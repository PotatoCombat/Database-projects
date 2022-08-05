DROP TRIGGER IF EXISTS check_review_version ON review;
DROP FUNCTION IF EXISTS check_review_version_func;

CREATE OR REPLACE FUNCTION check_review_version_func()
RETURNS TRIGGER AS $$
BEGIN
    IF NOT EXISTS(SELECT review_id FROM review_version WHERE review_id = NEW.id) THEN
        RAISE EXCEPTION 'Add a version to this review.';
		RETURN NULL;
    END IF;
    RETURN NEW;
END;
$$ language plpgsql;

CREATE CONSTRAINT TRIGGER check_review_version
AFTER INSERT ON review
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW EXECUTE FUNCTION check_review_version_func();
