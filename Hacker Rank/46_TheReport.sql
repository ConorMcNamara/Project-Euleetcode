SELECT 
    CASE WHEN grades.grade > 7 THEN students.name ELSE NULL END,
    grade, 
    marks
FROM 
    students
JOIN 
    grades
ON 
    students.marks BETWEEN min_mark AND max_mark
ORDER BY
    grade DESC, 
    name ASC, 
    marks ASC
