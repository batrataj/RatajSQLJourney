CREATE TABLE personal_info (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    major VARCHAR(100),
    future_major VARCHAR(100)
);

INSERT INTO personal_info VALUES 
(1, 'رتاج فرحان العنزي', 20, 'علوم بيانات', 'علوم بيانات وذكاء اصطناعي');

SELECT * FROM personal_info;

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    platform VARCHAR(50)
);

INSERT INTO courses VALUES
(1, 'SQL101', 'منصة سطر'),
(2, 'SQL102', 'منصة سطر'),
(3, 'SQL103', 'منصة سطر');

SELECT * FROM courses;

CREATE TABLE skills (
    skill_id INT PRIMARY KEY,
    course_id INT,
    skill_name VARCHAR(100),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO skills VALUES
(1, 1, 'SELECT و WHERE'),
(2, 2, 'JOIN و GROUP BY'),
(3, 3, 'Subquery و View');

SELECT c.course_name, s.skill_name
FROM courses c
JOIN skills s ON c.course_id = s.course_id;

CREATE TABLE future_goals (
    goal_id INT PRIMARY KEY,
    age_goal INT,
    dream_job VARCHAR(100),
    location VARCHAR(100),
    degree_goal VARCHAR(100)
);

INSERT INTO future_goals VALUES
(1, 26, 'عالمة بيانات', 'نيوم', 'ماجستير علوم بيانات وذكاء اصطناعي');

CREATE VIEW my_dreams AS
SELECT name, future_major, fg.age_goal, fg.dream_job, fg.location
FROM personal_info p
JOIN future_goals fg ON p.id = 1;

SELECT * FROM my_dreams;

SELECT name, age,
CASE 
    WHEN age < 25 THEN 'طالبة'
    ELSE 'موظفة'
END AS current_status
FROM personal_info;
