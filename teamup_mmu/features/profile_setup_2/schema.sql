DROP TABLE IF EXISTS profiles CASCADE;
CREATE TABLE IF NOT EXISTS profiles (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE,
    introduction TEXT,
    descriptions TEXT,
    year_of_study INTEGER CHECK (year_of_study >= 1 AND year_of_study <= 5),
    faculty VARCHAR(255),
    program VARCHAR(255),
    cgpa DECIMAL(3,2) CHECK (cgpa >= 0.00 AND cgpa <= 4.00),
    interests TEXT[] CHECK (
        array_length(interests, 1) >= 2 AND 
        array_length(interests, 1) <= 5
    ),
    classes_ids INTEGER[] CHECK (
        array_length(classes_ids, 1) >= 0 AND 
        array_length(classes_ids, 1) <= 8
    )
);