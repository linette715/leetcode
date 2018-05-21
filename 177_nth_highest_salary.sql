CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      SELECT Salary
      FROM (
          SELECT
            Salary,
            @rank:=
                CASE WHEN Salary = @prev_salary
                     THEN @rank
                     ELSE @rank + 1
                END AS rk,
            @prev_salary:= Salary
          FROM Employee,
          (SELECT @rank:=0) AS rank,
          (SELECT @prev_salary:=0) AS prev_salary
          ORDER BY Salary DESC
      ) AS tmp
      WHERE rk = N
      LIMIT 1
  );
END