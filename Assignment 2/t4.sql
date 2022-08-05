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