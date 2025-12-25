# Vehicle Rental System - Database Design & SQL Queries

## Overview & Objectives

This project is designed to evaluate my understanding of database table design, ERD relationships and SQL queries. I will work with a simplified Vehicle Rental System database.

- Design an ERD with 1 to 1, 1 to Many and Many to 1 relationships
- Understand primary keys and foreign keys
- Write SQL queries using JOIN, NOT EXISTS, WHERE and GROUP BY, HAVING

[← Main Project Requirment](https://github.com/Apollo-Level2-Web-Dev/B6A3/blob/main/README.md)

## ERD Design

Design an Entity Relationship Diagram (ERD) for the Vehicle Rental System.

[ERD Design Link](https://drawsql.app/teams/saiyam-erd/diagrams/vehicle-rental-system-erd)

## Documentation

### Explanation of the project queries.sql

### Query 1: JOIN

Retrieve booking information along with:

- Customer name
- Vehicle name

**Concepts used**: INNER JOIN

**SQL Query:**

```sql
SELECT
    b.booking_id,
    u.name AS customer_name,
    v.name AS vehicle_name,
    b.start_date,
    b.end_date,
    b.status
FROM
    bookings AS b
    INNER JOIN users AS u USING (user_id)
    INNER JOIN vehicles AS v USING (vehicle_id);
```

**Explanation:**
This query uses two INNER JOINs to combine data from three tables. It retrieves booking details by joining the `bookings` table with `users` (to get customer name) and `vehicles` (to get vehicle name). The `USING` clause matches on shared column names (`user_id` and `vehicle_id`), returning only rows where all three tables have matching records.

### Query 2: NOT EXISTS

Retrieve all vehicles that have never been booked.

**Concepts used**: NOT EXISTS, Subquery

**SQL Query:**

```sql
SELECT
    *
FROM
    vehicles
WHERE
    NOT EXISTS (
        SELECT
            vehicle_id
        FROM
            bookings
        WHERE
            bookings.vehicle_id = vehicles.vehicle_id
    );
```

**Explanation:**
This query finds vehicles with no bookings by using NOT EXISTS. For each vehicle, the subquery checks if any bookings exist. If no bookings are found, the condition is true and the vehicle is returned.

### Query 3: WHERE with Multiple Conditions

Retrieve all available cars.

**Concepts used**: WHERE clause with AND operator

**SQL Query:**

```sql
SELECT * FROM vehicles WHERE status = 'available' AND type = 'car';
```

**Explanation:**
This simple query filters vehicles using multiple WHERE conditions combined with AND, returning only cars with an 'available' status.

### Query 4: GROUP BY and HAVING

Retrieve vehicles with more than 2 bookings.

**Concepts used**: GROUP BY, HAVING, COUNT(), JOIN

**SQL Query:**

```sql
SELECT
    v.name AS vehicle_name,
    COUNT(*) AS total_bookings
FROM
    bookings
    JOIN vehicles AS v USING (vehicle_id)
GROUP BY
    v.name
HAVING
    COUNT(*) > 2;
```

**Explanation:**
This query groups bookings by vehicle and counts them. The HAVING clause filters groups to show only vehicles with more than 2 bookings, providing a summary of frequently booked vehicles.

---

**Made with ❤️ by Sheikh Saiyam**
