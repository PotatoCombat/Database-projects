DROP TABLE IF EXISTS exams CASCADE;

CREATE TABLE exams (
	sid int,
	cid int,
	score int,
	PRIMARY KEY (sid, cid)
);

INSERT INTO exams (sid, cid, score) VALUES
(1, 10, 50),
(1, 11, 60),
(1, 12, 61),
(1, 13, 62),
(1, 14, 70),
(2, 10, 60),
(2, 11, 70),
(2, 12, 80)
;

CREATE OR REPLACE FUNCTION revised_avg( IN stu_id integer, OUT r_avg float )
RETURNS float as $$
BEGIN
    SELECT CASE
        WHEN count(score) >= 3 THEN (sum(score) - max(score) - min(score)) / (count(score) - 2)
        ELSE NULL
        END
    INTO r_avg
    FROM exams
    GROUP BY sid
    HAVING sid = stu_id;
END
$$ LANGUAGE plpgsql;