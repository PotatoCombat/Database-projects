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