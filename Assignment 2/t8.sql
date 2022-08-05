DROP TRIGGER IF EXISTS new_comment ON comment;
DROP FUNCTION IF EXISTS new_comment_fn;

DROP TRIGGER IF EXISTS check_comment_review ON review;
DROP TRIGGER IF EXISTS check_comment_reply ON reply;

DROP FUNCTION IF EXISTS check_only_review_fn;
DROP FUNCTION IF EXISTS check_only_reply_fn;

CREATE OR REPLACE FUNCTION new_comment_fn()
RETURNS TRIGGER AS $$
BEGIN
    IF (NEW.id NOT IN (SELECT id FROM review)
        AND NEW.id NOT IN (SELECT id FROM reply)) THEN
        RAISE EXCEPTION 'Comments need to be either a review or reply.';
        RETURN NULL;
    ELSE
        RETURN NEW;
    END IF;
END
$$ LANGUAGE plpgsql;

CREATE CONSTRAINT TRIGGER new_comment
AFTER INSERT ON comment
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW EXECUTE FUNCTION new_comment_fn();

CREATE OR REPLACE FUNCTION check_only_review_fn()
RETURNS TRIGGER AS $$
DECLARE
    lcount INTEGER;
BEGIN
    SELECT COUNT(*) INTO lcount
    FROM reply
    WHERE id = NEW.id;

    IF lcount > 0 THEN
        RAISE NOTICE 'Same comment cannot be both review and reply';
        RETURN NULL;
    ELSE
        RETURN NEW;
    END IF;
END
$$ language plpgsql;

CREATE OR REPLACE FUNCTION check_only_reply_fn()
RETURNS TRIGGER AS $$
DECLARE
    lcount INTEGER;
BEGIN
    SELECT COUNT(*) INTO lcount
    FROM review
    WHERE id = NEW.id;

    IF lcount > 0 THEN
        RAISE NOTICE 'Same comment cannot be both review and reply';
        RETURN NULL;
    ELSE
        RETURN NEW;
    END IF;
END
$$ language plpgsql;

CREATE TRIGGER check_comment_review
BEFORE INSERT ON review
FOR EACH ROW EXECUTE FUNCTION check_only_review_fn();

CREATE TRIGGER check_comment_reply
BEFORE INSERT ON reply
FOR EACH ROW EXECUTE FUNCTION check_only_reply_fn();
