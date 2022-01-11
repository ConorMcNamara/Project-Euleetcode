CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  set N=N-1;
  RETURN (
      SELECT DISTINCT(salary) as salary
      FROM employee
      ORDER BY salary DESC
      LIMIT 1 offset N
  );
END

--Alternatively
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      WITH salary_rank AS (
                          SELECT salary,
                          dense_rank() OVER (order by salary DESC) as rank_sal
                          FROM employee
      )
      SELECT salary
      FROM salary_rank
      WHERE rank_sal = N
      LIMIT 1
  );
END
