# Write your MySQL query statement below

SELECT
    Trips.Request_at AS Day,
    ROUND(COUNT(CASE WHEN Trips.Status IN ('cancelled_by_driver', 'cancelled_by_client') THEN 1 END) *1.0/COUNT(*), 2) AS "Cancellation Rate"
FROM Trips
INNER JOIN Users clients
ON Trips.Client_Id = clients.Users_Id
INNER JOIN Users drivers
ON Trips.Driver_Id = drivers.Users_Id
WHERE drivers.Banned = "No" AND clients.Banned = "No" AND Trips.Request_at BETWEEN DATE("2013-10-01") AND DATE("2013-10-03")
GROUP BY 1
ORDER BY 1