CREATE OR REPLACE procedure reply (
	user_id INTEGER,
	other_comment_id INTEGER,
	content TEXT,
	reply_timestamp TIMESTAMP)
AS $$
DECLARE
	comment_id INTEGER;
BEGIN
	SELECT COALESCE(max(id), 0) + 1
	INTO comment_id
	FROM comment;

    insert into comment(id, user_id)
    values (comment_id, user_id);

    insert into reply(id, other_comment_id)
    values (comment_id, other_comment_id);

    insert into reply_version(reply_id, reply_timestamp, content)
    values (comment_id, reply_timestamp, content);
END;
$$ LANGUAGE plpgsql;
