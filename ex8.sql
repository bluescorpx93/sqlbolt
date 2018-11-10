-- Find the name and role of all employees who have not been assigned to a building

SELECT name, role FROM employees OUTER LEFT JOIN buildings ON employees.building = buildings.building_name WHERE building IS null

-- Find the names of the buildings that hold no employees
SELECT building_name FROM buildings OUTER LEFT JOIN employees ON buildings.building_name = employees.building WHERE employees.building IS null