-- ============================================================
-- DAY 2: SQL AGGREGATION & ORDER ANALYSIS
-- Dataset: Maven Analytics - Restaurant Orders
-- Database: MySQL
--
-- Concepts practiced:
--   - GROUP BY
--   - COUNT()
--   - AVG()
--   - DISTINCT
--   - HAVING
--   - Subqueries
--   - ORDER BY
-- ============================================================


-- ============================================================
-- SECTION 1: MENU ITEM ANALYSIS
-- ============================================================

-- Question 1:
-- How many dishes are in each category?

SELECT 
    category, 
    COUNT(menu_item_id) AS dish_count
FROM menu_items
GROUP BY category;


-- Question 2:
-- What is the average price of dishes in each category?

SELECT 
    category, 
    AVG(price) AS average_price
FROM menu_items
GROUP BY category;


-- ============================================================
-- SECTION 2: ORDER DATA EXPLORATION
-- ============================================================

-- Question 3:
-- View the order_details table.

SELECT *
FROM order_details;


-- Question 4:
-- What is the date range of the order_details table?

SELECT *
FROM order_details
ORDER BY order_date ASC;


-- Question 5:
-- How many unique orders were made?

SELECT COUNT(DISTINCT order_id) AS total_orders
FROM order_details;


-- Question 6:
-- How many items were ordered?

SELECT COUNT(*) AS total_items
FROM order_details;


-- ============================================================
-- SECTION 3: ORDER SIZE ANALYSIS
-- ============================================================

-- Question 7:
-- Which orders had the most number of items?

SELECT 
    order_id, 
    COUNT(item_id) AS item_count
FROM order_details
GROUP BY order_id
ORDER BY item_count DESC;


-- Question 8:
-- How many orders had more than 12 items?

SELECT COUNT(*) AS orders_with_more_than_12_items
FROM (
    SELECT 
        order_id, 
        COUNT(item_id) AS item_count
    FROM order_details
    GROUP BY order_id
    HAVING item_count > 12
) AS item_count;
