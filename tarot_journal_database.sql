-- Tarot Journal Database
-- PostgreSQL Project

DROP TABLE IF EXISTS reading_cards;
DROP TABLE IF EXISTS readings;
DROP TABLE IF EXISTS cards;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE readings (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question TEXT NOT NULL,
    reading_date DATE DEFAULT CURRENT_DATE,
    notes TEXT,

    CONSTRAINT fk_user
        FOREIGN KEY (user_id)
        REFERENCES users(id)
);

CREATE TABLE cards (
    id SERIAL PRIMARY KEY,
    card_name VARCHAR(100) NOT NULL,
    suit VARCHAR(50)
);

CREATE TABLE reading_cards (
    id SERIAL PRIMARY KEY,
    reading_id INTEGER NOT NULL,
    card_id INTEGER NOT NULL,
    position VARCHAR(50),
    is_reversed BOOLEAN DEFAULT FALSE,

    CONSTRAINT fk_reading
        FOREIGN KEY (reading_id)
        REFERENCES readings(id),

    CONSTRAINT fk_card
        FOREIGN KEY (card_id)
        REFERENCES cards(id)
);

INSERT INTO users (name, email)
VALUES ('Armando', 'armando@example.com');

INSERT INTO cards (card_name, suit)
VALUES
('The Fool', 'Major Arcana'),
('The Magician', 'Major Arcana'),
('The High Priestess', 'Major Arcana'),
('Death', 'Major Arcana'),
('The Star', 'Major Arcana'),
('The Moon', 'Major Arcana'),
('The Sun', 'Major Arcana');

INSERT INTO readings (user_id, question, notes)
VALUES
(1, 'What energy surrounds my relationship right now?', 'Three card spread'),
(1, 'What should I focus on this month?', 'Monthly guidance reading with one reversed card');

INSERT INTO reading_cards (reading_id, card_id, position, is_reversed)
VALUES
(1, 1, 'Past', false),
(1, 4, 'Present', false),
(1, 5, 'Future', false),
(2, 2, 'Past', false),
(2, 6, 'Present', true),
(2, 7, 'Future', false);

CREATE VIEW reading_details AS
SELECT
    r.id AS reading_id,
    r.question,
    r.reading_date,
    rc.position,
    c.card_name,
    rc.is_reversed
FROM readings r
JOIN reading_cards rc
    ON r.id = rc.reading_id
JOIN cards c
    ON rc.card_id = c.id;
