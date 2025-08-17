-- Active: 1754991264628@@127.0.0.1@5432@psql_task
-- Create department table
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    manager_id INT
);


-- create employees table
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    hire_date DATE NOT NULL,
    salary NUMERIC(10, 2) NOT NULL,
    department_id INT REFERENCES departments (department_id),
    is_active BOOLEAN
);

-- insert data into departments table
INSERT INTO
    departments (department_name, manager_id)
VALUES ('Human Resources', 1),
    ('Finance', 2),
    ('Engineering', 4);

SELECT * FROM departments;


-- insert data into employees table
INSERT INTO
    employees (
        first_name,
        last_name,
        hire_date,
        salary,
        department_id,
        is_active
    )
VALUES (
        'John',
        'Doe',
        '2021-05-10',
        50000.00,
        1,
        TRUE
    ),
    (
        'Jane',
        'Smith',
        '2022-03-15',
        62000.00,
        2,
        TRUE
    ),
    (
        'Alice',
        'Johnson',
        '2023-01-20',
        55000.00,
        1,
        FALSE
    ),
    (
        'Bob',
        'Davis',
        '2020-11-30',
        72000.00,
        3,
        TRUE
    );

SELECT * FROM employees;


INSERT INTO
    employees (
        first_name,
        last_name,
        hire_date,
        salary,
        department_id,
        is_active
    )
VALUES (
        'Isha',
        'khan',
        '2021-05-10',
        50000.00,
        15,
        TRUE
    );

    -- Select all active employees.
SELECT * FROM employees WHERE is_active = TRUE;