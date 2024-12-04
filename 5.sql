USE pandemic;

SET SQL_SAFE_UPDATES = 0;

UPDATE normalized_infectious_cases
SET year_difference = calculate_year_difference(year);

SET SQL_SAFE_UPDATES = 1;

SELECT 
    country_id,
    year,
    first_january_date,
    today_date,
    year_difference
FROM normalized_infectious_cases
LIMIT 10;
