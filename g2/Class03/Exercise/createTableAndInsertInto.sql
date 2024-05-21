-- Create table Students
CREATE TABLE Students (
    StudentID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    EnrollmentDate DATE DEFAULT GETDATE()
);



-- Create table Enrollments
CREATE TABLE Enrollments (
    EnrollmentID INT IDENTITY(1,1) PRIMARY KEY,
    StudentID INT,
    CourseName VARCHAR(100),
    Grade CHAR(1),
    CONSTRAINT FK_Student FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    CONSTRAINT CHK_Grade CHECK (Grade IN ('A', 'B', 'C', 'D', 'F'))
);

-- Create table Courses
CREATE TABLE Courses (
    CourseID INT IDENTITY(1,1) PRIMARY KEY,
    CourseName VARCHAR(100),
    CourseCredits INT
);



-- Insert Students
INSERT INTO Students (FirstName, LastName, Email)
VALUES ('Marko', 'Markovski', 'marko@example.com'),
       ('Ana', 'Anova', 'ana@example.com');

-- Insert Enrollments
INSERT INTO Enrollments (StudentID, CourseName, Grade)
VALUES (1, 'Mathematics', 'A'),
       (1, 'History', 'B'),
       (2, 'Biology', 'C');

-- Insert Courses
INSERT INTO Courses (CourseName, CourseCredits)
VALUES ('Mathematics', 3),
       ('History', 4),
       ('Biology', 3),
       ('Chemistry', 4);

