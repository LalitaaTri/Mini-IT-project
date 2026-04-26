DROP TABLE IF EXISTS chats CASCADE;
CREATE TABLE IF NOT EXISTS chats (
    id SERIAL PRIMARY KEY,
    user_x_id INTEGER REFERENCES users(id),
    user_y_id INTEGER REFERENCES users(id)
);
DROP TABLE IF EXISTS messages CASCADE;
CREATE TABLE IF NOT EXISTS messages (
    id SERIAL PRIMARY KEY,
    chat_id INTEGER REFERENCES chats(id),
    sender_id INTEGER REFERENCES users(id),
    content TEXT,
    created_at TIMESTAMP DEFAULT now()
);