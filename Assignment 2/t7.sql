CREATE OR REPLACE FUNCTION check_user_of_review_func()
RETURNS TRIGGER AS $$
DECLARE
    lcount number;
BEGIN
    SELECT COUNT(*) INTO lcount
    FROM comment, orders 
    WHERE NEW.id = comment.id
    AND comment.user_id = orders.user_id
    AND NEW.order_id = orders.id

    IF lcount = 0 THEN
        RAISE EXCEPTION 'Review can also be posted by the user who had purchased that product';
        return NULL;
    END IF;

    RETURN NEW;
END;
$$ language plpgsql;

CREATE OR REPLACE TRIGGER check_user_of_review
BEFORE INSERT ON review
FOR EACH ROW EXECUTE FUNCTION check_user_of_review_func();
