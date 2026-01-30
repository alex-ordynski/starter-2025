-- Очищення
DROP TABLE IF EXISTS grades;
DROP TABLE IF EXISTS subjects;
DROP TABLE IF EXISTS points_log;
DROP TABLE IF EXISTS wizards;
DROP TABLE IF EXISTS houses;

-- 1. Факультети
CREATE TABLE houses (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);
INSERT INTO houses VALUES (1, 'Gryffindor'), (2, 'Slytherin'), (3, 'Ravenclaw'), (4, 'Hufflepuff');

-- 2. Студенти
CREATE TABLE wizards (
    id INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    house_id INTEGER,
    FOREIGN KEY(house_id) REFERENCES houses(id)
);
INSERT INTO wizards VALUES 
(1, 'Harry', 'Potter', 1), (2, 'Hermione', 'Granger', 1), (3, 'Ron', 'Weasley', 1),
(4, 'Draco', 'Malfoy', 2), (5, 'Vincent', 'Crabbe', 2), (6, 'Gregory', 'Goyle', 2),
(7, 'Luna', 'Lovegood', 3), (8, 'Cho', 'Chang', 3),
(9, 'Cedric', 'Diggory', 4), (10, 'Hannah', 'Abbott', 4);

-- 3. Предмети (Нова таблиця!)
CREATE TABLE subjects (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    teacher_name TEXT
);
INSERT INTO subjects VALUES 
(1, 'Potions', 'Severus Snape'),
(2, 'Transfiguration', 'Minerva McGonagall'),
(3, 'Defense Against the Dark Arts', 'Dolores Umbridge'),
(4, 'Herbology', 'Pomona Sprout');

-- 4. Оцінки (Нова таблиця! Зв'язує студентів і предмети)
-- Оцінки від 1 (Troll) до 5 (Outstanding)
CREATE TABLE grades (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    wizard_id INTEGER,
    subject_id INTEGER,
    grade INTEGER,
    FOREIGN KEY(wizard_id) REFERENCES wizards(id),
    FOREIGN KEY(subject_id) REFERENCES subjects(id)
);

-- Наповнення оцінками (Data generation)
-- Hermione (All 5s)
INSERT INTO grades (wizard_id, subject_id, grade) VALUES (2, 1, 5), (2, 2, 5), (2, 3, 5), (2, 4, 5);
-- Harry (Good at DADA, bad at Potions)
INSERT INTO grades (wizard_id, subject_id, grade) VALUES (1, 1, 2), (1, 2, 4), (1, 3, 5), (1, 4, 3);
-- Ron
INSERT INTO grades (wizard_id, subject_id, grade) VALUES (3, 1, 2), (3, 2, 3), (3, 3, 4), (3, 4, 3);
-- Draco (Snape loves him)
INSERT INTO grades (wizard_id, subject_id, grade) VALUES (4, 1, 5), (4, 2, 4), (4, 3, 4);
-- Crabbe & Goyle (Bad students)
INSERT INTO grades (wizard_id, subject_id, grade) VALUES (5, 1, 2), (5, 2, 1), (6, 1, 2), (6, 3, 1);
-- Luna & Cho (Ravenclaws are smart)
INSERT INTO grades (wizard_id, subject_id, grade) VALUES (7, 2, 4), (7, 4, 5), (8, 2, 5);
-- Cedric (Hard worker)
INSERT INTO grades (wizard_id, subject_id, grade) VALUES (9, 2, 4), (9, 3, 4), (9, 4, 5);
