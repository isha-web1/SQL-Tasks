
-- create table for students
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(255) NOT NULL,
    age INT,
    email VARCHAR(255) UNIQUE,
    frontend_mark INT,
    backend_mark INT,
    status VARCHAR(50)
);


-- create table for courses
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL,
    credits INT
);
-- create table for enrollment
CREATE TABLE enrollment (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- insert data into students table
INSERT INTO students (student_id, student_name, age, email, frontend_mark, backend_mark, status)
VALUES
    (1, 'Sameer', 21, 'sameer@example.com', 48, 60, NULL),
    (2, 'Zoya', 23, 'zoya@example.com', 52, 58, NULL),
    (3, 'Nabil', 22, 'nabil@example.com', 37, 46, NULL),
    (4, 'Rafi', 24, 'rafi@example.com', 41, 40, NULL),
    (5, 'Sophia', 22, 'sophia@example.com', 50, 52, NULL),
    (6, 'Hasan', 23, 'hasan@gmail.com', 43, 39, NULL);

-- insert data into courses table
INSERT INTO courses (course_id, course_name, credits)
VALUES
    (1, 'Next.js', 3),
    (2, 'React.js', 4),
    (3, 'Databases', 3),
    (4, 'Prisma', 3);

-- insert data into enrollment table
    INSERT INTO enrollment (enrollment_id, student_id, course_id)
VALUES
    (1, 1, 1),
    (2, 1, 2),
    (3, 2, 1),
    (4, 3, 2);

-- Insert a new student record with the following details:
INSERT INTO students (student_id, student_name, age, email, frontend_mark, backend_mark, status)
VALUES (1, 'John Doe', 20, 'john.doe@example.com', 85, 90, NULL);


-- Query to find students enrolled in the 'Next.js' course
-- This query retrieves the names of students who are enrolled in the 'Next.js' course.
SELECT s.student_name
FROM students s
JOIN enrollment e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE c.course_name = 'Next.js';

-- Query to find the student with the highest total marks (frontend + backend)
UPDATE students
SET status = 'Awarded'
WHERE student_id = (
    SELECT student_id
    FROM students
    ORDER BY (frontend_mark + backend_mark) DESC
    LIMIT 1
);

-- Query to delete courses that have no students enrolled
-- This query removes courses from the courses table that do not have any students enrolled in them.
DELETE FROM courses
WHERE course_id NOT IN (
    SELECT course_id
    FROM enrollment
);


-- Query to select the first two students from the students table
-- This query retrieves the names of the first two students based on their student_id.
SELECT student_name
FROM students
ORDER BY student_id
LIMIT 2 OFFSET 2;


-- Query to count the number of students enrolled in each course
-- This query counts the number of students enrolled in each course and groups the results by course name
SELECT c.course_name, COUNT(e.student_id) AS students_enrolled
FROM courses c
LEFT JOIN enrollment e ON c.course_id = e.course_id
GROUP BY c.course_name
HAVING COUNT(e.student_id) > 0;


-- Query to calculate the average age of students
-- This query calculates the average age of all students in the students table.
SELECT ROUND(AVG(age), 2) AS average_age
FROM students;


-- Query to find students with a specific email domain
-- This query retrieves the names of students whose email addresses end with 'example.com'.
SELECT student_name
FROM students
WHERE email LIKE '%example.com';