# Write your MySQL query statement below

SELECT id, date, people
FROM (
    SELECT
        id,
        date,
        people,
        @seq:=
        CASE WHEN @seq >=3 AND people>=100
             THEN 3
             ELSE ct
        END AS indicator
    FROM (
        SELECT
            s1.id,
            s1.date,
            s1.people,
            COUNT(CASE WHEN s1.people >= 100 AND s2.people >=100 THEN 1 END) AS ct
        FROM stadium s1
        INNER JOIN stadium s2
                ON s2.id - s1.id < 3
               AND s2.id - s1.id >= 0
        GROUP BY 1,2,3
    ) AS tmp, (SELECT @seq:=0) AS seq
) tmp2
WHERE indicator >= 3