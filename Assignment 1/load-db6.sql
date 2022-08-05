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



