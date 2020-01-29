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


-- git stuff
MAX-Student@DESKTOP-BU97D2V MINGW64 /c/repos
$ mkdir sql-tutorial

MAX-Student@DESKTOP-BU97D2V MINGW64 /c/repos
$ cd sql
SQL_Day2      sql-tutorial/

MAX-Student@DESKTOP-BU97D2V MINGW64 /c/repos
$ cd sql-tutorial/

MAX-Student@DESKTOP-BU97D2V MINGW64 /c/repos/sql-tutorial
$ get init
bash: get: command not found

MAX-Student@DESKTOP-BU97D2V MINGW64 /c/repos/sql-tutorial
$ git init
Initialized empty Git repository in C:/repos/sql-tutorial/.git/

MAX-Student@DESKTOP-BU97D2V MINGW64 /c/repos/sql-tutorial (master)
$ ls
my-first-sql-scripts.sql

MAX-Student@DESKTOP-BU97D2V MINGW64 /c/repos/sql-tutorial (master)
$ git status
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        my-first-sql-scripts.sql

nothing added to commit but untracked files present (use "git add" to track)

MAX-Student@DESKTOP-BU97D2V MINGW64 /c/repos/sql-tutorial (master)
$ cat my-first-sql-scripts.sql
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
MAX-Student@DESKTOP-BU97D2V MINGW64 /c/repos/sql-tutorial (master)
$ git add .

MAX-Student@DESKTOP-BU97D2V MINGW64 /c/repos/sql-tutorial (master)
$ git status
On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
        new file:   my-first-sql-scripts.sql


MAX-Student@DESKTOP-BU97D2V MINGW64 /c/repos/sql-tutorial (master)
$ git commit -m "Initial Commit"
[master (root-commit) 7002df4] Initial Commit
 1 file changed, 27 insertions(+)
 create mode 100644 my-first-sql-scripts.sql

MAX-Student@DESKTOP-BU97D2V MINGW64 /c/repos/sql-tutorial (master)
$ git status
On branch master
nothing to commit, working tree clean

MAX-Student@DESKTOP-BU97D2V MINGW64 /c/repos/sql-tutorial (master)
$ git remote add origin https://github.com/tlchan668/sql-tutorial.git

MAX-Student@DESKTOP-BU97D2V MINGW64 /c/repos/sql-tutorial (master)
$ git remote -v
origin  https://github.com/tlchan668/sql-tutorial.git (fetch)
origin  https://github.com/tlchan668/sql-tutorial.git (push)

MAX-Student@DESKTOP-BU97D2V MINGW64 /c/repos/sql-tutorial (master)
$ git log
commit 7002df496f905303291b987cb1761474b8490349 (HEAD -> master)
Author: Traci Chan <tlc668@gmail.com>
Date:   Wed Jan 29 14:49:22 2020 -0500

    Initial Commit

MAX-Student@DESKTOP-BU97D2V MINGW64 /c/repos/sql-tutorial (master)
$ ^C

MAX-Student@DESKTOP-BU97D2V MINGW64 /c/repos/sql-tutorial (master)
$ git status
On branch master
nothing to commit, working tree clean

MAX-Student@DESKTOP-BU97D2V MINGW64 /c/repos/sql-tutorial (master)
$ git push origin master
Enumerating objects: 3, done.
Counting objects: 100% (3/3), done.
Delta compression using up to 4 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 541 bytes | 541.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To https://github.com/tlchan668/sql-tutorial.git
 * [new branch]      master -> master
 --look back at github and refresh should see work
MAX-Student@DESKTOP-BU97D2V MINGW64 /c/repos/sql-tutorial (master)
