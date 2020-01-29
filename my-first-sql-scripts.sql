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