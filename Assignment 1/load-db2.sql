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

