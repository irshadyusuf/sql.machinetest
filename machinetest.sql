1.CREATE TABLE
machinetest=# \dt
           List of relations
 Schema |   Name    | Type  |  Owner
--------+-----------+-------+----------
 public | tbl_stock | table | postgres
(1 row)


machinetest=# select * from tbl_stock;
 pk_int_stock_id | vchr_name | int_quantity | int_price
-----------------+-----------+--------------+-----------
(0 rows)

2.machinetest=# alter table tbl_stock alter column int_price type float;
ALTER TABLE


3.machinetest=# create table tbl_supplier(pk_int_supplier_id serial primary key,vchr_supplier_name varchar(50));
CREATE TABLE
machinetest=# \d tbl_supplier;
                                                 Table "public.tbl_supplier"
       Column       |         Type          | Collation | Nullable |                         Default
--------------------+-----------------------+-----------+----------+----------------------------------------------------------
 pk_int_supplier_id | integer               |           | not null | nextval('tbl_supplier_pk_int_supplier_id_seq'::regclass)
 vchr_supplier_name | character varying(50) |           |          |
Indexes:
    "tbl_supplier_pkey" PRIMARY KEY, btree (pk_int_supplier_id)



4.machinetest=# alter table tbl_stock add column fk_int_supplier int;
ALTER TABLE
machinetest=# \d tbl_stock;
                                              Table "public.tbl_stock"
     Column      |         Type          | Collation | Nullable |                      Default
-----------------+-----------------------+-----------+----------+----------------------------------------------------
 pk_int_stock_id | integer               |           | not null | nextval('tbl_stock_pk_int_stock_id_seq'::regclass)
 vchr_name       | character varying(50) |           |          |
 int_quantity    | integer               |           |          |
 int_price       | double precision      |           |          |
 fk_int_supplier | integer               |           |          |
Indexes:
    "tbl_stock_pkey" PRIMARY KEY, btree (pk_int_stock_id)



ALTER TABLE
5.machinetest=# \d tbl_stock;
                                              Table "public.tbl_stock"
     Column      |         Type          | Collation | Nullable |                      Default
-----------------+-----------------------+-----------+----------+----------------------------------------------------
 pk_int_stock_id | integer               |           | not null | nextval('tbl_stock_pk_int_stock_id_seq'::regclass)
 vchr_name       | character varying(50) |           |          |
 int_quantity    | integer               |           |          |
 int_price       | double precision      |           |          |
 fk_int_supplier | integer               |           |          |
Indexes:
    "tbl_stock_pkey" PRIMARY KEY, btree (pk_int_stock_id)
Foreign-key constraints:
    "tbl_stock_fk_int_supplier_fkey" FOREIGN KEY (fk_int_supplier) REFERENCES tbl_supplier(pk_int_supplier_id)

6.machinetest=# create table tbl_dpt (pk_int_dpt_id serial primary key,vchr_dept_name varchar(50));
CREATE TABLE
machinetest=# \d tbl_dpt;
                                             Table "public.tbl_dpt"
     Column     |         Type          | Collation | Nullable |                    Default
----------------+-----------------------+-----------+----------+------------------------------------------------
 pk_int_dpt_id  | integer               |           | not null | nextval('tbl_dpt_pk_int_dpt_id_seq'::regclass)
 vchr_dept_name | character varying(50) |           |          |
Indexes:
    "tbl_dpt_pkey" PRIMARY KEY, btree (pk_int_dpt_id)

7.machinetest=# create table tbl_classes (pk_int_class_id serial primary key,vchr_class_name varchar(50),fk_int_dpt_id int,foreign key(fk_int_dpt_id) references tbl_dpt(pk_int_dpt_id));
CREATE TABLE
machinetest=# \d tbl_classes
                                              Table "public.tbl_classes"
     Column      |         Type          | Collation | Nullable |                       Default
-----------------+-----------------------+-----------+----------+------------------------------------------------------
 pk_int_class_id | integer               |           | not null | nextval('tbl_classes_pk_int_class_id_seq'::regclass)
 vchr_class_name | character varying(50) |           |          |
 fk_int_dpt_id   | integer               |           |          |
Indexes:
    "tbl_classes_pkey" PRIMARY KEY, btree (pk_int_class_id)
Foreign-key constraints:
    "tbl_classes_fk_int_dpt_id_fkey" FOREIGN KEY (fk_int_dpt_id) REFERENCES tbl_dpt(pk_int_dpt_id)

8.machinetest=# create table tbl_enrollment (pk_int_enrollment_id serial primary key,int_count int,fk_int_class_id int,foreign key(fk_int_class_id) references tbl_classes(pk_int_class_id));
CREATE TABLE
machinetest=# \d tbl_enrollment
                                            Table "public.tbl_enrollment"
        Column        |  Type   | Collation | Nullable |                           Default
----------------------+---------+-----------+----------+--------------------------------------------------------------
 pk_int_enrollment_id | integer |           | not null | nextval('tbl_enrollment_pk_int_enrollment_id_seq'::regclass)
 int_count            | integer |           |          |
 fk_int_class_id      | integer |           |          |
Indexes:
    "tbl_enrollment_pkey" PRIMARY KEY, btree (pk_int_enrollment_id)
Foreign-key constraints:
    "tbl_enrollment_fk_int_class_id_fkey" FOREIGN KEY (fk_int_class_id) REFERENCES tbl_classes(pk_int_class_id)

9.machinetest=# alter table tbl_classes add unique (vchr_class_name);
ALTER TABLE
machinetest=# \d tbl_classes
                                              Table "public.tbl_classes"
     Column      |         Type          | Collation | Nullable |                       Default
-----------------+-----------------------+-----------+----------+------------------------------------------------------
 pk_int_class_id | integer               |           | not null | nextval('tbl_classes_pk_int_class_id_seq'::regclass)
 vchr_class_name | character varying(50) |           |          |
 fk_int_dpt_id   | integer               |           |          |
Indexes:
    "tbl_classes_pkey" PRIMARY KEY, btree (pk_int_class_id)
    "tbl_classes_vchr_class_name_key" UNIQUE CONSTRAINT, btree (vchr_class_name)
Foreign-key constraints:
    "tbl_classes_fk_int_dpt_id_fkey" FOREIGN KEY (fk_int_dpt_id) REFERENCES tbl_dpt(pk_int_dpt_id)
Referenced by:
    TABLE "tbl_enrollment" CONSTRAINT "tbl_enrollment_fk_int_class_id_fkey" FOREIGN KEY (fk_int_class_id) REFERENCES tbl_classes(pk_int_class_id)

10.machinetest=# alter table tbl_dpt add column vchr_dpth_description varchar(100);
ALTER TABLE
machinetest=# \d tbl_dpt
                                                 Table "public.tbl_dpt"
        Column         |          Type          | Collation | Nullable |                    Default
-----------------------+------------------------+-----------+----------+------------------------------------------------
 pk_int_dpt_id         | integer                |           | not null | nextval('tbl_dpt_pk_int_dpt_id_seq'::regclass)
 vchr_dept_name        | character varying(50)  |           |          |
 vchr_dpth_description | character varying(100) |           |          |
Indexes:
    "tbl_dpt_pkey" PRIMARY KEY, btree (pk_int_dpt_id)
Referenced by:
    TABLE "tbl_classes" CONSTRAINT "tbl_classes_fk_int_dpt_id_fkey" FOREIGN KEY (fk_int_dpt_id) REFERENCES tbl_dpt(pk_int_dpt_id)

11.machinetest=# insert into tbl_supplier (vchr_supplier_name) values ('logitech');
INSERT 0 1
machinetest=# insert into tbl_supplier (vchr_supplier_name) values ('samsung');
INSERT 0 1
machinetest=# insert into tbl_supplier (vchr_supplier_name) values ('iball');
INSERT 0 1
machinetest=# insert into tbl_supplier (vchr_supplier_name) values ('lg');
INSERT 0 1
machinetest=# insert into tbl_supplier (vchr_supplier_name) values ('creative');
INSERT 0 1
machinetest=# select * from tbl_supplier;
 pk_int_supplier_id | vchr_supplier_name
--------------------+--------------------
                  1 | logitech
                  2 | samsung
                  3 | iball
                  4 | lg
                  5 | creative
(5 rows)

-- machintest SQL2

1.machinetest=# insert into tbl_stock (vchr_name,int_quantity,int_price,fk_int_supplier) values ('mouse','10','500','1');
INSERT 0 1
machinetest=# insert into tbl_stock (vchr_name,int_quantity,int_price,fk_int_supplier) values ('keybord','5','450','3');
INSERT 0 1
machinetest=# insert into tbl_stock (vchr_name,int_quantity,int_price,fk_int_supplier) values ('modem','10','1200','2');
INSERT 0 1
machinetest=# insert into tbl_stock (vchr_name,int_quantity,int_price,fk_int_supplier) values ('memmory','100','1500','5');
INSERT 0 1
machinetest=# insert into tbl_stock (vchr_name,int_quantity,int_price,fk_int_supplier) values ('headphone','50','750','4');
INSERT 0 1
machinetest=# insert into tbl_stock (vchr_name,int_quantity,int_price,fk_int_supplier) values ('memmory','2','3500','4');
INSERT 0 1
machinetest=# select * from tbl_stock;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               1 | mouse     |           10 |       500 |               1
               2 | keybord   |            5 |       450 |               3
               3 | modem     |           10 |      1200 |               2
               4 | memmory   |          100 |      1500 |               5
               5 | headphone |           50 |       750 |               4
               6 | memmory   |            2 |      3500 |               4
(6 rows)

2.machinetest=# update tbl_stock set int_price = 501.5 where pk_int_stock_id = 1;
UPDATE 1
machinetest=# update tbl_stock set int_price = 451.5 where pk_int_stock_id = 2;
UPDATE 1
machinetest=# update tbl_stock set int_price = 1201.5 where pk_int_stock_id = 3;
UPDATE 1
machinetest=# update tbl_stock set int_price = 1501.5 where pk_int_stock_id = 4;
UPDATE 1
machinetest=# update tbl_stock set int_price = 751.5 where pk_int_stock_id = 5;
UPDATE 1
machinetest=# update tbl_stock set int_price = 3501.5 where pk_int_stock_id = 6;
UPDATE 1
machinetest=# select * from tbl_stock;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               1 | mouse     |           10 |     501.5 |               1
               2 | keybord   |            5 |     451.5 |               3
               3 | modem     |           10 |    1201.5 |               2
               4 | memmory   |          100 |    1501.5 |               5
               5 | headphone |           50 |     751.5 |               4
               6 | memmory   |            2 |    3501.5 |               4
(6 rows)


3.machinetest=# select * from tbl_stock where int_price > 1000;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               3 | modem     |           10 |    1201.5 |               2
               4 | memmory   |          100 |    1501.5 |               5
               6 | memmory   |            2 |    3501.5 |               4
(3 rows)

4.machinetest=# select * from tbl_stock order by vchr_name;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               5 | headphone |           50 |     751.5 |               4
               2 | keybord   |            5 |     451.5 |               3
               4 | memmory   |          100 |    1501.5 |               5
               6 | memmory   |            2 |    3501.5 |               4
               3 | modem     |           10 |    1201.5 |               2
               1 | mouse     |           10 |     501.5 |               1
(6 rows)

5.machinetest=# select * from tbl_stock order by vchr_name limit 3;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               5 | headphone |           50 |     751.5 |               4
               2 | keybord   |            5 |     451.5 |               3
               4 | memmory   |          100 |    1501.5 |               5
(3 rows)

6.machinetest=# select * from tbl_stock order by vchr_name desc limit 3;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               1 | mouse     |           10 |     501.5 |               1
               3 | modem     |           10 |    1201.5 |               2
               4 | memmory   |          100 |    1501.5 |               5
(3 rows)

7.machinetest=# select vchr_name,int_quantity,int_price,int_quantity*int_price as extended_price from tbl_stock;
 vchr_name | int_quantity | int_price | extended_price
-----------+--------------+-----------+----------------
 mouse     |           10 |     501.5 |           5015
 keybord   |            5 |     451.5 |         2257.5
 modem     |           10 |    1201.5 |          12015
 headphone |           50 |     751.5 |          37575
 memmory   |            2 |    3501.5 |           7003
(5 rows)


8.machinetest=# delete from tbl_stock where fk_int_supplier =5;
DELETE 1
machinetest=# select * from tbl_stock;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               1 | mouse     |           10 |     501.5 |               1
               2 | keybord   |            5 |     451.5 |               3
               3 | modem     |           10 |    1201.5 |               2
               5 | headphone |           50 |     751.5 |               4
               6 | memmory   |            2 |    3501.5 |               4
(5 rows)

9.machinetest=# insert into tbl_dpt (vchr_dept_name,vchr_dpth_description) values ('computer sceience','cs');
INSERT 0 1
machinetest=# insert into tbl_dpt (vchr_dept_name,vchr_dpth_description) values ('electronics','ec');
INSERT 0 1
machinetest=# insert into tbl_dpt (vchr_dept_name,vchr_dpth_description) values ('commerce','cc');
INSERT 0 1
machinetest=# insert into tbl_dpt (vchr_dept_name,vchr_dpth_description) values ('arts','ar');
INSERT 0 1
machinetest=# select * from tbl_dpt;
 pk_int_dpt_id |  vchr_dept_name   | vchr_dpth_description
---------------+-------------------+-----------------------
             1 | computer sceience | cs
             2 | electronics       | ec
             3 | commerce          | cc
             4 | arts              | ar
(4 rows)


-- MACHINETEST SQL.3
1.machinetest=# select sum (int_quantity*int_price) from tbl_stock;
   sum
---------
 63865.5
(1 row)

2.machinetest=# select sum (int_quantity) from tbl_stock;
 sum
-----
  77
(1 row)

3.machinetest=# select upper(vchr_name),round(int_price) from tbl_stock;
   upper   | round
-----------+-------
 MOUSE     |   502
 KEYBORD   |   452
 MODEM     |  1202
 HEADPHONE |   752
 MEMMORY   |  3502
(5 rows)

4.machinetest=# select count (vchr_name)as items from tbl_stock;
 items
-------
     5
(1 row)

5.machinetest=# select max (int_price) from tbl_stock;
  max
--------
 3501.5
(1 row)
machinetest=# select vchr_name,int_price from tbl_stock where int_price > 1500;
 vchr_name | int_price
-----------+-----------
 memmory   |    3501.5
(1 row)


6.machinetest=# select sum(int_count)as total_enrollment from tbl_enrollment;
 total_enrollment
------------------
              351
(1 row)

(1 row)

7.machinetest=# select count(*)as no_of_classes from tbl_classes;
 no_of_classes
---------------
             7
(1 row)


8.machinetest=# select * from tbl_stock;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               1 | mouse     |           10 |     501.5 |               1
               2 | keybord   |            5 |     451.5 |               3
               3 | modem     |           10 |    1201.5 |               2
               5 | headphone |           50 |     751.5 |               4
               6 | memmory   |            2 |    3501.5 |               4
(5 rows)


9.machinetest=# select concat(vchr_name,int_price) as product_price from tbl_stock;
 product_price
----------------
 mouse501.5
 keybord451.5
 modem1201.5
 headphone751.5
 memmory3501.5
(5 rows)





