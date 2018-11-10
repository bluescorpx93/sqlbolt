-- Find the number of Artists in the studio (without a HAVING clause)
SELECT COUNT(role) FROM employees WHERE role='Artist';

-- Find the number of Employees of each role in the studio
SELECT role, COUNT(role) FROM employees GROUP BY role;

-- Find the total number of years employed by all Engineers
SELECT SUM(years_employed) FROM employees WHERE role="Engineer";