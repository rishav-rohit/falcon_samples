SET hive.exec.dynamic.partition=true;
SET hive.exec.dynamic.partition.mode=nonstrict;

INSERT OVERWRITE TABLE ${falcon_output_database}.${falcon_output_table} PARTITION (${falcon_output_partitions_hive})
SELECT "${falcon_input1_table}" as tbl_name, count(*) as cnt from ${falcon_input1_database}.${falcon_input1_table} where ${falcon_input1_filter}
UNION ALL
select "${falcon_input2_table}" as tbl_name, count(*) as cnt from ${falcon_input2_database}.${falcon_input2_table} where ${falcon_input2_filter}
;