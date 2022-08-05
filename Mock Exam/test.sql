drop table if exists Presenters, Students cascade;
create table Students (
    sid integer primary key
);

create table Presenters (
week    integer check (week > 0),
sid     integer references Students(sid),
qnum    integer not null check (qnum > 0),
primary key (week, sid)
);

insert into Students(sid)
values (1), (2), (3);
insert into Presenters(week, sid, qnum)
values (1, 1, 1), (2, 2, 2), (3, 3, 3);
drop view if exists v1, v2, v3, v4, v5 cascade;
create or replace view v1(sid) as
    select * from students;