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