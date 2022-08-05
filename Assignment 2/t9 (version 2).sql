DROP TRIGGER IF EXISTS check_reply_version ON reply;
DROP FUNCTION IF EXISTS check_reply_version_func;

CREATE OR REPLACE FUNCTION check_reply_version_func()
RETURNS TRIGGER AS $$
BEGIN
    IF NOT EXISTS(SELECT reply_id FROM reply_version WHERE reply_id = NEW.id) THEN
        RAISE EXCEPTION 'Add a version to this reply.';
		RETURN NULL;
    END IF;
    RETURN NEW;
END;
$$ language plpgsql;

CREATE CONSTRAINT TRIGGER check_reply_version
AFTER INSERT ON reply
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW EXECUTE FUNCTION check_reply_version_func();
