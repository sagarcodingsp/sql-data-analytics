-- SECTION 1: DDL (Data Definition Language) & Table Constraints
-- ============================================================================
CREATE DATABASE IF NOT EXISTS class10;
USE class10;
-- Customer Table Creation & Alterations
DROP TABLE IF EXISTS customer;
CREATE TABLE customer (
    name VARCHAR(30), 
    age TINYINT, 
    height DOUBLE, 
    amount INT, 
    dob DATE
);
DESCRIBE customer;
-- Table Schema Alterations
ALTER TABLE customer ADD address VARCHAR(100);
ALTER TABLE customer MODIFY COLUMN name VARCHAR(100);
ALTER TABLE customer CHANGE COLUMN amount sales DOUBLE;
ALTER TABLE customer DROP COLUMN address;
-- Data Constraints (UNIQUE, NOT NULL, DEFAULT, CHECK)
CREATE TABLE emp (
    empid INT UNIQUE,
    name VARCHAR(30) NOT NULL,
    city VARCHAR(30) DEFAULT 'indore'
);
CREATE TABLE vote (
    name VARCHAR(30),
    age INT,
    CONSTRAINT check_age CHECK (age >= 18)
);
-- Foreign Key Relational Schema
DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS customer_ref;
CREATE TABLE customer_ref (
    cid INT NOT NULL PRIMARY KEY,
    name VARCHAR(50)
);
CREATE TABLE sales (
    product VARCHAR(50),
    amount INT,
    cid INT,
    FOREIGN KEY (cid) REFERENCES customer_ref(cid)
);
-- ============================================================================
-- SECTION 2: DML (Data Manipulation Language) & Filtering
-- ============================================================================
INSERT INTO customer_ref VALUES (1, 'ravi'), (2, 'shyam');
INSERT INTO sales VALUES ('biscuit', 3456, 1), ('rice', 346, 2);
-- Aggregations & Math Functions
SELECT 
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    MIN(sales) AS minimum_sales,
    MAX(sales) AS maximum_sales,
    AVG(sales) AS average_sales,
    COUNT(sales) AS total_transactions
FROM store;
-- String Pattern Matching & Wildcards
SELECT DISTINCT name FROM store WHERE name LIKE 'a%th';
SELECT DISTINCT sub_category FROM store WHERE sub_category LIKE '____';
-- Date Range & NULL Filtering
SELECT order_date, sales FROM store WHERE order_date BETWEEN '2016-01-01' AND '2016-04-30';
SELECT * FROM store WHERE post_code IS NULL;
SELECT * FROM store WHERE post_code IS NOT NULL;
-- ============================================================================
-- SECTION 3: Group By, Having, Offset & Pagination
-- ============================================================================
-- Group By & Having (Filtering Aggregated Results)
SELECT 
    category, 
    sub_category,
    ROUND(SUM(sales)) AS Total_Sales,
    ROUND(SUM(profit)) AS Total_Profit,
    ROUND(AVG(qty), 2) AS Average_Quantity
FROM store
GROUP BY category, sub_category
ORDER BY Total_Sales DESC;
-- Profitable & Loss Sub-categories
SELECT 
    sub_category,
    ROUND(SUM(profit)) AS Total_Profit 
FROM store 
GROUP BY sub_category
HAVING Total_Profit < 0
ORDER BY Total_Profit DESC;
-- Pagination (LIMIT & OFFSET)
SELECT name, profit FROM store ORDER BY profit DESC LIMIT 1 OFFSET 1;
-- ============================================================================
-- SECTION 4: Joins (Left, Right, Full Outer Union, Self Join)
-- ============================================================================
-- Left & Right Joins
SELECT * FROM emp LEFT JOIN dep ON emp.depid = dep.depid;
SELECT * FROM emp RIGHT JOIN dep ON emp.depid = dep.depid;
-- Full Outer Join Simulation using UNION
SELECT * FROM emp LEFT JOIN dep ON emp.depid = dep.depid
UNION 
SELECT * FROM emp RIGHT JOIN dep ON emp.depid = dep.depid;
-- Self Join (Employee - Manager Hierarchy)
SELECT 
    e.name AS employee_name, 
    m.name AS manager_name 
FROM emp AS e 
JOIN emp AS m ON e.manager_id = m.empid;
-- ============================================================================
-- SECTION 5: Subqueries & Common Table Expressions (CTEs)
-- ============================================================================
-- Subquery: Sales greater than Average
SELECT name, sales FROM store WHERE sales >= (SELECT AVG(sales) FROM store);
-- CTE: P&L Classification
WITH pnl_summary AS (
    SELECT profit, IF(profit > 0, 'Profit', 'Loss') AS pnl FROM store
)
SELECT 
    pnl,
    COUNT(profit) AS transaction_count,
    SUM(profit) AS total_amount,
    AVG(profit) AS avg_amount
FROM pnl_summary
GROUP BY pnl;
