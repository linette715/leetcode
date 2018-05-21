# Write your MySQL query statement below

SELECT
    Department.Name AS Department,
    tmp.Employee,
    tmp.Salary
FROM (
    SELECT
        Name AS Employee,
        Salary,
        DepartmentId,
        @rank:= 
            CASE WHEN @department = DepartmentId
                  AND @emp_salary = Salary
                 THEN @rank
                 WHEN @department = DepartmentId
                 THEN @rank + 1
                 ELSE 1
            END AS row_num,
        @department:= DepartmentId AS department_id,
        @emp_salary:= Salary AS emp_salary
    FROM Employee
    , (SELECT @rank:=0) AS rank
    , (SELECT @department:=NULL) AS d
    ORDER BY DepartmentId, Salary DESC
) tmp
INNER JOIN Department ON Department.Id = tmp.DepartmentId
WHERE row_num <= 3