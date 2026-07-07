DROP TABLE IF EXISTS user_classes CASCADE;
DROP TABLE IF EXISTS classes CASCADE;
DROP TABLE IF EXISTS class_announcements CASCADE;

CREATE TABLE IF NOT EXISTS classes (
    id SERIAL PRIMARY KEY,
    course_code VARCHAR(20) NOT NULL,
    course_name VARCHAR(100) NOT NULL,
    description TEXT,
    join_code TEXT UNIQUE NOT NULL,
    trimester VARCHAR(20) NOT NULL DEFAULT '0000',
    section VARCHAR(20) NOT NULL DEFAULT 'TC1L',
    groups_enabled BOOLEAN DEFAULT FALSE,
    max_groups INTEGER DEFAULT 10,
    max_members_per_group INTEGER DEFAULT 5,
    teams_frozen BOOLEAN DEFAULT FALSE
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


DROP TABLE IF EXISTS group_requests CASCADE;
CREATE TABLE IF NOT EXISTS group_requests (
    id SERIAL PRIMARY KEY,
    group_id INTEGER REFERENCES groups(id) ON DELETE CASCADE,
    student_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    status VARCHAR(20) DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(group_id, student_id)
);