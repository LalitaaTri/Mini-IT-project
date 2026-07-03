-- Clear existing data if any (cascades will clean up related tables)
TRUNCATE users, classes CASCADE;

-- 1. Insert dummy users (Password: 123)
INSERT INTO users (id, email, password, email_verified) VALUES
(1, 'hello@mmu.edu.my', 'pbkdf2_sha256$1200000$DgHrTsEu31RNhdbaSI3GSm$JRnXD5NfZoLq4Oko55Y3gdIv3qABfOkOfE3/eSYErWA=', TRUE),
(2, 'alice@student.mmu.edu.my', 'pbkdf2_sha256$1200000$DgHrTsEu31RNhdbaSI3GSm$JRnXD5NfZoLq4Oko55Y3gdIv3qABfOkOfE3/eSYErWA=', TRUE),
(3, 'bob@student.mmu.edu.my', 'pbkdf2_sha256$1200000$DgHrTsEu31RNhdbaSI3GSm$JRnXD5NfZoLq4Oko55Y3gdIv3qABfOkOfE3/eSYErWA=', TRUE);

-- Adjust user ID sequence so next inserts don't conflict
SELECT setval('users_id_seq', (SELECT MAX(id) FROM users));

-- 2. Insert dummy profiles
INSERT INTO profiles (id, username, introduction, descriptions, year_of_study, faculty, program, cgpa, interests) VALUES
(1, 'john_doe', 'Hey, I am John, a passionate developer!', 'Friendly and hardworking.', 3, 'FCI', 'Software Engineering', 3.80, ARRAY['Coding', 'Gaming', 'Music']),
(2, 'alice_smith', 'Hi there! I love building cool web applications.', 'Enthusiastic team player.', 2, 'FCI', 'Computer Science', 3.90, ARRAY['Coding', 'Design', 'Reading']),
(3, 'bob_jones', 'Telecommunications student looking for group members.', 'Practical and analytical.', 3, 'FOE', 'Telecommunications', 3.50, ARRAY['Gaming', 'Sports', 'Music']);

-- Adjust profiles ID sequence
SELECT setval('profiles_id_seq', (SELECT MAX(id) FROM profiles));

-- 3. Insert classes
INSERT INTO classes (id, course_code, course_name, description, join_code) VALUES
(1, 'TCS3111', 'Software Engineering', 'Learn about software development life cycles and project management.', 'SE123'),
(2, 'TCS3151', 'Object Oriented Programming', 'Java programming concepts and OOP principles.', 'OOP456'),
(3, 'TSN2201', 'Computer Networks', 'Network protocols, layers, and architectures.', 'NET789');

-- Adjust classes ID sequence
SELECT setval('classes_id_seq', (SELECT MAX(id) FROM classes));

-- 4. Associate users with classes
INSERT INTO user_classes (user_id, class_id, role) VALUES
(1, 1, 'admin'),
(2, 1, 'student'),
(2, 2, 'admin'),
(3, 2, 'student');

-- 5. Insert dummy casual groups (general, not linked to any class)
INSERT INTO groups (id, name, description, whatsapp_link, is_general, class_name, max_members, leader_id, created_by, join_code) VALUES
(1, 'The Debug Squad',    'A casual study group for anyone who loves coding and debugging together.', 'https://chat.whatsapp.com/debugsquad', TRUE, NULL, 6, 1, 1, 'DBG001'),
(2, 'Weekend Warriors',   'We meet on weekends to work on side projects and have fun!',               'https://chat.whatsapp.com/wkndwar',    TRUE, NULL, 5, 2, 2, 'WKD002');

-- Adjust groups ID sequence
SELECT setval('groups_id_seq', (SELECT MAX(id) FROM groups));

-- 6. Insert group members
INSERT INTO group_members (group_id, user_id) VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 3);

-- 7. Insert group invites
INSERT INTO group_invites (group_id, sender_id, receiver_id, status) VALUES
(1, 1, 3, 'pending');
