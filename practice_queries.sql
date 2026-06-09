-- Tarot journal database practice queries

-- 1. View All Reading Details
SELECT *
FROM reading_details;

-- 2. Find readings that contain The Moon
SELECT *
FROM reading_details
WHERE card_name = 'The Moon';

-- 3. Find readings with reversed cards
SELECT * 
FROM  reading_details
WHERE is_reversed = true;

-- 4. Count how many cards are in each reading
SELECT 
    r.id,
    r.question,
    COUNT(rc.id) AS total_cards
FROM readings r
JOIN reading_cards rc
    ON r.id = rc.reading_id
GROUP BY r.id, r.question;

-- 5. Count how many times each card has been pulled
SELECT 
    c.card_name,
    COUNT(rc.id) AS times_pulled
FROM cards c
LEFT JOIN reading_cards rc
    ON c.id = rc.cards_id
GROUP BY c.card_name
ORDER BY times_pulled DESC;

-- 6. Find readings with 3 or more cards
SELECT 
    r.id,
    r.question,
    COUNT(rc.id) AS total_cards
FROM readings r 
JOIN reading_cards rc
    ON r.id = rc.reading_id
GROUP BY r.id, r.question
HAVING COUNT(rc.id) >=3;

-- 7. Find the most recent reading date
SELECT *
FROM readings
WHERE reading_date = (
        SELECT MAX(reading_date)
        FROM readings
);

-- 8. Show readings for Armando
SELECT * 
FROM readings
WHERE user_id = (
    SELECT id
    FROM users
    WHERE name = 'Armando'
);

-- 9. Find cards that have never been pulled
SELECT
    c.card_name
FROM cards c
LEFT JOIN reading_cards rc 
    ON c.id = rc.card_id
WHERE rc.id IS NULL;

-- 10. Get the latest reading by ID
SELECT * 
FROM readings
ORDER BY id DESC
LIMIT 1;

