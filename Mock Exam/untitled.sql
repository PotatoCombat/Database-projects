-- drop table if exists Presenters, Students, cascade;

-- create table Students (
-- sid integer primary key
-- );

-- create table Presenters (
-- week integer check (week > 0),
-- sid integer references Students(sid),
-- qnum integer not null check (qnum > 0),
-- primary key (week, sid)
-- );

drop view if exists v1 cascade;

create or replace view v1(sid) as
	select *
	from Students;
