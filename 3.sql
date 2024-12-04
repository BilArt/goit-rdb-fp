SET SQL_SAFE_UPDATES = 0;

UPDATE infectious_cases
SET Number_rabies = NULL
WHERE Number_rabies = '';

SELECT COUNT(*) AS null_rows
FROM infectious_cases
WHERE Number_rabies IS NULL;

INSERT INTO normalized_infectious_cases (country_id, year, disease_id, cases)
SELECT 
    c.id, 
    ic.year, 
    d.id, 
    ic.Number_rabies
FROM infectious_cases ic
JOIN countries c ON ic.code = c.code
JOIN diseases d ON d.disease_name = 'rabies'
WHERE ic.Number_rabies IS NOT NULL;

SELECT * 
FROM normalized_infectious_cases
WHERE disease_id = (SELECT id FROM diseases WHERE disease_name = 'rabies')
LIMIT 10;

SELECT 
    c.entity,
    c.code,
    AVG(nic.cases) AS average_rabies,
    MIN(nic.cases) AS min_rabies,
    MAX(nic.cases) AS max_rabies,
    SUM(nic.cases) AS total_rabies
FROM normalized_infectious_cases nic
JOIN countries c ON nic.country_id = c.id
WHERE nic.disease_id = (SELECT id FROM diseases WHERE disease_name = 'rabies')
GROUP BY c.entity, c.code
ORDER BY average_rabies DESC
LIMIT 10;

SET SQL_SAFE_UPDATES = 1;
