Create Database student;
use student;
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gpa DECIMAL(3,2),
    enrollment_date DATETIME,
    major VARCHAR(100)
);

INSERT INTO students (student_id, first_name, last_name, gpa, enrollment_date, major) VALUES
(201, 'Shivansh', 'Mahajan', 8.79, '2021-09-01 09:30:00', 'Computer Science'),
(202, 'Umesh', 'Sharma', 8.44, '2021-09-01 08:30:00', 'Mathematics'),
(203, 'Rakesh', 'Kumar', 5.60, '2021-09-01 10:00:00', 'Biology'),
(204, 'Radha', 'Sharma', 9.20, '2021-09-01 12:45:00', 'Chemistry'),
(205, 'Kush', 'Kumar', 7.85, '2021-09-01 08:30:00', 'Physics'),
(206, 'Prem', 'Chopra', 9.56, '2021-09-01 09:24:00', 'History'),
(207, 'Pankaj', 'Vats', 9.78, '2021-09-01 02:30:00', 'English'),
(208, 'Navleen', 'Kaur', 7.00, '2021-09-01 06:30:00', 'Mathematics');

CREATE TABLE programs (
    student_ref_id INT,
    program_name VARCHAR(100),
    program_start_date DATETIME,
    FOREIGN KEY (student_ref_id) REFERENCES students(student_id)
);

INSERT INTO programs (student_ref_id, program_name, program_start_date) VALUES
(201, 'Computer Science', '2021-09-01 00:00:00'),
(202, 'Mathematics', '2021-09-01 00:00:00'),
(208, 'Mathematics', '2021-09-01 00:00:00'),
(205, 'Physics', '2021-09-01 00:00:00'),
(204, 'Chemistry', '2021-09-01 00:00:00'),
(207, 'Psychology', '2021-09-01 00:00:00'),
(206, 'History', '2021-09-01 00:00:00'),
(203, 'Biology', '2021-09-01 00:00:00');

CREATE TABLE scholarships (
    student_ref_id INT,
    scholarship_amount INT,
    scholarship_date DATETIME,
    FOREIGN KEY (student_ref_id) REFERENCES students(student_id)
);

INSERT INTO scholarships (student_ref_id, scholarship_amount, scholarship_date) VALUES
(201, 5000, '2021-10-15 00:00:00'),
(202, 4500, '2022-08-18 00:00:00'),
(203, 3000, '2022-01-25 00:00:00'),
(204, 4000, '2021-10-15 00:00:00');

select upper(FIRST_NAME) as SUTDENT_NAME FROM Students;

select distinct major from students;

select substring(FIRST_NAME, 1,3) from students;

select instr(lower(FIRST_NAME),'a') from students where FIRST_NAME='Shivansh';

select distinct major, LENGTH(MAJOR) from students;


SELECT * FROM Students order by FIRST_NAME, MAJOR DESC;

SELECT * FROM Students WHERE FIRST_NAME NOT IN ('Prem', 'Shivansh');

SELECT * FROM Students WHERE FIRST_NAME NOT IN ('Prem','Shivansh');

SELECT * FROM Students WHERE FIRST_NAME LIKE'%a';

SELECT * FROM Students WHERE FIRST_NAME LIKE'_a';

SELECT * FROM Students WHERE GPA BETWEEN 9.00 AND 9.99;

SELECT MAJOR,COUNT(*)AS TOTAL_COUNT FROM Students WHERE MAJOR='Computer Science';
 
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS FULL_NAME FROM Students WHERE GPA BETWEEN 8.5 AND 9.5;

SELECT MAJOR, COUNT(MAJOR) FROM Students group by MAJOR order by COUNT(MAJOR) DESC;

SELECT 
      Students.FIRST_NAME,
      Students.LAST_NAME,
      Scholarships.SCHOLARSHIP_AMOUNT,
      Scholarships.SCHOLARSHIP_DATE
FROM
     Students
INNER JOIN
Scholarships ON Students.STUDENT_ID=Scholarships.STUDENT_REF_ID;

SELECT * FROM Students WHERE Student_id % 2 !=0;

SELECT * FROM Students WHERE student_id % 2=0;

SELECT Students.FIRST_NAME,Students.LAST_NAME,
Scholarships.SCHOLARSHIP_AMOUNT, 
Scholarships.SCHOLARSHIP_DATE FROM Students LEFT JOIN
Scholarships ON Students.STUDENT_ID=
Scholarships.STUDENT_REF_ID;

SELECT * FROM Students ORDER BY GPA DESC LIMIT 5;

SELECT * FROM Students ORDER BY GPA DESC LIMIT 4,1;

SELECT * FROM Students s1
WHERE 4=
(SELECT COUNT(DISTINCT (s2.GPA))
FROM Students s2
WHERE s2.GPA>=s1.GPA
);

SELECT s1.*FROM Students s1,Students s2 WHERE s1.GPA=s2.GPA AND s1.Student_id !=s2.Student_id;
 
 SELECT MAX(GPA) FROM Students WHERE GPA NOT IN (SELECT MAX(GPA) FROM Students);
 
SELECT * FROM Students 
UNION ALL
SELECT * FROM  Students ORDER BY STUDENT_ID; 
 
 SELECT STUDENT_ID FROM Students
 WHERE STUDENT_ID NOT IN(SELECT STUDENT_REF_ID FROM Scholarships);
 
 SELECT * FROM Students
LIMIT (SELECT FLOOR(COUNT(*)/2) FROM Students);
 
SELECT MAJOR, COUNT(MAJOR) AS MAJOR_COUNT FROM Students GROUP BY MAJOR HAVING COUNT(MAJOR)<4;

SELECT MAJOR, COUNT(MAJOR) AS ALL_MAJOR FROM Students GROUP BY MAJOR;

SELECT * FROM Students WHERE STUDENT_ID=(SELECT MAX(STUDENT_ID) FROM Students);

SELECT * FROM Students WHERE STUDENT_ID=(SELECT MIN(STUDENT_ID) FROM Students);

SELECT * 
FROM (
SELECT *
FROM Students
ORDER BY STUDENT_ID DESC
LIMIT 5)
AS subquery
ORDER BY STUDENT_ID;

SELECT DISTINCT GPA FROM Students S1
WHERE 3>=(SELECT COUNT(DISTINCT GPA) FROM Students S2 WHERE S1.GPA<=S2.GPA)
ORDER BY S1.GPA DESC;

SELECT DISTINCT GPA FROM Students S1
WHERE 3>=(SELECT COUNT(DISTINCT GPA) FROM Students S2 WHERE S1.GPA>=S2.GPA)
ORDER BY S1.GPA;

SELECT DISTINCT GPA FROM Students S1
WHERE 2 =(SELECT COUNT(DISTINCT GPA) FROM Students S2 WHERE S1.GPA<=S2.GPA)
ORDER BY S1.GPA DESC;

SELECT MAJOR, MAX(GPA) AS MAXGPA FROM Students GROUP BY MAJOR;


SELECT FIRST_NAME, GPA FROM Students WHERE GPA =(SELECT MAX(GPA) FROM Students);

SELECT CURDATE(); 
SELECT NOW();

CREATE TABLE CloneTable AS SELECT * FROM Students;

UPDATE Students SET GPA = 7.5 WHERE MAJOR = 'Computer Science'; 

SELECT MAJOR,AVG(GPA) AS AVERAGE_GPA FROM Students GROUP BY MAJOR;

SELECT * FROM Students ORDER BY GPA DESC LIMIT 3;

SELECT MAJOR,COUNT(STUDENT_ID) AS HIGH_GPA_COUNT FROM Students WHERE GPA>7.5 GROUP BY MAJOR;

SELECT * FROM Students WHERE GPA = (SELECT GPA FROM Students WHERE STUDENT_ID=201);