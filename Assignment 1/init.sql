
-- init db
CREATE OR REPLACE FUNCTION init() RETURNS VOID
AS $$
BEGIN


DROP VIEW IF EXISTS zzsolution, zzanswer CASCADE;
DROP VIEW IF EXISTS v1, v2, v3, v4, v5, v6, v7, v8, v9, v10 CASCADE;
DROP TABLE IF EXISTS zzSummary CASCADE;

CREATE TABLE zzSummary (
	status		TEXT
);


-- ------------------- database schema

DROP TABLE IF EXISTS Transcripts, Tutors, Teaches, Offerings, Courses, Profs, Students, Departments CASCADE;


CREATE TABLE Departments (
	did 		text PRIMARY KEY,
	faculty 	text NOT NULL
);

CREATE TABLE Students (
	sid 		text PRIMARY KEY,
	did		text NOT NULL REFERENCES Departments,
	year		integer NOT NULL CHECK (year >= 1980)
);

CREATE TABLE Profs (
	pid 		text PRIMARY KEY,
	did		text NOT NULL REFERENCES Departments
);

CREATE TABLE Courses (
	cid 		text PRIMARY KEY,
	did		text NOT NULL REFERENCES Departments,
	credits 	integer NOT NULL CHECK (credits in (2,3,4,5))
);

CREATE TABLE Offerings (
	cid 		text REFERENCES Courses,
	year 		integer CHECK (year >= 1980),
	semester 	integer CHECK (semester in (1,2)),
	PRIMARY KEY 	(cid, year, semester)
);

CREATE TABLE Teaches (
	pid 		text REFERENCES Profs,
	cid 		text,
	year 		integer,
	semester 	integer,
	hours		integer NOT NULL CHECK (hours > 0),
	PRIMARY KEY 	(pid, cid, year, semester),
	FOREIGN KEY 	(cid, year, semester) REFERENCES Offerings
);

CREATE TABLE Tutors (
	sid 		text REFERENCES Students,
	cid 		text,
	year 		integer,
	semester 	integer,
	hours		integer NOT NULL CHECK (hours > 0),
	PRIMARY KEY 	(sid, cid, year, semester),
	FOREIGN KEY 	(cid, year, semester) REFERENCES Offerings
);

CREATE TABLE Transcripts (
	sid 		text,
	cid 		text,
	year 		integer,
	semester 	integer,
	marks 		integer NOT NULL CHECK (marks >= 0 AND marks <= 100),
	PRIMARY KEY 	(sid, cid, year, semester),
	FOREIGN KEY 	(sid) REFERENCES Students,
	FOREIGN KEY 	(cid, year, semester) REFERENCES Offerings
);

DROP VIEW IF EXISTS zzsolution, zzanswer CASCADE;
DROP VIEW IF EXISTS v1, v2, v3, v4, v5, v6, v7, v8, v9, v10 CASCADE;
DROP TABLE IF EXISTS zzdb1q1 CASCADE;
DROP TABLE IF EXISTS zzdb1q2 CASCADE;
DROP TABLE IF EXISTS zzdb1q3 CASCADE;
DROP TABLE IF EXISTS zzdb1q4 CASCADE;
DROP TABLE IF EXISTS zzdb1q5 CASCADE;
DROP TABLE IF EXISTS zzdb1q6 CASCADE;
DROP TABLE IF EXISTS zzdb1q7 CASCADE;
DROP TABLE IF EXISTS zzdb1q8 CASCADE;
DROP TABLE IF EXISTS zzdb1q9 CASCADE;
DROP TABLE IF EXISTS zzdb1q10 CASCADE;
DROP TABLE IF EXISTS zzdb2q1 CASCADE;
DROP TABLE IF EXISTS zzdb2q2 CASCADE;
DROP TABLE IF EXISTS zzdb2q3 CASCADE;
DROP TABLE IF EXISTS zzdb2q4 CASCADE;
DROP TABLE IF EXISTS zzdb2q5 CASCADE;
DROP TABLE IF EXISTS zzdb2q6 CASCADE;
DROP TABLE IF EXISTS zzdb2q7 CASCADE;
DROP TABLE IF EXISTS zzdb2q8 CASCADE;
DROP TABLE IF EXISTS zzdb2q9 CASCADE;
DROP TABLE IF EXISTS zzdb2q10 CASCADE;
DROP TABLE IF EXISTS zzdb3q1 CASCADE;
DROP TABLE IF EXISTS zzdb3q2 CASCADE;
DROP TABLE IF EXISTS zzdb3q3 CASCADE;
DROP TABLE IF EXISTS zzdb3q4 CASCADE;
DROP TABLE IF EXISTS zzdb3q5 CASCADE;
DROP TABLE IF EXISTS zzdb3q6 CASCADE;
DROP TABLE IF EXISTS zzdb3q7 CASCADE;
DROP TABLE IF EXISTS zzdb3q8 CASCADE;
DROP TABLE IF EXISTS zzdb3q9 CASCADE;
DROP TABLE IF EXISTS zzdb3q10 CASCADE;
DROP TABLE IF EXISTS zzdb4q1 CASCADE;
DROP TABLE IF EXISTS zzdb4q2 CASCADE;
DROP TABLE IF EXISTS zzdb4q3 CASCADE;
DROP TABLE IF EXISTS zzdb4q4 CASCADE;
DROP TABLE IF EXISTS zzdb4q5 CASCADE;
DROP TABLE IF EXISTS zzdb4q6 CASCADE;
DROP TABLE IF EXISTS zzdb4q7 CASCADE;
DROP TABLE IF EXISTS zzdb4q8 CASCADE;
DROP TABLE IF EXISTS zzdb4q9 CASCADE;
DROP TABLE IF EXISTS zzdb4q10 CASCADE;
DROP TABLE IF EXISTS zzdb5q1 CASCADE;
DROP TABLE IF EXISTS zzdb5q2 CASCADE;
DROP TABLE IF EXISTS zzdb5q3 CASCADE;
DROP TABLE IF EXISTS zzdb5q4 CASCADE;
DROP TABLE IF EXISTS zzdb5q5 CASCADE;
DROP TABLE IF EXISTS zzdb5q6 CASCADE;
DROP TABLE IF EXISTS zzdb5q7 CASCADE;
DROP TABLE IF EXISTS zzdb5q8 CASCADE;
DROP TABLE IF EXISTS zzdb5q9 CASCADE;
DROP TABLE IF EXISTS zzdb5q10 CASCADE;
DROP TABLE IF EXISTS zzdb6q1 CASCADE;
DROP TABLE IF EXISTS zzdb6q2 CASCADE;
DROP TABLE IF EXISTS zzdb6q3 CASCADE;
DROP TABLE IF EXISTS zzdb6q4 CASCADE;
DROP TABLE IF EXISTS zzdb6q5 CASCADE;
DROP TABLE IF EXISTS zzdb6q6 CASCADE;
DROP TABLE IF EXISTS zzdb6q7 CASCADE;
DROP TABLE IF EXISTS zzdb6q8 CASCADE;
DROP TABLE IF EXISTS zzdb6q9 CASCADE;
DROP TABLE IF EXISTS zzdb6q10 CASCADE;
DROP TABLE IF EXISTS zzdb7q1 CASCADE;
DROP TABLE IF EXISTS zzdb7q2 CASCADE;
DROP TABLE IF EXISTS zzdb7q3 CASCADE;
DROP TABLE IF EXISTS zzdb7q4 CASCADE;
DROP TABLE IF EXISTS zzdb7q5 CASCADE;
DROP TABLE IF EXISTS zzdb7q6 CASCADE;
DROP TABLE IF EXISTS zzdb7q7 CASCADE;
DROP TABLE IF EXISTS zzdb7q8 CASCADE;
DROP TABLE IF EXISTS zzdb7q9 CASCADE;
DROP TABLE IF EXISTS zzdb7q10 CASCADE;
DROP TABLE IF EXISTS zzdb8q1 CASCADE;
DROP TABLE IF EXISTS zzdb8q2 CASCADE;
DROP TABLE IF EXISTS zzdb8q3 CASCADE;
DROP TABLE IF EXISTS zzdb8q4 CASCADE;
DROP TABLE IF EXISTS zzdb8q5 CASCADE;
DROP TABLE IF EXISTS zzdb8q6 CASCADE;
DROP TABLE IF EXISTS zzdb8q7 CASCADE;
DROP TABLE IF EXISTS zzdb8q8 CASCADE;
DROP TABLE IF EXISTS zzdb8q9 CASCADE;
DROP TABLE IF EXISTS zzdb8q10 CASCADE;
DROP TABLE IF EXISTS zzdb9q1 CASCADE;
DROP TABLE IF EXISTS zzdb9q2 CASCADE;
DROP TABLE IF EXISTS zzdb9q3 CASCADE;
DROP TABLE IF EXISTS zzdb9q4 CASCADE;
DROP TABLE IF EXISTS zzdb9q5 CASCADE;
DROP TABLE IF EXISTS zzdb9q6 CASCADE;
DROP TABLE IF EXISTS zzdb9q7 CASCADE;
DROP TABLE IF EXISTS zzdb9q8 CASCADE;
DROP TABLE IF EXISTS zzdb9q9 CASCADE;
DROP TABLE IF EXISTS zzdb9q10 CASCADE;
DROP TABLE IF EXISTS zzdb10q1 CASCADE;
DROP TABLE IF EXISTS zzdb10q2 CASCADE;
DROP TABLE IF EXISTS zzdb10q3 CASCADE;
DROP TABLE IF EXISTS zzdb10q4 CASCADE;
DROP TABLE IF EXISTS zzdb10q5 CASCADE;
DROP TABLE IF EXISTS zzdb10q6 CASCADE;
DROP TABLE IF EXISTS zzdb10q7 CASCADE;
DROP TABLE IF EXISTS zzdb10q8 CASCADE;
DROP TABLE IF EXISTS zzdb10q9 CASCADE;
DROP TABLE IF EXISTS zzdb10q10 CASCADE;
DROP VIEW IF EXISTS zzsolution CASCADE;






CREATE TABLE zzdb10q1 (
    sid text,
    cid text
);



CREATE TABLE zzdb10q10 (
    sid1 text,
    sid2 text,
    sid3 text,
    sid4 text
);



CREATE TABLE zzdb10q2 (
    sid text
);



CREATE TABLE zzdb10q3 (
    sid text,
    year integer,
    semester integer
);



CREATE TABLE zzdb10q4 (
    sid text,
    year integer,
    semester integer
);



CREATE TABLE zzdb10q5 (
    cid text
);



CREATE TABLE zzdb10q6 (
    cid text,
    year integer,
    semester integer,
    cost bigint
);



CREATE TABLE zzdb10q7 (
    did text,
    faculty text,
    num_admitted bigint,
    num_offering bigint,
    total_enrollment bigint
);



CREATE TABLE zzdb10q8 (
    sid text,
    year integer,
    semester integer
);



CREATE TABLE zzdb10q9 (
    sid text,
    year integer,
    semester integer
);



CREATE TABLE zzdb1q1 (
    sid text,
    cid text
);



CREATE TABLE zzdb1q10 (
    sid1 text,
    sid2 text,
    sid3 text,
    sid4 text
);



CREATE TABLE zzdb1q2 (
    sid text
);



CREATE TABLE zzdb1q3 (
    sid text,
    year integer,
    semester integer
);



CREATE TABLE zzdb1q4 (
    sid text,
    year integer,
    semester integer
);



CREATE TABLE zzdb1q5 (
    cid text
);



CREATE TABLE zzdb1q6 (
    cid text,
    year integer,
    semester integer,
    cost bigint
);



CREATE TABLE zzdb1q7 (
    did text,
    faculty text,
    num_admitted bigint,
    num_offering bigint,
    total_enrollment bigint
);



CREATE TABLE zzdb1q8 (
    sid text,
    year integer,
    semester integer
);



CREATE TABLE zzdb1q9 (
    sid text,
    year integer,
    semester integer
);



CREATE TABLE zzdb2q1 (
    sid text,
    cid text
);



CREATE TABLE zzdb2q10 (
    sid1 text,
    sid2 text,
    sid3 text,
    sid4 text
);



CREATE TABLE zzdb2q2 (
    sid text
);



CREATE TABLE zzdb2q3 (
    sid text,
    year integer,
    semester integer
);



CREATE TABLE zzdb2q4 (
    sid text,
    year integer,
    semester integer
);



CREATE TABLE zzdb2q5 (
    cid text
);



CREATE TABLE zzdb2q6 (
    cid text,
    year integer,
    semester integer,
    cost bigint
);



CREATE TABLE zzdb2q7 (
    did text,
    faculty text,
    num_admitted bigint,
    num_offering bigint,
    total_enrollment bigint
);



CREATE TABLE zzdb2q8 (
    sid text,
    year integer,
    semester integer
);



CREATE TABLE zzdb2q9 (
    sid text,
    year integer,
    semester integer
);



CREATE TABLE zzdb3q1 (
    sid text,
    cid text
);



CREATE TABLE zzdb3q10 (
    sid1 text,
    sid2 text,
    sid3 text,
    sid4 text
);



CREATE TABLE zzdb3q2 (
    sid text
);



CREATE TABLE zzdb3q3 (
    sid text,
    year integer,
    semester integer
);



CREATE TABLE zzdb3q4 (
    sid text,
    year integer,
    semester integer
);



CREATE TABLE zzdb3q5 (
    cid text
);



CREATE TABLE zzdb3q6 (
    cid text,
    year integer,
    semester integer,
    cost bigint
);



CREATE TABLE zzdb3q7 (
    did text,
    faculty text,
    num_admitted bigint,
    num_offering bigint,
    total_enrollment bigint
);



CREATE TABLE zzdb3q8 (
    sid text,
    year integer,
    semester integer
);



CREATE TABLE zzdb3q9 (
    sid text,
    year integer,
    semester integer
);



CREATE TABLE zzdb4q1 (
    sid text,
    cid text
);



CREATE TABLE zzdb4q10 (
    sid1 text,
    sid2 text,
    sid3 text,
    sid4 text
);



CREATE TABLE zzdb4q2 (
    sid text
);



CREATE TABLE zzdb4q3 (
    sid text,
    year integer,
    semester integer
);



CREATE TABLE zzdb4q4 (
    sid text,
    year integer,
    semester integer
);



CREATE TABLE zzdb4q5 (
    cid text
);



CREATE TABLE zzdb4q6 (
    cid text,
    year integer,
    semester integer,
    cost bigint
);



CREATE TABLE zzdb4q7 (
    did text,
    faculty text,
    num_admitted bigint,
    num_offering bigint,
    total_enrollment bigint
);



CREATE TABLE zzdb4q8 (
    sid text,
    year integer,
    semester integer
);



CREATE TABLE zzdb4q9 (
    sid text,
    year integer,
    semester integer
);



CREATE TABLE zzdb5q1 (
    sid text,
    cid text
);



CREATE TABLE zzdb5q10 (
    sid1 text,
    sid2 text,
    sid3 text,
    sid4 text
);



CREATE TABLE zzdb5q2 (
    sid text
);



CREATE TABLE zzdb5q3 (
    sid text,
    year integer,
    semester integer
);



CREATE TABLE zzdb5q4 (
    sid text,
    year integer,
    semester integer
);



CREATE TABLE zzdb5q5 (
    cid text
);



CREATE TABLE zzdb5q6 (
    cid text,
    year integer,
    semester integer,
    cost bigint
);



CREATE TABLE zzdb5q7 (
    did text,
    faculty text,
    num_admitted bigint,
    num_offering bigint,
    total_enrollment bigint
);



CREATE TABLE zzdb5q8 (
    sid text,
    year integer,
    semester integer
);



CREATE TABLE zzdb5q9 (
    sid text,
    year integer,
    semester integer
);



CREATE TABLE zzdb6q1 (
    sid text,
    cid text
);



CREATE TABLE zzdb6q10 (
    sid1 text,
    sid2 text,
    sid3 text,
    sid4 text
);



CREATE TABLE zzdb6q2 (
    sid text
);



CREATE TABLE zzdb6q3 (
    sid text,
    year integer,
    semester integer
);



CREATE TABLE zzdb6q4 (
    sid text,
    year integer,
    semester integer
);



CREATE TABLE zzdb6q5 (
    cid text
);



CREATE TABLE zzdb6q6 (
    cid text,
    year integer,
    semester integer,
    cost bigint
);



CREATE TABLE zzdb6q7 (
    did text,
    faculty text,
    num_admitted bigint,
    num_offering bigint,
    total_enrollment bigint
);



CREATE TABLE zzdb6q8 (
    sid text,
    year integer,
    semester integer
);



CREATE TABLE zzdb6q9 (
    sid text,
    year integer,
    semester integer
);



CREATE TABLE zzdb7q1 (
    sid text,
    cid text
);



CREATE TABLE zzdb7q10 (
    sid1 text,
    sid2 text,
    sid3 text,
    sid4 text
);



CREATE TABLE zzdb7q2 (
    sid text
);



CREATE TABLE zzdb7q3 (
    sid text,
    year integer,
    semester integer
);



CREATE TABLE zzdb7q4 (
    sid text,
    year integer,
    semester integer
);



CREATE TABLE zzdb7q5 (
    cid text
);



CREATE TABLE zzdb7q6 (
    cid text,
    year integer,
    semester integer,
    cost bigint
);



CREATE TABLE zzdb7q7 (
    did text,
    faculty text,
    num_admitted bigint,
    num_offering bigint,
    total_enrollment bigint
);



CREATE TABLE zzdb7q8 (
    sid text,
    year integer,
    semester integer
);



CREATE TABLE zzdb7q9 (
    sid text,
    year integer,
    semester integer
);



CREATE TABLE zzdb8q1 (
    sid text,
    cid text
);



CREATE TABLE zzdb8q10 (
    sid1 text,
    sid2 text,
    sid3 text,
    sid4 text
);



CREATE TABLE zzdb8q2 (
    sid text
);



CREATE TABLE zzdb8q3 (
    sid text,
    year integer,
    semester integer
);



CREATE TABLE zzdb8q4 (
    sid text,
    year integer,
    semester integer
);



CREATE TABLE zzdb8q5 (
    cid text
);



CREATE TABLE zzdb8q6 (
    cid text,
    year integer,
    semester integer,
    cost bigint
);



CREATE TABLE zzdb8q7 (
    did text,
    faculty text,
    num_admitted bigint,
    num_offering bigint,
    total_enrollment bigint
);



CREATE TABLE zzdb8q8 (
    sid text,
    year integer,
    semester integer
);



CREATE TABLE zzdb8q9 (
    sid text,
    year integer,
    semester integer
);



CREATE TABLE zzdb9q1 (
    sid text,
    cid text
);



CREATE TABLE zzdb9q10 (
    sid1 text,
    sid2 text,
    sid3 text,
    sid4 text
);



CREATE TABLE zzdb9q2 (
    sid text
);



CREATE TABLE zzdb9q3 (
    sid text,
    year integer,
    semester integer
);



CREATE TABLE zzdb9q4 (
    sid text,
    year integer,
    semester integer
);



CREATE TABLE zzdb9q5 (
    cid text
);



CREATE TABLE zzdb9q6 (
    cid text,
    year integer,
    semester integer,
    cost bigint
);



CREATE TABLE zzdb9q7 (
    did text,
    faculty text,
    num_admitted bigint,
    num_offering bigint,
    total_enrollment bigint
);



CREATE TABLE zzdb9q8 (
    sid text,
    year integer,
    semester integer
);



CREATE TABLE zzdb9q9 (
    sid text,
    year integer,
    semester integer
);



INSERT INTO zzdb10q1 (sid, cid) VALUES ('alice', 'cs1');
INSERT INTO zzdb10q1 (sid, cid) VALUES ('alice', 'cs4');
INSERT INTO zzdb10q1 (sid, cid) VALUES ('carol', 'cs2');
INSERT INTO zzdb10q1 (sid, cid) VALUES ('dave', 'cs1');
INSERT INTO zzdb10q1 (sid, cid) VALUES ('dave', 'cs3');
INSERT INTO zzdb10q1 (sid, cid) VALUES ('dave', 'cs4');






INSERT INTO zzdb10q2 (sid) VALUES ('dave');
INSERT INTO zzdb10q2 (sid) VALUES ('alice');



INSERT INTO zzdb10q3 (sid, year, semester) VALUES ('cs3', 2020, 2);
INSERT INTO zzdb10q3 (sid, year, semester) VALUES ('cs1', 2021, 2);
INSERT INTO zzdb10q3 (sid, year, semester) VALUES ('cs2', 2020, 2);
INSERT INTO zzdb10q3 (sid, year, semester) VALUES ('cs4', 2021, 2);
INSERT INTO zzdb10q3 (sid, year, semester) VALUES ('cs2', 2021, 2);



INSERT INTO zzdb10q4 (sid, year, semester) VALUES ('cs1', 2019, 2);
INSERT INTO zzdb10q4 (sid, year, semester) VALUES ('cs1', 2020, 1);
INSERT INTO zzdb10q4 (sid, year, semester) VALUES ('cs1', 2020, 2);
INSERT INTO zzdb10q4 (sid, year, semester) VALUES ('cs1', 2021, 2);
INSERT INTO zzdb10q4 (sid, year, semester) VALUES ('cs1', 2022, 1);
INSERT INTO zzdb10q4 (sid, year, semester) VALUES ('cs2', 2020, 2);
INSERT INTO zzdb10q4 (sid, year, semester) VALUES ('cs2', 2021, 2);
INSERT INTO zzdb10q4 (sid, year, semester) VALUES ('cs3', 2020, 2);
INSERT INTO zzdb10q4 (sid, year, semester) VALUES ('cs3', 2022, 1);
INSERT INTO zzdb10q4 (sid, year, semester) VALUES ('cs4', 2020, 2);
INSERT INTO zzdb10q4 (sid, year, semester) VALUES ('cs4', 2021, 2);
INSERT INTO zzdb10q4 (sid, year, semester) VALUES ('cs4', 2022, 1);



INSERT INTO zzdb10q5 (cid) VALUES ('cs1');
INSERT INTO zzdb10q5 (cid) VALUES ('cs4');



INSERT INTO zzdb10q6 (cid, year, semester, cost) VALUES ('cs3', 2022, 1, 4000);
INSERT INTO zzdb10q6 (cid, year, semester, cost) VALUES ('cs4', 2020, 2, 3500);
INSERT INTO zzdb10q6 (cid, year, semester, cost) VALUES ('cs3', 2020, 2, 3500);
INSERT INTO zzdb10q6 (cid, year, semester, cost) VALUES ('cs1', 2021, 2, 3000);
INSERT INTO zzdb10q6 (cid, year, semester, cost) VALUES ('cs1', 2019, 2, 3000);
INSERT INTO zzdb10q6 (cid, year, semester, cost) VALUES ('cs1', 2022, 1, 5000);
INSERT INTO zzdb10q6 (cid, year, semester, cost) VALUES ('cs2', 2020, 2, 3500);
INSERT INTO zzdb10q6 (cid, year, semester, cost) VALUES ('cs4', 2021, 2, 3000);
INSERT INTO zzdb10q6 (cid, year, semester, cost) VALUES ('cs1', 2020, 2, 3000);
INSERT INTO zzdb10q6 (cid, year, semester, cost) VALUES ('cs4', 2022, 1, 3500);
INSERT INTO zzdb10q6 (cid, year, semester, cost) VALUES ('cs1', 2020, 1, 4000);
INSERT INTO zzdb10q6 (cid, year, semester, cost) VALUES ('cs2', 2021, 2, 3000);



INSERT INTO zzdb10q7 (did, faculty, num_admitted, num_offering, total_enrollment) VALUES ('maths', 'fos', 0, 0, 0);
INSERT INTO zzdb10q7 (did, faculty, num_admitted, num_offering, total_enrollment) VALUES ('cs', 'soc', 0, 3, 8);



INSERT INTO zzdb10q8 (sid, year, semester) VALUES ('eve', 2021, 2);
INSERT INTO zzdb10q8 (sid, year, semester) VALUES ('fred', 2020, 2);
INSERT INTO zzdb10q8 (sid, year, semester) VALUES ('bob', 2021, 2);
INSERT INTO zzdb10q8 (sid, year, semester) VALUES ('fred', 2019, 2);
INSERT INTO zzdb10q8 (sid, year, semester) VALUES ('carol', 2021, 2);
INSERT INTO zzdb10q8 (sid, year, semester) VALUES ('fred', 2020, 1);
INSERT INTO zzdb10q8 (sid, year, semester) VALUES ('fred', 2022, 1);
INSERT INTO zzdb10q8 (sid, year, semester) VALUES ('fred', 2021, 2);
INSERT INTO zzdb10q8 (sid, year, semester) VALUES ('alice', 2020, 2);



INSERT INTO zzdb10q9 (sid, year, semester) VALUES ('bob', 2021, 2);
INSERT INTO zzdb10q9 (sid, year, semester) VALUES ('fred', 2019, 2);
INSERT INTO zzdb10q9 (sid, year, semester) VALUES ('fred', 2020, 1);
INSERT INTO zzdb10q9 (sid, year, semester) VALUES ('fred', 2022, 1);
INSERT INTO zzdb10q9 (sid, year, semester) VALUES ('alice', 2020, 2);



INSERT INTO zzdb1q1 (sid, cid) VALUES ('alice', 'cs1');
INSERT INTO zzdb1q1 (sid, cid) VALUES ('dave', 'cs1');









INSERT INTO zzdb1q3 (sid, year, semester) VALUES ('cs3', 2020, 1);
INSERT INTO zzdb1q3 (sid, year, semester) VALUES ('cs1', 2021, 2);
INSERT INTO zzdb1q3 (sid, year, semester) VALUES ('cs2', 2020, 1);
INSERT INTO zzdb1q3 (sid, year, semester) VALUES ('ma4', 2021, 2);
INSERT INTO zzdb1q3 (sid, year, semester) VALUES ('cs2', 2021, 2);



INSERT INTO zzdb1q4 (sid, year, semester) VALUES ('cs1', 2019, 1);
INSERT INTO zzdb1q4 (sid, year, semester) VALUES ('cs1', 2020, 1);
INSERT INTO zzdb1q4 (sid, year, semester) VALUES ('cs1', 2021, 2);
INSERT INTO zzdb1q4 (sid, year, semester) VALUES ('cs1', 2022, 1);
INSERT INTO zzdb1q4 (sid, year, semester) VALUES ('cs2', 2020, 1);
INSERT INTO zzdb1q4 (sid, year, semester) VALUES ('cs2', 2021, 2);
INSERT INTO zzdb1q4 (sid, year, semester) VALUES ('cs3', 2020, 1);
INSERT INTO zzdb1q4 (sid, year, semester) VALUES ('ma4', 2021, 2);



INSERT INTO zzdb1q5 (cid) VALUES ('cs1');



INSERT INTO zzdb1q6 (cid, year, semester, cost) VALUES ('cs3', 2020, 1, 6000);
INSERT INTO zzdb1q6 (cid, year, semester, cost) VALUES ('ma4', 2020, 1, 6000);
INSERT INTO zzdb1q6 (cid, year, semester, cost) VALUES ('cs1', 2021, 2, 6000);
INSERT INTO zzdb1q6 (cid, year, semester, cost) VALUES ('cs1', 2022, 1, 5000);
INSERT INTO zzdb1q6 (cid, year, semester, cost) VALUES ('cs2', 2020, 1, 6000);
INSERT INTO zzdb1q6 (cid, year, semester, cost) VALUES ('cs1', 2019, 1, 6000);
INSERT INTO zzdb1q6 (cid, year, semester, cost) VALUES ('cs1', 2020, 1, 6000);
INSERT INTO zzdb1q6 (cid, year, semester, cost) VALUES ('ma4', 2021, 2, 6000);
INSERT INTO zzdb1q6 (cid, year, semester, cost) VALUES ('cs2', 2021, 2, 6000);



INSERT INTO zzdb1q7 (did, faculty, num_admitted, num_offering, total_enrollment) VALUES ('maths', 'fos', 1, 1, 2);
INSERT INTO zzdb1q7 (did, faculty, num_admitted, num_offering, total_enrollment) VALUES ('cs', 'soc', 0, 2, 6);



INSERT INTO zzdb1q8 (sid, year, semester) VALUES ('bob', 2021, 2);
INSERT INTO zzdb1q8 (sid, year, semester) VALUES ('fred', 2019, 1);
INSERT INTO zzdb1q8 (sid, year, semester) VALUES ('alice', 2020, 1);
INSERT INTO zzdb1q8 (sid, year, semester) VALUES ('carol', 2021, 2);
INSERT INTO zzdb1q8 (sid, year, semester) VALUES ('fred', 2022, 1);



INSERT INTO zzdb1q9 (sid, year, semester) VALUES ('bob', 2021, 2);
INSERT INTO zzdb1q9 (sid, year, semester) VALUES ('fred', 2019, 1);
INSERT INTO zzdb1q9 (sid, year, semester) VALUES ('alice', 2020, 1);
INSERT INTO zzdb1q9 (sid, year, semester) VALUES ('fred', 2022, 1);



INSERT INTO zzdb2q1 (sid, cid) VALUES ('bob', 'cs1');
INSERT INTO zzdb2q1 (sid, cid) VALUES ('dave', 'cs1');
INSERT INTO zzdb2q1 (sid, cid) VALUES ('george', 'cs1');
INSERT INTO zzdb2q1 (sid, cid) VALUES ('george', 'ma1');



INSERT INTO zzdb2q10 (sid1, sid2, sid3, sid4) VALUES ('alice', 'bob', 'dave', 'eve');
INSERT INTO zzdb2q10 (sid1, sid2, sid3, sid4) VALUES ('alice', 'bob', 'eve', 'george');
INSERT INTO zzdb2q10 (sid1, sid2, sid3, sid4) VALUES ('alice', 'dave', 'eve', 'george');



INSERT INTO zzdb2q2 (sid) VALUES ('george');



INSERT INTO zzdb2q3 (sid, year, semester) VALUES ('cs3', 2020, 2);
INSERT INTO zzdb2q3 (sid, year, semester) VALUES ('cs1', 2021, 2);
INSERT INTO zzdb2q3 (sid, year, semester) VALUES ('cs2', 2020, 2);
INSERT INTO zzdb2q3 (sid, year, semester) VALUES ('cs4', 2021, 2);
INSERT INTO zzdb2q3 (sid, year, semester) VALUES ('cs1', 2020, 2);
INSERT INTO zzdb2q3 (sid, year, semester) VALUES ('ma1', 2022, 1);
INSERT INTO zzdb2q3 (sid, year, semester) VALUES ('cs2', 2021, 2);



INSERT INTO zzdb2q4 (sid, year, semester) VALUES ('cs1', 2019, 2);
INSERT INTO zzdb2q4 (sid, year, semester) VALUES ('cs1', 2020, 2);
INSERT INTO zzdb2q4 (sid, year, semester) VALUES ('cs1', 2021, 2);
INSERT INTO zzdb2q4 (sid, year, semester) VALUES ('cs1', 2022, 1);
INSERT INTO zzdb2q4 (sid, year, semester) VALUES ('cs2', 2020, 2);
INSERT INTO zzdb2q4 (sid, year, semester) VALUES ('cs2', 2021, 2);
INSERT INTO zzdb2q4 (sid, year, semester) VALUES ('cs3', 2020, 2);
INSERT INTO zzdb2q4 (sid, year, semester) VALUES ('cs4', 2020, 2);
INSERT INTO zzdb2q4 (sid, year, semester) VALUES ('cs4', 2021, 2);
INSERT INTO zzdb2q4 (sid, year, semester) VALUES ('ma1', 2022, 1);



INSERT INTO zzdb2q5 (cid) VALUES ('cs4');



INSERT INTO zzdb2q6 (cid, year, semester, cost) VALUES ('cs4', 2020, 2, 3000);
INSERT INTO zzdb2q6 (cid, year, semester, cost) VALUES ('cs3', 2020, 2, 3000);
INSERT INTO zzdb2q6 (cid, year, semester, cost) VALUES ('cs1', 2021, 2, 3000);
INSERT INTO zzdb2q6 (cid, year, semester, cost) VALUES ('cs1', 2019, 2, 3000);
INSERT INTO zzdb2q6 (cid, year, semester, cost) VALUES ('cs1', 2022, 1, 5200);
INSERT INTO zzdb2q6 (cid, year, semester, cost) VALUES ('cs2', 2020, 2, 3000);
INSERT INTO zzdb2q6 (cid, year, semester, cost) VALUES ('cs4', 2021, 2, 3000);
INSERT INTO zzdb2q6 (cid, year, semester, cost) VALUES ('cs1', 2020, 2, 3000);
INSERT INTO zzdb2q6 (cid, year, semester, cost) VALUES ('ma1', 2022, 1, 4300);
INSERT INTO zzdb2q6 (cid, year, semester, cost) VALUES ('cs2', 2021, 2, 3000);



INSERT INTO zzdb2q7 (did, faculty, num_admitted, num_offering, total_enrollment) VALUES ('maths', 'fos', 0, 0, 0);
INSERT INTO zzdb2q7 (did, faculty, num_admitted, num_offering, total_enrollment) VALUES ('cs', 'soc', 1, 3, 6);



INSERT INTO zzdb2q8 (sid, year, semester) VALUES ('eve', 2021, 2);
INSERT INTO zzdb2q8 (sid, year, semester) VALUES ('fred', 2020, 2);
INSERT INTO zzdb2q8 (sid, year, semester) VALUES ('fred', 2019, 2);
INSERT INTO zzdb2q8 (sid, year, semester) VALUES ('george', 2020, 2);
INSERT INTO zzdb2q8 (sid, year, semester) VALUES ('fred', 2021, 2);
INSERT INTO zzdb2q8 (sid, year, semester) VALUES ('alice', 2020, 2);



INSERT INTO zzdb2q9 (sid, year, semester) VALUES ('eve', 2021, 2);
INSERT INTO zzdb2q9 (sid, year, semester) VALUES ('fred', 2019, 2);
INSERT INTO zzdb2q9 (sid, year, semester) VALUES ('fred', 2022, 1);
INSERT INTO zzdb2q9 (sid, year, semester) VALUES ('alice', 2020, 2);












INSERT INTO zzdb3q3 (sid, year, semester) VALUES ('cs3', 2020, 2);
INSERT INTO zzdb3q3 (sid, year, semester) VALUES ('cs1', 2021, 2);
INSERT INTO zzdb3q3 (sid, year, semester) VALUES ('cs2', 2020, 2);
INSERT INTO zzdb3q3 (sid, year, semester) VALUES ('cs4', 2021, 2);
INSERT INTO zzdb3q3 (sid, year, semester) VALUES ('cs2', 2021, 2);



INSERT INTO zzdb3q4 (sid, year, semester) VALUES ('cs1', 2019, 2);
INSERT INTO zzdb3q4 (sid, year, semester) VALUES ('cs1', 2020, 2);
INSERT INTO zzdb3q4 (sid, year, semester) VALUES ('cs1', 2021, 2);
INSERT INTO zzdb3q4 (sid, year, semester) VALUES ('cs2', 2020, 2);
INSERT INTO zzdb3q4 (sid, year, semester) VALUES ('cs2', 2021, 2);
INSERT INTO zzdb3q4 (sid, year, semester) VALUES ('cs3', 2020, 2);
INSERT INTO zzdb3q4 (sid, year, semester) VALUES ('cs4', 2020, 2);
INSERT INTO zzdb3q4 (sid, year, semester) VALUES ('cs4', 2021, 2);



INSERT INTO zzdb3q5 (cid) VALUES ('cs4');



INSERT INTO zzdb3q6 (cid, year, semester, cost) VALUES ('cs4', 2020, 2, 3000);
INSERT INTO zzdb3q6 (cid, year, semester, cost) VALUES ('cs3', 2020, 2, 3000);
INSERT INTO zzdb3q6 (cid, year, semester, cost) VALUES ('cs1', 2021, 2, 3000);
INSERT INTO zzdb3q6 (cid, year, semester, cost) VALUES ('cs1', 2019, 2, 3000);
INSERT INTO zzdb3q6 (cid, year, semester, cost) VALUES ('cs2', 2020, 2, 3000);
INSERT INTO zzdb3q6 (cid, year, semester, cost) VALUES ('cs4', 2021, 2, 3000);
INSERT INTO zzdb3q6 (cid, year, semester, cost) VALUES ('cs1', 2020, 2, 3000);
INSERT INTO zzdb3q6 (cid, year, semester, cost) VALUES ('cs2', 2021, 2, 3000);



INSERT INTO zzdb3q7 (did, faculty, num_admitted, num_offering, total_enrollment) VALUES ('maths', 'fos', 0, 0, 0);
INSERT INTO zzdb3q7 (did, faculty, num_admitted, num_offering, total_enrollment) VALUES ('cs', 'soc', 1, 3, 8);



INSERT INTO zzdb3q8 (sid, year, semester) VALUES ('eve', 2021, 2);
INSERT INTO zzdb3q8 (sid, year, semester) VALUES ('fred', 2020, 2);
INSERT INTO zzdb3q8 (sid, year, semester) VALUES ('bob', 2021, 2);
INSERT INTO zzdb3q8 (sid, year, semester) VALUES ('fred', 2019, 2);
INSERT INTO zzdb3q8 (sid, year, semester) VALUES ('carol', 2021, 2);
INSERT INTO zzdb3q8 (sid, year, semester) VALUES ('fred', 2021, 2);
INSERT INTO zzdb3q8 (sid, year, semester) VALUES ('alice', 2020, 2);



INSERT INTO zzdb3q9 (sid, year, semester) VALUES ('bob', 2021, 2);
INSERT INTO zzdb3q9 (sid, year, semester) VALUES ('fred', 2019, 2);
INSERT INTO zzdb3q9 (sid, year, semester) VALUES ('alice', 2020, 2);



INSERT INTO zzdb4q1 (sid, cid) VALUES ('alice', 'cs1');
INSERT INTO zzdb4q1 (sid, cid) VALUES ('dave', 'cs1');









INSERT INTO zzdb4q3 (sid, year, semester) VALUES ('cs3', 2020, 2);
INSERT INTO zzdb4q3 (sid, year, semester) VALUES ('cs1', 2021, 2);
INSERT INTO zzdb4q3 (sid, year, semester) VALUES ('cs4', 2021, 2);
INSERT INTO zzdb4q3 (sid, year, semester) VALUES ('cs2', 2021, 2);



INSERT INTO zzdb4q4 (sid, year, semester) VALUES ('cs1', 2019, 2);
INSERT INTO zzdb4q4 (sid, year, semester) VALUES ('cs1', 2020, 2);
INSERT INTO zzdb4q4 (sid, year, semester) VALUES ('cs1', 2021, 2);
INSERT INTO zzdb4q4 (sid, year, semester) VALUES ('cs1', 2022, 1);
INSERT INTO zzdb4q4 (sid, year, semester) VALUES ('cs2', 2020, 2);
INSERT INTO zzdb4q4 (sid, year, semester) VALUES ('cs2', 2021, 2);
INSERT INTO zzdb4q4 (sid, year, semester) VALUES ('cs3', 2020, 2);
INSERT INTO zzdb4q4 (sid, year, semester) VALUES ('cs4', 2020, 2);
INSERT INTO zzdb4q4 (sid, year, semester) VALUES ('cs4', 2021, 2);



INSERT INTO zzdb4q5 (cid) VALUES ('cs1');
INSERT INTO zzdb4q5 (cid) VALUES ('cs4');



INSERT INTO zzdb4q6 (cid, year, semester, cost) VALUES ('cs4', 2020, 2, 3000);
INSERT INTO zzdb4q6 (cid, year, semester, cost) VALUES ('cs3', 2020, 2, 3000);
INSERT INTO zzdb4q6 (cid, year, semester, cost) VALUES ('cs1', 2021, 2, 3000);
INSERT INTO zzdb4q6 (cid, year, semester, cost) VALUES ('cs1', 2019, 2, 3000);
INSERT INTO zzdb4q6 (cid, year, semester, cost) VALUES ('cs1', 2022, 1, 5000);
INSERT INTO zzdb4q6 (cid, year, semester, cost) VALUES ('cs2', 2020, 2, 3000);
INSERT INTO zzdb4q6 (cid, year, semester, cost) VALUES ('cs4', 2021, 2, 3000);
INSERT INTO zzdb4q6 (cid, year, semester, cost) VALUES ('cs1', 2020, 2, 3000);
INSERT INTO zzdb4q6 (cid, year, semester, cost) VALUES ('cs2', 2021, 2, 3000);



INSERT INTO zzdb4q7 (did, faculty, num_admitted, num_offering, total_enrollment) VALUES ('maths', 'fos', 0, 0, 0);
INSERT INTO zzdb4q7 (did, faculty, num_admitted, num_offering, total_enrollment) VALUES ('cs', 'soc', 1, 3, 10);



INSERT INTO zzdb4q8 (sid, year, semester) VALUES ('irene', 2022, 1);
INSERT INTO zzdb4q8 (sid, year, semester) VALUES ('eve', 2021, 2);
INSERT INTO zzdb4q8 (sid, year, semester) VALUES ('fred', 2020, 2);
INSERT INTO zzdb4q8 (sid, year, semester) VALUES ('bob', 2021, 2);
INSERT INTO zzdb4q8 (sid, year, semester) VALUES ('irene', 2021, 2);
INSERT INTO zzdb4q8 (sid, year, semester) VALUES ('fred', 2019, 2);
INSERT INTO zzdb4q8 (sid, year, semester) VALUES ('carol', 2021, 2);
INSERT INTO zzdb4q8 (sid, year, semester) VALUES ('george', 2020, 2);
INSERT INTO zzdb4q8 (sid, year, semester) VALUES ('fred', 2022, 1);
INSERT INTO zzdb4q8 (sid, year, semester) VALUES ('fred', 2021, 2);
INSERT INTO zzdb4q8 (sid, year, semester) VALUES ('alice', 2020, 2);



INSERT INTO zzdb4q9 (sid, year, semester) VALUES ('irene', 2022, 1);
INSERT INTO zzdb4q9 (sid, year, semester) VALUES ('bob', 2021, 2);
INSERT INTO zzdb4q9 (sid, year, semester) VALUES ('irene', 2021, 2);
INSERT INTO zzdb4q9 (sid, year, semester) VALUES ('fred', 2019, 2);
INSERT INTO zzdb4q9 (sid, year, semester) VALUES ('george', 2020, 2);
INSERT INTO zzdb4q9 (sid, year, semester) VALUES ('alice', 2020, 2);



INSERT INTO zzdb5q1 (sid, cid) VALUES ('alice', 'cs1');
INSERT INTO zzdb5q1 (sid, cid) VALUES ('dave', 'cs1');









INSERT INTO zzdb5q3 (sid, year, semester) VALUES ('cs3', 2020, 2);
INSERT INTO zzdb5q3 (sid, year, semester) VALUES ('cs1', 2021, 2);
INSERT INTO zzdb5q3 (sid, year, semester) VALUES ('is4', 2021, 2);
INSERT INTO zzdb5q3 (sid, year, semester) VALUES ('cs2', 2020, 2);
INSERT INTO zzdb5q3 (sid, year, semester) VALUES ('cs2', 2021, 2);



INSERT INTO zzdb5q4 (sid, year, semester) VALUES ('cs1', 2019, 2);
INSERT INTO zzdb5q4 (sid, year, semester) VALUES ('cs1', 2020, 2);
INSERT INTO zzdb5q4 (sid, year, semester) VALUES ('cs1', 2021, 2);
INSERT INTO zzdb5q4 (sid, year, semester) VALUES ('cs1', 2022, 1);
INSERT INTO zzdb5q4 (sid, year, semester) VALUES ('cs2', 2020, 2);
INSERT INTO zzdb5q4 (sid, year, semester) VALUES ('cs2', 2021, 2);
INSERT INTO zzdb5q4 (sid, year, semester) VALUES ('cs3', 2020, 2);
INSERT INTO zzdb5q4 (sid, year, semester) VALUES ('is4', 2020, 2);
INSERT INTO zzdb5q4 (sid, year, semester) VALUES ('is4', 2021, 2);



INSERT INTO zzdb5q5 (cid) VALUES ('cs1');



INSERT INTO zzdb5q6 (cid, year, semester, cost) VALUES ('cs3', 2020, 2, 3000);
INSERT INTO zzdb5q6 (cid, year, semester, cost) VALUES ('cs1', 2021, 2, 3000);
INSERT INTO zzdb5q6 (cid, year, semester, cost) VALUES ('cs1', 2019, 2, 3000);
INSERT INTO zzdb5q6 (cid, year, semester, cost) VALUES ('cs1', 2022, 1, 5000);
INSERT INTO zzdb5q6 (cid, year, semester, cost) VALUES ('cs2', 2020, 2, 3000);
INSERT INTO zzdb5q6 (cid, year, semester, cost) VALUES ('is4', 2021, 2, 3000);
INSERT INTO zzdb5q6 (cid, year, semester, cost) VALUES ('cs1', 2020, 2, 3000);
INSERT INTO zzdb5q6 (cid, year, semester, cost) VALUES ('is4', 2020, 2, 3000);
INSERT INTO zzdb5q6 (cid, year, semester, cost) VALUES ('cs2', 2021, 2, 3000);



INSERT INTO zzdb5q7 (did, faculty, num_admitted, num_offering, total_enrollment) VALUES ('maths', 'fos', 0, 0, 0);
INSERT INTO zzdb5q7 (did, faculty, num_admitted, num_offering, total_enrollment) VALUES ('disa', 'soc', 0, 1, 3);
INSERT INTO zzdb5q7 (did, faculty, num_admitted, num_offering, total_enrollment) VALUES ('cs', 'soc', 1, 2, 6);



INSERT INTO zzdb5q8 (sid, year, semester) VALUES ('bob', 2021, 2);
INSERT INTO zzdb5q8 (sid, year, semester) VALUES ('fred', 2019, 2);
INSERT INTO zzdb5q8 (sid, year, semester) VALUES ('carol', 2021, 2);
INSERT INTO zzdb5q8 (sid, year, semester) VALUES ('fred', 2022, 1);
INSERT INTO zzdb5q8 (sid, year, semester) VALUES ('alice', 2020, 2);



INSERT INTO zzdb5q9 (sid, year, semester) VALUES ('kath', 2021, 2);
INSERT INTO zzdb5q9 (sid, year, semester) VALUES ('bob', 2021, 2);
INSERT INTO zzdb5q9 (sid, year, semester) VALUES ('fred', 2019, 2);
INSERT INTO zzdb5q9 (sid, year, semester) VALUES ('fred', 2022, 1);
INSERT INTO zzdb5q9 (sid, year, semester) VALUES ('alice', 2020, 2);



INSERT INTO zzdb6q1 (sid, cid) VALUES ('alice', 'cs1');
INSERT INTO zzdb6q1 (sid, cid) VALUES ('dave', 'cs1');









INSERT INTO zzdb6q3 (sid, year, semester) VALUES ('cs3', 2020, 2);
INSERT INTO zzdb6q3 (sid, year, semester) VALUES ('cs1', 2021, 2);
INSERT INTO zzdb6q3 (sid, year, semester) VALUES ('is4', 2021, 2);
INSERT INTO zzdb6q3 (sid, year, semester) VALUES ('is5', 2021, 1);
INSERT INTO zzdb6q3 (sid, year, semester) VALUES ('cs2', 2021, 2);



INSERT INTO zzdb6q4 (sid, year, semester) VALUES ('cs1', 2021, 2);
INSERT INTO zzdb6q4 (sid, year, semester) VALUES ('cs2', 2021, 2);
INSERT INTO zzdb6q4 (sid, year, semester) VALUES ('is4', 2021, 2);
INSERT INTO zzdb6q4 (sid, year, semester) VALUES ('is5', 2021, 1);
INSERT INTO zzdb6q4 (sid, year, semester) VALUES ('cs1', 2019, 2);
INSERT INTO zzdb6q4 (sid, year, semester) VALUES ('cs1', 2020, 2);
INSERT INTO zzdb6q4 (sid, year, semester) VALUES ('cs1', 2022, 1);
INSERT INTO zzdb6q4 (sid, year, semester) VALUES ('cs2', 2020, 2);
INSERT INTO zzdb6q4 (sid, year, semester) VALUES ('cs3', 2020, 2);
INSERT INTO zzdb6q4 (sid, year, semester) VALUES ('is4', 2020, 2);



INSERT INTO zzdb6q5 (cid) VALUES ('cs1');
INSERT INTO zzdb6q5 (cid) VALUES ('cs3');



INSERT INTO zzdb6q6 (cid, year, semester, cost) VALUES ('cs3', 2020, 2, 3000);
INSERT INTO zzdb6q6 (cid, year, semester, cost) VALUES ('cs1', 2021, 2, 3000);
INSERT INTO zzdb6q6 (cid, year, semester, cost) VALUES ('cs1', 2019, 2, 3000);
INSERT INTO zzdb6q6 (cid, year, semester, cost) VALUES ('cs1', 2022, 1, 5000);
INSERT INTO zzdb6q6 (cid, year, semester, cost) VALUES ('is4', 2021, 2, 6000);
INSERT INTO zzdb6q6 (cid, year, semester, cost) VALUES ('cs2', 2020, 2, 3000);
INSERT INTO zzdb6q6 (cid, year, semester, cost) VALUES ('cs1', 2020, 2, 3000);
INSERT INTO zzdb6q6 (cid, year, semester, cost) VALUES ('is5', 2021, 1, 3000);
INSERT INTO zzdb6q6 (cid, year, semester, cost) VALUES ('is4', 2020, 2, 3000);
INSERT INTO zzdb6q6 (cid, year, semester, cost) VALUES ('cs2', 2021, 2, 3000);



INSERT INTO zzdb6q7 (did, faculty, num_admitted, num_offering, total_enrollment) VALUES ('maths', 'fos', 2, 0, 0);
INSERT INTO zzdb6q7 (did, faculty, num_admitted, num_offering, total_enrollment) VALUES ('cs', 'soc', 2, 2, 10);
INSERT INTO zzdb6q7 (did, faculty, num_admitted, num_offering, total_enrollment) VALUES ('ee', 'foe', 0, 0, 0);
INSERT INTO zzdb6q7 (did, faculty, num_admitted, num_offering, total_enrollment) VALUES ('disa', 'soc', 3, 2, 6);



INSERT INTO zzdb6q8 (sid, year, semester) VALUES ('bob', 2021, 2);
INSERT INTO zzdb6q8 (sid, year, semester) VALUES ('mike', 2021, 2);
INSERT INTO zzdb6q8 (sid, year, semester) VALUES ('fred', 2019, 2);
INSERT INTO zzdb6q8 (sid, year, semester) VALUES ('carol', 2021, 2);
INSERT INTO zzdb6q8 (sid, year, semester) VALUES ('fred', 2022, 1);



INSERT INTO zzdb6q9 (sid, year, semester) VALUES ('alice', 2021, 2);
INSERT INTO zzdb6q9 (sid, year, semester) VALUES ('fred', 2020, 2);
INSERT INTO zzdb6q9 (sid, year, semester) VALUES ('bob', 2021, 2);
INSERT INTO zzdb6q9 (sid, year, semester) VALUES ('fred', 2019, 2);
INSERT INTO zzdb6q9 (sid, year, semester) VALUES ('irene', 2021, 1);
INSERT INTO zzdb6q9 (sid, year, semester) VALUES ('fred', 2022, 1);
INSERT INTO zzdb6q9 (sid, year, semester) VALUES ('jill', 2021, 1);



INSERT INTO zzdb7q1 (sid, cid) VALUES ('alice', 'cs1');
INSERT INTO zzdb7q1 (sid, cid) VALUES ('alice', 'cs4');
INSERT INTO zzdb7q1 (sid, cid) VALUES ('dave', 'cs1');









INSERT INTO zzdb7q3 (sid, year, semester) VALUES ('cs3', 2020, 2);
INSERT INTO zzdb7q3 (sid, year, semester) VALUES ('cs1', 2021, 2);
INSERT INTO zzdb7q3 (sid, year, semester) VALUES ('cs2', 2020, 2);
INSERT INTO zzdb7q3 (sid, year, semester) VALUES ('cs4', 2021, 2);
INSERT INTO zzdb7q3 (sid, year, semester) VALUES ('cs2', 2021, 2);



INSERT INTO zzdb7q4 (sid, year, semester) VALUES ('cs1', 2019, 2);
INSERT INTO zzdb7q4 (sid, year, semester) VALUES ('cs1', 2020, 2);
INSERT INTO zzdb7q4 (sid, year, semester) VALUES ('cs1', 2021, 2);
INSERT INTO zzdb7q4 (sid, year, semester) VALUES ('cs1', 2022, 1);
INSERT INTO zzdb7q4 (sid, year, semester) VALUES ('cs2', 2020, 2);
INSERT INTO zzdb7q4 (sid, year, semester) VALUES ('cs2', 2021, 2);
INSERT INTO zzdb7q4 (sid, year, semester) VALUES ('cs3', 2020, 2);
INSERT INTO zzdb7q4 (sid, year, semester) VALUES ('cs4', 2020, 2);
INSERT INTO zzdb7q4 (sid, year, semester) VALUES ('cs4', 2021, 2);



INSERT INTO zzdb7q5 (cid) VALUES ('cs1');
INSERT INTO zzdb7q5 (cid) VALUES ('cs4');



INSERT INTO zzdb7q6 (cid, year, semester, cost) VALUES ('cs4', 2020, 2, 1000);
INSERT INTO zzdb7q6 (cid, year, semester, cost) VALUES ('cs3', 2020, 2, 2000);
INSERT INTO zzdb7q6 (cid, year, semester, cost) VALUES ('cs1', 2021, 2, 4000);
INSERT INTO zzdb7q6 (cid, year, semester, cost) VALUES ('cs1', 2019, 2, 2000);
INSERT INTO zzdb7q6 (cid, year, semester, cost) VALUES ('cs1', 2022, 1, 6000);
INSERT INTO zzdb7q6 (cid, year, semester, cost) VALUES ('cs2', 2020, 2, 3000);
INSERT INTO zzdb7q6 (cid, year, semester, cost) VALUES ('cs4', 2021, 2, 1250);
INSERT INTO zzdb7q6 (cid, year, semester, cost) VALUES ('cs1', 2020, 2, 1000);
INSERT INTO zzdb7q6 (cid, year, semester, cost) VALUES ('cs2', 2021, 2, 2000);



INSERT INTO zzdb7q7 (did, faculty, num_admitted, num_offering, total_enrollment) VALUES ('maths', 'fos', 0, 0, 0);
INSERT INTO zzdb7q7 (did, faculty, num_admitted, num_offering, total_enrollment) VALUES ('cs', 'soc', 1, 3, 8);



INSERT INTO zzdb7q8 (sid, year, semester) VALUES ('eve', 2021, 2);
INSERT INTO zzdb7q8 (sid, year, semester) VALUES ('fred', 2020, 2);
INSERT INTO zzdb7q8 (sid, year, semester) VALUES ('bob', 2021, 2);
INSERT INTO zzdb7q8 (sid, year, semester) VALUES ('fred', 2019, 2);
INSERT INTO zzdb7q8 (sid, year, semester) VALUES ('carol', 2021, 2);
INSERT INTO zzdb7q8 (sid, year, semester) VALUES ('fred', 2022, 1);
INSERT INTO zzdb7q8 (sid, year, semester) VALUES ('fred', 2021, 2);
INSERT INTO zzdb7q8 (sid, year, semester) VALUES ('alice', 2020, 2);



INSERT INTO zzdb7q9 (sid, year, semester) VALUES ('bob', 2021, 2);
INSERT INTO zzdb7q9 (sid, year, semester) VALUES ('fred', 2019, 2);
INSERT INTO zzdb7q9 (sid, year, semester) VALUES ('fred', 2022, 1);
INSERT INTO zzdb7q9 (sid, year, semester) VALUES ('alice', 2020, 2);



INSERT INTO zzdb8q1 (sid, cid) VALUES ('alice', 'cs1');
INSERT INTO zzdb8q1 (sid, cid) VALUES ('dave', 'cs1');









INSERT INTO zzdb8q3 (sid, year, semester) VALUES ('cs3', 2020, 2);
INSERT INTO zzdb8q3 (sid, year, semester) VALUES ('cs1', 2021, 2);
INSERT INTO zzdb8q3 (sid, year, semester) VALUES ('cs2', 2020, 2);
INSERT INTO zzdb8q3 (sid, year, semester) VALUES ('cs4', 2021, 2);
INSERT INTO zzdb8q3 (sid, year, semester) VALUES ('cs2', 2021, 2);



INSERT INTO zzdb8q4 (sid, year, semester) VALUES ('cs1', 2019, 2);
INSERT INTO zzdb8q4 (sid, year, semester) VALUES ('cs1', 2020, 2);
INSERT INTO zzdb8q4 (sid, year, semester) VALUES ('cs1', 2021, 2);
INSERT INTO zzdb8q4 (sid, year, semester) VALUES ('cs1', 2022, 1);
INSERT INTO zzdb8q4 (sid, year, semester) VALUES ('cs2', 2020, 2);
INSERT INTO zzdb8q4 (sid, year, semester) VALUES ('cs2', 2021, 2);
INSERT INTO zzdb8q4 (sid, year, semester) VALUES ('cs3', 2020, 2);
INSERT INTO zzdb8q4 (sid, year, semester) VALUES ('cs4', 2020, 2);
INSERT INTO zzdb8q4 (sid, year, semester) VALUES ('cs4', 2021, 2);



INSERT INTO zzdb8q5 (cid) VALUES ('cs1');
INSERT INTO zzdb8q5 (cid) VALUES ('cs4');
INSERT INTO zzdb8q5 (cid) VALUES ('cs5');



INSERT INTO zzdb8q6 (cid, year, semester, cost) VALUES ('cs4', 2020, 2, 3000);
INSERT INTO zzdb8q6 (cid, year, semester, cost) VALUES ('cs3', 2020, 2, 3000);
INSERT INTO zzdb8q6 (cid, year, semester, cost) VALUES ('cs1', 2021, 2, 3000);
INSERT INTO zzdb8q6 (cid, year, semester, cost) VALUES ('cs1', 2019, 2, 3000);
INSERT INTO zzdb8q6 (cid, year, semester, cost) VALUES ('cs1', 2022, 1, 5000);
INSERT INTO zzdb8q6 (cid, year, semester, cost) VALUES ('cs2', 2020, 2, 3000);
INSERT INTO zzdb8q6 (cid, year, semester, cost) VALUES ('cs4', 2021, 2, 3000);
INSERT INTO zzdb8q6 (cid, year, semester, cost) VALUES ('cs1', 2020, 2, 3000);
INSERT INTO zzdb8q6 (cid, year, semester, cost) VALUES ('cs2', 2021, 2, 3000);



INSERT INTO zzdb8q7 (did, faculty, num_admitted, num_offering, total_enrollment) VALUES ('maths', 'fos', 0, 0, 0);
INSERT INTO zzdb8q7 (did, faculty, num_admitted, num_offering, total_enrollment) VALUES ('cs', 'soc', 1, 3, 8);



INSERT INTO zzdb8q8 (sid, year, semester) VALUES ('eve', 2021, 2);
INSERT INTO zzdb8q8 (sid, year, semester) VALUES ('fred', 2020, 2);
INSERT INTO zzdb8q8 (sid, year, semester) VALUES ('bob', 2021, 2);
INSERT INTO zzdb8q8 (sid, year, semester) VALUES ('fred', 2019, 2);
INSERT INTO zzdb8q8 (sid, year, semester) VALUES ('carol', 2021, 2);
INSERT INTO zzdb8q8 (sid, year, semester) VALUES ('fred', 2022, 1);
INSERT INTO zzdb8q8 (sid, year, semester) VALUES ('fred', 2021, 2);
INSERT INTO zzdb8q8 (sid, year, semester) VALUES ('alice', 2020, 2);



INSERT INTO zzdb8q9 (sid, year, semester) VALUES ('bob', 2021, 2);
INSERT INTO zzdb8q9 (sid, year, semester) VALUES ('fred', 2019, 2);
INSERT INTO zzdb8q9 (sid, year, semester) VALUES ('fred', 2022, 1);
INSERT INTO zzdb8q9 (sid, year, semester) VALUES ('alice', 2020, 2);



INSERT INTO zzdb9q1 (sid, cid) VALUES ('alice', 'cs1');
INSERT INTO zzdb9q1 (sid, cid) VALUES ('alice', 'cs4');
INSERT INTO zzdb9q1 (sid, cid) VALUES ('dave', 'cs1');






INSERT INTO zzdb9q2 (sid) VALUES ('alice');



INSERT INTO zzdb9q3 (sid, year, semester) VALUES ('cs3', 2020, 2);
INSERT INTO zzdb9q3 (sid, year, semester) VALUES ('cs1', 2021, 2);
INSERT INTO zzdb9q3 (sid, year, semester) VALUES ('cs2', 2020, 2);
INSERT INTO zzdb9q3 (sid, year, semester) VALUES ('cs4', 2021, 2);
INSERT INTO zzdb9q3 (sid, year, semester) VALUES ('cs2', 2021, 2);



INSERT INTO zzdb9q4 (sid, year, semester) VALUES ('cs1', 2019, 2);
INSERT INTO zzdb9q4 (sid, year, semester) VALUES ('cs1', 2020, 2);
INSERT INTO zzdb9q4 (sid, year, semester) VALUES ('cs1', 2021, 2);
INSERT INTO zzdb9q4 (sid, year, semester) VALUES ('cs1', 2022, 1);
INSERT INTO zzdb9q4 (sid, year, semester) VALUES ('cs2', 2020, 2);
INSERT INTO zzdb9q4 (sid, year, semester) VALUES ('cs2', 2021, 2);
INSERT INTO zzdb9q4 (sid, year, semester) VALUES ('cs3', 2020, 2);
INSERT INTO zzdb9q4 (sid, year, semester) VALUES ('cs3', 2022, 1);
INSERT INTO zzdb9q4 (sid, year, semester) VALUES ('cs4', 2020, 2);
INSERT INTO zzdb9q4 (sid, year, semester) VALUES ('cs4', 2021, 2);



INSERT INTO zzdb9q5 (cid) VALUES ('cs1');
INSERT INTO zzdb9q5 (cid) VALUES ('cs4');



INSERT INTO zzdb9q6 (cid, year, semester, cost) VALUES ('cs3', 2022, 1, 3500);
INSERT INTO zzdb9q6 (cid, year, semester, cost) VALUES ('cs4', 2020, 2, 3500);
INSERT INTO zzdb9q6 (cid, year, semester, cost) VALUES ('cs3', 2020, 2, 3500);
INSERT INTO zzdb9q6 (cid, year, semester, cost) VALUES ('cs1', 2021, 2, 3000);
INSERT INTO zzdb9q6 (cid, year, semester, cost) VALUES ('cs1', 2019, 2, 3000);
INSERT INTO zzdb9q6 (cid, year, semester, cost) VALUES ('cs1', 2022, 1, 5000);
INSERT INTO zzdb9q6 (cid, year, semester, cost) VALUES ('cs2', 2020, 2, 3000);
INSERT INTO zzdb9q6 (cid, year, semester, cost) VALUES ('cs4', 2021, 2, 3000);
INSERT INTO zzdb9q6 (cid, year, semester, cost) VALUES ('cs1', 2020, 2, 3000);
INSERT INTO zzdb9q6 (cid, year, semester, cost) VALUES ('cs2', 2021, 2, 3000);



INSERT INTO zzdb9q7 (did, faculty, num_admitted, num_offering, total_enrollment) VALUES ('maths', 'fos', 0, 0, 0);
INSERT INTO zzdb9q7 (did, faculty, num_admitted, num_offering, total_enrollment) VALUES ('cs', 'soc', 1, 3, 8);



INSERT INTO zzdb9q8 (sid, year, semester) VALUES ('eve', 2021, 2);
INSERT INTO zzdb9q8 (sid, year, semester) VALUES ('fred', 2020, 2);
INSERT INTO zzdb9q8 (sid, year, semester) VALUES ('bob', 2021, 2);
INSERT INTO zzdb9q8 (sid, year, semester) VALUES ('fred', 2019, 2);
INSERT INTO zzdb9q8 (sid, year, semester) VALUES ('carol', 2021, 2);
INSERT INTO zzdb9q8 (sid, year, semester) VALUES ('fred', 2022, 1);
INSERT INTO zzdb9q8 (sid, year, semester) VALUES ('fred', 2021, 2);
INSERT INTO zzdb9q8 (sid, year, semester) VALUES ('alice', 2020, 2);



INSERT INTO zzdb9q9 (sid, year, semester) VALUES ('bob', 2021, 2);
INSERT INTO zzdb9q9 (sid, year, semester) VALUES ('fred', 2019, 2);
INSERT INTO zzdb9q9 (sid, year, semester) VALUES ('fred', 2022, 1);
INSERT INTO zzdb9q9 (sid, year, semester) VALUES ('alice', 2020, 2);



RETURN;
END;
$$ LANGUAGE PLPGSQL;


select init();




-- Test summary for Query for Question 1
CREATE OR REPLACE FUNCTION test1 () RETURNS SETOF TEXT
AS $$
BEGIN

DELETE FROM zzSummary;

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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v1;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb1q1;

-- Compare zzsolution and zzanswer for Question 1 on testcase 1
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v1;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb2q1;

-- Compare zzsolution and zzanswer for Question 1 on testcase 2
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v1;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb3q1;

-- Compare zzsolution and zzanswer for Question 1 on testcase 3
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v1;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb4q1;

-- Compare zzsolution and zzanswer for Question 1 on testcase 4
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v1;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb5q1;

-- Compare zzsolution and zzanswer for Question 1 on testcase 5
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v1;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb6q1;

-- Compare zzsolution and zzanswer for Question 1 on testcase 6
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v1;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb7q1;

-- Compare zzsolution and zzanswer for Question 1 on testcase 7
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v1;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb8q1;

-- Compare zzsolution and zzanswer for Question 1 on testcase 8
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v1;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb9q1;

-- Compare zzsolution and zzanswer for Question 1 on testcase 9
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v1;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb10q1;

-- Compare zzsolution and zzanswer for Question 1 on testcase 10
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

RETURN QUERY EXECUTE 'SELECT status AS  "Summary of testing query 1"  FROM zzSummary';
RETURN;
END;
$$ LANGUAGE PLPGSQL;


-- Test summary for Query for Question 2
CREATE OR REPLACE FUNCTION test2 () RETURNS SETOF TEXT
AS $$
BEGIN

DELETE FROM zzSummary;

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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v2;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb1q2;

-- Compare zzsolution and zzanswer for Question 2 on testcase 1
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v2;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb2q2;

-- Compare zzsolution and zzanswer for Question 2 on testcase 2
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v2;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb3q2;

-- Compare zzsolution and zzanswer for Question 2 on testcase 3
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v2;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb4q2;

-- Compare zzsolution and zzanswer for Question 2 on testcase 4
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v2;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb5q2;

-- Compare zzsolution and zzanswer for Question 2 on testcase 5
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v2;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb6q2;

-- Compare zzsolution and zzanswer for Question 2 on testcase 6
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v2;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb7q2;

-- Compare zzsolution and zzanswer for Question 2 on testcase 7
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v2;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb8q2;

-- Compare zzsolution and zzanswer for Question 2 on testcase 8
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v2;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb9q2;

-- Compare zzsolution and zzanswer for Question 2 on testcase 9
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v2;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb10q2;

-- Compare zzsolution and zzanswer for Question 2 on testcase 10
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

RETURN QUERY EXECUTE 'SELECT status AS  "Summary of testing query 2"  FROM zzSummary';
RETURN;
END;
$$ LANGUAGE PLPGSQL;


-- Test summary for Query for Question 3
CREATE OR REPLACE FUNCTION test3 () RETURNS SETOF TEXT
AS $$
BEGIN

DELETE FROM zzSummary;

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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v3;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb1q3;

-- Compare zzsolution and zzanswer for Question 3 on testcase 1
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v3;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb2q3;

-- Compare zzsolution and zzanswer for Question 3 on testcase 2
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v3;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb3q3;

-- Compare zzsolution and zzanswer for Question 3 on testcase 3
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v3;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb4q3;

-- Compare zzsolution and zzanswer for Question 3 on testcase 4
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v3;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb5q3;

-- Compare zzsolution and zzanswer for Question 3 on testcase 5
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v3;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb6q3;

-- Compare zzsolution and zzanswer for Question 3 on testcase 6
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v3;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb7q3;

-- Compare zzsolution and zzanswer for Question 3 on testcase 7
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v3;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb8q3;

-- Compare zzsolution and zzanswer for Question 3 on testcase 8
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v3;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb9q3;

-- Compare zzsolution and zzanswer for Question 3 on testcase 9
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v3;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb10q3;

-- Compare zzsolution and zzanswer for Question 3 on testcase 10
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

RETURN QUERY EXECUTE 'SELECT status AS  "Summary of testing query 3"  FROM zzSummary';
RETURN;
END;
$$ LANGUAGE PLPGSQL;


-- Test summary for Query for Question 4
CREATE OR REPLACE FUNCTION test4 () RETURNS SETOF TEXT
AS $$
BEGIN

DELETE FROM zzSummary;

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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v4;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb1q4;

-- Compare zzsolution and zzanswer for Question 4 on testcase 1
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v4;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb2q4;

-- Compare zzsolution and zzanswer for Question 4 on testcase 2
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v4;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb3q4;

-- Compare zzsolution and zzanswer for Question 4 on testcase 3
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v4;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb4q4;

-- Compare zzsolution and zzanswer for Question 4 on testcase 4
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v4;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb5q4;

-- Compare zzsolution and zzanswer for Question 4 on testcase 5
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v4;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb6q4;

-- Compare zzsolution and zzanswer for Question 4 on testcase 6
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v4;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb7q4;

-- Compare zzsolution and zzanswer for Question 4 on testcase 7
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v4;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb8q4;

-- Compare zzsolution and zzanswer for Question 4 on testcase 8
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v4;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb9q4;

-- Compare zzsolution and zzanswer for Question 4 on testcase 9
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v4;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb10q4;

-- Compare zzsolution and zzanswer for Question 4 on testcase 10
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

RETURN QUERY EXECUTE 'SELECT status AS  "Summary of testing query 4"  FROM zzSummary';
RETURN;
END;
$$ LANGUAGE PLPGSQL;


-- Test summary for Query for Question 5
CREATE OR REPLACE FUNCTION test5 () RETURNS SETOF TEXT
AS $$
BEGIN

DELETE FROM zzSummary;

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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v5;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb1q5;

-- Compare zzsolution and zzanswer for Question 5 on testcase 1
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v5;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb2q5;

-- Compare zzsolution and zzanswer for Question 5 on testcase 2
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v5;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb3q5;

-- Compare zzsolution and zzanswer for Question 5 on testcase 3
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v5;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb4q5;

-- Compare zzsolution and zzanswer for Question 5 on testcase 4
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v5;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb5q5;

-- Compare zzsolution and zzanswer for Question 5 on testcase 5
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v5;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb6q5;

-- Compare zzsolution and zzanswer for Question 5 on testcase 6
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v5;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb7q5;

-- Compare zzsolution and zzanswer for Question 5 on testcase 7
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v5;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb8q5;

-- Compare zzsolution and zzanswer for Question 5 on testcase 8
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v5;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb9q5;

-- Compare zzsolution and zzanswer for Question 5 on testcase 9
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v5;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb10q5;

-- Compare zzsolution and zzanswer for Question 5 on testcase 10
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

RETURN QUERY EXECUTE 'SELECT status AS  "Summary of testing query 5"  FROM zzSummary';
RETURN;
END;
$$ LANGUAGE PLPGSQL;


-- Test summary for Query for Question 6
CREATE OR REPLACE FUNCTION test6 () RETURNS SETOF TEXT
AS $$
BEGIN

DELETE FROM zzSummary;

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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v6;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb1q6;

-- Compare zzsolution and zzanswer for Question 6 on testcase 1
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v6;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb2q6;

-- Compare zzsolution and zzanswer for Question 6 on testcase 2
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v6;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb3q6;

-- Compare zzsolution and zzanswer for Question 6 on testcase 3
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v6;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb4q6;

-- Compare zzsolution and zzanswer for Question 6 on testcase 4
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v6;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb5q6;

-- Compare zzsolution and zzanswer for Question 6 on testcase 5
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v6;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb6q6;

-- Compare zzsolution and zzanswer for Question 6 on testcase 6
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v6;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb7q6;

-- Compare zzsolution and zzanswer for Question 6 on testcase 7
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v6;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb8q6;

-- Compare zzsolution and zzanswer for Question 6 on testcase 8
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v6;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb9q6;

-- Compare zzsolution and zzanswer for Question 6 on testcase 9
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v6;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb10q6;

-- Compare zzsolution and zzanswer for Question 6 on testcase 10
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

RETURN QUERY EXECUTE 'SELECT status AS  "Summary of testing query 6"  FROM zzSummary';
RETURN;
END;
$$ LANGUAGE PLPGSQL;


-- Test summary for Query for Question 7
CREATE OR REPLACE FUNCTION test7 () RETURNS SETOF TEXT
AS $$
BEGIN

DELETE FROM zzSummary;

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

RETURN QUERY EXECUTE 'SELECT status AS  "Summary of testing query 7"  FROM zzSummary';
RETURN;
END;
$$ LANGUAGE PLPGSQL;


-- Test summary for Query for Question 8
CREATE OR REPLACE FUNCTION test8 () RETURNS SETOF TEXT
AS $$
BEGIN

DELETE FROM zzSummary;

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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v8;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb1q8;

-- Compare zzsolution and zzanswer for Question 8 on testcase 1
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v8;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb2q8;

-- Compare zzsolution and zzanswer for Question 8 on testcase 2
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v8;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb3q8;

-- Compare zzsolution and zzanswer for Question 8 on testcase 3
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v8;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb4q8;

-- Compare zzsolution and zzanswer for Question 8 on testcase 4
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v8;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb5q8;

-- Compare zzsolution and zzanswer for Question 8 on testcase 5
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v8;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb6q8;

-- Compare zzsolution and zzanswer for Question 8 on testcase 6
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v8;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb7q8;

-- Compare zzsolution and zzanswer for Question 8 on testcase 7
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v8;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb8q8;

-- Compare zzsolution and zzanswer for Question 8 on testcase 8
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v8;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb9q8;

-- Compare zzsolution and zzanswer for Question 8 on testcase 9
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v8;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb10q8;

-- Compare zzsolution and zzanswer for Question 8 on testcase 10
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

RETURN QUERY EXECUTE 'SELECT status AS  "Summary of testing query 8"  FROM zzSummary';
RETURN;
END;
$$ LANGUAGE PLPGSQL;


-- Test summary for Query for Question 9
CREATE OR REPLACE FUNCTION test9 () RETURNS SETOF TEXT
AS $$
BEGIN

DELETE FROM zzSummary;

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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v9;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb1q9;

-- Compare zzsolution and zzanswer for Question 9 on testcase 1
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v9;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb2q9;

-- Compare zzsolution and zzanswer for Question 9 on testcase 2
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v9;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb3q9;

-- Compare zzsolution and zzanswer for Question 9 on testcase 3
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v9;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb4q9;

-- Compare zzsolution and zzanswer for Question 9 on testcase 4
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v9;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb5q9;

-- Compare zzsolution and zzanswer for Question 9 on testcase 5
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v9;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb6q9;

-- Compare zzsolution and zzanswer for Question 9 on testcase 6
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v9;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb7q9;

-- Compare zzsolution and zzanswer for Question 9 on testcase 7
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v9;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb8q9;

-- Compare zzsolution and zzanswer for Question 9 on testcase 8
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v9;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb9q9;

-- Compare zzsolution and zzanswer for Question 9 on testcase 9
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v9;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb10q9;

-- Compare zzsolution and zzanswer for Question 9 on testcase 10
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

RETURN QUERY EXECUTE 'SELECT status AS  "Summary of testing query 9"  FROM zzSummary';
RETURN;
END;
$$ LANGUAGE PLPGSQL;


-- Test summary for Query for Question 10
CREATE OR REPLACE FUNCTION test10 () RETURNS SETOF TEXT
AS $$
BEGIN

DELETE FROM zzSummary;

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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v10;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb1q10;

-- Compare zzsolution and zzanswer for Question 10 on testcase 1
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v10;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb2q10;

-- Compare zzsolution and zzanswer for Question 10 on testcase 2
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v10;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb3q10;

-- Compare zzsolution and zzanswer for Question 10 on testcase 3
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v10;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb4q10;

-- Compare zzsolution and zzanswer for Question 10 on testcase 4
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v10;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb5q10;

-- Compare zzsolution and zzanswer for Question 10 on testcase 5
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v10;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb6q10;

-- Compare zzsolution and zzanswer for Question 10 on testcase 6
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v10;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb7q10;

-- Compare zzsolution and zzanswer for Question 10 on testcase 7
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v10;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb8q10;

-- Compare zzsolution and zzanswer for Question 10 on testcase 8
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v10;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb9q10;

-- Compare zzsolution and zzanswer for Question 10 on testcase 9
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
CREATE OR REPLACE VIEW zzanswer AS SELECT * FROM v10;
CREATE OR REPLACE VIEW zzsolution AS SELECT * FROM zzdb10q10;

-- Compare zzsolution and zzanswer for Question 10 on testcase 10
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

RETURN QUERY EXECUTE 'SELECT status AS  "Summary of testing query 10"  FROM zzSummary';
RETURN;
END;
$$ LANGUAGE PLPGSQL;
