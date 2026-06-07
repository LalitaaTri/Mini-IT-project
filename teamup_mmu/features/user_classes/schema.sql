DROP TABLE IF EXISTS user_classes CASCADE;
DROP TABLE IF EXISTS classes CASCADE;
DROP TABLE IF EXISTS class_announcements CASCADE;

CREATE TABLE IF NOT EXISTS classes (
    id SERIAL PRIMARY KEY,
    course_code VARCHAR(20) NOT NULL,
    course_name VARCHAR(100) NOT NULL,
    description TEXT,
    join_code TEXT UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS user_classes (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    class_id INTEGER REFERENCES classes(id) ON DELETE CASCADE,
    role VARCHAR(20) DEFAULT 'student',
    joined_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(user_id, class_id)
);

CREATE TABLE IF NOT EXISTS class_announcements (
    id SERIAL PRIMARY KEY,
    class_id INTEGER NOT NULL REFERENCES classes(id) ON DELETE CASCADE,
    sender_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert some dummy MMU classes for testing --- delete later
INSERT INTO classes (course_code, course_name, description, join_code) VALUES
('TCS3111', 'Software Engineering', 'Learn about software development life cycles and project management.', 'SE123'),
('TCS3151', 'Object Oriented Programming', 'Java programming concepts and OOP principles.', 'OOP456'),
('TSN2201', 'Computer Networks', 'Network protocols, layers, and architectures.', 'NET789');
