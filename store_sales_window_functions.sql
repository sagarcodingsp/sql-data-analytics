sql

SELECT * FROM store;
-- 2. Sales Categorization (Fixed Top-to-Bottom Logic)
SELECT 
    name,
    sales, 
    CASE 
        WHEN sales > 1000 THEN 'High'
        WHEN sales > 500  THEN 'Mid'
        WHEN sales > 100  THEN 'Low'
        ELSE 'Very Low'
    END AS sales_category
FROM store;
-- 3. Handle NULL Postal Codes using COALESCE
SELECT 
    name, 
    COALESCE(post_code, city) AS contact_location 
FROM store;
-- 4. Ranking Stores by Sales (RANK vs DENSE_RANK vs ROW_NUMBER)
SELECT 
    name, 
    sales, 
    RANK() OVER (ORDER BY sales DESC) AS sales_rank,
    DENSE_RANK() OVER (ORDER BY sales DESC) AS sales_dense_rank,
    ROW_NUMBER() OVER (ORDER BY sales DESC) AS row_num
FROM store;
-- 5. Ranking Stores by Quantity Sold
SELECT 
    name, 
    qty, 
    RANK() OVER (ORDER BY qty DESC) AS qty_rank,
    DENSE_RANK() OVER (ORDER BY qty DESC) AS qty_dense_rank,
    ROW_NUMBER() OVER (ORDER BY qty DESC) AS qty_row_num
FROM store;
-- 6. Partitioned Ranking by Region
SELECT 
    name, 
    region, 
    city,
    DENSE_RANK() OVER (PARTITION BY region ORDER BY city DESC) AS regional_rank 
FROM store;
