DROP TABLE IF EXISTS profiles CASCADE;
CREATE TABLE IF NOT EXISTS profiles (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE,
    
    interests TEXT[] CHECK (
        array_length(interests, 1) >= 2 AND 
        array_length(interests, 1) <= 5
    )
);