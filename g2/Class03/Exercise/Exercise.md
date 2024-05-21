Creating tables:

1. Create a Students table with the following columns:
    - StudentID INT (Primary Key)
    - FirstName VARCHAR(50)
    - LastName VARCHAR(50)
    - Email VARCHAR(100) (UNIQUE)
    - EnrollmentDate DATE (DEFAULT current date)

2. Create the Enrollments table with the following columns:
    - EnrollmentID INT (Primary Key)
    - StudentID INT (Foreign Key references StudentID from the Students table)
    - CourseName VARCHAR(100)
    - Grade CHAR(1) (CHECK value must be 'A', 'B', 'C', 'D' or 'F')

3. Create the Courses table with the following columns:
    - CourseID INT (Primary Key)
    - CourseName VARCHAR(100)
    - CourseCredits INT

4. Entering data into the Students table
5. Entering data into the Enrollments table
6. Entering data into the Courses table

7. Find all unique courses students are taking, using the CourseName column.
8. Find all courses students are taking, including duplicates.
9. Find common courses between those students are taking and those available in the Courses table.
10. Create combinations of each student with each course.
11. Find all students and their courses, including students who may not be enrolled in any courses.
12. Find all students whose name starts with 'M'.
13. Find all courses students are taking that have more than 3 credits.

14. BONUS - Find all courses and students enrolled in those courses, including courses where no students may be enrolled.
