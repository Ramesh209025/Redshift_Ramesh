-- see current table locks
select s.schema, l.lock_owner_pid, s.table from svv_table_info s, stv_locks l where l.table_id = s.table_id;

-- see current queries
select * from stv_recents where status = 'Running';

-- kill process
select pg_terminate_backend(pid);

-- table size on disk
select pg_size_pretty(pg_relation_size(relid)) from pg_stat_user_tables where relname = 'table_name';


-- command line, dump table
pg_dump -h hostname -p port -d dbname -U username -s (schema only) -t tablename




## General Stuff

### List of all tables
SELECT * FROM pg_catalog.pg_tables

### Create new user and give it superuser access
create user adminuser createuser password '1234Admin';
alter user adminuser createuser;

### Create user without superuser privilege
select md5('password' || 'username'); -- Generate the md5 for the password
create user user1 password 'md537af65b44378ac7a5a1fb187a1969c71'; -- Use the generated md5 as password

### Grant all to specific user
GRANT SELECT ON ALL TABLES IN SCHEMA public TO user;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO user;

### Drop User
drop user danny;

### Revoke database access from a user
revoke all on database dwtable from dwuser;

### Change user password
alter user newuser password 'EXAMPLENewPassword11'; 

### Automatically gives access when new table is created
ALTER DEFAULT PRIVILEGES GRANT SELECT ON TABLES TO PUBLIC
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO PUBLIC
