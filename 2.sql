CREATE TABLE IF NOT EXISTS diseases (
    id INT AUTO_INCREMENT PRIMARY KEY,
    disease_name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS normalized_infectious_cases (
    id INT AUTO_INCREMENT PRIMARY KEY,
    country_id INT NOT NULL,
    year INT NOT NULL,
    disease_id INT NOT NULL,
    cases INT,
    FOREIGN KEY (country_id) REFERENCES countries(id),
    FOREIGN KEY (disease_id) REFERENCES diseases(id)
);

INSERT INTO diseases (disease_name)
VALUES 
    ('yaws'),
    ('polio'),
    ('guinea_worm'),
    ('rabies'),
    ('malaria'),
    ('hiv'),
    ('tuberculosis'),
    ('smallpox'),
    ('cholera')
ON DUPLICATE KEY UPDATE disease_name = disease_name;

INSERT INTO normalized_infectious_cases (country_id, year, disease_id, cases)
SELECT c.id, ic.year, d.id, ic.Number_yaws
FROM infectious_cases ic
JOIN countries c ON ic.code = c.code
JOIN diseases d ON d.disease_name = 'yaws'
WHERE ic.Number_yaws IS NOT NULL;

INSERT INTO normalized_infectious_cases (country_id, year, disease_id, cases)
SELECT c.id, ic.year, d.id, ic.polio_cases
FROM infectious_cases ic
JOIN countries c ON ic.code = c.code
JOIN diseases d ON d.disease_name = 'polio'
WHERE ic.polio_cases IS NOT NULL;

