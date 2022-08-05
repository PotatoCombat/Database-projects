DROP TRIGGER IF EXISTS reject_no_complaint_type ON complaint;
DROP FUNCTION IF EXISTS reject_no_complaint_type_fn;

DROP TRIGGER IF EXISTS reject_shop_complaint ON shop_complaint;
DROP TRIGGER IF EXISTS reject_comment_complaint ON comment_complaint;
DROP TRIGGER IF EXISTS reject_delivery_complaint ON delivery_complaint;
DROP FUNCTION IF EXISTS reject_duplicate_complaint_fn;

CREATE OR REPLACE FUNCTION reject_no_complaint_type_fn() RETURNS TRIGGER
AS $$
BEGIN
    IF (NEW.id NOT IN (SELECT id FROM shop_complaint)
        AND NEW.id NOT IN (SELECT id FROM comment_complaint)
        AND NEW.id NOT IN (SELECT id FROM delivery_complaint)
        ) THEN
        RAISE EXCEPTION 'Complaint does not have a valid type';
        RETURN NULL;
    ELSE
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE CONSTRAINT TRIGGER reject_no_complaint_type
AFTER INSERT ON complaint
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW EXECUTE FUNCTION reject_no_complaint_type_fn();

CREATE OR REPLACE FUNCTION reject_duplicate_complaint_fn() RETURNS TRIGGER
AS $$
DECLARE
    choice INTEGER := 100;
    is_complaint BOOLEAN;
    is_shop_complaint BOOLEAN;
    is_comment_complaint BOOLEAN;
    is_delivery_complaint BOOLEAN;
BEGIN
    choice := TG_ARGV[0];
    is_complaint := false;
    is_shop_complaint := false;
    is_comment_complaint := false;
    is_delivery_complaint := false;

    IF (NEW.id IN (SELECT id FROM complaint)) THEN
        is_complaint := true;
    END IF;

    IF (NEW.id IN (SELECT id FROM shop_complaint)) THEN
        is_shop_complaint := true;
    END IF;

    IF (NEW.id IN (SELECT id FROM comment_complaint)) THEN
        is_comment_complaint := true;
    END IF;

    IF (NEW.id IN (SELECT id FROM delivery_complaint)) THEN
        is_delivery_complaint := true;
    END IF;

    IF (is_complaint = false) THEN
        RAISE EXCEPTION 'Complaint does not have a valid type';
        RETURN NULL;
    ELSIF (choice = 0) THEN
        IF (is_shop_complaint = true AND is_comment_complaint = false AND is_delivery_complaint = false) THEN
            RETURN NEW;
        ELSE
            RAISE EXCEPTION 'Invalid shop complaint';
            RETURN NULL;
        END IF;
    ELSIF (choice = 1) THEN
        IF (is_shop_complaint = false AND is_comment_complaint = true AND is_delivery_complaint = false) THEN
            RETURN NEW;
        ELSE
            RAISE EXCEPTION 'Invalid comment complaint';
            RETURN NULL;
        END IF;
    ELSIF (choice = 2) THEN
        IF (is_shop_complaint = false AND is_comment_complaint = false AND is_delivery_complaint = true) THEN
            RETURN NEW;
        ELSE
            RAISE EXCEPTION 'Invalid delivery complaint';
            RETURN NULL;
        END IF;
    ELSE
        RAISE EXCEPTION 'Invalid choice';
        RETURN NULL;
    END IF;

END;
$$ LANGUAGE plpgsql;

CREATE CONSTRAINT TRIGGER reject_shop_complaint
AFTER INSERT ON shop_complaint
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW EXECUTE FUNCTION reject_duplicate_complaint_fn(0);

CREATE CONSTRAINT TRIGGER reject_comment_complaint
AFTER INSERT ON comment_complaint
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW EXECUTE FUNCTION reject_duplicate_complaint_fn(1);

CREATE CONSTRAINT TRIGGER reject_delivery_complaint
AFTER INSERT ON delivery_complaint
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW EXECUTE FUNCTION reject_duplicate_complaint_fn(2);
