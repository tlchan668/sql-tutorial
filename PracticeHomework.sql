select * from class;
select * from major;
select * from MajorClassRel;

--all classes required for accounting major
--get it to return the majorid of accounting =2
select * from major m
	where m.Description = 'accounting';
--pull the class id from that major id
select * from MajorClassRel mcr
	join Major m
		on mcr.majorid = m.id
		where m.description = 'accounting');
select * from major	m
	join MajorClassRel mcr
		on mcr.majorid=m.id
	join class c
		on c.id = mcr.classid
	where m.Description = 'accounting';

--i was trying with class first so get it to work that way
select * from class c
	join MajorClassRel mcr
		on mcr.ClassId = c.id
	join major m
		on mcr.MajorId = m.id
	where m.Description = 'accounting'
		on m.id = 
	
/*Task 2
finding out which insturctor teaches the least classes
*/

select i.Lastname as 'Instruct',count(*) as 'class'
from Instructor i
	join class c
		on c.InstructorId = i.Id
	group by i.Lastname
	order by class;
	

/*Task 3
write a query to tell brian what majors he can take with his SAT score
*/
--query to get brian's SAT score
select *--student.sat as 'SAT' 
	from student s
	where s.lastname = 'biggs';
--query to get classes with lower than 950 sat
select * from major m
	where m.MinSAT <=950;

--put together
select * from major m
	where m.MinSAT <= (
	select s.sat  
	from student s
	where s.lastname = 'biggs');

--more practice
--what classes do not have an instuctor
select * from class c
	where c.InstructorId is null;

--get gpas of 3.0 or better
select * from student s
where s.gpa>=3.0
order by s.sat desc;

select * from class
select * from StudentClassRel
select * from student
select * from instructor

--find out what classes ephrma is taking
select student.id
	from Student	
	where  lastname = 'ephram'
---give classes ephrma is taking 
select c.id, c.subject, c.section
	from class c
	join StudentClassRel scr
	on c.id=scr.ClassId
	join student s
	on s.Id = scr.StudentId
	where scr.StudentId =100; 

select c.id, c.subject, c.section, i.lastname
	from class c
	join StudentClassRel scr
	on c.id=scr.ClassId
	join student s
	on s.Id = scr.StudentId
	join instructor i 
	on i.id=c.InstructorId
	/*where scr.StudentId = (select s.id from student s */where s.Lastname = 'ephram';


/*more practice with insert*/
select * from Instructor
select * from class
select * from assignment

insert into assignment(id,description, classid)
	values (1,'assignment 1', 10101),
			(2,'assignment 2', 10101),
			(3,'assignment 3', 10101),
			(4,'assign 1', 10102),
			(5,'assign 2', 10102);

--shows all assignments with english 101
select * from assignment a
	where a.classid = 10101
update Assignment
	set classid = 10102
	where id=5;--Description = 'assign ';