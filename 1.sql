CREATE SCHEMA IF NOT EXISTS pandemic;

USE pandemic;

CREATE TABLE IF NOT EXISTS countries (
    id INT AUTO_INCREMENT PRIMARY KEY,
    entity VARCHAR(255) NOT NULL,
    code VARCHAR(10) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS infectious_cases (
    id INT AUTO_INCREMENT PRIMARY KEY,
    country_id INT NOT NULL,
    year INT NOT NULL,
    disease_name VARCHAR(255) NOT NULL,
    cases INT,
    FOREIGN KEY (country_id) REFERENCES countries(id)
);
