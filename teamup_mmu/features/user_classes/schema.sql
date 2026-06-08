DROP TABLE IF EXISTS user_classes CASCADE;
DROP TABLE IF EXISTS classes CASCADE;

CREATE TABLE IF NOT EXISTS classes (
    id SERIAL PRIMARY KEY,
    course_code VARCHAR(20) NOT NULL,
    course_name VARCHAR(100) NOT NULL,
    description TEXT,
    join_code TEXT UNIQUE NOT NULL,
    trimester VARCHAR(20) NOT NULL,
    section VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS user_classes (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    class_id INTEGER REFERENCES classes(id) ON DELETE CASCADE,
    role VARCHAR(20) DEFAULT 'student',
    joined_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(user_id, class_id)
);

-- Insert some dummy MMU classes for testing
INSERT INTO classes (course_code, course_name, description, join_code, trimester, section) VALUES
('TCS3111', 'Software Engineering', 'Learn about software development life cycles and project management.', 'SE123', '2610', 'TC1L'),
('TCS3151', 'Object Oriented Programming', 'Java programming concepts and OOP principles.', 'OOP456', '2610', 'TC3L'),
('TSN2201', 'Computer Networks', 'Network protocols, layers, and architectures.', 'NET789', '2610', 'TC2L');
