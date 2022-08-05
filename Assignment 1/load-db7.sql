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

