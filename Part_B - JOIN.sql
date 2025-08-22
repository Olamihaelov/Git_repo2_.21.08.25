JOIN Queries:

  1
SELECT t.first_name, t.last_name, c.country_name
FROM tourists t
INNER JOIN countries c ON c.id = t.country_id;

  2
SELECT t.first_name, t.last_name, tr.*
FROM tourists t
INNER JOIN tours tr ON tr.id = t.tour_id;

  3
SELECT t.first_name, t.last_name, tr.*
FROM tourists t
left JOIN tours tr ON tr.id = t.tour_id;
