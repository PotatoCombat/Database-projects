DROP FUNCTION IF EXISTS view_comments;

CREATE FUNCTION view_comments(
    shop_id INTEGER,
    product_id INTEGER,
    sell_timestamp TIMESTAMP)
RETURNS TABLE(
    username TEXT,
    content TEXT,
    rating INTEGER,
    comment_timestamp TIMESTAMP) AS $$
BEGIN
    RETURN QUERY
    WITH RECURSIVE
    fullComments AS (
        SELECT comment.id AS _id,
               CASE WHEN users.account_closed THEN 'A Deleted User'
                    ELSE users.name
               END AS _username
        FROM comment
        JOIN users ON comment.user_id = users.id
    ),
    recentReviews AS (
        SELECT c._id,
               c._username,
               rv.review_timestamp AS _comment_timestamp,
               rv.content AS _content,
               rv.rating AS _rating
        FROM fullComments c
        JOIN review_version rv ON c._id = rv.review_id
        WHERE rv.review_timestamp = (
            SELECT max(rv2.review_timestamp)
            FROM review_version rv2
            WHERE rv.review_id = rv2.review_id
        )
    ),
    recentReplies AS (
        SELECT c._id,
               c._username,
               rv.reply_timestamp AS _comment_timestamp,
               rv.content AS _content,
               rp.other_comment_id AS _pid
        FROM fullComments c
        JOIN reply_version rv ON c._id = rv.reply_id
        JOIN reply rp ON c._id = rp.id
        WHERE rv.reply_timestamp = (
            SELECT max(rv2.reply_timestamp)
            FROM reply_version rv2
            WHERE rv.reply_id = rv2.reply_id
        )
    ),
    relatedComments AS (
        SELECT rrv._id,
               rrv._username,
               rrv._content,
               rrv._rating,
               rrv._comment_timestamp
        FROM recentReviews rrv
        WHERE rrv._id = (
            SELECT rv.id
            FROM review rv
            WHERE rv.shop_id = IN.shop_id
            AND rv.product_id = IN.product_id
            AND rv.sell_timestamp = IN.sell_timestamp
        )
        UNION
        SELECT rrp._id,
               rrp._username,
               rrp._content,
               NULL AS _rating,
               rrp._comment_timestamp
        FROM recentReplies rrp
        JOIN relatedComments rc ON rrp._pid = rc._id
    )
    SELECT _username,
           _content,
           _rating,
           _comment_timestamp
    FROM relatedComments
    ORDER BY _comment_timestamp, _id;

END
$$ LANGUAGE plpgsql;
