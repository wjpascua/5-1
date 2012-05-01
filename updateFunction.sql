/*
create or replace function updateSurvey(
*/
drop sequence if exists survey_id_seq cascade;
create sequence survey_id_seq;
drop sequence if exists question_id_seq cascade;
create sequence question_id_seq;
drop sequence if exists result_id_seq cascade;
create sequence result_id_seq;

drop table if exists surveys cascade;
create table surveys(
   id integer not null default nextval('survey_id_seq'),
   survey_name text,
   primary key (id)
);
drop table if exists questions cascade;
create table questions(
   id integer not null default nextval('question_id_seq'),
   survey_id integer references surveys(id),
   q_text text,
   primary key (id)
);
drop table if exists results cascade;
create table results(
   id integer not null default nextval('result_id_seq'),
   question_id integer references questions(id),
   num_1 integer default 0,
   num_2 integer default 0,
   num_3 integer default 0,
   num_4 integer default 0,
   num_5 integer default 0,
   primary key (id)
);

drop view if exists survey_questions_view;
create view survey_questions_view as
   select surveys.id as sid, questions.id as qid, questions.q_text from
   surveys inner join questions on surveys.id=questions.survey_id;
   
create or replace function addQuestion(_sid integer, _qtext text)
   returns boolean as
   $func$
      declare
         v_sid integer;
      begin
         insert into questions (survey_id, q_text) values
            (_sid, _qtext);
         v_sid := currval('question_id_seq');
         insert into results (question_id) values (v_sid);
         return 't';
       end;
      $func$
      language 'plpgsql';
      
drop view if exists survey_results_view;
create view survey_results_view as
   select surveys.id as sid, questions.id as quid,
   questions.q_text, results.id as rid, results.num_1,
   results.num_2, results.num_3, results.num_4,
   results.num_5 from
   surveys inner join questions on surveys.id=questions.survey_id
   inner join results on questions.id=results.question_id;


create or replace function updateResult( _qid integer, _val integer)
   returns boolean as
   $func$

   declare
     rec record;
begin
   select into rec * from results where question_id=_qid;
   if _val = 1 then
      update results set num_1 = rec.num_1 + 1 where id=rec.id;
   elseif _val = 2 then
      update results set num_2 = rec.num_2 + 1 where id=rec.id;
   elseif _val = 3 then
      update results set num_3 = rec.num_3 + 1 where id=rec.id;
   elseif _val = 4 then
      update results set num_4 = rec.num_4 + 1 where id=rec.id;
   elseif _val = 5 then
      update results set num_5 = rec.num_5 + 1 where id=rec.id;
      end if;
      return 't';
   end;
$func$
language 'plpgsql';

insert into surveys (survey_name) values ('survey1');
insert into surveys (survey_name) values ('survey2');

select addQuestion(1,
   'How would you rate the food at this campus?');
select addQuestion(1,
   'How would you rate the parking at this campus?');
select addQuestion(1,
   'How would you rate the security at this campus?');
select addQuestion(1,
   'How would you rate the education value at this campus?');
select addQuestion(2,
   'How would you rate the education value at this campus?');
select * from survey_questions_view where sid=1;
select * from survey_questions_view where sid=2;
select * from results where question_id = 1;
select * from survey_results_view where sid=1;
select updateResult(1,1);
select updateResult(1,5);
select quid, num_1, num_2, num_3, num_4, num_5
   from survey_results_view where sid=1;
