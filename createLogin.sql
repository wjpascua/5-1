drop sequence if exists login_id_seq cascade;
create sequence login_id_seq;
drop table if exists login cascade;
create table login(
  id integer not null default nextval('login_id_seq'),
  first_name varchar(50),
  last_name varchar(50),
  username varchar(50),
  password varchar(50),
  department varchar(50),
  division varchar(50),
  primary key(id)
);

insert into login (first_name, last_name, username, password, department, division) 
  values ('Liberal', 'Arts', 'lib', md5('art'), 'div1', 'div1');
insert into login (first_name, last_name, username, password, department, division) 
  values ('Math', 'Person', 'math', md5('math'), 'math', 'div1');
insert into login (first_name, last_name, username, password, department, division) 
  values ('English', 'Muffin', 'eng', md5('words'), 'english', 'div1');
insert into login (first_name, last_name, username, password, department, division) 
  values ('History', 'Lesson', 'hist', md5('hist'), 'history', 'div1');
insert into login (first_name, last_name, username, password, department, division) 
  values ('Science', 'Leader', 'sci', md5('fic'), 'div2', 'div2');
insert into login (first_name, last_name, username, password, department, division) 
  values ('ICS', 'Pro', 'ics', md5('ics'), 'ics', 'div2');
insert into login (first_name, last_name, username, password, department, division) 
  values ('CENT', 'Pro', 'cent', md5('password'), 'cent', 'div2');
insert into login (first_name, last_name, username, password, department, division) 
  values ('Super', 'Planet', 'astro', md5('astro'), 'astr', 'div2');
