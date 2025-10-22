-- Повне очищення перед початком випробування

-- 1. Очищення таблиць з практичної роботи
DROP TABLE IF EXISTS my_solution;
DROP TABLE IF EXISTS challenge_01_room;
DROP TABLE IF EXISTS challenge_02_plants;
DROP TABLE IF EXISTS challenge_03_flying_keys;
DROP TABLE IF EXISTS challenge_04_chess;
DROP TABLE IF EXISTS challenge_05_potions;

-- 2. Очищення таблиць з попередніх лабораторних робіт (Лаб 1-4)
-- (Важливо дотримуватись порядку через FOREIGN KEYs:
-- duels -> wizards, duelling_club_members -> wizards, wizards -> houses)
DROP TABLE IF EXISTS duels;
DROP TABLE IF EXISTS duelling_club_members;
DROP TABLE IF EXISTS spells;
DROP TABLE IF EXISTS wizards;
DROP TABLE IF EXISTS houses;

--
-- СТВОРЕННЯ СВІТУ ДЛЯ ПРАКТИЧНОЇ РОБОТИ
--

-- Кімната 1: Пухнастик та Арфа (з доданими предметами)
CREATE TABLE challenge_01_room (
    id INTEGER PRIMARY KEY,
    item_name TEXT NOT NULL,
    status TEXT NOT NULL
);
INSERT INTO challenge_01_room (item_name, status) VALUES
    ('Fluffy', 'Awake'),                 -- Ключовий предмет
    ('Harp', 'Silent'),                -- Ключовий предмет
    ('Three-headed dog bowl', 'Full'), -- Додатковий предмет
    ('A large pile of bones', 'Messy'),-- Додатковий предмет
    ('Stone trapdoor', 'Closed');        -- Додатковий предмет

-- Кімната 2: Гербарій (з пастками та безпечними рослинами)
CREATE TABLE challenge_02_plants (
    id INTEGER PRIMARY KEY,
    plant_name TEXT NOT NULL,
    description TEXT,
    weakness TEXT
);
INSERT INTO challenge_02_plants (plant_name, description, weakness) VALUES
    ('Devil''s Snare', 'Loves damp and dark', 'Bright Light'), -- Ключовий предмет
    ('Flitterbloom', 'Harmless, looks pretty', 'Nothing'),
    ('Snargaluff', 'Aggressive, thorny', 'Fire'),
    ('Venomous Tentacula', 'Very dangerous', 'Severing Charm'),
    ('Fanged Geranium', 'Bites strangers', 'Lulling music'),
    ('Mimbulus Mimbletonia', 'Squirts Stinksap', 'Water'),
    ('Mandrake', 'Screams when uprooted', 'Earmuffs');

-- Кімната 3: Летючі Ключі (100 ключів, один з яких правильний)
CREATE TABLE challenge_03_flying_keys (
    key_id INTEGER PRIMARY KEY AUTOINCREMENT,
    wing_status TEXT NOT NULL, -- 'Intact', 'Damaged'
    key_type TEXT NOT NULL,    -- 'Modern', 'Antique', 'Rusty'
    color TEXT,
    location TEXT
);
-- Наповнюємо сотнею ключів
INSERT INTO challenge_03_flying_keys (wing_status, key_type, color, location)
WITH RECURSIVE cnt(x) AS (SELECT 1 UNION ALL SELECT x+1 FROM cnt LIMIT 100)
SELECT 
    -- Ключ #57 буде нашим правильним ключем
    CASE WHEN x = 57 THEN 'Damaged' ELSE 'Intact' END,
    CASE WHEN x = 57 THEN 'Antique' WHEN x % 10 = 0 THEN 'Rusty' ELSE 'Modern' END,
    CASE WHEN x % 3 = 0 THEN 'Silver' WHEN x % 3 = 1 THEN 'Gold' ELSE 'Bronze' END,
    'Sector ' || (x % 5 + 1)
FROM cnt;

-- Кімната 4: Шахова партія (більше фігур)
CREATE TABLE challenge_04_chess (
    id INTEGER PRIMARY KEY,
    piece_name TEXT NOT NULL,
    color TEXT NOT NULL CHECK (color IN ('White', 'Black')),
    position TEXT,
    is_dangerous BOOLEAN NOT NULL CHECK (is_dangerous IN (0, 1))
);
INSERT INTO challenge_04_chess (id, piece_name, color, position, is_dangerous) VALUES
    (1, 'White Pawn', 'White', 'a3', 1),
    (2, 'White Queen', 'White', 'd1', 1),         -- Ключова фігура
    (3, 'White Knight', 'White', 'c3', 1),
    (4, 'Black King (Harry)', 'Black', 'e8', 0),
    (5, 'Black Knight (Ron)', 'Black', 'g5', 0),  -- Ключова фігура
    (6, 'White Bishop', 'White', 'f4', 1),
    (7, 'Black Rook (Hermione)', 'Black', 'h8', 0),
    (8, 'White Rook', 'White', 'a1', 1),
    (9, 'White Pawn', 'White', 'g2', 0),
    (10, 'Black Pawn', 'Black', 'a7', 0),
    (11, 'Black Pawn', 'Black', 'b7', 0),
    (12, 'Black Bishop', 'Black', 'c8', 0),
    (13, 'White Pawn', 'White', 'd4', 1),
    (14, 'Black Pawn', 'Black', 'e7', 0),
    (15, 'White Bishop', 'White', 'c1', 1);

-- Кімната 5: Загадка Снейпа (з додатковими пляшками, що не ламають логіку)
CREATE TABLE challenge_05_potions (
    id INTEGER PRIMARY KEY,
    position INTEGER NOT NULL,
    color TEXT NOT NULL,
    contents TEXT NOT NULL, -- 'Poison', 'Nettle Wine', 'Safety', 'Forward'
    volume_ml INTEGER,
    is_used BOOLEAN NOT NULL DEFAULT 0
);
INSERT INTO challenge_05_potions (position, color, contents, volume_ml, is_used) VALUES
    (11, 'Black', 'Poison', 300, 0),
    (12, 'Purple', 'Nettle Wine', 500, 0),
    (13, 'Grey', 'Poison', 300, 0),
    (14, 'Blue', 'Safety', 250, 0),       -- Ключ 2: Єдине синє
    (15, 'Yellow', 'Nettle Wine', 500, 0),
    (16, 'Red', 'Poison', 300, 0),
    (17, 'Green', 'Forward', 150, 0),      -- Ключ 1: Найменший об'єм
    (18, 'Brown', 'Poison', 400, 0),
    (19, 'Purple', 'Nettle Wine', 500, 0); -- Ще одне вино, не впливає
