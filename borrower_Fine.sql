Problem Statement :
Create the University Database having following specifications:
1.Department table(dept_no,dept_name,building_name)
Apply Unique constraint on name field
mysql> create database University;
Query OK, 1 row affected (0.00 sec)
mysql> use University;
Database changed
mysql> create table Department(dept_no int,dept_name varchar(15),bldg_name
varchar(15),unique(dept_name));
Query OK, 0 rows affected (0.08 sec)
mysql> desc Department;
+-----------+-------------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| dept_no | int(11) | YES | | NULL | |
| dept_name | varchar(15) | YES | UNI | NULL | |
| bldg_name | varchar(15) | YES | | NULL | |
+-----------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)
2.Instructor table(ins_id,ins_name,dept_no,salary,mob_no)
Apply NOT NULL constraint on name field.
mysql> create table instructor(ins_id int,ins_name varchar(15) not null,dept_no int,salary
int,mob_no int,primary key(ins_id));
Query OK, 0 rows affected (0.08 sec)
mysql> desc instructor;
+----------+-------------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |+----------+-------------+------+-----+---------+-------+
| ins_id | int(11) | NO | PRI | 0 | |
| ins_name | varchar(15) | NO | | NULL | |
| dept_no | int(11) | YES | | NULL | |
| salary | int(11) | YES | | NULL | |
| mob_no | int(11) | YES | | NULL | |
+----------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)
3.Course table(course_id,title,dept_no,credits)
mysql> create table course(course_id int,title varchar(15),dept_no int,credits int,primary
key(course_id));
Query OK, 0 rows affected (0.06 sec)
mysql> desc course;
+-----------+-------------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| course_id | int(11) | NO | PRI | 0 | |
| title | varchar(15) | YES | | NULL | |
| dept_no | int(11) | YES | | NULL | |
| credits | int(11) | YES | | NULL | |
+-----------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)
4.Teachers table(teacher_id,course_id,semester,year)
mysql> create table teachers(teacher_id int,course_id int,semester int, year year,foreign key
(teacher_id) references
instructor(ins_id),foreign key (course_id) references course(course_id));
Query OK, 0 rows affected (0.08 sec)
mysql> desc teachers;
+------------+---------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+------------+---------+------+-----+---------+-------+
| teacher_id | int(11) | YES | MUL | NULL | |
| course_id | int(11) | YES | MUL | NULL | |
| semester | int(11) | YES | | NULL | |
| year | year(4) | YES | | NULL | |
+------------+---------+------+-----+---------+-------+
4 rows in set (0.00 sec)Quieries :
1.Add the primary key in department table.
mysql> alter table Department add primary key(dept_no);
Query OK, 0 rows affected (0.09 sec)
Records: 0 Duplicates: 0 Warnings: 0
mysql> desc Department;
+-----------+-------------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| dept_no | int(11) | NO | PRI | 0 | |
| dept_name | varchar(15) | YES | UNI | NULL | |
| bldg_name | varchar(15) | YES | | NULL | |
+-----------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)
2.Add the foreign key in instructor table.
mysql> alter table instructor add foreign key(dept_no) references Department(dept_no);
Query OK, 0 rows affected (0.13 sec)
Records: 0 Duplicates: 0 Warnings: 0
mysql> desc instructor;
+----------+-------------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| ins_id | int(11) | NO | PRI | 0 | |
| ins_name | varchar(15) | NO | | NULL | |
| dept_no | int(11) | YES | MUL | NULL | |
| salary | int(11) | YES | | NULL | |
| mob_no | int(11) | YES | | NULL | |
+----------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)
3.Modify the table department by addding a column budget.
mysql> alter table Department add column budget int;
Query OK, 0 rows affected (0.11 sec)
Records: 0 Duplicates: 0 Warnings: 0
4.Create unique index on mobile number of instructor table.mysql> create unique index sr on instructor(mob_no);
Query OK, 0 rows affected (0.09 sec)
Records: 0 Duplicates: 0 Warnings: 0
mysql> desc instructor;
+----------+-------------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| ins_id | int(11) | NO | PRI | 0 | |
| ins_name | varchar(15) | NO | | NULL | |
| dept_no | int(11) | YES | MUL | NULL | |
| salary | int(11) | YES | | NULL | |
| mob_no | int(11) | YES | UNI | NULL | |
+----------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)
5.Create a view of instructor relation except the salary field.
mysql> create view inst_view as select ins_id,ins_name,dept_no,mob_no from instructor;
Query OK, 0 rows affected (0.03 sec)
6.Insert record into instructor table using newly created viewname.
mysql> insert into Department values(4,"Elect","D",null);
Query OK, 1 row affected (0.02 sec)
mysql> insert into inst_view values(4,"D",4,12000);
Query OK, 1 row affected (0.03 sec)
mysql> select * from inst_view;
+--------+----------+---------+--------+
| ins_id | ins_name | dept_no | mob_no |
+--------+----------+---------+--------+
| 4 | D | 4 | 12000 |
+--------+----------+---------+--------+
1 row in set (0.00 sec)
8.Delete record of particular instructor from instructor table using newly created viewname.
mysql> delete from inst_view where ins_id=4;
Query OK, 1 row affected (0.03 sec)
mysql> select * from inst_view;Empty set (0.00 sec)
10.Remove the Budget from department table.
mysql> alter table Department drop budget;
Query OK, 1 row affected (0.14 sec)
Records: 1 Duplicates: 0 Warnings: 0
11.increase the size of the title field of course relation.
mysql> alter table course modify title varchar(20);
Query OK, 0 rows affected (0.08 sec)
Records: 0 Duplicates: 0 Warnings: 0
12.Create a view by showing a instructor name with a department name and its salary.
mysql> create view newview1 as select ins_name,dept_name,salary from instructor,Department
where
instructor.dept_no=Department.dept_no;
Query OK, 0 rows affected (0.03 sec)
13.Update salary of particular instructor using update view.
mysql> update newview1 set salary=11000 where ins_name="C";
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0 Changed: 0 Warnings: 0
14.Delete the index from the instructor table.
mysql> alter table instructor drop index sr;
Query OK, 0 rows affected (0.06 sec)
Records: 0 Duplicates: 0 Warnings: 0
17.Delete the primary key from the department table.
mysql> alter table instructor drop foreign key instructor_ibfk_1;
Query OK, 0 rows affected (0.11 sec)
Records: 0 Duplicates: 0 Warnings: 0
mysql> alter table Department drop primary key;
Query OK, 1 row affected (0.11 sec)
Records: 1 Duplicates: 0 Warning