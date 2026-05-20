-- ==========================================
-- СХЕМА ДЛЯ ЛАБ 8: ТАЄМНИЦІ АСТРОНОМІЧНОЇ ВЕЖІ
-- ==========================================

DROP TABLE IF EXISTS observations;
DROP TABLE IF EXISTS wizards;
DROP TABLE IF EXISTS houses;

-- Створення базових таблиць
CREATE TABLE houses (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    founder TEXT,
    animal TEXT
);

CREATE TABLE wizards (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT,
    house_id INTEGER,
    FOREIGN KEY (house_id) REFERENCES houses (id)
);

-- Нова таблиця для Астрономічної Вежі
CREATE TABLE observations (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    wizard_id INTEGER NOT NULL,
    body_type TEXT NOT NULL, -- Planet, Star, Comet, Nebula, Galaxy
    constellation TEXT,
    brightness REAL NOT NULL, 
    duration_minutes INTEGER NOT NULL,
    FOREIGN KEY (wizard_id) REFERENCES wizards (id)
);

-- Наповнення даними
INSERT INTO houses (id, name, founder, animal) VALUES
    (1, 'Gryffindor', 'Godric Gryffindor', 'Lion'),
    (2, 'Slytherin', 'Salazar Slytherin', 'Serpent'),
    (3, 'Ravenclaw', 'Rowena Ravenclaw', 'Eagle'),
    (4, 'Hufflepuff', 'Helga Hufflepuff', 'Badger');

INSERT INTO wizards (first_name, last_name, house_id) VALUES
    ('Harry', 'Potter', 1), ('Hermione', 'Granger', 1), ('Ron', 'Weasley', 1),
    ('Draco', 'Malfoy', 2), ('Pansy', 'Parkinson', 2),
    ('Luna', 'Lovegood', 3), ('Cho', 'Chang', 3),
    ('Cedric', 'Diggory', 4), ('Ernie', 'Macmillan', 4);

-- Масивне наповнення журналу спостережень для аналітики
INSERT INTO observations (wizard_id, body_type, constellation, brightness, duration_minutes) VALUES
    -- Hermione (Gryffindor) - Very accurate and long observations
    (2, 'Planet', 'Centaurus', 8.5, 45), (2, 'Star', 'Orion', 9.2, 60), 
    (2, 'Nebula', 'Orion', 5.0, 110), (2, 'Planet', 'Ursa Major', 8.1, 55),
    (2, 'Galaxy', 'Andromeda', 6.4, 90),
    -- Harry (Gryffindor) - Shorter, random
    (1, 'Comet', 'Ursa Major', 7.8, 15), (1, 'Star', 'Centaurus', 6.5, 20),
    (1, 'Star', 'Draco', 7.0, 30), (1, 'Planet', 'Cassiopeia', 5.5, 25),
    -- Ron (Gryffindor) - Shortest observations
    (3, 'Planet', 'Ursa Major', 4.0, 10), (3, 'Star', 'Orion', 5.5, 15),
    (3, 'Comet', 'Cassiopeia', 8.9, 12),
    -- Draco (Slytherin) - Likes bright things and Draco constellation
    (4, 'Planet', 'Draco', 9.9, 50), (4, 'Star', 'Draco', 8.0, 40), 
    (4, 'Comet', 'Draco', 7.5, 35), (4, 'Star', 'Orion', 8.5, 45),
    (4, 'Star', 'Centaurus', 9.0, 30),
    -- Pansy (Slytherin)
    (5, 'Planet', 'Lyra', 6.8, 20), (5, 'Star', 'Cassiopeia', 7.2, 25),
    -- Luna (Ravenclaw) - Long observations of mysterious objects
    (6, 'Nebula', 'Lyra', 4.5, 120), (6, 'Planet', 'Centaurus', 6.0, 45),
    (6, 'Galaxy', 'Andromeda', 3.5, 150), (6, 'Nebula', 'Orion', 4.8, 90),
    (6, 'Star', 'Ursa Major', 8.8, 40), (6, 'Comet', 'Lyra', 9.1, 25),
    -- Cho (Ravenclaw)
    (7, 'Star', 'Cassiopeia', 7.5, 35), (7, 'Planet', 'Ursa Major', 8.0, 40),
    (7, 'Star', 'Centaurus', 7.8, 45), (7, 'Galaxy', 'Andromeda', 5.5, 60),
    -- Cedric (Hufflepuff) - Solid, consistent
    (8, 'Star', 'Orion', 8.2, 50), (8, 'Planet', 'Centaurus', 7.9, 45),
    (8, 'Comet', 'Ursa Major', 8.5, 30), (8, 'Nebula', 'Lyra', 6.0, 70),
    (8, 'Star', 'Cassiopeia', 7.7, 40),
    -- Ernie (Hufflepuff)
    (9, 'Planet', 'Draco', 6.5, 35), (9, 'Star', 'Orion', 7.0, 45),
    (9, 'Star', 'Ursa Major', 6.8, 40), (9, 'Comet', 'Centaurus', 8.1, 20);
