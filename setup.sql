DROP TABLE IF EXISTS wizards;
DROP TABLE IF EXISTS houses;

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

INSERT INTO houses (id, name, founder, animal) VALUES
    (1, 'Gryffindor', 'Godric Gryffindor', 'Lion'),
    (2, 'Slytherin', 'Salazar Slytherin', 'Serpent'),
    (3, 'Ravenclaw', 'Rowena Ravenclaw', 'Eagle'),
    (4, 'Hufflepuff', 'Helga Hufflepuff', 'Badger');

INSERT INTO wizards (first_name, last_name, house_id) VALUES
    ('Harry', 'Potter', 1),
    ('Hermione', 'Granger', 1),
    ('Ron', 'Weasley', 1),
    ('Draco', 'Malfoy', 2),
    ('Luna', 'Lovegood', 3),
    ('Neville', 'Longbottom', 1),
    ('Ginny', 'Weasley', 1),
    ('Cedric', 'Diggory', 4),
    ('Cho', 'Chang', 3),
    ('Pansy', 'Parkinson', 2),
    ('Blaise', 'Zabini', 2),
    ('Seamus', 'Finnigan', 1),
    ('Dean', 'Thomas', 1),
    ('Padma', 'Patil', 3),
    ('Parvati', 'Patil', 1);
