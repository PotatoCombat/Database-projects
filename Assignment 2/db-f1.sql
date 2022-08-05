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

BEGIN TRANSACTION;

INSERT INTO users (id, address, name, account_closed) VALUES
(1, 'one', 'u1', false),
(2, 'two', 'u2', true)
;

INSERT INTO shop (id, name) VALUES
(1, 's1'),
(2, 's2')
;

INSERT INTO category (id, name, parent) VALUES
(1, 'cat1', NULL),
(2, 'cat2', NULL),
(3, 'cat3', 2),
(4, 'cat4', 3)
;

INSERT INTO manufacturer (id, name, country) VALUES
(1, 'm1', 'country-1'),
(2, 'm2', 'country-2'),
(3, 'm3', 'country-3'),
(4, 'm4', 'country-4')
;

INSERT INTO product (id, name, description, category, manufacturer) VALUES
(11, 'p1', 'product-1', 1, 1),
(12, 'p2', 'product-2', 2, 2),
(21, 'p3', 'product-3', 3, 3),
(22, 'p4', 'product-4', 4, 4)
;

INSERT INTO sells (shop_id, product_id, sell_timestamp, price, quantity) VALUES
(1, 11, '2000-01-01 00:00:00', 1, 100),
(1, 12, '2000-01-01 00:00:00', 2, 200),
(2, 21, '2000-01-01 00:00:01', 3, 300),
(2, 22, '2000-01-02 00:00:02', 4, 400)
;

INSERT INTO orders (id, user_id, coupon_id, shipping_address, payment_amount) VALUES
(1, 1, NULL, 'one', 1000.00),
(2, 2, NULL, 'two', 1000.00)
;

INSERT INTO orderline (order_id, shop_id, product_id, sell_timestamp, quantity, shipping_cost, status, delivery_date) VALUES
(1, 1, 11, '2000-01-01 00:00:00', 100, 1.00, 'being_processed', NULL),
(1, 2, 21, '2000-01-01 00:00:01', 200, 2.00, 'shipped', '2000-02-01'),
(2, 1, 12, '2000-01-01 00:00:00', 300, 3.00, 'delivered', '2000-02-01'),
(2, 2, 21, '2000-01-01 00:00:01', 300, 3.00, 'delivered', '2000-02-01'),
(2, 2, 22, '2000-01-02 00:00:02', 400, 4.00, 'delivered', '2000-02-02')
;

INSERT INTO refund_request (id, handled_by, order_id, shop_id, product_id, sell_timestamp, quantity, request_date, status, handled_date, rejection_reason) VALUES
(1, NULL, 1, 1, 11, '2000-01-01 00:00:00', 10, '2000-02-20', 'pending', NULL, NULL),
(2, NULL, 1, 2, 21, '2000-01-01 00:00:01', 10, '2000-02-20', 'pending', NULL, NULL),
(3, NULL, 2, 1, 12, '2000-01-01 00:00:00', 10, '2000-02-20', 'pending', NULL, NULL),
(4, NULL, 2, 2, 22, '2000-01-02 00:00:02', 10, '2000-02-20', 'pending', NULL, NULL),
(5, NULL, 2, 2, 21, '2000-01-01 00:00:01', 10, '2000-02-20', 'pending', NULL, NULL)
;

INSERT INTO comment (id, user_id) VALUES
(1, 1),
(2, 2),
(3, 1),
(4, 2),
(5, 2)
;

INSERT INTO review (id, order_id, shop_id, product_id, sell_timestamp) VALUES
(1, 1, 1, 11, '2000-01-01 00:00:00')
;

INSERT INTO review_version (review_id, review_timestamp, content, rating) VALUES
(1, '2000-03-01 00:00:00', 'Delicous', 3),
(1, '2000-04-01 00:00:00', 'Deliciousy', 4),
(1, '2000-05-01 00:00:00', 'Delicious', 5)
;

INSERT INTO reply (id, other_comment_id) VALUES
(2, 1),
(3, 2),
(4, 3),
(5, 4)
;

INSERT INTO reply_version (reply_id, reply_timestamp, content) VALUES
(2, '2000-03-01 00:00:01', 'Really'),
(2, '2000-04-01 00:00:01', 'Really Truly'),
(2, '2000-05-01 00:00:01', 'Really Truly Definitely'),
(3, '2000-03-01 00:00:02', 'Yes'),
(4, '2000-04-01 00:00:02', 'Ok'),
(4, '2000-05-01 00:00:02', 'Ok!'),
(5, '2000-05-01 00:00:02', 'Ok!')
;
COMMIT;

SELECT * FROM view_comments(1, 11, '2000-01-01 00:00:00');
