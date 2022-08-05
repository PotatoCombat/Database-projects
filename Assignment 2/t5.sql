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