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
