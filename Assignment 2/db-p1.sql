-- Load data
DELETE FROM delivery_complaint;
DELETE FROM comment_complaint;
DELETE FROM shop_complaint;
DELETE FROM complaint;
DELETE FROM refund_request;
DELETE FROM employee;
DELETE FROM reply_version;
DELETE FROM reply;
DELETE FROM review_version;
DELETE FROM review;
DELETE FROM comment;
DELETE FROM orderline;
DELETE FROM orders;
DELETE FROM issued_coupon;
DELETE FROM coupon_batch;
DELETE FROM sells;
DELETE FROM product;
DELETE FROM manufacturer;
DELETE FROM category;
DELETE FROM shop;
DELETE FROM users;

INSERT INTO users
VALUES
	(1, 'Address Street 1', 'User 1', FALSE),
	(2, 'Address Street 2', 'User 2', FALSE);

INSERT INTO coupon_batch(id, reward_amount, min_order_amount)
VALUES
	(1, 2.0, 10.0),
	(2, 5.0, 15.0);

INSERT INTO issued_coupon(user_id, coupon_id)
VALUES
	(1, 1),
	(2, 2);

INSERT INTO manufacturer
VALUES (0);

INSERT INTO category
VALUES (0);

INSERT INTO product
VALUES
	(1, 'product 1', 'this is test product 1', 0, 0),
	(2, 'product 2', 'this is test product 2', 0, 0);

BEGIN TRANSACTION;
INSERT INTO shop
VALUES
	(1, 'Shop 1'),
	(2, 'Shop 2');

INSERT INTO sells
VALUES
	(1, 1, '2022-03-23 00:00:01', 7.0, 3),
	(2, 2, '2022-03-24 00:00:02', 9.0, 5);
COMMIT;

CALL place_order(1, 1, 'Shipping Lane 1', '{1,2}',
	 '{1,2}', '{"2022-03-23 00:00:01","2022-03-24 00:00:02"}', '{3,5}',
	 '{3.0, 5.0}');

SELECT * FROM orders;