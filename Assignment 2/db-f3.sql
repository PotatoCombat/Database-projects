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

INSERT INTO employee (id, name, salary) VALUES
(1, 'e1', 10),
(2, 'e2', 20),
(3, 'e3', 30),
(4, 'e4', 40)
;

INSERT INTO users (id, address, name, account_closed) VALUES
(1, 'one', 'u1', false),
(2, 'two', 'u2', true),
(3, 'three', 'u3', false),
(4, 'four', 'u4', false)
;

INSERT INTO shop (id, name) VALUES
(1, 's1'),
(2, 's2'),
(3, 's3'),
(4, 's4')
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
(11, 'p11', 'product-11', 1, 1),
(12, 'p12', 'product-12', 2, 1),
(13, 'p13', 'product-13', 3, 1),
(14, 'p14', 'product-14', 4, 1),

(21, 'p21', 'product-21', 1, 2),
(22, 'p22', 'product-22', 2, 2),
(23, 'p23', 'product-23', 3, 2),
(24, 'p24', 'product-24', 4, 2),

(31, 'p31', 'product-31', 1, 3),
(32, 'p32', 'product-32', 2, 3),
(33, 'p33', 'product-33', 3, 3),
(34, 'p34', 'product-34', 4, 3),

(41, 'p41', 'product-41', 1, 4),
(42, 'p42', 'product-42', 2, 4),
(43, 'p43', 'product-43', 3, 4),
(44, 'p44', 'product-44', 4, 4)
;

INSERT INTO sells (shop_id, product_id, sell_timestamp, price, quantity) VALUES
(1, 11, '2000-01-01 00:00:00', 1, 1000),
(1, 12, '2000-01-01 00:00:00', 2, 1000),
(1, 13, '2000-01-01 00:00:00', 3, 1000),
(1, 14, '2000-01-01 00:00:00', 4, 1000),

(2, 21, '2000-01-01 00:00:00', 1, 1000),
(2, 22, '2000-01-01 00:00:00', 2, 1000),
(2, 23, '2000-01-01 00:00:00', 3, 1000),
(2, 24, '2000-01-01 00:00:00', 4, 1000),

(3, 31, '2000-01-01 00:00:00', 1, 1000),
(3, 32, '2000-01-01 00:00:00', 2, 1000),
(3, 33, '2000-01-01 00:00:00', 3, 1000),
(3, 34, '2000-01-01 00:00:00', 4, 1000),

(4, 41, '2000-01-01 00:00:00', 1, 1000),
(4, 42, '2000-01-01 00:00:00', 2, 1000),
(4, 43, '2000-01-01 00:00:00', 3, 1000),
(4, 44, '2000-01-01 00:00:00', 4, 1000)
;

-- NO refunds, NO complaints, NO reviews
INSERT INTO orders (id, user_id, coupon_id, shipping_address, payment_amount) VALUES
(1, 1, NULL, 'address', 1000.00)
;

INSERT INTO orderline (order_id, shop_id, product_id, sell_timestamp, quantity, shipping_cost, status, delivery_date) VALUES
(1, 1, 11, '2000-01-01 00:00:00', 10, 1.00, 'delivered', '2000-02-24')
;
-- MULTIPLE refunds, NO complaints, NO reviews
-- INSERT INTO refund_request (id, handled_by, order_id, shop_id, product_id, sell_timestamp, quantity, request_date, status, handled_date, rejection_reason) VALUES
-- (1, NULL, 1, 1, 11, '2000-01-01 00:00:00', 1, '2000-02-25', 'pending', NULL, NULL),
-- (2, 1, 1, 1, 11, '2000-01-01 00:00:00', 1, '2000-02-25', 'being_handled', NULL, NULL),
-- (3, 1, 1, 1, 11, '2000-01-01 00:00:00', 1, '2000-02-25', 'rejected', '2000-02-26', 'duplicate'),
-- (4, 1, 1, 1, 11, '2000-01-01 00:00:00', 1, '2000-02-25', 'accepted', '2000-02-26', NULL),
-- (5, 1, 1, 1, 11, '2000-01-01 00:00:00', 1, '2000-02-25', 'accepted', '2000-02-26', NULL)
-- ;

-- NO refunds, MULTIPLE SHOP complaints, NO reviews
-- BEGIN TRANSACTION;
-- INSERT INTO complaint (id, content, status, user_id, handled_by) VALUES
-- (1, 'cs1', 'pending', 3, NULL),
-- (2, 'cs2', 'being_handled', 3, 3),
-- (3, 'cs3', 'addressed', 3, 3),
-- (4, 'cs4', 'addressed', 4, 3)
-- ;

-- INSERT INTO shop_complaint (id, shop_id) VALUES
-- (1, 3),
-- (2, 3),
-- (3, 3),
-- (4, 3)
-- ;
-- COMMIT;

-- NO refunds, MULTIPLE DELIVERY complaints, NO reviews
-- BEGIN TRANSACTION;
-- INSERT INTO complaint (id, content, status, user_id, handled_by) VALUES
-- (1, 'cs1', 'pending', 3, NULL),
-- (2, 'cs2', 'being_handled', 3, 3),
-- (3, 'cs3', 'addressed', 3, 3),
-- (4, 'cs4', 'addressed', 4, 3)
-- ;

-- INSERT INTO delivery_complaint (id, order_id, shop_id, product_id, sell_timestamp) VALUES
-- (1, 1, 1, 11, '2000-01-01 00:00:00'),
-- (2, 1, 1, 11, '2000-01-01 00:00:00'),
-- (3, 1, 1, 11, '2000-01-01 00:00:00'),
-- (4, 1, 1, 11, '2000-01-01 00:00:00')
-- ;
-- COMMIT;

-- NO refunds, NO complaints, MULTIPLE reviews
-- INSERT INTO comment (id, user_id) VALUES
-- (1, 1)
-- ;

-- INSERT INTO review (id, order_id, shop_id, product_id, sell_timestamp) VALUES
-- (1, 1, 1, 11, '2000-01-01 00:00:00')
-- ;

-- INSERT INTO review_version (review_id, review_timestamp, content, rating) VALUES
-- (1, '2000-03-01 00:00:00', 'Delicous', 1),
-- (1, '2000-04-01 00:00:00', 'Deliciousy', 2),
-- (1, '2000-05-01 00:00:00', 'Delicious', 1)
-- ;

-- MULTIPLE refunds, MULTIPLE complaints, MULTIPLE reviews
INSERT INTO refund_request (id, handled_by, order_id, shop_id, product_id, sell_timestamp, quantity, request_date, status, handled_date, rejection_reason) VALUES
(1, NULL, 1, 1, 11, '2000-01-01 00:00:00', 1, '2000-02-25', 'pending', NULL, NULL),
(2, 1, 1, 1, 11, '2000-01-01 00:00:00', 1, '2000-02-25', 'being_handled', NULL, NULL),
(3, 1, 1, 1, 11, '2000-01-01 00:00:00', 1, '2000-02-25', 'rejected', '2000-02-26', 'duplicate'),
(4, 1, 1, 1, 11, '2000-01-01 00:00:00', 1, '2000-02-25', 'accepted', '2000-02-26', NULL),
(5, 1, 1, 1, 11, '2000-01-01 00:00:00', 1, '2000-02-25', 'accepted', '2000-02-26', NULL)
;

INSERT INTO complaint (id, content, status, user_id, handled_by) VALUES
(1, 'cs1', 'pending', 3, NULL),
(2, 'cs2', 'being_handled', 3, 3),
(3, 'cs3', 'addressed', 3, 3),
(4, 'cs4', 'addressed', 4, 3)
;

INSERT INTO shop_complaint (id, shop_id) VALUES
(1, 3),
(2, 3),
(3, 3),
(4, 2)
;

INSERT INTO complaint (id, content, status, user_id, handled_by) VALUES
(5, 'cs1', 'pending', 3, NULL),
(6, 'cs2', 'being_handled', 3, 3),
(7, 'cs3', 'addressed', 3, 3),
(8, 'cs4', 'addressed', 4, 3)
;

INSERT INTO delivery_complaint (id, order_id, shop_id, product_id, sell_timestamp) VALUES
(5, 1, 1, 11, '2000-01-01 00:00:00'),
(6, 1, 1, 11, '2000-01-01 00:00:00'),
(7, 1, 1, 11, '2000-01-01 00:00:00'),
(8, 1, 1, 11, '2000-01-01 00:00:00')
;

INSERT INTO comment (id, user_id) VALUES
(1, 1)
;

INSERT INTO review (id, order_id, shop_id, product_id, sell_timestamp) VALUES
(1, 1, 1, 11, '2000-01-01 00:00:00')
;

INSERT INTO review_version (review_id, review_timestamp, content, rating) VALUES
(1, '2000-03-01 00:00:00', 'Delicous', 1),
(1, '2000-04-01 00:00:00', 'Deliciousy', 2),
(1, '2000-05-01 00:00:00', 'Delicious', 1)
;
COMMIT;
SELECT * FROM get_worst_shops(5);


