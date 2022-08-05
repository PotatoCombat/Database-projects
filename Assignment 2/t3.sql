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