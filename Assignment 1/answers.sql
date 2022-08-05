
/* cs2102 assignment 1 */

drop view if exists v1, v2, v3, v4, v5, v6, v7, v8, v9, v10 cascade;

create or replace view v1 (sid,cid) as
select distinct sid, cid
from Tutors
except
select sid, cid
from Transcripts
;

create or replace view v2 (sid) as
select distinct t1.sid
from Tutors t1, Tutors t2
where t1.cid <> t2.cid
and row(t1.sid, t1.year, t1.semester) = row(t2.sid, t2.year, t2.semester)
;

create or replace view v3 (cid, year, semester) as
with
Enrolled as (
    select cid, year, semester, count(sid) as enrolled
    from Transcripts
    group by cid, year, semester
),
MaxEnrolled as (
    select cid, max(enrolled) as max_enrolled
    from Enrolled
    group by cid
)
select distinct e.cid, e.year, e.semester
from Enrolled e, MaxEnrolled max_e
where row(e.cid, e.enrolled) = row(max_e.cid, max_e.max_enrolled)
;

create or replace view v4 (cid, year, semester) as
with
NumTeaches as (
    select cid, year, semester, count(pid) as n
    from Teaches
    group by cid, year, semester
)
select cid, year, semester
from NumTeaches natural join Courses
where did = 'cs'
or semester = 2
or n = 1
;

create or replace view v5 (cid) as
select cid
from Courses
where did = 'cs'
except
select cid
from Transcripts
where sid = 'alice'
;

create or replace view v6 (cid, year, semester, cost) as
with
Costs as (
    select cid, year, semester, hours * 100 as cost
    from Teaches
    union all
    select cid, year, semester, hours * 50 as cost
    from Tutors
)
select cid, year, semester, sum(cost) as cost
from Costs
group by cid, year, semester
;

create or replace view v7 (did, faculty, num_admitted, num_offering, total_enrollment) as
with
NumAdmissions as (
    select did, count(sid) as num_admitted
    from Students
    group by did, year
    having year = 2021
),
NumOfferings as (
    select did, count(cid) as num_offering
    from Courses natural join Offerings
    group by did, year
    having year = 2021
),
TotalEnrollments as (
    select did, count(sid) as total_enrollment
    from Courses natural join Transcripts
    group by did, year
    having year = 2021
)
select
    did,
    faculty,
    case when num_admitted is null then 0 else num_admitted end,
    case when num_offering is null then 0 else num_offering end,
    case when total_enrollment is null then 0 else total_enrollment end
from Departments
natural left join NumAdmissions
natural left join NumOfferings
natural left join TotalEnrollments
;

create or replace view v8 (sid, year, semester) as
with
Enrolls as (
    select distinct sid, did, year, semester
    from Transcripts natural join Courses
)
select sid, year, semester
from Enrolls
except
select sid, year, semester
from Enrolls
where did <> 'cs'
;

create or replace view v9 (sid, year, semester) as
with
HighestMarks as (
    select cid, year, semester, max(marks) as highest_marks
    from Transcripts
    group by cid, year, semester
)
select distinct sid, year, semester
from Transcripts
except
select sid, year, semester
from Transcripts natural join HighestMarks
where marks <> highest_marks
;

create or replace view v10 (sid1, sid2, sid3, sid4) as
with
BestTutors as (
    select sid
    from Tutors natural join (
        select sid
        from Students
        where year >= 2019
    ) as Students2019
    group by sid, year, semester
    having row(year, semester) = row(2022, 1)
    and sum(hours) >= 10
),
Teams as (
    select s1.sid as sid1, s2.sid as sid2, s3.sid as sid3, s4.sid as sid4
    from BestTutors s1, BestTutors s2, BestTutors s3, BestTutors s4
    where s1.sid < s2.sid
    and s2.sid < s3.sid
    and s3.sid < s4.sid
),
EnrollsBefore as (
    select sid, cid
    from Transcripts
    where row(year, semester) < row (2022, 2)
),
EnrollsA as (
    select sid
    from EnrollsBefore
    where cid = 'cs1'
    intersect
    select sid
    from EnrollsBefore
    where cid = 'cs2'
),
EnrollsB as (
    select sid
    from EnrollsBefore
    where cid = 'cs3'
    union
    select sid
    from EnrollsBefore
    where cid = 'cs4'
)
select sid1, sid2, sid3, sid4
from Teams
where (case when sid1 in (select * from EnrollsA) then 1 else 0 end) +
      (case when sid2 in (select * from EnrollsA) then 1 else 0 end) +
      (case when sid3 in (select * from EnrollsA) then 1 else 0 end) +
      (case when sid4 in (select * from EnrollsA) then 1 else 0 end) >= 2
and (case when sid1 in (select * from EnrollsB) then 1 else 0 end) +
    (case when sid2 in (select * from EnrollsB) then 1 else 0 end) +
    (case when sid3 in (select * from EnrollsB) then 1 else 0 end) +
    (case when sid4 in (select * from EnrollsB) then 1 else 0 end) >= 2
;

