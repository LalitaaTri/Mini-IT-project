CREATE TABLE IF NOT EXISTS classes (
    id SERIAL PRIMARY KEY,
    course_code VARCHAR(20) NOT NULL,
    course_name VARCHAR(100) NOT NULL,
    description TEXT
);

CREATE TABLE IF NOT EXISTS user_classes (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    class_id INTEGER REFERENCES classes(id) ON DELETE CASCADE,
    joined_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(user_id, class_id)
);

-- Insert some dummy MMU classes for testing
INSERT INTO classes (course_code, course_name, description) VALUES
('TCS3111', 'Software Engineering', 'Learn about software development life cycles and project management.'),
('TCS3151', 'Object Oriented Programming', 'Java programming concepts and OOP principles.'),
('TSN2201', 'Computer Networks', 'Network protocols, layers, and architectures.');
