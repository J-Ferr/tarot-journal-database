# Tarot Journal Database

A PostgreSQL database project designed to store tarot readings, cards, users, and card positions within each reading.

## Technologies Used

- PostgreSQL
- SQL
- pgAdmin

## Database Overview

This database includes four main tables:

- `users`
- `readings`
- `cards`
- `reading_cards`

## Relationships

- One user can have many readings.
- One reading can have many cards.
- One card can appear in many readings.
- The `reading_cards` table connects readings and cards through a many-to-many relationship.

## Skills Demonstrated

- Relational database design
- Primary and foreign key constraints
- One-to-many relationships
- Many-to-many relationships
- Junction tables
- SQL querying and data analysis
- Data normalization
- Aggregate functions
- Subqueries
- PostgreSQL view creation

## Files

- `tarot_journal_database.sql` - Creates the database tables, inserts sample data, and creates a view.
- `practice_queries.sql` - Contains practice queries for analyzing tarot reading data.

## Example Query

```sql
SELECT *
FROM reading_details
WHERE card_name = 'The Moon';
```

## Learning Objectives

This project was built to strengthen PostgreSQL and SQL skills by designing a normalized relational database, creating relationships between entities, and writing analytical queries using joins, aggregations, subqueries, and views.