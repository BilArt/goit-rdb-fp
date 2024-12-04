USE pandemic;

ALTER TABLE normalized_infectious_cases DROP COLUMN first_january_date;
ALTER TABLE normalized_infectious_cases DROP COLUMN today_date;
ALTER TABLE normalized_infectious_cases DROP COLUMN year_difference;

ALTER TABLE normalized_infectious_cases
ADD COLUMN first_january_date DATE,
ADD COLUMN today_date DATE,
ADD COLUMN year_difference INT;

SET SQL_SAFE_UPDATES = 0;

UPDATE normalized_infectious_cases
SET first_january_date = STR_TO_DATE(CONCAT(year, '-01-01'), '%Y-%m-%d');

UPDATE normalized_infectious_cases
SET today_date = CURDATE();

UPDATE normalized_infectious_cases
SET year_difference = YEAR(CURDATE()) - year;

SET SQL_SAFE_UPDATES = 1;

SELECT 
    country_id,
    year,
    first_january_date,
    today_date,
    year_difference
FROM normalized_infectious_cases
LIMIT 10;
