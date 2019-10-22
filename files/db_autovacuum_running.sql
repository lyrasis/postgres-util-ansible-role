/*
* Displays the databases in which autovacuum is running and for how long
* https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Appendix.PostgreSQL.CommonDBATasks.html#Appendix.PostgreSQL.CommonDBATasks.Autovacuum.AutovacuumRunning
*/
SELECT datname, usename, pid, waiting, current_timestamp - xact_start AS xact_runtime, query
FROM pg_stat_activity
WHERE upper(query) LIKE '%VACUUM%'
ORDER BY xact_start;
