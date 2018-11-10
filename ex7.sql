-- Find the list of all buildings that have employees
SELECT building_name FROM employees LEFT OUTER JOIN buildings ON employees.building = buildings.building_name WHERE employees.building IS NOT NULL GROUP BY buildings.building_name;

-- Find the list of all buildings and their capacity
SELECT * FROM buildings;

-- List all buildings and the distinct employee roles in each building (including empty buildings)
SELECT DISTINCT role, building_name FROM buildings LEFT OUTER JOIN employees ON buildings.building_name = employees.building;