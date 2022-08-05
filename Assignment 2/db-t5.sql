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
(1, 'one', 'u1', false)
;

INSERT INTO shop (id, name) VALUES
(1, 's1')
;

INSERT INTO category (id, name, parent) VALUES
(1, 'cat1', NULL)
;

INSERT INTO manufacturer (id, name, country) VALUES
(1, 'm1', 'country-1')
;

INSERT INTO product (id, name, description, category, manufacturer) VALUES
(1, 'p1', 'product-1', 1, 1)
;

INSERT INTO sells (shop_id, product_id, sell_timestamp, price, quantity) VALUES
(1, 1, '2000-01-01 00:00:00', 1, 100)
;

INSERT INTO orders (id, user_id, coupon_id, shipping_address, payment_amount) VALUES
(1, 1, NULL, 'one', 1000.00)
;

INSERT INTO orderline (order_id, shop_id, product_id, sell_timestamp, quantity, shipping_cost, status, delivery_date) VALUES
(1, 1, 1, '2000-01-01 00:00:00', 10, 10.00, 'delivered', '2000-01-01')
;

INSERT INTO refund_request (id, handled_by, order_id, shop_id, product_id, sell_timestamp, quantity, request_date, status, handled_date, rejection_reason) VALUES
(1, NULL, 1, 1, 1, '2000-01-01 00:00:00', 10, '1999-12-31', 'pending', NULL, NULL),
(2, NULL, 1, 1, 1, '2000-01-01 00:00:00', 10, '2000-01-01', 'pending', NULL, NULL),
(3, NULL, 1, 1, 1, '2000-01-01 00:00:00', 10, '2000-01-31', 'pending', NULL, NULL),
(4, NULL, 1, 1, 1, '2000-01-01 00:00:00', 10, '2000-02-01', 'pending', NULL, NULL)
;
COMMIT;

select *
from refund_request;
