SELECT 
    CASE WHEN A + B <= C THEN 'Not A Triangle'
    WHEN B + C <= A THEN 'Not A Triangle'
    WHEN A + C <= B THEN 'Not A Triangle'
    WHEN A = B AND B = C THEN 'Equilateral'
    WHEN A = B and B <> C THEN 'Isosceles'
    WHEN B = C and A <> B THEN 'Isosceles'
    WHEN A = C and B <> A THEN 'Isosceles'
    WHEN A <> B AND B <> C then 'Scalene'
END AS is_triangle
FROM triangles
