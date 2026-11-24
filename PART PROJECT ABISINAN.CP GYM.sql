create database FIT_LIFE;
USE FIT_LIFE;

-- membership plans  details table 
create table membership_plans (
plan_id  int primary key auto_increment,
plan_name varchar(50) not null,
duration_months int not null,
price  decimal(8,2) not	null
);

INSERT INTO membership_plans (plan_name, duration_months, price) VALUES
('Monthly', 1, 1500.00), 
('Quarterly', 3, 4000.00), 
('Annual', 12, 12000.00);


-- members table 
create table MEMBERS (
member_id int primary key auto_increment , 
full_name varchar(100)	not null ,
email varchar(100) unique,
phone varchar(15),
gender varchar(10),
join_date date not null ,
plan_id int ,
foreign key(plan_id) references membership_plans(plan_id)
);
INSERT INTO members (full_name, email, phone, gender, join_date, plan_id) VALUES
('Tony Stark',      'tony@mail.com',    '9876500001', 'Male',   '2026-01-15', 3),
('Bruce Banner',    'bruce@mail.com',   '9876500002', 'Male',   '2026-03-02', 2),
('Natasha Romanoff','natasha@mail.com', '9876500003', 'Female', '2026-04-10', 1),
('Steve Rogers',    'steve@mail.com',   '9876500004', 'Male',   '2026-05-21', 2),
('Clint Barton',    'clint@mail.com',   '9876500005', 'Male',   '2026-07-05', 3),
('Wanda Maximoff',  'wanda@mail.com',   '9876500006', 'Female', '2026-09-18', 1);



-- trainners table 
create table trainers (
trainer_id int primary key auto_increment,
trainer_name varchar(100) not null ,
specialization varchar(50),
hire_date date 
);

INSERT INTO trainers (trainer_name, specialization, hire_date) VALUES
('bruce wayne ', 'Strength', '2023-02-10'),
('selina kyle', 'cardio', '2022-08-01');


-- table for classes 
create table classes (
class_id int primary key auto_increment,
class_name varchar(50) not null,
trainer_id int ,
schedule_day varchar(10),
start_time time ,
capacity int ,
foreign key (trainer_id) references trainers (trainer_id)
);

INSERT INTO classes (class_name, trainer_id, schedule_day, start_time, capacity) VALUES
('Power Lifting', 1, 'Monday',  '06:00:00', 15),
('Morning Cardio', 2, 'Tuesday', '07:00:00', 20);

-- table for booking 
create table Bookings (
    booking_id   INT PRIMARY KEY AUTO_INCREMENT,
    member_id    INT,
    class_id     INT,
    booking_date DATE NOT NULL,
    attended     BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (class_id)  REFERENCES classes(class_id)
);

INSERT INTO Bookings (member_id, class_id, booking_date, attended) VALUES
(1, 1, '2026-11-17', TRUE),
(2, 2, '2026-11-18', TRUE),
(3, 2, '2026-11-18', TRUE),
(4, 1, '2026-11-19', FALSE),
(5, 1, '2026-11-20', TRUE),
(6, 2, '2026-11-21', FALSE);

SELECT * FROM membership_plans;
SELECT * FROM members;
SELECT * FROM trainers;
SELECT * FROM classes;
SELECT * FROM bookings;



