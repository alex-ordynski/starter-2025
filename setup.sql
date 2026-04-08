-- ==========================================
-- SETUP SCRIPT: THE HOUSE CUP MYSTERY
-- ==========================================

-- 1. Чистимо "дошку" (Drop tables)
DROP TABLE IF EXISTS points_log;
DROP TABLE IF EXISTS wizards;
DROP TABLE IF EXISTS houses;

-- 2. Створюємо Факультети
CREATE TABLE houses (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);
INSERT INTO houses (id, name) VALUES 
    (1, 'Gryffindor'), 
    (2, 'Slytherin'), 
    (3, 'Ravenclaw'), 
    (4, 'Hufflepuff');

-- 3. Створюємо Студентів
CREATE TABLE wizards (
    id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    house_id INTEGER,
    FOREIGN KEY (house_id) REFERENCES houses(id)
);

INSERT INTO wizards (id, first_name, last_name, house_id) VALUES
    (1, 'Harry', 'Potter', 1),
    (2, 'Hermione', 'Granger', 1),
    (3, 'Ron', 'Weasley', 1),
    (4, 'Draco', 'Malfoy', 2),
    (5, 'Luna', 'Lovegood', 3),
    (6, 'Cedric', 'Diggory', 4),
    (7, 'Neville', 'Longbottom', 1),
    (8, 'Vincent', 'Crabbe', 2),
    (9, 'Gregory', 'Goyle', 2),
    (10, 'Cho', 'Chang', 3),
    (11, 'Hannah', 'Abbott', 4);

-- 4. Створюємо Журнал Балів (Points Log)
CREATE TABLE points_log (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    receiver_id INTEGER,
    house_id INTEGER, -- Для зручності фільтрації в Лаб №5
    points_change INTEGER NOT NULL,
    reason TEXT,
    date_awarded DATE,
    FOREIGN KEY (receiver_id) REFERENCES wizards(id),
    FOREIGN KEY (house_id) REFERENCES houses(id)
);

-- ==========================================
-- НАПОВНЕННЯ ІСТОРІЄЮ (INSERT DATA)
-- ==========================================

-- Вересень: Початок навчання. Герміона та Рейвенклов лідирують.
INSERT INTO points_log (receiver_id, house_id, points_change, reason, date_awarded) VALUES
    (2, 1, 10, 'Perfect transfiguration of a match', '2024-09-02'),
    (2, 1, 10, 'Knowing about bezoars', '2024-09-05'),
    (5, 3, 15, 'Correctly answering a riddle', '2024-09-06'), -- Luna
    (10, 3, 10, 'Perfect Charms work', '2024-09-07'), -- Cho
    (3, 1, -5, 'Dirty robes', '2024-09-10'), -- Snape hates Ron
    (1, 1, -5, 'Cheekiness', '2024-09-10'); -- Snape hates Harry

-- Жовтень: Квідич і Троль
INSERT INTO points_log (receiver_id, house_id, points_change, reason, date_awarded) VALUES
    (1, 1, 50, 'Catching the Golden Snitch', '2024-10-15'), -- Великий виграш
    (4, 2, 40, 'Slytherin wins a match', '2024-10-20'),
    (6, 4, 30, 'Hufflepuff Fair Play award', '2024-10-25'),
    (1, 1, -5, 'Troll in the dungeon incident', '2024-10-31'), -- Спочатку зняли
    (3, 1, -5, 'Troll in the dungeon incident', '2024-10-31'),
    (1, 1, 5, 'Defeating the Troll (luck)', '2024-10-31'), -- Потім дали
    (3, 1, 5, 'Defeating the Troll (spell)', '2024-10-31');

-- Листопад - Грудень: Слизерин виривається вперед
INSERT INTO points_log (receiver_id, house_id, points_change, reason, date_awarded) VALUES
    (4, 2, 20, 'Potions master favorite', '2024-11-05'),
    (4, 2, 20, 'Donation of new brooms (Suspect)', '2024-11-10'),
    (8, 2, 10, 'Intimidating first years', '2024-11-12'), -- Crabbe
    (1, 1, -50, 'Out of bed at night', '2024-12-01'), -- Величезний штраф!
    (2, 1, -20, 'Out of bed at night', '2024-12-01'),
    (7, 1, -20, 'Out of bed at night', '2024-12-01'),
    (4, 2, 50, 'Catching students out of bed', '2024-12-01'); -- Драко здав їх

-- Весна: Фінальна гонка
INSERT INTO points_log (receiver_id, house_id, points_change, reason, date_awarded) VALUES
    (2, 1, 40, 'Solving the Logic Puzzle', '2025-05-20'),
    (3, 1, 50, 'The best played game of Chess', '2025-05-20'),
    (1, 1, 60, 'Pure nerve and outstanding courage', '2025-05-20'),
    (7, 1, 10, 'Standing up to his friends', '2025-05-20'); -- Neville's 10 points

-- Додаткові випадкові події для статистики
INSERT INTO points_log (receiver_id, house_id, points_change, reason, date_awarded) VALUES
    (11, 4, 5, 'Watering the Sprout plants', '2025-03-10'),
    (9, 2, -10, 'Sleeping in History of Magic', '2025-03-15'),
    (6, 4, 15, 'Bubble-head charm', '2025-04-01'),
    (4, 2, -5, 'Insulting a Buckbeak', '2025-04-05');
