-- DROP SCHEMA dbo;
CREATE DATABASE FCI
CREATE SCHEMA dbo;
-- FCI.dbo.course_price definition

-- Drop table

-- DROP TABLE FCI.dbo.course_price;

CREATE TABLE course_price (
	name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	price bigint NOT NULL,
	CONSTRAINT PK__course_p__72E12F1A8786DC79 PRIMARY KEY (name)
);
ALTER TABLE FCI.dbo.course_price WITH NOCHECK ADD CONSTRAINT CK__course_pr__price__33D4B598 CHECK ([price]>(0));


-- FCI.dbo.department_floor definition

-- Drop table

-- DROP TABLE FCI.dbo.department_floor;

CREATE TABLE department_floor (
	name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	floor bigint NOT NULL,
	CONSTRAINT PK__departme__72E12F1ABEAF5C9A PRIMARY KEY (name)
);


-- FCI.dbo.instructor_salary definition

-- Drop table

-- DROP TABLE FCI.dbo.instructor_salary;

CREATE TABLE instructor_salary (
	salary bigint NOT NULL,
	working_hours bigint NOT NULL,
	CONSTRAINT PK__instruct__E87C0D70E56DA82A PRIMARY KEY (working_hours)
);


-- FCI.dbo.[role] definition

-- Drop table

-- DROP TABLE FCI.dbo.[role];

CREATE TABLE [role] (
	instructor_id bigint NOT NULL,
	[role] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT PK__role__298C84FC98F792F1 PRIMARY KEY (instructor_id,[role])
);


-- FCI.dbo.student definition

-- Drop table

-- DROP TABLE FCI.dbo.student;

CREATE TABLE student (
	student_id bigint NOT NULL,
	f_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	m_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	l_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Dob varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	gender varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	nationality varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	national_number bigint NOT NULL,
	address varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	email varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	educational_mail varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	major varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[level] bigint NOT NULL,
	phone bigint NOT NULL,
	department_code varchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK__student__2A33069A3980ED59 PRIMARY KEY (student_id),
	CONSTRAINT UQ__student__23C03C8483FA93E8 UNIQUE (educational_mail),
	CONSTRAINT UQ__student__4449273A04C26FE3 UNIQUE (national_number),
	CONSTRAINT UQ__student__AB6E616472D00B58 UNIQUE (email),
	CONSTRAINT UQ__student__B43B145FE63160A0 UNIQUE (phone)
);
CREATE UNIQUE NONCLUSTERED INDEX UQ__student__23C03C8483FA93E8 ON FCI.dbo.student (educational_mail);
CREATE UNIQUE NONCLUSTERED INDEX UQ__student__4449273A04C26FE3 ON FCI.dbo.student (national_number);
CREATE UNIQUE NONCLUSTERED INDEX UQ__student__AB6E616472D00B58 ON FCI.dbo.student (email);
CREATE UNIQUE NONCLUSTERED INDEX UQ__student__B43B145FE63160A0 ON FCI.dbo.student (phone);


-- FCI.dbo.course definition

-- Drop table

-- DROP TABLE FCI.dbo.course;

CREATE TABLE course (
	code varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	credit_hours bigint NOT NULL,
	start_end_date varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	semester varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	description varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	compulsory_elective varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	prerequisite varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	lecture_code bigint NOT NULL,
	department_code varchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK__course__357D4CF8321BF895 PRIMARY KEY (code),
	CONSTRAINT UQ__course__0C0F3956E8B1A37C UNIQUE (lecture_code)
);
CREATE UNIQUE NONCLUSTERED INDEX UQ__course__0C0F3956E8B1A37C ON FCI.dbo.course (lecture_code);


-- FCI.dbo.department definition

-- Drop table

-- DROP TABLE FCI.dbo.department;

CREATE TABLE department (
	code varchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	instructor_id bigint NOT NULL,
	CONSTRAINT PK__departme__357D4CF8D36738D7 PRIMARY KEY (code)
);


-- FCI.dbo.instructor definition

-- Drop table

-- DROP TABLE FCI.dbo.instructor;

CREATE TABLE instructor (
	f_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	address varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	nationality varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	id bigint NOT NULL,
	join_date varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	national_number bigint NOT NULL,
	phone_number bigint NOT NULL,
	marital_status varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	salary bigint NOT NULL,
	job_title varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	working_hours bigint NOT NULL,
	attendance bigint NOT NULL,
	date_of_birth varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	department_code varchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	email varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	m_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	l_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT PK__instruct__3213E83FA5793A91 PRIMARY KEY (id),
	CONSTRAINT UQ__instruct__4449273A3DF0EE05 UNIQUE (national_number),
	CONSTRAINT UQ__instruct__A1936A6B0187A3D6 UNIQUE (phone_number),
	CONSTRAINT UQ__instruct__AB6E6164A136319B UNIQUE (email)
);
CREATE UNIQUE NONCLUSTERED INDEX UQ__instruct__4449273A3DF0EE05 ON FCI.dbo.instructor (national_number);
CREATE UNIQUE NONCLUSTERED INDEX UQ__instruct__A1936A6B0187A3D6 ON FCI.dbo.instructor (phone_number);
CREATE UNIQUE NONCLUSTERED INDEX UQ__instruct__AB6E6164A136319B ON FCI.dbo.instructor (email);


-- FCI.dbo.lab definition

-- Drop table

-- DROP TABLE FCI.dbo.lab;

CREATE TABLE lab (
	[time] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	id bigint NOT NULL,
	[number] bigint NOT NULL,
	course_code varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	instructor_id bigint NOT NULL,
	CONSTRAINT PK__lab__3213E83F8CC2BBB5 PRIMARY KEY (id)
);


-- FCI.dbo.lecture definition

-- Drop table

-- DROP TABLE FCI.dbo.lecture;

CREATE TABLE lecture (
	time_ varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	code bigint NOT NULL,
	classroom_id bigint NOT NULL,
	classroom_floor bigint NOT NULL,
	instructor_id bigint NOT NULL,
	CONSTRAINT PK__lecture__357D4CF82AFAC02D PRIMARY KEY (code)
);


-- FCI.dbo.student_course definition

-- Drop table

-- DROP TABLE FCI.dbo.student_course;

CREATE TABLE student_course (
	student_id bigint NOT NULL,
	course_code varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	grade varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT PK__student___3085B2C52854BD8E PRIMARY KEY (student_id,course_code)
);


-- FCI.dbo.student_lab definition

-- Drop table

-- DROP TABLE FCI.dbo.student_lab;

CREATE TABLE student_lab (
	student_id bigint NOT NULL,
	lab_id bigint NOT NULL,
	CONSTRAINT PK__student___8C5EE0D75CB437CA PRIMARY KEY (student_id,lab_id)
);


-- FCI.dbo.student_lecture definition

-- Drop table

-- DROP TABLE FCI.dbo.student_lecture;

CREATE TABLE student_lecture (
	student_id bigint NOT NULL,
	code bigint NOT NULL,
	CONSTRAINT PK__student___B964D2557619C425 PRIMARY KEY (student_id,code)
);


-- FCI.dbo.course foreign keys

ALTER TABLE FCI.dbo.course ADD CONSTRAINT FK__course__departme__5165187F FOREIGN KEY (department_code) REFERENCES department(code);
ALTER TABLE FCI.dbo.course ADD CONSTRAINT FK__course__lecture___52593CB8 FOREIGN KEY (lecture_code) REFERENCES lecture(code);


-- FCI.dbo.department foreign keys

ALTER TABLE FCI.dbo.department ADD CONSTRAINT FK__departmen__instr__4D94879B FOREIGN KEY (instructor_id) REFERENCES instructor(id);
ALTER TABLE FCI.dbo.department ADD CONSTRAINT FK__department__name__4CA06362 FOREIGN KEY (name) REFERENCES department_floor(name);


-- FCI.dbo.instructor foreign keys

ALTER TABLE FCI.dbo.instructor ADD CONSTRAINT FK__instructo__depar__4E88ABD4 FOREIGN KEY (department_code) REFERENCES department(code);
ALTER TABLE FCI.dbo.instructor ADD CONSTRAINT FK__instructo__worki__4F7CD00D FOREIGN KEY (working_hours) REFERENCES instructor_salary(working_hours);


-- FCI.dbo.lab foreign keys

ALTER TABLE FCI.dbo.lab ADD CONSTRAINT FK__lab__course_code__4AB81AF0 FOREIGN KEY (course_code) REFERENCES course(code);
ALTER TABLE FCI.dbo.lab ADD CONSTRAINT FK__lab__instructor___440B1D61 FOREIGN KEY (instructor_id) REFERENCES instructor(id);
ALTER TABLE FCI.dbo.lab ADD CONSTRAINT FK__lab__instructor___4BAC3F29 FOREIGN KEY (instructor_id) REFERENCES instructor(id);
ALTER TABLE FCI.dbo.lab ADD CONSTRAINT FK__lab__instructor___5441852A FOREIGN KEY (instructor_id) REFERENCES instructor(id);


-- FCI.dbo.lecture foreign keys

ALTER TABLE FCI.dbo.lecture ADD CONSTRAINT FK__lecture__instruc__5070F446 FOREIGN KEY (instructor_id) REFERENCES instructor(id);


-- FCI.dbo.student_course foreign keys

ALTER TABLE FCI.dbo.student_course ADD CONSTRAINT FK__student_c__cours__47DBAE45 FOREIGN KEY (course_code) REFERENCES course(code);
ALTER TABLE FCI.dbo.student_course ADD CONSTRAINT FK__student_c__stude__46E78A0C FOREIGN KEY (student_id) REFERENCES student(student_id);


-- FCI.dbo.student_lab foreign keys

ALTER TABLE FCI.dbo.student_lab ADD CONSTRAINT FK__student_l__lab_i__49C3F6B7 FOREIGN KEY (lab_id) REFERENCES lab(id);
ALTER TABLE FCI.dbo.student_lab ADD CONSTRAINT FK__student_l__stude__48CFD27E FOREIGN KEY (student_id) REFERENCES student(student_id);


-- FCI.dbo.student_lecture foreign keys

ALTER TABLE FCI.dbo.student_lecture ADD CONSTRAINT FK__student_l__stude__44FF419A FOREIGN KEY (student_id) REFERENCES student(student_id);
ALTER TABLE FCI.dbo.student_lecture ADD CONSTRAINT FK__student_le__code__45F365D3 FOREIGN KEY (code) REFERENCES lecture(code);


---------------------------
INSERT INTO FCI.dbo.course (code,name,credit_hours,start_end_date,semester,description,compulsory_elective,prerequisite,lecture_code,department_code) VALUES
	 (N'cs_101',N'bigintroduction to computer science',3,N'20\9-20\1',N'wbiginter',N'bigintroduction to computer science',N'R',N'',500600,N'CS'),
	 (N'is_101',N'bigintroduction to information system',3,N'20\9-20\1',N'wbiginter',N'bigintroduction to information system',N'R',N'',500700,N'IS'),
	 (N'it_101',N'bigintroduction to information technology',3,N'20\9-20\1',N'wbiginter',N'bigintroduction to information technology',N'R',N'',500800,N'IT');INSERT INTO FCI.dbo.course_price (name,price) VALUES
	 (N'cs',2500),
	 (N'is',2000),
	 (N'it',1500);INSERT INTO FCI.dbo.department (code,name,instructor_id) VALUES
	 (N'CS',N'Computer Science',8040502),
	 (N'IS',N'Information System',8040501),
	 (N'IT',N'Information Technology',8040500);INSERT INTO FCI.dbo.department_floor (name,floor) VALUES
	 (N'Computer Science',2),
	 (N'Information System',4),
	 (N'Information Technology',3);INSERT INTO FCI.dbo.instructor (f_name,address,nationality,id,join_date,national_number,phone_number,marital_status,salary,job_title,working_hours,attendance,date_of_birth,department_code,email,m_name,l_name) VALUES
	 (N'Mohamed',N'Minya',N'Egyptian',8040500,N'11/5/2009',306265852,1016678,N'married',4000,N'Professor',8,0,N'10/11/1965',N'IT',N'MohammedAli@gmail.com',N'Ali',N'Said'),
	 (N'Eman',N'Minya',N'Egyptian',8040501,N'11/5/2010',336243852,1116678,N'married',4000,N'Professor',8,0,N'10/11/1970',N'IS',N'EmanYounes@gmail.com',N'Younes',N'Mohammed'),
	 (N'Mina',N'Minya',N'Egyptian',8040502,N'20/8/2011',301243112,1245678,N'single',4000,N'Professor',8,0,N'10/11/1988',N'CS',N'mina.yonan@gmail.com',N'Younan',N'Emad'),
	 (N'Mohamed',N'Minya',N'Egyptian',8040510,N'11/5/2020',30627765852,101655678,N'single',3000,N'Teacher assistant',6,0,N'10/11/1992',N'IS',N'Mohammedahmed@gmail.com',N'Ahmed',N'mohsen'),
	 (N'Mostafa',N'Minya',N'Egyptian',8040512,N'11/5/2020',3062774565854,101789655678,N'single',3000,N'Teacher assistant',6,0,N'02/11/1993',N'CS',N'Mohammedadam@gmail.com',N'Adam',N'mohsen'),
	 (N'Youssef',N'Minya',N'Egyptian',8040520,N'11/6/2021',301215652154,1207179257,N'married',4000,N'professor',8,0,N'12/11/1991',N'CS',N'youssef.gamal55@gmail.com',N'gamal',N'Mina');INSERT INTO FCI.dbo.instructor_salary (salary,working_hours) VALUES
	 (3000,6),
	 (4000,8);INSERT INTO FCI.dbo.lab ([time],id,[number],course_code,instructor_id) VALUES
	 (N'monday 12',702,1,N'cs_101',8040510),
	 (N'monday 2',707,1,N'is_101',8040512);INSERT INTO FCI.dbo.lecture (time_,code,classroom_id,classroom_floor,instructor_id) VALUES
	 (N'sunday-10',500600,501,2,8040502),
	 (N'saturday-10',500700,502,4,8040500),
	 (N'monday-9',500800,502,3,8040501);INSERT INTO FCI.dbo.[role] (instructor_id,[role]) VALUES
	 (8040500,N'IT HOD'),
	 (8040501,N'IS HOD'),
	 (8040502,N'CS HOD');INSERT INTO FCI.dbo.student (student_id,f_name,m_name,l_name,Dob,gender,nationality,national_number,address,email,educational_mail,major,[level],phone,department_code) VALUES
	 (7000900,N'Ahmed',N'Magdy',N'Mohamed',N'12-1-2000',N'M',N'Egyptian',12345698,N'Minya',N'Ahmed@gmail.com',N'Ahmed123@edumail.com',N'',1,198561,N''),
	 (7500800,N'Youssef',N'Magdy',N'Ali',N'4\2\2001',N'M',N'Egyptian',82345698,N'Minya',N'Youssef@gmail.com',N'youssef123@edumail.com',N'computer science',3,798561,N'CS');INSERT INTO FCI.dbo.student_course (student_id,course_code,grade) VALUES
	 (7000900,N'it_101',N'C'),
	 (7500800,N'cs_101',N'A');INSERT INTO FCI.dbo.student_lab (student_id,lab_id) VALUES
	 (7000900,702),
	 (7500800,702);INSERT INTO FCI.dbo.student_lecture (student_id,code) VALUES
	 (7000900,500600),
	 (7500800,500600);
