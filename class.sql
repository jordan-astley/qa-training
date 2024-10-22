CREATE DATABASE classdb;
USE classdb;

CREATE TABLE courses (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
course_name VARCHAR(255) NOT NULL,
teacher VARCHAR(255)
);

CREATE TABLE students (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
student_name VARCHAR(255) NOT NULL,
date_of_birth DATE NOT NULL
);

CREATE TABLE marks (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
student_id INT NOT NULL,
course_id INT NOT NULL,
marks TINYINT UNSIGNED,
FOREIGN KEY (student_id)
	REFERENCES students(id),
FOREIGN KEY (course_id)
	REFERENCES courses(id)
);

ALTER TABLE courses
MODIFY COLUMN teacher VARCHAR(255);

INSERT INTO courses (course_name, teacher) VALUES
("MySQL 101", "Courage");

INSERT INTO students (date_of_birth, student_name) VALUES
("2000-07-18", "SAM");

SHOW TABLES;

SELECT * FROM students;

INSERT INTO marks (student_id, course_id, marks) VALUES
(1, 1, 96);

SELECT * FROM students JOIN marks ON students.id = marks.student_id;
