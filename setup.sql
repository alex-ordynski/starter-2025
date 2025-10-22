-- Повне очищення у правильному порядку (від дочірніх до батьківських таблиць)
DROP TABLE IF EXISTS duels;
DROP TABLE IF EXISTS duelling_club_members;
DROP TABLE IF EXISTS spells;
DROP TABLE IF EXISTS wizards;
DROP TABLE IF EXISTS houses;

-- Створення таблиці для факультетів (з Лаб 1)
CREATE TABLE houses (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    founder TEXT,
    animal TEXT
);

-- Створення таблиці для чарівників (з Лаб 1)
CREATE TABLE wizards (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT,
    house_id INTEGER,
    FOREIGN KEY (house_id) REFERENCES houses (id)
);

-- Створення таблиці для заклять (з Лаб 2)
CREATE TABLE spells (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    type TEXT,
    description TEXT
);

-- Створення таблиці членів клубу (з Лаб 3)
CREATE TABLE duelling_club_members (
    id INTEGER PRIMARY KEY,
    wizard_id INTEGER NOT NULL,
    join_date DATE,
    FOREIGN KEY (wizard_id) REFERENCES wizards(id) ON DELETE CASCADE
);

-- Створення таблиці дуелей (з Лаб 3)
CREATE TABLE duels (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    winner_id INTEGER NOT NULL,
    loser_id INTEGER NOT NULL,
    duel_date DATE,
    FOREIGN KEY (winner_id) REFERENCES wizards(id),
    FOREIGN KEY (loser_id) REFERENCES wizards(id)
);

-- Наповнення базових таблиць
INSERT INTO houses (id, name, founder, animal) VALUES
    (1, 'Gryffindor', 'Godric Gryffindor', 'Lion'),
    (2, 'Slytherin', 'Salazar Slytherin', 'Serpent'),
    (3, 'Ravenclaw', 'Rowena Ravenclaw', 'Eagle'),
    (4, 'Hufflepuff', 'Helga Hufflepuff', 'Badger');

-- РОЗШИРЕНИЙ список чарівників
INSERT INTO wizards (id, first_name, last_name, house_id) VALUES
    (1, 'Harry', 'Potter', 1),
    (2, 'Hermione', 'Granger', 1),
    (3, 'Ron', 'Weasley', 1),
    (4, 'Draco', 'Malfoy', 2),
    (5, 'Luna', 'Lovegood', 3),
    (6, 'Neville', 'Longbottom', 1),
    (7, 'Ginny', 'Weasley', 1),
    (8, 'Cedric', 'Diggory', 4),
    (9, 'Cho', 'Chang', 3),
    (10, 'Pansy', 'Parkinson', 2),
    (11, 'Blaise', 'Zabini', 2),
    (12, 'Seamus', 'Finnigan', 1),
    (13, 'Dean', 'Thomas', 1),
    (14, 'Padma', 'Patil', 3),
    (15, 'Parvati', 'Patil', 1),
    -- Нові чарівники
    (16, 'Hannah', 'Abbott', 4),
    (17, 'Susan', 'Bones', 4),
    (18, 'Terry', 'Boot', 3),
    (19, 'Justin', 'Finch-Fletchley', 4),
    (20, 'Gregory', 'Goyle', 2);

-- РОЗШИРЕНИЙ список заклять
INSERT INTO spells (name, type, description) VALUES
    ('Wingardium Leviosa', 'Charm', 'Causes an object to levitate.'),
    ('Alohomora', 'Charm', 'Unlocks doors and windows.'),
    ('Expelliarmus', 'Jinx', 'Disarms another wizard.'),
    ('Crucio', 'Curse', 'Inflicts unbearable pain.'),
    ('Vera Verto', 'Transfiguration', 'Turns an animal into a water goblet.'),
    -- Нові закляття
    ('Lumos', 'Charm', 'Creates a beam of light at the tip of the wand.'),
    ('Petrificus Totalus', 'Jinx', 'Full Body-Bind Curse.'),
    ('Rictusempra', 'Jinx', 'The Tickling Charm.'),
    ('Incendio', 'Charm', 'Produces fire.'),
    ('Bat-Bogey Hex', 'Hex', 'Grotesquely enlarges the target''s bogeys.');


-- РОЗШИРЕНИЙ список членів Дуельного Клубу
INSERT INTO duelling_club_members (wizard_id, join_date) VALUES
    (1, '2025-10-08'), -- Harry
    (2, '2025-10-08'), -- Hermione
    (3, '2025-10-09'), -- Ron
    (4, '2025-10-08'), -- Draco
    (6, '2025-10-09'), -- Neville
    (7, '2025-10-10'), -- Ginny
    -- Нові члени клубу
    (5, '2025-10-11'), -- Luna
    (8, '2025-10-11'), -- Cedric
    (16, '2025-10-12'),-- Hannah
    (18, '2025-10-12'); -- Terry

-- РОЗШИРЕНИЙ журнал дуелей
-- Важливі дуелі 1-5 для індивідуального завдання ЗАЛИШАЮТЬСЯ НЕЗМІННИМИ
INSERT INTO duels (id, winner_id, loser_id, duel_date) VALUES
    (1, 1, 4, '2025-10-10'), -- Harry (1) vs Draco (4)
    (2, 2, 3, '2025-10-10'), -- Hermione (2) vs Ron (3)
    (3, 7, 9, '2025-10-11'), -- Ginny (7) vs Cho (9)
    (4, 4, 3, '2025-10-12'), -- Draco (4) vs Ron (3)
    (5, 6, 12, '2025-10-12'), -- Neville (6) vs Seamus (12)
    -- Нові дуелі для більшої кількості даних
    (6, 8, 5, '2025-10-13'), -- Cedric (8) vs Luna (5)
    (7, 1, 20, '2025-10-13'), -- Harry (1) vs Goyle (20)
    (8, 16, 17, '2025-10-14'), -- Hannah (16) vs Susan (17)
    (9, 2, 18, '2025-10-14'), -- Hermione (2) vs Terry (18)
    (10, 4, 6, '2025-10-15'); -- Draco (4) vs Neville (6)
