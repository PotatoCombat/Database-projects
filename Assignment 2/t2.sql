CREATE OR REPLACE FUNCTION new_order_func() RETURNS TRIGGER
AS $$
BEGIN
	IF (NEW.id NOT IN (SELECT order_id FROM orderline)) THEN
		RAISE EXCEPTION 'New order added that does not involve one or more products from one or more shops';
		RETURN NULL;
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE CONSTRAINT TRIGGER new_order
AFTER INSERT ON orders
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW EXECUTE FUNCTION new_order_func();