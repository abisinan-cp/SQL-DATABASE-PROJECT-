# Gym Management Database (FIT_LIFE)

A MySQL relational database for managing a gym: membership plans, members, trainers, classes and class bookings.

**Author:** Abisinan.cp

## Database Structure

The `FIT_LIFE` database has 5 tables:

| Table | Purpose |
|---|---|
| `membership_plans` | Plan types, duration and price |
| `members` | Gym members and their chosen plan |
| `trainers` | Trainers and their specialization |
| `classes` | Scheduled classes and the trainer who teaches them |
| `bookings` | Which member booked which class, and whether they attended |

## Table Relationships

```
membership_plans ──(plan_id)──► members ──(member_id)──┐
trainers ──(trainer_id)──► classes ──(class_id)────────┴──► bookings
```

| Child column | References |
|---|---|
| `members.plan_id` | `membership_plans.plan_id` |
| `classes.trainer_id` | `trainers.trainer_id` |
| `bookings.member_id` | `members.member_id` |
| `bookings.class_id` | `classes.class_id` |

`bookings` is a junction table that handles the many-to-many relationship between members and classes.

## Concepts Used

- Primary keys with `AUTO_INCREMENT`
- Foreign keys for referential integrity
- `NOT NULL` and `UNIQUE` constraints
- `JOIN` queries across multiple tables

## How to Run

1. Run the script in MySQL Workbench.
2. Create tables in this order: `membership_plans`, `trainers`, `members`, `classes`, `bookings`. Parent tables must come before child tables.
3. Insert the sample data, then verify with `SHOW TABLES;`.

## Sample Query

Show each booking with the member, class and trainer names:

```sql
SELECT m.full_name, c.class_name, t.trainer_name, b.booking_date, b.attended
FROM bookings b
JOIN members m  ON b.member_id  = m.member_id
JOIN classes c  ON b.class_id   = c.class_id
JOIN trainers t ON c.trainer_id = t.trainer_id;
```

## Tools

MySQL, MySQL Workbench


<img width="533" height="356" alt="Screenshot 2026-11-24 193411" src="https://github.com/user-attachments/assets/4287ba0b-25ad-41e2-9fc9-e70ee96ef619" />

