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
