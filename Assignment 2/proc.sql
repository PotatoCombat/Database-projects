-- Trigger 1

DROP TRIGGER IF EXISTS new_shop ON shop;
DROP FUNCTION IF EXISTS new_shop_func;

CREATE OR REPLACE FUNCTION new_shop_func() RETURNS TRIGGER
AS $$
BEGIN
	IF (NEW.id NOT IN (SELECT shop_id FROM sells)) THEN
		RAISE EXCEPTION 'New shop added that does not sell at least 1 product';
		RETURN NULL;
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE CONSTRAINT TRIGGER new_shop
AFTER INSERT ON shop
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW EXECUTE FUNCTION new_shop_func();

-- Trigger 2

DROP TRIGGER IF EXISTS new_order ON orders;
DROP FUNCTION IF EXISTS new_order_func;

CREATE OR REPLACE FUNCTION new_order_func() RETURNS TRIGGER
AS $$
BEGIN
	IF (NEW.id NOT IN (SELECT order_id FROM orderline)) THEN
		RAISE EXCEPTION 'New order added that does not involve one or more products from one or more shops';
		RETURN NULL;
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE CONSTRAINT TRIGGER new_order
AFTER INSERT ON orders
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW EXECUTE FUNCTION new_order_func();

-- Trigger 3

DROP TRIGGER IF EXISTS apply_coupon ON orders;
DROP FUNCTION IF EXISTS apply_coupon_func;

CREATE OR REPLACE FUNCTION apply_coupon_func() RETURNS TRIGGER
AS $$
DECLARE
	discount NUMERIC;
	min_amount NUMERIC;
BEGIN
	IF (NEW.coupon_id IS NOT NULL) THEN
		SELECT reward_amount INTO discount
		FROM coupon_batch B1
		WHERE NEW.coupon_id = B1.id;

		SELECT min_order_amount INTO min_amount
		FROM coupon_batch B2
		WHERE NEW.coupon_id = B2.id;

		IF (NEW.payment_amount + discount < min_amount) THEN
			RAISE EXCEPTION 'Total order amount does not meet minimum for coupon';
			RETURN NULL;
		END IF;
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER apply_coupon
BEFORE INSERT ON orders
FOR EACH ROW EXECUTE FUNCTION apply_coupon_func();

-- Trigger 4

DROP TRIGGER IF EXISTS reject_refund_qty ON refund_request;
DROP FUNCTION IF EXISTS reject_refund_qty_fn;

CREATE FUNCTION reject_refund_qty_fn()
RETURNS TRIGGER AS $$
DECLARE
    total_quantity INTEGER;
    refund_quantity INTEGER;
BEGIN
    SELECT COALESCE(orderline.quantity, 0)
    INTO total_quantity
    FROM orderline
    WHERE row(orderline.order_id, orderline.shop_id, orderline.product_id, orderline.sell_timestamp)
        = row(NEW.order_id, NEW.shop_id, NEW.product_id, NEW.sell_timestamp);

    SELECT COALESCE(sum(refund_request.quantity), 0)
    INTO refund_quantity
    FROM refund_request
    WHERE row(refund_request.order_id, refund_request.shop_id, refund_request.product_id, refund_request.sell_timestamp)
        = row(NEW.order_id, NEW.shop_id, NEW.product_id, NEW.sell_timestamp)
    AND refund_request.status <> 'rejected';

    IF (NEW.quantity IS NULL
        OR NEW.quantity <= 0
        OR NEW.quantity + refund_quantity > total_quantity) THEN
        RAISE NOTICE 'Net refund quantity cannot exceed order quantity.';
        RETURN NULL;
    ELSE
        RETURN NEW;
    END IF;
END
$$ LANGUAGE plpgsql;

CREATE TRIGGER reject_refund_qty
BEFORE INSERT ON refund_request
FOR EACH ROW EXECUTE FUNCTION reject_refund_qty_fn();

-- Trigger 5

DROP TRIGGER IF EXISTS reject_late_refunds ON refund_request;
DROP FUNCTION IF EXISTS reject_late_refunds_fn;

CREATE FUNCTION reject_late_refunds_fn()
RETURNS TRIGGER AS $$
DECLARE
    delivery_date DATE;
BEGIN
    SELECT orderline.delivery_date
    INTO delivery_date
    FROM orderline
    WHERE orderline.order_id = NEW.order_id
    AND orderline.shop_id = NEW.shop_id
    AND orderline.product_id = NEW.product_id
    AND orderline.sell_timestamp = NEW.sell_timestamp;

    IF (NEW.request_date IS NULL
        OR NEW.request_date < delivery_date
        OR NEW.request_date > delivery_date + 30) THEN
        RAISE NOTICE 'Refund date must be within 30 days of the delivery date.';
        RETURN NULL;
    ELSE
        RETURN NEW;
    END IF;
END
$$ LANGUAGE plpgsql;

CREATE TRIGGER reject_late_refunds
BEFORE INSERT ON refund_request
FOR EACH ROW EXECUTE FUNCTION reject_late_refunds_fn();

-- Trigger 6

DROP TRIGGER IF EXISTS reject_undelivered_products ON refund_request;
DROP FUNCTION IF EXISTS reject_undelivered_products_fn;

CREATE FUNCTION reject_undelivered_products_fn()
RETURNS TRIGGER AS $$
DECLARE
    status orderline_status;
BEGIN
    SELECT orderline.status
    INTO status
    FROM orderline
    WHERE orderline.order_id = NEW.order_id
    AND orderline.shop_id = NEW.shop_id
    AND orderline.product_id = NEW.product_id
    AND orderline.sell_timestamp = NEW.sell_timestamp;

    IF (status <> 'delivered') THEN
        RAISE NOTICE 'Refund can only be made for delivered products.';
        RETURN NULL;
    ELSE
        RETURN NEW;
    END IF;
END
$$ LANGUAGE plpgsql;

CREATE TRIGGER reject_undelivered_products
BEFORE INSERT ON refund_request
FOR EACH ROW EXECUTE FUNCTION reject_undelivered_products_fn();

-- Trigger 7

DROP TRIGGER IF EXISTS check_user_of_review ON review;
DROP FUNCTION IF EXISTS check_user_of_review_func;

CREATE OR REPLACE FUNCTION check_user_of_review_func()
RETURNS TRIGGER AS $$
DECLARE
    lcount INTEGER;
BEGIN
    SELECT COUNT(*) INTO lcount
    FROM comment, orders
    WHERE NEW.id = comment.id
    AND comment.user_id = orders.user_id
    AND NEW.order_id = orders.id;

    IF lcount = 0 THEN
        RAISE EXCEPTION 'Review can also be posted by the user who had purchased that product';
        return NULL;
    END IF;

    RETURN NEW;
END;
$$ language plpgsql;

CREATE OR REPLACE TRIGGER check_user_of_review
BEFORE INSERT ON review
FOR EACH ROW EXECUTE FUNCTION check_user_of_review_func();


-- Trigger 8

DROP TRIGGER IF EXISTS new_comment ON comment;
DROP FUNCTION IF EXISTS new_comment_fn;

DROP TRIGGER IF EXISTS check_comment_review ON review;
DROP TRIGGER IF EXISTS check_comment_reply ON reply;

DROP FUNCTION IF EXISTS check_only_review_fn;
DROP FUNCTION IF EXISTS check_only_reply_fn;

CREATE OR REPLACE FUNCTION new_comment_fn()
RETURNS TRIGGER AS $$
BEGIN
    IF (NEW.id NOT IN (SELECT id FROM review)
        AND NEW.id NOT IN (SELECT id FROM reply)) THEN
        RAISE EXCEPTION 'Comments need to be either a review or reply.';
        RETURN NULL;
    ELSE
        RETURN NEW;
    END IF;
END
$$ LANGUAGE plpgsql;

CREATE CONSTRAINT TRIGGER new_comment
AFTER INSERT ON comment
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW EXECUTE FUNCTION new_comment_fn();

CREATE OR REPLACE FUNCTION check_only_review_fn()
RETURNS TRIGGER AS $$
DECLARE
    lcount INTEGER;
BEGIN
    SELECT COUNT(*) INTO lcount
    FROM reply
    WHERE id = NEW.id;

    IF lcount > 0 THEN
        RAISE NOTICE 'Same comment cannot be both review and reply';
        RETURN NULL;
    ELSE
        RETURN NEW;
    END IF;
END
$$ language plpgsql;

CREATE OR REPLACE FUNCTION check_only_reply_fn()
RETURNS TRIGGER AS $$
DECLARE
    lcount INTEGER;
BEGIN
    SELECT COUNT(*) INTO lcount
    FROM review
    WHERE id = NEW.id;

    IF lcount > 0 THEN
        RAISE NOTICE 'Same comment cannot be both review and reply';
        RETURN NULL;
    ELSE
        RETURN NEW;
    END IF;
END
$$ language plpgsql;

CREATE TRIGGER check_comment_review
BEFORE INSERT ON review
FOR EACH ROW EXECUTE FUNCTION check_only_review_fn();

CREATE TRIGGER check_comment_reply
BEFORE INSERT ON reply
FOR EACH ROW EXECUTE FUNCTION check_only_reply_fn();

-- Trigger 9

DROP TRIGGER IF EXISTS check_reply_version ON reply;
DROP FUNCTION IF EXISTS check_reply_version_func;

CREATE OR REPLACE FUNCTION check_reply_version_func()
RETURNS TRIGGER AS $$
BEGIN
    IF NOT EXISTS(SELECT reply_id FROM reply_version WHERE reply_id = NEW.id) THEN
        RAISE EXCEPTION 'Add a version to this reply.';
		RETURN NULL;
    END IF;
    RETURN NEW;
END;
$$ language plpgsql;

CREATE CONSTRAINT TRIGGER check_reply_version
AFTER INSERT ON reply
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW EXECUTE FUNCTION check_reply_version_func();

-- Trigger 10

DROP TRIGGER IF EXISTS check_review_version ON review;
DROP FUNCTION IF EXISTS check_review_version_func;

CREATE OR REPLACE FUNCTION check_review_version_func()
RETURNS TRIGGER AS $$
BEGIN
    IF NOT EXISTS(SELECT review_id FROM review_version WHERE review_id = NEW.id) THEN
        RAISE EXCEPTION 'Add a version to this review.';
		RETURN NULL;
    END IF;
    RETURN NEW;
END;
$$ language plpgsql;

CREATE CONSTRAINT TRIGGER check_review_version
AFTER INSERT ON review
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW EXECUTE FUNCTION check_review_version_func();

-- Trigger 11

DROP TRIGGER IF EXISTS for_complaint_allow_trigger ON delivery_complaint;
DROP FUNCTION IF EXISTS check_if_delivered;

create or replace function check_if_delivered() returns trigger as $$
declare
    _status orderline_status;
begin
	select orderline.status
	into _status
	from orderline
	WHERE orderline.order_id = NEW.order_id
	AND orderline.shop_id = NEW.shop_id
	AND orderline.product_id = NEW.product_id
	AND orderline.sell_timestamp = NEW.sell_timestamp;
	if _status <> 'delivered' then
		RAISE NOTICE 'Complaint can only be made for delivered products.';
		return NULL;
	else
		return NEW;
	end if;
end
$$ language plpgsql;

create OR REPLACE trigger for_complaint_allow_trigger
before insert on delivery_complaint
for each row execute function check_if_delivered();

-- Trigger 12

DROP TRIGGER IF EXISTS reject_no_complaint_type ON complaint;
DROP FUNCTION IF EXISTS reject_no_complaint_type_fn;

DROP TRIGGER IF EXISTS reject_shop_complaint ON shop_complaint;
DROP TRIGGER IF EXISTS reject_comment_complaint ON comment_complaint;
DROP TRIGGER IF EXISTS reject_delivery_complaint ON delivery_complaint;
DROP FUNCTION IF EXISTS reject_duplicate_complaint_fn;

CREATE OR REPLACE FUNCTION reject_no_complaint_type_fn() RETURNS TRIGGER
AS $$
BEGIN
    IF (NEW.id NOT IN (SELECT id FROM shop_complaint)
        AND NEW.id NOT IN (SELECT id FROM comment_complaint)
        AND NEW.id NOT IN (SELECT id FROM delivery_complaint)
        ) THEN
        RAISE EXCEPTION 'Complaint does not have a valid type';
        RETURN NULL;
    ELSE
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE CONSTRAINT TRIGGER reject_no_complaint_type
AFTER INSERT ON complaint
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW EXECUTE FUNCTION reject_no_complaint_type_fn();

CREATE OR REPLACE FUNCTION reject_duplicate_complaint_fn() RETURNS TRIGGER
AS $$
DECLARE
    choice INTEGER := 100;
    is_complaint BOOLEAN;
    is_shop_complaint BOOLEAN;
    is_comment_complaint BOOLEAN;
    is_delivery_complaint BOOLEAN;
BEGIN
    choice := TG_ARGV[0];
    is_complaint := false;
    is_shop_complaint := false;
    is_comment_complaint := false;
    is_delivery_complaint := false;

    IF (NEW.id IN (SELECT id FROM complaint)) THEN
        is_complaint := true;
    END IF;

    IF (NEW.id IN (SELECT id FROM shop_complaint)) THEN
        is_shop_complaint := true;
    END IF;

    IF (NEW.id IN (SELECT id FROM comment_complaint)) THEN
        is_comment_complaint := true;
    END IF;

    IF (NEW.id IN (SELECT id FROM delivery_complaint)) THEN
        is_delivery_complaint := true;
    END IF;

    IF (is_complaint = false) THEN
        RAISE EXCEPTION 'Complaint does not have a valid type';
        RETURN NULL;
    ELSIF (choice = 0) THEN
        IF (is_shop_complaint = true AND is_comment_complaint = false AND is_delivery_complaint = false) THEN
            RETURN NEW;
        ELSE
            RAISE EXCEPTION 'Invalid shop complaint';
            RETURN NULL;
        END IF;
    ELSIF (choice = 1) THEN
        IF (is_shop_complaint = false AND is_comment_complaint = true AND is_delivery_complaint = false) THEN
            RETURN NEW;
        ELSE
            RAISE EXCEPTION 'Invalid comment complaint';
            RETURN NULL;
        END IF;
    ELSIF (choice = 2) THEN
        IF (is_shop_complaint = false AND is_comment_complaint = false AND is_delivery_complaint = true) THEN
            RETURN NEW;
        ELSE
            RAISE EXCEPTION 'Invalid delivery complaint';
            RETURN NULL;
        END IF;
    ELSE
        RAISE EXCEPTION 'Invalid choice';
        RETURN NULL;
    END IF;

END;
$$ LANGUAGE plpgsql;

CREATE CONSTRAINT TRIGGER reject_shop_complaint
AFTER INSERT ON shop_complaint
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW EXECUTE FUNCTION reject_duplicate_complaint_fn(0);

CREATE CONSTRAINT TRIGGER reject_comment_complaint
AFTER INSERT ON comment_complaint
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW EXECUTE FUNCTION reject_duplicate_complaint_fn(1);

CREATE CONSTRAINT TRIGGER reject_delivery_complaint
AFTER INSERT ON delivery_complaint
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW EXECUTE FUNCTION reject_duplicate_complaint_fn(2);



-- Procedure 1

CREATE OR REPLACE PROCEDURE place_order
	(user_id INTEGER, coupon_id INTEGER, shipping_address TEXT, shop_ids INTEGER[],
	 product_ids INTEGER[], sell_timestamps TIMESTAMP[], quantities INTEGER[],
	 shipping_costs NUMERIC[])
AS $$
DECLARE
	temp_shop INTEGER;
	temp_product INTEGER;
	temp_timestamp TIMESTAMP;
	temp_quantity INTEGER;
	price NUMERIC;
	payment NUMERIC := 0;
	discount NUMERIC := 0;
	new_id INTEGER;
BEGIN
	new_id := (SELECT COALESCE(max(id), 0) FROM orders) + 1;
	IF (coupon_id IS NOT NULL) THEN
		discount := (
			SELECT reward_amount
			FROM coupon_batch B
			WHERE B.id = coupon_id);
	END IF;

	FOR i IN 1..ARRAY_LENGTH(shop_ids, 1)
	LOOP
		temp_shop := shop_ids[i];
		temp_product := product_ids[i];
		temp_timestamp := sell_timestamps[i];
		temp_quantity := quantities[i];
		price := (
			SELECT S.price
			FROM sells S
			WHERE S.shop_id = temp_shop
			AND S.product_id = temp_product
			AND S.sell_timestamp = temp_timestamp);
		payment := payment + price * temp_quantity + shipping_costs[i];

		UPDATE sells
		SET quantity = quantity + temp_quantity
		WHERE shop_id = temp_shop
		AND product_id = temp_product
		AND sell_timestamp = temp_timestamp;
	END LOOP;

	INSERT INTO orders(id, user_id, coupon_id, shipping_address, payment_amount)
		VALUES (new_id, user_id, coupon_id, shipping_address, payment - discount);

	FOR i IN 1..ARRAY_LENGTH(shop_ids, 1)
	LOOP
		INSERT INTO orderline(order_id, shop_id, product_id, sell_timestamp,
							  quantity, shipping_cost, status)
		VALUES (new_id, shop_ids[i], product_ids[i], sell_timestamps[i],
				quantities[i], shipping_costs[i], 'being_processed');
	END LOOP;
END;
$$ LANGUAGE plpgsql;

-- Procedure 2

CREATE OR REPLACE procedure review (
	user_id INTEGER,
	order_id INTEGER,
	shop_id INTEGER,
	product_id INTEGER,
	sell_timestamp TIMESTAMP,
	content TEXT,
	rating INTEGER,
	comment_timestamp TIMESTAMP)
AS $$
DECLARE
	comment_id INTEGER;
BEGIN
	SELECT COALESCE(max(id), 0) + 1
	INTO comment_id
	FROM comment;

    insert into comment(id, user_id)
    values (comment_id, user_id);

    insert into review(id, order_id, shop_id, product_id, sell_timestamp)
    values (comment_id, order_id, shop_id, product_id, sell_timestamp);

    insert into review_version(review_id, review_timestamp, content, rating)
    values (comment_id, comment_timestamp, content, rating);
END;
$$ LANGUAGE plpgsql;

-- Procedure 3

CREATE OR REPLACE procedure reply (
	user_id INTEGER,
	other_comment_id INTEGER,
	content TEXT,
	reply_timestamp TIMESTAMP)
AS $$
DECLARE
	comment_id INTEGER;
BEGIN
	SELECT COALESCE(max(id), 0) + 1
	INTO comment_id
	FROM comment;

    insert into comment(id, user_id)
    values (comment_id, user_id);

    insert into reply(id, other_comment_id)
    values (comment_id, other_comment_id);

    insert into reply_version(reply_id, reply_timestamp, content)
    values (comment_id, reply_timestamp, content);
END;
$$ LANGUAGE plpgsql;



-- Function 1

CREATE OR REPLACE FUNCTION view_comments(
    _shop_id INTEGER,
    _product_id INTEGER,
    _sell_timestamp TIMESTAMP)
RETURNS TABLE(
    username TEXT,
    content TEXT,
    rating INTEGER,
    comment_timestamp TIMESTAMP) AS $$
BEGIN
    RETURN QUERY
    WITH RECURSIVE
    fullComments AS (
        SELECT comment.id AS _id,
               CASE WHEN users.account_closed THEN 'A Deleted User'
                    ELSE users.name
               END AS _username
        FROM comment
        JOIN users ON comment.user_id = users.id
    ),
    recentReviews AS (
        SELECT c._id,
               c._username,
               rv.review_timestamp AS _comment_timestamp,
               rv.content AS _content,
               rv.rating AS _rating
        FROM fullComments c
        JOIN review_version rv ON c._id = rv.review_id
        WHERE rv.review_timestamp = (
            SELECT max(rv2.review_timestamp)
            FROM review_version rv2
            WHERE rv.review_id = rv2.review_id
        )
    ),
    recentReplies AS (
        SELECT c._id,
               c._username,
               rv.reply_timestamp AS _comment_timestamp,
               rv.content AS _content,
               rp.other_comment_id AS _pid
        FROM fullComments c
        JOIN reply_version rv ON c._id = rv.reply_id
        JOIN reply rp ON c._id = rp.id
        WHERE rv.reply_timestamp = (
            SELECT max(rv2.reply_timestamp)
            FROM reply_version rv2
            WHERE rv.reply_id = rv2.reply_id
        )
    ),
    relatedComments AS (
        SELECT rrv._id,
               rrv._username,
               rrv._content,
               rrv._rating,
               rrv._comment_timestamp
        FROM recentReviews rrv
        WHERE rrv._id = (
            SELECT rv.id
            FROM review rv
            WHERE rv.shop_id = _shop_id
            AND rv.product_id = _product_id
            AND rv.sell_timestamp = _sell_timestamp
        )
        UNION
        SELECT rrp._id,
               rrp._username,
               rrp._content,
               NULL AS _rating,
               rrp._comment_timestamp
        FROM recentReplies rrp
        JOIN relatedComments rc ON rrp._pid = rc._id
    )
    SELECT _username,
           _content,
           _rating,
           _comment_timestamp
    FROM relatedComments
    ORDER BY _comment_timestamp, _id;

END
$$ LANGUAGE plpgsql;

-- Function 2

CREATE OR REPLACE FUNCTION get_most_returned_products_from_manufacturer (manufacturer_id INTEGER, n INTEGER)
RETURNS TABLE (product_id INTEGER, product_name TEXT, return_rate NUMERIC(3,2)) AS $$
BEGIN
	RETURN QUERY
	WITH prod_sold AS (
		SELECT o.product_id, CAST(sum(o.quantity) AS NUMERIC) AS qty_sold
		FROM orderline o, product p
		WHERE p.manufacturer = manufacturer_id AND
		p.id = o.product_id AND
		o.status = 'delivered'
		GROUP BY (o.product_id)
	),
	prod_returned AS (
		SELECT rr.product_id, CAST(sum(rr.quantity) AS NUMERIC) AS qty_returned
		FROM refund_request rr, product p
		WHERE p.manufacturer = manufacturer_id AND
		p.id = rr.product_id AND
		rr.status = 'accepted'
		GROUP BY (rr.product_id)
	),
	prod_return_rate AS (
		SELECT ps.product_id AS product_id,
		p.name AS product_name,
		CAST(qty_returned/qty_sold AS NUMERIC(3,2)) AS return_rate
		FROM prod_sold ps, prod_returned pr, product p
		WHERE ps.product_id = p.id AND pr.product_id = p.id
	)
	SELECT PRR.product_id, PRR.product_name, PRR.return_rate
	FROM prod_return_rate PRR
	ORDER BY return_rate DESC, product_id ASC
	LIMIT n;
END
$$ language plpgsql;

-- Function 3

CREATE OR REPLACE FUNCTION get_worst_shops(n INTEGER)
RETURNS TABLE(
  shop_id INTEGER,
  shop_name TEXT,
  num_negative_indicators INTEGER) AS $$
BEGIN
  RETURN QUERY
  WITH refund_count AS (
    SELECT Counts.shop_id AS id, count(Counts.shop_id) AS count1
    FROM (
      SELECT RR.shop_id
      FROM refund_request RR
      GROUP BY RR.order_id, RR.shop_id, RR.product_id, RR.sell_timestamp
    ) AS Counts
    GROUP BY Counts.shop_id
  ),
  shop_complaint_count AS (
    SELECT SC.shop_id AS id, count(SC.shop_id) AS count2
    FROM shop_complaint SC
    GROUP BY SC.shop_id
  ),
  delivery_complaint_count AS (
    SELECT Counts.shop_id AS id, count(Counts.shop_id) AS count3
    FROM (
      SELECT DC.shop_id
      FROM delivery_complaint DC
      GROUP BY DC.order_id, DC.shop_id, DC.product_id, DC.sell_timestamp
    ) AS Counts
    GROUP BY Counts.shop_id
  ),
  review_count AS (
    SELECT review.shop_id AS id, count(review.shop_id) AS count4
    FROM review NATURAL JOIN (
      SELECT review_id AS id
      FROM review_version RV
      WHERE RV.review_timestamp = (
        SELECT max(review_timestamp)
        FROM review_version RV2
        WHERE RV2.review_id = RV.review_id
      )
      AND RV.rating = 1
    ) AS RRV
    GROUP BY review.shop_id
  )
  SELECT S.id AS shop_id, S.name AS shop_name,
    CAST(COALESCE(count1, 0)
      + COALESCE(count2, 0)
      + COALESCE(count3, 0)
      + COALESCE(count4, 0)
      AS INTEGER)
    AS num_negative_indicators
  FROM
    shop S FULL JOIN refund_count RC ON S.id = RC.id
    FULL JOIN shop_complaint_count SCC ON S.id = SCC.id
    FULL JOIN delivery_complaint_count DCC ON S.id = DCC.id
    FULL JOIN review_count RVC ON S.id = RVC.id
  ORDER BY num_negative_indicators DESC, shop_id ASC
  LIMIT n;

END
$$ LANGUAGE plpgsql;
