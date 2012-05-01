drop language if exists 'plpgsql' cascade;
create language 'plpgsql';
create or replace function getID(_user text, _pass text)
    returns integer as
    $func$
        declare
            rec record;
        begin
            select into rec * from login where username=_user;
            if not found then
                return -1;
            else
                if md5(_pass) = rec.password then
                    return rec.id;
                else
                    return -1;
                end if;
            end if;
        end;
    $func$
    language 'plpgsql';

select getID('lib','art');
select getID('math', 'mat'); -- should fail
select getID('eng', 'words');
