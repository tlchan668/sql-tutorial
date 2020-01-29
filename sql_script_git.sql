select * --id,concat(firstname,' ',lastname) as 'Full Name',gpa,sat 
from student
where gpa < 3.0
order by SAT desc;

select * from student;
select * from major;
--inner join  doesn't show null for min sat required
select student.id, concat(firstname, ' ', lastname) as 'Full Name', gpa, sat, 
	Description as 'Major', MinSAT as 'min SAT required' 
	from Student 
	join Major
		on major.Id = Student.MajorId;

--outerjoin shows all even null fields
select student.id, concat(firstname, ' ', lastname) as 'Full Name', gpa, sat, 
	Description as 'Major', MinSAT as 'min SAT required' 
	from Student 
	left join Major
		on major.Id = Student.MajorId;
--outerjoin takes values of null and rename
select student.id, concat(firstname, ' ', lastname) as 'Full Name', gpa, sat, 
	isnull(Description, 'Undecided') as 'Major', 
	isnull(MinSAT, '') as 'min SAT required' 
	from Student 
	left join Major
		on major.Id = Student.MajorId;
--regurlar join view class insturctor table sort by last name of instructor
select  concat(firstname,' ', lastname) as 'Instructor', YearsExperience, 
		class.id as 'Course Code', 
		concat(subject, ' ', section) as 'class'
	from Instructor 
	join class 
	on Instructor.id = class.InstructorId
	order by instructor.Lastname;

--make an alias for tables
select  concat(firstname,' ', lastname) as 'Instructor', YearsExperience, 
		c.id as 'Course Code', 
		concat(subject, ' ', section) as 'class'
	from Instructor i
	join class c
	on i.id = c.InstructorId
	order by i.Lastname; 

---only want tenured on this list
select  concat(firstname,' ', lastname) as 'Instructor', YearsExperience, 
		c.id as 'Course Code', i.istenured,
		concat(subject, ' ', section) as 'class'
	from Instructor i
	join class c
	on i.id = c.InstructorId
	where i.IsTenured=1
	order by i.Lastname; 

---only want not tenured on this list using not
select  concat(firstname,' ', lastname) as 'Instructor', YearsExperience, 
		c.id as 'Course Code', i.istenured,
		concat(subject, ' ', section) as 'class'
	from Instructor i
	join class c
	on i.id = c.InstructorId
	where not i.IsTenured=1
	order by i.Lastname; 

--is tenured > 3 & is tenured < 7 would be 4, 5, 6
--istenures <3 & istenured > 7  can't be
--istenured >3| is tenured < 7  is all numbers
--age !=5 | age !=7 all numbers   if wanted all numbers but 5 and 7 would write age != 5 & age != 7S

fun
