-- SQL Practice: Restaurant Orders
-- Dataset: Maven Analytics Restaurant Orders

-- What are the menu items?
SELECT *
FROM menu_items;

-- What is the total number of items?
SELECT COUNT(*) AS total_items
FROM menu_items;

-- What are the least expensive items?
SELECT *
FROM menu_items
ORDER BY price ASC;

-- What are the most expensive items?
SELECT *
FROM menu_items
ORDER BY price DESC;

-- How many Italian dishes are on the menu?
SELECT COUNT(*) AS italian_dishes
FROM menu_items
WHERE category = 'Italian';

-- Least expensive Italian dishes
SELECT *
FROM menu_items
WHERE category = 'Italian'
ORDER BY price ASC;

-- Most expensive Italian dishes
SELECT *
FROM menu_items
WHERE category = 'Italian'
ORDER BY price DESC;
