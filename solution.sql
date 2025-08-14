-- Active: 1754991264628@@127.0.0.1@5432@psql_task
-- Create department table
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    manager_id INT
);