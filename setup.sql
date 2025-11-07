-- Видаляємо старі таблиці, якщо вони існують, для чистого старту
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS houses;

/*
 * Таблиця 1: Факультети (Houses)
 * Це проста довідкова таблиця.
 */
CREATE TABLE houses (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    founder TEXT
);

/*
 * Таблиця 2: Студенти (Students)
 * Це наша ОСНОВНА таблиця для лекції.
 * Зверніть увагу, що last_name, patronus та score МОЖУТЬ бути NULL.
 */
CREATE TABLE students (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT,          -- ❗ NULL-приклади тут
    house_id INTEGER,
    patronus TEXT,           -- ❗ NULL-приклади тут
    score INTEGER,           -- ❗ NULL-приклади тут
    FOREIGN KEY (house_id) REFERENCES houses (id)
);

-- Наповнюємо факультети
INSERT INTO houses (id, name, founder) VALUES
    (1, 'Gryffindor', 'Godric Gryffindor'),
    (2, 'Slytherin', 'Salazar Slytherin'),
    (3, 'Ravenclaw', 'Rowena Ravenclaw'),
    (4, 'Hufflepuff', 'Helga Hufflepuff');

-- Наповнюємо студентів (з великою кількістю NULL!)
INSERT INTO students (first_name, last_name, house_id, patronus, score) VALUES
    -- === Приклади з повними даними ===
    ('Harry', 'Potter', 1, 'Stag', 85),
    ('Hermione', 'Granger', 1, 'Otter', 98),
    ('Ron', 'Weasley', 1, 'Jack Russell Terrier', 72),
    
    -- === Приклади для пасток з NULL ===
    
    -- 1. NULL в last_name (для демонстрації з'єднання рядків)
    ('Luna', NULL, 3, 'Hare', 88), -- 'Luna' || ' ' || NULL -> NULL
    
    -- 2. NULL в patronus (для демонстрації IS NULL)
    ('Draco', 'Malfoy', 2, NULL, 75), -- Невідомий патронус
    ('Neville', 'Longbottom', 1, NULL, 68), -- Патронус невідомий (спочатку)

    -- 3. NULL в score (для демонстрації арифметики та AVG)
    ('Ginny', 'Weasley', 1, 'Horse', NULL), -- Бал не виставлено
    ('Seamus', 'Finnigan', 1, 'Fox', NULL), -- Бал не виставлено

    -- 4. Приклад з 0 балом (для контрасту з NULL)
    ('Crabbe', 'Goyle', 2, NULL, 0), -- Бал 0 (не NULL!)
    
    -- 5. Приклад з декількома NULL
    ('Parvati', 'Patil', 1, NULL, NULL);

COMMIT;
