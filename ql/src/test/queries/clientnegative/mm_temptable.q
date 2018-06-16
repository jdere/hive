--! qt:dataset:src

set hive.support.concurrency=true;
set hive.txn.manager=org.apache.hadoop.hive.ql.lockmgr.DbTxnManager;

drop table if exists mm_temptable;

CREATE TEMPORARY TABLE mm_temptable (key string, value string) TBLPROPERTIES ('transactional'='true', 'transactional_properties'='insert_only');

insert into table mm_temptable select * from src;

