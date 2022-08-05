-- Testing Query for Question 7

-- Load data for testcase 1

DELETE FROM Transcripts;
DELETE FROM Tutors;
DELETE FROM Teaches;
DELETE FROM Offerings;
DELETE FROM Courses;
DELETE FROM Profs;
DELETE FROM Students;
DELETE FROM Departments;



INSERT INTO departments (did, faculty) VALUES 
('maths','fos'),
('cs','soc')
;

INSERT INTO students (sid, did, year) VALUES 
('alice','cs',2020),
('carol','maths',2018),
('bob','cs',2019),
('dave','cs',2019),
('eve','maths',2021),
('fred','cs',2018)
;

INSERT INTO profs (pid, did) VALUES 
('homer','cs'),
('maggie','cs'),
('willie','maths'),
('lisa','maths')
;

INSERT INTO courses (cid, did, credits) VALUES 
('cs1','cs',5),
('cs2','cs',5),
('cs3','cs',5),
('ma4','maths',5)
;

INSERT INTO offerings (cid, year, semester) VALUES 
('cs1',2019,1),
('cs1',2020,1),
('cs1',2021,2),
('cs1',2022,1),
('cs2',2020,1),
('cs2',2021,2),
('cs3',2020,1),
('ma4',2020,1),
('ma4',2021,2)
;

INSERT INTO teaches (pid, cid, year, semester, hours) VALUES 
('homer','cs1',2019,1,30),
('lisa','cs1',2019,1,30),
('homer','cs1',2020,1,30),
('lisa','cs1',2020,1,30),
('homer','cs1',2021,2,30),
('lisa','cs1',2021,2,30),
('homer','cs1',2022,1,30),
('maggie','cs2',2020,1,30),
('lisa','cs2',2020,1,30),
('maggie','cs2',2021,2,30),
('lisa','cs2',2021,2,30),
('homer','cs3',2020,1,30),
('lisa','cs3',2020,1,30),
('maggie','ma4',2020,1,30),
('lisa','ma4',2020,1,30),
('maggie','ma4',2021,2,30),
('lisa','ma4',2021,2,30)
;

INSERT INTO tutors (sid, cid, year, semester, hours) VALUES 
('alice','cs1',2022,1,10),
('bob','cs1',2022,1,10),
('dave','cs1',2022,1,10),
('eve','cs1',2022,1,10)
;

INSERT INTO transcripts (sid, cid, year, semester, marks) VALUES 
('alice','cs2',2020,1,90),
('alice','cs3',2020,1,90),
('bob','cs1',2021,2,70),
('carol','cs1',2021,2,60),
('eve','cs1',2021,2,60),
('eve','cs2',2021,2,50),
('eve','ma4',2021,2,90),
('fred','cs1',2019,1,40),
('fred','cs1',2020,1,40),
('fred','cs1',2021,2,40),
('fred','cs1',2022,1,40),
('fred','cs2',2020,1,40),
('fred','cs2',2021,2,40),
('fred','cs3',2020,1,40),
('fred','ma4',2020,1,40),
('fred','ma4',2021,2,40)
;


DROP VIEW IF EXISTS zzanswer, zzsolution;
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v7;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb1q7;

-- Compare zzsolution and zzanswer for Question 7 on testcase 1
WITH correct AS  ( 
	SELECT * FROM zzanswer 
	INTERSECT ALL 
	SELECT * FROM zzsolution
), 
extra AS (
	SELECT * FROM zzanswer 
	EXCEPT ALL 
	SELECT * FROM zzsolution
), 
missing AS (
	SELECT * FROM zzsolution 
	EXCEPT ALL 
	SELECT * FROM zzanswer
) 
INSERT INTO zzSummary
SELECT 'Test case ' || 1 || ' - ' || 
CASE 
	WHEN (SELECT COALESCE(COUNT(*),0) FROM extra) = 0 THEN
		CASE 
			WHEN (SELECT COALESCE(COUNT(*),0) FROM missing) = 0  THEN 'CORRECT'
			ELSE 'INCORRECT: MISSING = ' || (SELECT COUNT(*) FROM missing)
		END
	WHEN (SELECT COALESCE(COUNT(*),0) FROM missing) = 0  THEN 'INCORRECT: EXTRA = ' || (SELECT COUNT(*) FROM extra)
	ELSE 'INCORRECT: MISSING = ' || (SELECT COUNT(*) FROM missing) || ', EXTRA = ' || (SELECT COUNT(*) FROM extra)
END as status;

WITH correct AS  (
	SELECT * FROM zzsolution 
	INTERSECT ALL 
	SELECT * FROM zzanswer
), 
extra AS (
	SELECT * FROM zzanswer EXCEPT ALL SELECT * FROM zzsolution
), 
missing AS (
	SELECT * FROM zzsolution EXCEPT ALL select * FROM zzanswer
)
SELECT *, 'OK' AS "Test case 1"
FROM correct 
UNION ALL 
SELECT *, 'EXTRA' FROM extra 
UNION ALL 
SELECT *, 'MISSING' FROM missing;
--ORDER BY status;

-- Load data for testcase 2

DELETE FROM Transcripts;
DELETE FROM Tutors;
DELETE FROM Teaches;
DELETE FROM Offerings;
DELETE FROM Courses;
DELETE FROM Profs;
DELETE FROM Students;
DELETE FROM Departments;



INSERT INTO departments (did, faculty) VALUES 
('maths','fos'),
('cs','soc')
;

INSERT INTO students (sid, did, year) VALUES 
('carol','cs',2018),
('alice','cs',2020),
('bob','cs',2019),
('dave','cs',2019),
('eve','cs',2021),
('fred','cs',2018),
('george','cs',2019)
;

INSERT INTO profs (pid, did) VALUES 
('homer','cs'),
('maggie','cs'),
('lisa','maths')
;

INSERT INTO courses (cid, did, credits) VALUES 
('cs1','cs',5),
('cs2','cs',5),
('cs3','cs',5),
('cs4','cs',5),
('ma1','maths',5)
;

INSERT INTO offerings (cid, year, semester) VALUES 
('cs1',2019,2),
('cs1',2020,2),
('cs1',2021,2),
('cs1',2022,1),
('cs2',2020,2),
('cs2',2021,2),
('cs3',2020,2),
('cs4',2020,2),
('cs4',2021,2),
('ma1',2022,1)
;

INSERT INTO teaches (pid, cid, year, semester, hours) VALUES 
('homer','cs1',2019,2,30),
('homer','cs1',2020,2,30),
('homer','cs1',2021,2,30),
('homer','cs1',2022,1,30),
('maggie','cs2',2020,2,30),
('maggie','cs2',2021,2,30),
('homer','cs3',2020,2,30),
('maggie','cs4',2020,2,30),
('maggie','cs4',2021,2,30),
('lisa','ma1',2022,1,40)
;

INSERT INTO tutors (sid, cid, year, semester, hours) VALUES 
('alice','cs1',2022,1,10),
('bob','cs1',2022,1,10),
('dave','cs1',2022,1,10),
('eve','cs1',2022,1,10),
('george','cs1',2022,1,4),
('george','ma1',2022,1,6)
;

INSERT INTO transcripts (sid, cid, year, semester, marks) VALUES 
('fred','cs1',2019,2,40),
('fred','cs1',2020,2,40),
('fred','cs1',2021,2,40),
('fred','cs1',2022,1,40),
('fred','cs2',2020,2,40),
('fred','cs2',2021,2,40),
('fred','cs3',2020,2,40),
('fred','cs4',2020,2,40),
('fred','cs4',2021,2,40),
('fred','ma1',2022,1,40),
('alice','cs1',2020,2,100),
('alice','cs2',2020,2,80),
('alice','cs3',2020,2,90),
('eve','cs1',2021,2,90),
('eve','cs2',2021,2,70),
('eve','cs4',2021,2,76),
('george','cs3',2020,2,80)
;


DROP VIEW IF EXISTS zzanswer, zzsolution;
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v7;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb2q7;

-- Compare zzsolution and zzanswer for Question 7 on testcase 2
WITH correct AS  ( 
	SELECT * FROM zzanswer 
	INTERSECT ALL 
	SELECT * FROM zzsolution
), 
extra AS (
	SELECT * FROM zzanswer 
	EXCEPT ALL 
	SELECT * FROM zzsolution
), 
missing AS (
	SELECT * FROM zzsolution 
	EXCEPT ALL 
	SELECT * FROM zzanswer
) 
INSERT INTO zzSummary
SELECT 'Test case ' || 2 || ' - ' || 
CASE 
	WHEN (SELECT COALESCE(COUNT(*),0) FROM extra) = 0 THEN
		CASE 
			WHEN (SELECT COALESCE(COUNT(*),0) FROM missing) = 0  THEN 'CORRECT'
			ELSE 'INCORRECT: MISSING = ' || (SELECT COUNT(*) FROM missing)
		END
	WHEN (SELECT COALESCE(COUNT(*),0) FROM missing) = 0  THEN 'INCORRECT: EXTRA = ' || (SELECT COUNT(*) FROM extra)
	ELSE 'INCORRECT: MISSING = ' || (SELECT COUNT(*) FROM missing) || ', EXTRA = ' || (SELECT COUNT(*) FROM extra)
END as status;

WITH correct AS  (
	SELECT * FROM zzsolution 
	INTERSECT ALL 
	SELECT * FROM zzanswer
), 
extra AS (
	SELECT * FROM zzanswer EXCEPT ALL SELECT * FROM zzsolution
), 
missing AS (
	SELECT * FROM zzsolution EXCEPT ALL select * FROM zzanswer
)
SELECT *, 'OK' AS "Test case 2"
FROM correct 
UNION ALL 
SELECT *, 'EXTRA' FROM extra 
UNION ALL 
SELECT *, 'MISSING' FROM missing;
--ORDER BY status;

-- Load data for testcase 3

DELETE FROM Transcripts;
DELETE FROM Tutors;
DELETE FROM Teaches;
DELETE FROM Offerings;
DELETE FROM Courses;
DELETE FROM Profs;
DELETE FROM Students;
DELETE FROM Departments;




INSERT INTO departments (did, faculty) VALUES 
('maths','fos'),
('cs','soc')
;

INSERT INTO students (sid, did, year) VALUES 
('alice','cs',2020),
('carol','cs',2018),
('bob','cs',2019),
('dave','cs',2019),
('eve','cs',2021),
('fred','cs',2018)
;

INSERT INTO profs (pid, did) VALUES 
('homer','cs'),
('maggie','cs')
;

INSERT INTO courses (cid, did, credits) VALUES 
('cs1','cs',5),
('cs2','cs',5),
('cs3','cs',5),
('cs4','cs',5)
;

INSERT INTO offerings (cid, year, semester) VALUES 
('cs1',2019,2),
('cs1',2020,2),
('cs1',2021,2),
('cs2',2020,2),
('cs2',2021,2),
('cs3',2020,2),
('cs4',2020,2),
('cs4',2021,2)
;

INSERT INTO teaches (pid, cid, year, semester, hours) VALUES 
('homer','cs1',2019,2,30),
('homer','cs1',2020,2,30),
('homer','cs1',2021,2,30),
('maggie','cs2',2020,2,30),
('maggie','cs2',2021,2,30),
('homer','cs3',2020,2,30),
('maggie','cs4',2020,2,30),
('maggie','cs4',2021,2,30)
;

INSERT INTO transcripts (sid, cid, year, semester, marks) VALUES 
('fred','cs1',2019,2,40),
('fred','cs1',2020,2,40),
('alice','cs1',2020,2,40),
('carol','cs1',2021,2,60),
('eve','cs1',2021,2,60),
('fred','cs1',2021,2,40),
('alice','cs2',2020,2,90),
('fred','cs2',2020,2,40),
('eve','cs2',2021,2,50),
('fred','cs2',2021,2,40),
('fred','cs4',2020,2,40),
('fred','cs4',2021,2,40),
('eve','cs4',2021,2,90),
('alice','cs3',2020,2,90),
('bob','cs1',2021,2,70),
('fred','cs3',2020,2,40)
;



DROP VIEW IF EXISTS zzanswer, zzsolution;
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v7;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb3q7;

-- Compare zzsolution and zzanswer for Question 7 on testcase 3
WITH correct AS  ( 
	SELECT * FROM zzanswer 
	INTERSECT ALL 
	SELECT * FROM zzsolution
), 
extra AS (
	SELECT * FROM zzanswer 
	EXCEPT ALL 
	SELECT * FROM zzsolution
), 
missing AS (
	SELECT * FROM zzsolution 
	EXCEPT ALL 
	SELECT * FROM zzanswer
) 
INSERT INTO zzSummary
SELECT 'Test case ' || 3 || ' - ' || 
CASE 
	WHEN (SELECT COALESCE(COUNT(*),0) FROM extra) = 0 THEN
		CASE 
			WHEN (SELECT COALESCE(COUNT(*),0) FROM missing) = 0  THEN 'CORRECT'
			ELSE 'INCORRECT: MISSING = ' || (SELECT COUNT(*) FROM missing)
		END
	WHEN (SELECT COALESCE(COUNT(*),0) FROM missing) = 0  THEN 'INCORRECT: EXTRA = ' || (SELECT COUNT(*) FROM extra)
	ELSE 'INCORRECT: MISSING = ' || (SELECT COUNT(*) FROM missing) || ', EXTRA = ' || (SELECT COUNT(*) FROM extra)
END as status;

WITH correct AS  (
	SELECT * FROM zzsolution 
	INTERSECT ALL 
	SELECT * FROM zzanswer
), 
extra AS (
	SELECT * FROM zzanswer EXCEPT ALL SELECT * FROM zzsolution
), 
missing AS (
	SELECT * FROM zzsolution EXCEPT ALL select * FROM zzanswer
)
SELECT *, 'OK' AS "Test case 3"
FROM correct 
UNION ALL 
SELECT *, 'EXTRA' FROM extra 
UNION ALL 
SELECT *, 'MISSING' FROM missing;
--ORDER BY status;

-- Load data for testcase 4

DELETE FROM Transcripts;
DELETE FROM Tutors;
DELETE FROM Teaches;
DELETE FROM Offerings;
DELETE FROM Courses;
DELETE FROM Profs;
DELETE FROM Students;
DELETE FROM Departments;



INSERT INTO departments (did, faculty) VALUES 
('maths','fos'),
('cs','soc')
;

INSERT INTO students (sid, did, year) VALUES 
('alice','cs',2020),
('carol','cs',2018),
('bob','cs',2019),
('dave','cs',2019),
('eve','cs',2021),
('george','maths',2018),
('irene','maths',2018),
('fred','cs',2018)
;

INSERT INTO profs (pid, did) VALUES 
('homer','cs'),
('maggie','cs')
;

INSERT INTO courses (cid, did, credits) VALUES 
('cs1','cs',5),
('cs2','cs',5),
('cs3','cs',5),
('cs4','cs',5)
;

INSERT INTO offerings (cid, year, semester) VALUES 
('cs1',2019,2),
('cs1',2020,2),
('cs1',2021,2),
('cs1',2022,1),
('cs2',2020,2),
('cs2',2021,2),
('cs3',2020,2),
('cs4',2020,2),
('cs4',2021,2)
;

INSERT INTO teaches (pid, cid, year, semester, hours) VALUES 
('homer','cs1',2019,2,30),
('homer','cs1',2020,2,30),
('homer','cs1',2021,2,30),
('homer','cs1',2022,1,30),
('maggie','cs2',2020,2,30),
('maggie','cs2',2021,2,30),
('homer','cs3',2020,2,30),
('maggie','cs4',2020,2,30),
('maggie','cs4',2021,2,30)
;

INSERT INTO tutors (sid, cid, year, semester, hours) VALUES 
('alice','cs1',2022,1,10),
('bob','cs1',2022,1,10),
('dave','cs1',2022,1,10),
('eve','cs1',2022,1,10)
;

INSERT INTO transcripts (sid, cid, year, semester, marks) VALUES 
('alice','cs2',2020,2,90),
('fred','cs2',2020,2,40),
('alice','cs3',2020,2,80),
('george','cs3',2020,2,80),
('fred','cs3',2020,2,40),
('fred','cs1',2020,2,40),
('fred','cs4',2020,2,40),
('bob','cs1',2021,2,70),
('carol','cs1',2021,2,60),
('eve','cs1',2021,2,60),
('fred','cs1',2021,2,40),
('eve','cs2',2021,2,50),
('irene','cs2',2021,2,80),
('fred','cs2',2021,2,40),
('irene','cs4',2021,2,80),
('eve','cs4',2021,2,60),
('fred','cs4',2021,2,40),
('fred','cs1',2019,2,40),
('fred','cs1',2022,1,40),
('irene','cs1',2022,1,60)

;


DROP VIEW IF EXISTS zzanswer, zzsolution;
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v7;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb4q7;

-- Compare zzsolution and zzanswer for Question 7 on testcase 4
WITH correct AS  ( 
	SELECT * FROM zzanswer 
	INTERSECT ALL 
	SELECT * FROM zzsolution
), 
extra AS (
	SELECT * FROM zzanswer 
	EXCEPT ALL 
	SELECT * FROM zzsolution
), 
missing AS (
	SELECT * FROM zzsolution 
	EXCEPT ALL 
	SELECT * FROM zzanswer
) 
INSERT INTO zzSummary
SELECT 'Test case ' || 4 || ' - ' || 
CASE 
	WHEN (SELECT COALESCE(COUNT(*),0) FROM extra) = 0 THEN
		CASE 
			WHEN (SELECT COALESCE(COUNT(*),0) FROM missing) = 0  THEN 'CORRECT'
			ELSE 'INCORRECT: MISSING = ' || (SELECT COUNT(*) FROM missing)
		END
	WHEN (SELECT COALESCE(COUNT(*),0) FROM missing) = 0  THEN 'INCORRECT: EXTRA = ' || (SELECT COUNT(*) FROM extra)
	ELSE 'INCORRECT: MISSING = ' || (SELECT COUNT(*) FROM missing) || ', EXTRA = ' || (SELECT COUNT(*) FROM extra)
END as status;

WITH correct AS  (
	SELECT * FROM zzsolution 
	INTERSECT ALL 
	SELECT * FROM zzanswer
), 
extra AS (
	SELECT * FROM zzanswer EXCEPT ALL SELECT * FROM zzsolution
), 
missing AS (
	SELECT * FROM zzsolution EXCEPT ALL select * FROM zzanswer
)
SELECT *, 'OK' AS "Test case 4"
FROM correct 
UNION ALL 
SELECT *, 'EXTRA' FROM extra 
UNION ALL 
SELECT *, 'MISSING' FROM missing;
--ORDER BY status;

-- Load data for testcase 5

DELETE FROM Transcripts;
DELETE FROM Tutors;
DELETE FROM Teaches;
DELETE FROM Offerings;
DELETE FROM Courses;
DELETE FROM Profs;
DELETE FROM Students;
DELETE FROM Departments;



INSERT INTO departments (did, faculty) VALUES 
('maths','fos'),
('disa','soc'),
('cs','soc')
;

INSERT INTO students (sid, did, year) VALUES 
('alice','cs',2020),
('carol','cs',2018),
('bob','cs',2019),
('dave','cs',2019),
('eve','cs',2021),
('kath','maths',2020),
('fred','cs',2018)
;

INSERT INTO profs (pid, did) VALUES 
('homer','cs'),
('maggie','cs')
;

INSERT INTO courses (cid, did, credits) VALUES 
('cs1','cs',5),
('cs2','cs',5),
('cs3','cs',5),
('is4','disa',5)
;

INSERT INTO offerings (cid, year, semester) VALUES 
('cs1',2019,2),
('cs1',2020,2),
('cs1',2021,2),
('cs1',2022,1),
('cs2',2020,2),
('cs2',2021,2),
('cs3',2020,2),
('is4',2020,2),
('is4',2021,2)
;

INSERT INTO teaches (pid, cid, year, semester, hours) VALUES 
('homer','cs1',2019,2,30),
('homer','cs1',2020,2,30),
('homer','cs1',2021,2,30),
('homer','cs1',2022,1,30),
('maggie','cs2',2020,2,30),
('maggie','cs2',2021,2,30),
('homer','cs3',2020,2,30),
('maggie','is4',2020,2,30),
('maggie','is4',2021,2,30)
;

INSERT INTO tutors (sid, cid, year, semester, hours) VALUES 
('alice','cs1',2022,1,10),
('bob','cs1',2022,1,10),
('dave','cs1',2022,1,10),
('eve','cs1',2022,1,10)
;

INSERT INTO transcripts (sid, cid, year, semester, marks) VALUES 
('alice','cs2',2020,2,90),
('alice','cs3',2020,2,90),
('bob','cs1',2021,2,70),
('carol','cs1',2021,2,60),
('eve','cs1',2021,2,60),
('eve','cs2',2021,2,50),
('eve','is4',2021,2,90),
('kath','is4',2021,2,90),
('fred','cs1',2019,2,40),
('fred','cs1',2020,2,40),
('fred','cs1',2021,2,40),
('fred','cs1',2022,1,40),
('fred','cs2',2020,2,40),
('fred','cs2',2021,2,40),
('fred','cs3',2020,2,40),
('fred','is4',2020,2,40),
('fred','is4',2021,2,40)
;


DROP VIEW IF EXISTS zzanswer, zzsolution;
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v7;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb5q7;

-- Compare zzsolution and zzanswer for Question 7 on testcase 5
WITH correct AS  ( 
	SELECT * FROM zzanswer 
	INTERSECT ALL 
	SELECT * FROM zzsolution
), 
extra AS (
	SELECT * FROM zzanswer 
	EXCEPT ALL 
	SELECT * FROM zzsolution
), 
missing AS (
	SELECT * FROM zzsolution 
	EXCEPT ALL 
	SELECT * FROM zzanswer
) 
INSERT INTO zzSummary
SELECT 'Test case ' || 5 || ' - ' || 
CASE 
	WHEN (SELECT COALESCE(COUNT(*),0) FROM extra) = 0 THEN
		CASE 
			WHEN (SELECT COALESCE(COUNT(*),0) FROM missing) = 0  THEN 'CORRECT'
			ELSE 'INCORRECT: MISSING = ' || (SELECT COUNT(*) FROM missing)
		END
	WHEN (SELECT COALESCE(COUNT(*),0) FROM missing) = 0  THEN 'INCORRECT: EXTRA = ' || (SELECT COUNT(*) FROM extra)
	ELSE 'INCORRECT: MISSING = ' || (SELECT COUNT(*) FROM missing) || ', EXTRA = ' || (SELECT COUNT(*) FROM extra)
END as status;

WITH correct AS  (
	SELECT * FROM zzsolution 
	INTERSECT ALL 
	SELECT * FROM zzanswer
), 
extra AS (
	SELECT * FROM zzanswer EXCEPT ALL SELECT * FROM zzsolution
), 
missing AS (
	SELECT * FROM zzsolution EXCEPT ALL select * FROM zzanswer
)
SELECT *, 'OK' AS "Test case 5"
FROM correct 
UNION ALL 
SELECT *, 'EXTRA' FROM extra 
UNION ALL 
SELECT *, 'MISSING' FROM missing;
--ORDER BY status;

-- Load data for testcase 6

DELETE FROM Transcripts;
DELETE FROM Tutors;
DELETE FROM Teaches;
DELETE FROM Offerings;
DELETE FROM Courses;
DELETE FROM Profs;
DELETE FROM Students;
DELETE FROM Departments;




INSERT INTO departments (did, faculty) VALUES 
('maths','fos'),
('cs','soc'),
('ee','foe'),
('disa','soc')
;

INSERT INTO students (sid, did, year) VALUES 
('alice','cs',2021),
('eve','cs',2021),
('george','maths',2021),
('irene','maths',2021),
('jill','disa',2021),
('kath','disa',2021),
('mike','disa',2021),
('carol','cs',2018),
('bob','cs',2019),
('dave','cs',2019),
('fred','cs',2018)
;

INSERT INTO profs (pid, did) VALUES 
('homer','cs'),
('maggie','cs'),
('lisa','disa')
;

INSERT INTO courses (cid, did, credits) VALUES 
('cs1','cs',5),
('cs2','cs',5),
('cs3','cs',5),
('is3','disa',5),
('is4','disa',5),
('is5','disa',5)
;

INSERT INTO offerings (cid, year, semester) VALUES 
('cs1',2021,2),
('cs2',2021,2),
('is4',2021,2),
('is5',2021,1),
('cs1',2019,2),
('cs1',2020,2),
('cs1',2022,1),
('cs2',2020,2),
('cs3',2020,2),
('is4',2020,2)
;

INSERT INTO teaches (pid, cid, year, semester, hours) VALUES 
('lisa','is4',2021,2,30),
('lisa','is5',2021,1,30),
('homer','cs1',2019,2,30),
('homer','cs1',2020,2,30),
('homer','cs1',2021,2,30),
('homer','cs1',2022,1,30),
('maggie','cs2',2020,2,30),
('maggie','cs2',2021,2,30),
('homer','cs3',2020,2,30),
('maggie','is4',2020,2,30),
('maggie','is4',2021,2,30)
;

INSERT INTO tutors (sid, cid, year, semester, hours) VALUES 
('alice','cs1',2022,1,10),
('bob','cs1',2022,1,10),
('dave','cs1',2022,1,10),
('eve','cs1',2022,1,10)
;

INSERT INTO transcripts (sid, cid, year, semester, marks) VALUES 
('irene','is4',2021,2,80),
('alice','is4',2021,2,90),
('eve','is4',2021,2,90),
('irene','is5',2021,1,80),
('jill','is5',2021,1,80),
('bob','cs1',2021,2,70),
('carol','cs1',2021,2,60),
('eve','cs1',2021,2,60),
('mike','cs1',2021,2,60),
('irene','cs1',2021,2,60),
('alice','cs2',2021,2,90),
('eve','cs2',2021,2,50),
('mike','cs2',2021,2,50),
('fred','cs1',2019,2,40),
('fred','cs1',2020,2,40),
('fred','cs1',2021,2,40),
('fred','cs1',2022,1,40),
('fred','cs2',2020,2,40),
('fred','cs2',2021,2,40),
('fred','cs3',2020,2,40),
('fred','is4',2020,2,40),
('fred','is4',2021,2,40)
;




DROP VIEW IF EXISTS zzanswer, zzsolution;
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v7;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb6q7;

-- Compare zzsolution and zzanswer for Question 7 on testcase 6
WITH correct AS  ( 
	SELECT * FROM zzanswer 
	INTERSECT ALL 
	SELECT * FROM zzsolution
), 
extra AS (
	SELECT * FROM zzanswer 
	EXCEPT ALL 
	SELECT * FROM zzsolution
), 
missing AS (
	SELECT * FROM zzsolution 
	EXCEPT ALL 
	SELECT * FROM zzanswer
) 
INSERT INTO zzSummary
SELECT 'Test case ' || 6 || ' - ' || 
CASE 
	WHEN (SELECT COALESCE(COUNT(*),0) FROM extra) = 0 THEN
		CASE 
			WHEN (SELECT COALESCE(COUNT(*),0) FROM missing) = 0  THEN 'CORRECT'
			ELSE 'INCORRECT: MISSING = ' || (SELECT COUNT(*) FROM missing)
		END
	WHEN (SELECT COALESCE(COUNT(*),0) FROM missing) = 0  THEN 'INCORRECT: EXTRA = ' || (SELECT COUNT(*) FROM extra)
	ELSE 'INCORRECT: MISSING = ' || (SELECT COUNT(*) FROM missing) || ', EXTRA = ' || (SELECT COUNT(*) FROM extra)
END as status;

WITH correct AS  (
	SELECT * FROM zzsolution 
	INTERSECT ALL 
	SELECT * FROM zzanswer
), 
extra AS (
	SELECT * FROM zzanswer EXCEPT ALL SELECT * FROM zzsolution
), 
missing AS (
	SELECT * FROM zzsolution EXCEPT ALL select * FROM zzanswer
)
SELECT *, 'OK' AS "Test case 6"
FROM correct 
UNION ALL 
SELECT *, 'EXTRA' FROM extra 
UNION ALL 
SELECT *, 'MISSING' FROM missing;
--ORDER BY status;

-- Load data for testcase 7

DELETE FROM Transcripts;
DELETE FROM Tutors;
DELETE FROM Teaches;
DELETE FROM Offerings;
DELETE FROM Courses;
DELETE FROM Profs;
DELETE FROM Students;
DELETE FROM Departments;



INSERT INTO departments (did, faculty) VALUES 
('maths','fos'),
('cs','soc')
;

INSERT INTO students (sid, did, year) VALUES 
('alice','cs',2020),
('carol','cs',2018),
('bob','cs',2019),
('dave','cs',2019),
('eve','cs',2021),
('fred','cs',2018)
;

INSERT INTO profs (pid, did) VALUES 
('homer','cs'),
('maggie','cs')
;

INSERT INTO courses (cid, did, credits) VALUES 
('cs1','cs',5),
('cs2','cs',5),
('cs3','cs',5),
('cs4','cs',5)
;

INSERT INTO offerings (cid, year, semester) VALUES 
('cs1',2019,2),
('cs1',2020,2),
('cs1',2021,2),
('cs1',2022,1),
('cs2',2020,2),
('cs2',2021,2),
('cs3',2020,2),
('cs4',2020,2),
('cs4',2021,2)
;

INSERT INTO teaches (pid, cid, year, semester, hours) VALUES 
('homer','cs1',2019,2,20),
('homer','cs1',2020,2,10),
('homer','cs1',2021,2,40),
('homer','cs1',2022,1,30),
('maggie','cs2',2020,2,30),
('maggie','cs2',2021,2,20),
('homer','cs3',2020,2,20),
('maggie','cs4',2020,2,10),
('maggie','cs4',2021,2,10)
;

INSERT INTO tutors (sid, cid, year, semester, hours) VALUES 
('alice','cs1',2022,1,10),
('bob','cs1',2022,1,20),
('dave','cs1',2022,1,20),
('eve','cs1',2022,1,10),
('alice','cs4',2021,2,5)
;

INSERT INTO transcripts (sid, cid, year, semester, marks) VALUES 
('alice','cs2',2020,2,90),
('alice','cs3',2020,2,90),
('bob','cs1',2021,2,70),
('carol','cs1',2021,2,60),
('eve','cs1',2021,2,60),
('eve','cs2',2021,2,50),
('eve','cs4',2021,2,90),
('fred','cs1',2019,2,40),
('fred','cs1',2020,2,40),
('fred','cs1',2021,2,40),
('fred','cs1',2022,1,40),
('fred','cs2',2020,2,40),
('fred','cs2',2021,2,40),
('fred','cs3',2020,2,40),
('fred','cs4',2020,2,40),
('fred','cs4',2021,2,40)
;


DROP VIEW IF EXISTS zzanswer, zzsolution;
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v7;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb7q7;

-- Compare zzsolution and zzanswer for Question 7 on testcase 7
WITH correct AS  ( 
	SELECT * FROM zzanswer 
	INTERSECT ALL 
	SELECT * FROM zzsolution
), 
extra AS (
	SELECT * FROM zzanswer 
	EXCEPT ALL 
	SELECT * FROM zzsolution
), 
missing AS (
	SELECT * FROM zzsolution 
	EXCEPT ALL 
	SELECT * FROM zzanswer
) 
INSERT INTO zzSummary
SELECT 'Test case ' || 7 || ' - ' || 
CASE 
	WHEN (SELECT COALESCE(COUNT(*),0) FROM extra) = 0 THEN
		CASE 
			WHEN (SELECT COALESCE(COUNT(*),0) FROM missing) = 0  THEN 'CORRECT'
			ELSE 'INCORRECT: MISSING = ' || (SELECT COUNT(*) FROM missing)
		END
	WHEN (SELECT COALESCE(COUNT(*),0) FROM missing) = 0  THEN 'INCORRECT: EXTRA = ' || (SELECT COUNT(*) FROM extra)
	ELSE 'INCORRECT: MISSING = ' || (SELECT COUNT(*) FROM missing) || ', EXTRA = ' || (SELECT COUNT(*) FROM extra)
END as status;

WITH correct AS  (
	SELECT * FROM zzsolution 
	INTERSECT ALL 
	SELECT * FROM zzanswer
), 
extra AS (
	SELECT * FROM zzanswer EXCEPT ALL SELECT * FROM zzsolution
), 
missing AS (
	SELECT * FROM zzsolution EXCEPT ALL select * FROM zzanswer
)
SELECT *, 'OK' AS "Test case 7"
FROM correct 
UNION ALL 
SELECT *, 'EXTRA' FROM extra 
UNION ALL 
SELECT *, 'MISSING' FROM missing;
--ORDER BY status;

-- Load data for testcase 8

DELETE FROM Transcripts;
DELETE FROM Tutors;
DELETE FROM Teaches;
DELETE FROM Offerings;
DELETE FROM Courses;
DELETE FROM Profs;
DELETE FROM Students;
DELETE FROM Departments;



INSERT INTO departments (did, faculty) VALUES 
('maths','fos'),
('cs','soc')
;

INSERT INTO students (sid, did, year) VALUES 
('alice','cs',2020),
('carol','cs',2018),
('bob','cs',2019),
('dave','cs',2019),
('eve','cs',2021),
('fred','cs',2018)
;

INSERT INTO profs (pid, did) VALUES 
('homer','cs'),
('maggie','cs')
;

INSERT INTO courses (cid, did, credits) VALUES 
('cs1','cs',5),
('cs2','cs',5),
('cs3','cs',5),
('cs4','cs',5),
('cs5','cs',5),
('ma1','maths',5)
;

INSERT INTO offerings (cid, year, semester) VALUES 
('cs1',2019,2),
('cs1',2020,2),
('cs1',2021,2),
('cs1',2022,1),
('cs2',2020,2),
('cs2',2021,2),
('cs3',2020,2),
('cs4',2020,2),
('cs4',2021,2)
;

INSERT INTO teaches (pid, cid, year, semester, hours) VALUES 
('homer','cs1',2019,2,30),
('homer','cs1',2020,2,30),
('homer','cs1',2021,2,30),
('homer','cs1',2022,1,30),
('maggie','cs2',2020,2,30),
('maggie','cs2',2021,2,30),
('homer','cs3',2020,2,30),
('maggie','cs4',2020,2,30),
('maggie','cs4',2021,2,30)
;

INSERT INTO tutors (sid, cid, year, semester, hours) VALUES 
('alice','cs1',2022,1,10),
('bob','cs1',2022,1,10),
('dave','cs1',2022,1,10),
('eve','cs1',2022,1,10)
;

INSERT INTO transcripts (sid, cid, year, semester, marks) VALUES 
('alice','cs2',2020,2,90),
('alice','cs3',2020,2,90),
('bob','cs1',2021,2,70),
('carol','cs1',2021,2,60),
('eve','cs1',2021,2,60),
('eve','cs2',2021,2,50),
('eve','cs4',2021,2,90),
('fred','cs1',2019,2,40),
('fred','cs1',2020,2,40),
('fred','cs1',2021,2,40),
('fred','cs1',2022,1,40),
('fred','cs2',2020,2,40),
('fred','cs2',2021,2,40),
('fred','cs3',2020,2,40),
('fred','cs4',2020,2,40),
('fred','cs4',2021,2,40)
;


DROP VIEW IF EXISTS zzanswer, zzsolution;
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v7;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb8q7;

-- Compare zzsolution and zzanswer for Question 7 on testcase 8
WITH correct AS  ( 
	SELECT * FROM zzanswer 
	INTERSECT ALL 
	SELECT * FROM zzsolution
), 
extra AS (
	SELECT * FROM zzanswer 
	EXCEPT ALL 
	SELECT * FROM zzsolution
), 
missing AS (
	SELECT * FROM zzsolution 
	EXCEPT ALL 
	SELECT * FROM zzanswer
) 
INSERT INTO zzSummary
SELECT 'Test case ' || 8 || ' - ' || 
CASE 
	WHEN (SELECT COALESCE(COUNT(*),0) FROM extra) = 0 THEN
		CASE 
			WHEN (SELECT COALESCE(COUNT(*),0) FROM missing) = 0  THEN 'CORRECT'
			ELSE 'INCORRECT: MISSING = ' || (SELECT COUNT(*) FROM missing)
		END
	WHEN (SELECT COALESCE(COUNT(*),0) FROM missing) = 0  THEN 'INCORRECT: EXTRA = ' || (SELECT COUNT(*) FROM extra)
	ELSE 'INCORRECT: MISSING = ' || (SELECT COUNT(*) FROM missing) || ', EXTRA = ' || (SELECT COUNT(*) FROM extra)
END as status;

WITH correct AS  (
	SELECT * FROM zzsolution 
	INTERSECT ALL 
	SELECT * FROM zzanswer
), 
extra AS (
	SELECT * FROM zzanswer EXCEPT ALL SELECT * FROM zzsolution
), 
missing AS (
	SELECT * FROM zzsolution EXCEPT ALL select * FROM zzanswer
)
SELECT *, 'OK' AS "Test case 8"
FROM correct 
UNION ALL 
SELECT *, 'EXTRA' FROM extra 
UNION ALL 
SELECT *, 'MISSING' FROM missing;
--ORDER BY status;

-- Load data for testcase 9

DELETE FROM Transcripts;
DELETE FROM Tutors;
DELETE FROM Teaches;
DELETE FROM Offerings;
DELETE FROM Courses;
DELETE FROM Profs;
DELETE FROM Students;
DELETE FROM Departments;



INSERT INTO departments (did, faculty) VALUES 
('maths','fos'),
('cs','soc')
;

INSERT INTO students (sid, did, year) VALUES 
('alice','cs',2018),
('carol','cs',2018),
('bob','cs',2019),
('dave','cs',2019),
('eve','cs',2021),
('fred','cs',2018)
;

INSERT INTO profs (pid, did) VALUES 
('homer','cs'),
('maggie','cs')
;

INSERT INTO courses (cid, did, credits) VALUES 
('cs1','cs',5),
('cs2','cs',5),
('cs3','cs',5),
('cs4','cs',5)
;

INSERT INTO offerings (cid, year, semester) VALUES 
('cs1',2019,2),
('cs1',2020,2),
('cs1',2021,2),
('cs1',2022,1),
('cs2',2020,2),
('cs2',2021,2),
('cs3',2020,2),
('cs3',2022,1),
('cs4',2020,2),
('cs4',2021,2)
;

INSERT INTO teaches (pid, cid, year, semester, hours) VALUES 
('homer','cs1',2019,2,30),
('homer','cs1',2020,2,30),
('homer','cs1',2021,2,30),
('homer','cs1',2022,1,30),
('maggie','cs2',2020,2,30),
('maggie','cs2',2021,2,30),
('homer','cs3',2020,2,30),
('homer','cs3',2022,1,30),
('maggie','cs4',2020,2,30),
('maggie','cs4',2021,2,30)
;

INSERT INTO tutors (sid, cid, year, semester, hours) VALUES 
('alice','cs3',2020,2,10),
('alice','cs4',2020,2,10),
('alice','cs1',2022,1,10),
('alice','cs3',2022,1,10),
('bob','cs1',2022,1,10),
('dave','cs1',2022,1,10),
('eve','cs1',2022,1,10)
;

INSERT INTO transcripts (sid, cid, year, semester, marks) VALUES 
('alice','cs2',2020,2,90),
('alice','cs3',2020,2,90),
('bob','cs1',2021,2,70),
('carol','cs1',2021,2,60),
('eve','cs1',2021,2,60),
('eve','cs2',2021,2,50),
('eve','cs4',2021,2,90),
('fred','cs1',2019,2,40),
('fred','cs1',2020,2,40),
('fred','cs1',2021,2,40),
('fred','cs1',2022,1,40),
('fred','cs2',2020,2,40),
('fred','cs2',2021,2,40),
('fred','cs3',2020,2,40),
('fred','cs3',2022,1,40),
('fred','cs4',2020,2,40),
('fred','cs4',2021,2,40)
;


DROP VIEW IF EXISTS zzanswer, zzsolution;
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v7;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb9q7;

-- Compare zzsolution and zzanswer for Question 7 on testcase 9
WITH correct AS  ( 
	SELECT * FROM zzanswer 
	INTERSECT ALL 
	SELECT * FROM zzsolution
), 
extra AS (
	SELECT * FROM zzanswer 
	EXCEPT ALL 
	SELECT * FROM zzsolution
), 
missing AS (
	SELECT * FROM zzsolution 
	EXCEPT ALL 
	SELECT * FROM zzanswer
) 
INSERT INTO zzSummary
SELECT 'Test case ' || 9 || ' - ' || 
CASE 
	WHEN (SELECT COALESCE(COUNT(*),0) FROM extra) = 0 THEN
		CASE 
			WHEN (SELECT COALESCE(COUNT(*),0) FROM missing) = 0  THEN 'CORRECT'
			ELSE 'INCORRECT: MISSING = ' || (SELECT COUNT(*) FROM missing)
		END
	WHEN (SELECT COALESCE(COUNT(*),0) FROM missing) = 0  THEN 'INCORRECT: EXTRA = ' || (SELECT COUNT(*) FROM extra)
	ELSE 'INCORRECT: MISSING = ' || (SELECT COUNT(*) FROM missing) || ', EXTRA = ' || (SELECT COUNT(*) FROM extra)
END as status;

WITH correct AS  (
	SELECT * FROM zzsolution 
	INTERSECT ALL 
	SELECT * FROM zzanswer
), 
extra AS (
	SELECT * FROM zzanswer EXCEPT ALL SELECT * FROM zzsolution
), 
missing AS (
	SELECT * FROM zzsolution EXCEPT ALL select * FROM zzanswer
)
SELECT *, 'OK' AS "Test case 9"
FROM correct 
UNION ALL 
SELECT *, 'EXTRA' FROM extra 
UNION ALL 
SELECT *, 'MISSING' FROM missing;
--ORDER BY status;

-- Load data for testcase 10

DELETE FROM Transcripts;
DELETE FROM Tutors;
DELETE FROM Teaches;
DELETE FROM Offerings;
DELETE FROM Courses;
DELETE FROM Profs;
DELETE FROM Students;
DELETE FROM Departments;



INSERT INTO departments (did, faculty) VALUES 
('maths','fos'),
('cs','soc')
;

INSERT INTO students (sid, did, year) VALUES 
('alice','cs',2018),
('carol','cs',2018),
('bob','cs',2019),
('dave','cs',2019),
('eve','cs',2018),
('fred','cs',2018)
;

INSERT INTO profs (pid, did) VALUES 
('homer','cs'),
('maggie','cs')
;

INSERT INTO courses (cid, did, credits) VALUES 
('cs1','cs',5),
('cs2','cs',5),
('cs3','cs',5),
('cs4','cs',5)
;

INSERT INTO offerings (cid, year, semester) VALUES 
('cs1',2019,2),
('cs1',2020,1),
('cs1',2020,2),
('cs1',2021,2),
('cs1',2022,1),
('cs2',2020,2),
('cs2',2021,2),
('cs3',2020,2),
('cs3',2022,1),
('cs4',2020,2),
('cs4',2021,2),
('cs4',2022,1)
;

INSERT INTO teaches (pid, cid, year, semester, hours) VALUES 
('homer','cs1',2019,2,30),
('homer','cs1',2020,1,30),
('homer','cs1',2020,2,30),
('homer','cs1',2021,2,30),
('homer','cs1',2022,1,30),
('maggie','cs2',2020,2,30),
('maggie','cs2',2021,2,30),
('homer','cs3',2020,2,30),
('homer','cs3',2022,1,30),
('maggie','cs4',2020,2,30),
('maggie','cs4',2021,2,30),
('maggie','cs4',2022,1,30)
;

INSERT INTO tutors (sid, cid, year, semester, hours) VALUES 
('alice','cs3',2020,2,10),
('alice','cs4',2020,2,10),
('alice','cs1',2022,1,10),
('alice','cs3',2022,1,10),
('bob','cs1',2022,1,10),
('carol','cs1',2020,1,10),
('carol','cs2',2020,2,10),
('dave','cs1',2022,1,10),
('dave','cs3',2022,1,10),
('dave','cs4',2022,1,10),
('eve','cs1',2020,1,10),
('eve','cs1',2022,1,10)
;

INSERT INTO transcripts (sid, cid, year, semester, marks) VALUES 
('alice','cs2',2020,2,90),
('alice','cs3',2020,2,90),
('bob','cs1',2021,2,70),
('carol','cs1',2021,2,60),
('eve','cs1',2021,2,60),
('eve','cs2',2021,2,50),
('eve','cs4',2021,2,90),
('fred','cs1',2019,2,40),
('fred','cs1',2020,1,40),
('fred','cs1',2020,2,40),
('fred','cs1',2021,2,40),
('fred','cs1',2022,1,40),
('fred','cs2',2020,2,40),
('fred','cs2',2021,2,40),
('fred','cs3',2020,2,40),
('fred','cs3',2022,1,40),
('fred','cs4',2020,2,40),
('fred','cs4',2021,2,40),
('fred','cs4',2022,1,40)
;


DROP VIEW IF EXISTS zzanswer, zzsolution;
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v7;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb10q7;

-- Compare zzsolution and zzanswer for Question 7 on testcase 10
WITH correct AS  ( 
	SELECT * FROM zzanswer 
	INTERSECT ALL 
	SELECT * FROM zzsolution
), 
extra AS (
	SELECT * FROM zzanswer 
	EXCEPT ALL 
	SELECT * FROM zzsolution
), 
missing AS (
	SELECT * FROM zzsolution 
	EXCEPT ALL 
	SELECT * FROM zzanswer
) 
INSERT INTO zzSummary
SELECT 'Test case ' || 10 || ' - ' || 
CASE 
	WHEN (SELECT COALESCE(COUNT(*),0) FROM extra) = 0 THEN
		CASE 
			WHEN (SELECT COALESCE(COUNT(*),0) FROM missing) = 0  THEN 'CORRECT'
			ELSE 'INCORRECT: MISSING = ' || (SELECT COUNT(*) FROM missing)
		END
	WHEN (SELECT COALESCE(COUNT(*),0) FROM missing) = 0  THEN 'INCORRECT: EXTRA = ' || (SELECT COUNT(*) FROM extra)
	ELSE 'INCORRECT: MISSING = ' || (SELECT COUNT(*) FROM missing) || ', EXTRA = ' || (SELECT COUNT(*) FROM extra)
END as status;

WITH correct AS  (
	SELECT * FROM zzsolution 
	INTERSECT ALL 
	SELECT * FROM zzanswer
), 
extra AS (
	SELECT * FROM zzanswer EXCEPT ALL SELECT * FROM zzsolution
), 
missing AS (
	SELECT * FROM zzsolution EXCEPT ALL select * FROM zzanswer
)
SELECT *, 'OK' AS "Test case 10"
FROM correct 
UNION ALL 
SELECT *, 'EXTRA' FROM extra 
UNION ALL 
SELECT *, 'MISSING' FROM missing;
--ORDER BY status;

