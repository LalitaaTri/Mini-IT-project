DROP TABLE IF EXISTS likes CASCADE;
CREATE TABLE IF NOT EXISTS likes (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    liked_user_id INTEGER REFERENCES users(id),
    created_at TIMESTAMP DEFAULT now()
);