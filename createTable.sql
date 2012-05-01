drop sequence if exists results_id_seq cascade;
create sequence results_id_seq;
drop table if exists results cascade;
create table results(
  id integer not null default nextval('results_id_seq'),
  question_id int,
  num1 int,
  num2 int,
  num3 int,
  num4 int,
  num5 int,
  primary key (id)
);

insert into results (question_id, num1, num2, num3, num4, num5)
  values (1, 1, 2, 3, 4, 5);
insert into results (question_id, num1, num2, num3, num4, num5)
  values (2, 1, 2, 3, 4, 5);
insert into results (question_id, num1, num2, num3, num4, num5)
  values (3, 1, 2, 3, 4, 5);
insert into results (question_id, num1, num2, num3, num4, num5)
  values (4, 1, 2, 3, 4, 5);
insert into results (question_id, num1, num2, num3, num4, num5)
  values (5, 1, 2, 3, 4, 5);

drop sequence if exists answer_choice_seq cascade;
create sequence answer_choice_seq;
drop table if exists addAnswerChoice cascade;
create table addAnswerChoice(
  id integer not null default nextval('answer_choice_seq'),
  survey_id int,
  question_id int,
  choice1 text,
  choice2 text,
  choice3 text,
  choice4 text,
  choice5 text,
  primary key(id)
);

drop table if exists user_surveys cascade;
create table user_surveys(
  survey_id integer references surveys(id),
  user_id  integer references login(id)
);

insert into user_surveys (survey_id, user_id) values
  (1, 1);
insert into user_surveys (survey_id, user_id) values
  (2, 2);
insert into user_surveys (survey_id, user_id) values
  (2, 3);

create or replace view user_survey_view as select login.id as uid, login.division, login.username, login.department, surveys.id as sid, surveys.survey_name from login inner join user_surveys on login.id=user_surveys.user_id inner join surveys on surveys.id=user_surveys.survey_id; 

select * from user_survey_view where division='div1';
select * from user_survey_view where department='math';
select * from user_survey_view where department='english';

