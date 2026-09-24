CREATE TABLE student (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birthday DATE,
    phone VARCHAR(20)
);


ALTER TABLE student ADD COLUMN middle_name VARCHAR(50);


ALTER TABLE student DROP COLUMN middle_name;


ALTER TABLE student RENAME COLUMN birthday TO birth_date;


ALTER TABLE student ALTER COLUMN phone TYPE VARCHAR(32);


INSERT INTO student (first_name, last_name, birth_date, phone) 
VALUES 
('Иван', 'Иванов', '2000-01-15', '1234567890'),
('Петр', 'Петров', '1999-05-20', '0987654321'),
('Анна', 'Сидорова', '2001-11-30', '1122334455');


TRUNCATE TABLE student RESTART IDENTITY;