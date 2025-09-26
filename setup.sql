-- Видаляємо старі таблиці, якщо вони існують, щоб уникнути конфліктів
DROP TABLE IF EXISTS wizards;
DROP TABLE IF EXISTS houses;
DROP TABLE IF EXISTS spells;

-- Створюємо таблицю для факультетів Гоґвортсу
CREATE TABLE houses (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    founder TEXT,
    animal TEXT
);

-- Створюємо таблицю для чарівників
CREATE TABLE wizards (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT,
    house_id INTEGER,
    FOREIGN KEY (house_id) REFERENCES houses (id)
);

-- Створюємо нову таблицю для заклять
CREATE TABLE spells (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    type TEXT,
    description TEXT
);

-- Наповнюємо таблицю факультетів
INSERT INTO houses (id, name, founder, animal) VALUES
    (1, 'Gryffindor', 'Godric Gryffindor', 'Lion'),
    (2, 'Slytherin', 'Salazar Slytherin', 'Serpent'),
    (3, 'Ravenclaw', 'Rowena Ravenclaw', 'Eagle'),
    (4, 'Hufflepuff', 'Helga Hufflepuff', 'Badger');

-- Наповнюємо таблицю чарівників
INSERT INTO wizards (first_name, last_name, house_id) VALUES
    ('Harry', 'Potter', 1), ('Hermione', 'Granger', 1), ('Ron', 'Weasley', 1),
    ('Draco', 'Malfoy', 2), ('Luna', 'Lovegood', 3), ('Neville', 'Longbottom', 1),
    ('Ginny', 'Weasley', 1), ('Cedric', 'Diggory', 4), ('Cho', 'Chang', 3),
    ('Pansy', 'Parkinson', 2), ('Blaise', 'Zabini', 2), ('Seamus', 'Finnigan', 1),
    ('Dean', 'Thomas', 1), ('Padma', 'Patil', 3), ('Parvati', 'Patil', 1);

-- Наповнюємо каталог заклять для індивідуальних варіантів
INSERT INTO spells (name, type, description) VALUES
    ('Wingardium Leviosa', 'Charm', 'Causes an object to levitate.'),
    ('Alohomora', 'Charm', 'Unlocks doors and windows.'),
    ('Lumos', 'Charm', 'Creates a beam of light at the tip of the wand.'),
    ('Expecto Patronum', 'Charm', 'Creates a Patronus to ward off Dementors.'),
    ('Avada Kedavra', 'Curse', 'The Killing Curse. Unforgivable.'),
    ('Crucio', 'Curse', 'The Cruciatus Curse. Inflicts unbearable pain. Unforgivable.'),
    ('Imperio', 'Curse', 'The Imperius Curse. Places the victim in a dreamlike state. Unforgivable.'),
    ('Vera Verto', 'Transfiguration', 'Turns an animal into a water goblet.'),
    ('Avifors', 'Transfiguration', 'Transforms small objects into birds.'),
    ('Expelliarmus', 'Jinx', 'Disarms another wizard, causing their wand to fly out of reach.'),
    ('Rictusempra', 'Jinx', 'The Tickling Charm, causes uncontrollable laughter.'),
    ('Bat-Bogey Hex', 'Hex', 'Grotesquely enlarges the target''s bogeys and gives them wings.'),
    ('Densaugeo', 'Hex', 'Causes the victim''s teeth to grow rapidly.');
