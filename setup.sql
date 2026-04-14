-- ==========================================
-- СХЕМА ДЛЯ ЛАБ 7: БРУДНІ АРХІВИ (Розширена)
-- ==========================================

DROP TABLE IF EXISTS dirty_potions;
DROP TABLE IF EXISTS dirty_student_pets;
DROP TABLE IF EXISTS dirty_grades;
DROP TABLE IF EXISTS dirty_quidditch_gear;
DROP TABLE IF EXISTS dirty_ministry_registry;
DROP TABLE IF EXISTS dirty_mungo_patients;

-- Завдання 1.1: Списки в комірці (1НФ)
CREATE TABLE dirty_potions (
    potion_id INTEGER PRIMARY KEY,
    potion_name TEXT,
    ingredients_list TEXT
);
INSERT INTO dirty_potions VALUES 
(1, 'Багатозільна настійка', 'Рододендрон, Шкіра бумсланга, Товчений ріг дворога, П''явки'),
(2, 'Амортенція', 'Яйця попелиці, Трояндові шпички, М''ята, Місячна роса'),
(3, 'Фелікс Феліціс', 'Яйце попелиці, Цибулина морської цибулі, Настоянка чебрецю'),
(4, 'Косторіст', 'Китайська жувальна капуста, Сік скарабея, Отрута пуфендуя'),
(5, 'Зілля забуття', 'Вода з річки Лета, Гілочки валеріани, Ягоди омели');

-- Завдання 1.2: Повторювані колонки (1НФ)
CREATE TABLE dirty_student_pets (
    student_id INTEGER PRIMARY KEY,
    student_name TEXT,
    pet_1 TEXT,
    pet_2 TEXT,
    pet_3 TEXT
);
INSERT INTO dirty_student_pets VALUES 
(1, 'Гаррі Поттер', 'Сова Гедвіґа', NULL, NULL),
(2, 'Рон Візлі', 'Щур Скеберс', 'Сова Левопіг', NULL),
(3, 'Герміона Ґрейнджер', 'Кіт Криволапик', NULL, NULL),
(4, 'Рубеус Геґрід', 'Пес Ікло', 'Дракон Норберт', 'Гіпогриф Бакбик'),
(5, 'Невіл Лонґботом', 'Жаба Тревор', 'Кактус Мімбус', NULL);

-- Завдання 2.1: Часткова залежність (2НФ)
CREATE TABLE dirty_grades (
    student_id INTEGER,
    course_id INTEGER,
    grade TEXT,
    course_name TEXT,
    professor TEXT,
    PRIMARY KEY (student_id, course_id)
);
INSERT INTO dirty_grades VALUES 
(1, 101, 'Відмінно', 'Трансфігурація', 'Мінерва Макґонеґел'),
(1, 102, 'Добре', 'Зіллєваріння', 'Северус Снейп'),
(2, 101, 'Добре', 'Трансфігурація', 'Мінерва Макґонеґел'),
(2, 102, 'Відмінно', 'Зіллєваріння', 'Северус Снейп'),
(3, 101, 'Відмінно', 'Трансфігурація', 'Мінерва Макґонеґел'),
(3, 103, 'Відмінно', 'Захист від темних мистецтв', 'Рімус Люпин'),
(4, 102, 'Задовільно', 'Зіллєваріння', 'Северус Снейп'),
(5, 104, 'Відмінно', 'Гербологія', 'Помона Спраут'),
(1, 104, 'Відмінно', 'Гербологія', 'Помона Спраут');

-- Завдання 2.2: Часткова залежність (2НФ)
CREATE TABLE dirty_quidditch_gear (
    player_id INTEGER,
    broom_model_id INTEGER,
    purchase_date DATE,
    manufacturer TEXT,
    max_speed INTEGER,
    PRIMARY KEY (player_id, broom_model_id)
);
INSERT INTO dirty_quidditch_gear VALUES 
(1, 201, '1991-09-01', 'Nimbus Racing Broom Company', 150),
(2, 202, '1992-08-15', 'Cleansweep Brooms', 110),
(3, 201, '1992-09-05', 'Nimbus Racing Broom Company', 150),
(4, 203, '1993-12-25', 'Firebolt Manufacturers', 250),
(5, 202, '1991-08-10', 'Cleansweep Brooms', 110),
(6, 204, '1990-07-20', 'Comet Trading Company', 120),
(7, 203, '1994-01-10', 'Firebolt Manufacturers', 250);

-- Завдання 3.1: Транзитивна залежність (3НФ)
CREATE TABLE dirty_ministry_registry (
    wizard_id INTEGER PRIMARY KEY,
    name TEXT,
    address_code INTEGER,
    city_name TEXT,
    country_name TEXT
);
INSERT INTO dirty_ministry_registry VALUES 
(1, 'Артур Візлі', 5001, 'Отері-Сент-Кечпол', 'Велика Британія'),
(2, 'Моллі Візлі', 5001, 'Отері-Сент-Кечпол', 'Велика Британія'),
(3, 'Луціус Малфой', 8002, 'Вілтшир', 'Велика Британія'),
(4, 'Нарциса Малфой', 8002, 'Вілтшир', 'Велика Британія'),
(5, 'Амос Діґорі', 5001, 'Отері-Сент-Кечпол', 'Велика Британія'),
(6, 'Чарлі Візлі', 9005, 'Трансільванія', 'Румунія'),
(7, 'Віктор Крум', 4004, 'Софія', 'Болгарія'),
(8, 'Ігор Каркароф', 4004, 'Софія', 'Болгарія'),
(9, 'Ксенофіліус Лавґуд', 5001, 'Отері-Сент-Кечпол', 'Велика Британія');

-- Завдання 3.2: Транзитивна залежність (3НФ)
CREATE TABLE dirty_mungo_patients (
    patient_id INTEGER PRIMARY KEY,
    patient_name TEXT,
    diagnosis TEXT,
    ward_id INTEGER,
    ward_name TEXT,
    head_healer TEXT
);
INSERT INTO dirty_mungo_patients VALUES 
(1, 'Артур Візлі', 'Укус змії', 4, 'Відділення укусів та отруєнь', 'Гіппократ Сметвік'),
(2, 'Кеті Бел', 'Прокляття намиста', 5, 'Відділення магічних травм', 'Август Пай'),
(3, 'Ґілдерой Локарт', 'Втрата пам''яті', 1, 'Відділення заклять', 'Міріам Строут'),
(4, 'Аліса Лонґботом', 'Наслідки Круціатусу', 1, 'Відділення заклять', 'Міріам Строут'),
(5, 'Френк Лонґботом', 'Наслідки Круціатусу', 1, 'Відділення заклять', 'Міріам Строут'),
(6, 'Німфадора Тонкс', 'Бойове поранення', 5, 'Відділення магічних травм', 'Август Пай'),
(7, 'Бродерік Боуд', 'Удушення рослиною', 4, 'Відділення укусів та отруєнь', 'Гіппократ Сметвік');
