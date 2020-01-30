--1/30/20
--students enroll in many classes
--many to many relationship
select *
	from student s 
	join StudentClassRel sc
		on s.id = sc.StudentId
--shows two classes eric enrolled it

--shows two classes but and subject and can add instructor name by joining insturctor table 
--want to eliminate some fields (ie keys) but need to join class table
select *
	from student s 
	join StudentClassRel sc
		on s.id = sc.StudentId
	join Class c
		on sc.ClassId = c.id

--include instructor this is erics class schedule
select *
	from student s 
	join StudentClassRel sc
		on s.id = sc.StudentId
	join Class c
		on sc.ClassId = c.id
	join Instructor i
		on i.id=c.InstructorId

--elminate columns don't need
select s.id as 'Student id', concat(s.firstname, ' ', s.Lastname) as 'Name',
		c.id as 'Course Number', concat(c.subject, ' ', c.Section) as 'Class',
		concat(i.firstname, ' ', i.Lastname) as 'Instructor'
	from student s 
	join StudentClassRel sc
		on s.id = sc.StudentId
	join Class c
		on sc.ClassId = c.id
	join Instructor i
		on i.id=c.InstructorId
--add erics major to display need to join major table has 5 tables
select s.id as 'Student id', concat(s.firstname, ' ', s.Lastname) as 'Name',
		c.id as 'Course Number', concat(c.subject, ' ', c.Section) as 'Class',
		concat(i.firstname, ' ', i.Lastname) as 'Instructor', m.Description as 'Major'--get this from major table what major is
	from student s 
	join StudentClassRel sc
		on s.id = sc.StudentId
	join Class c
		on sc.ClassId = c.id
	join Instructor i
		on i.id=c.InstructorId
	join Major m
		on m.Id = s.MajorId

select * from major




