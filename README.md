# Restaurant Orders — SQL Analysis

## Overview

This project uses the Maven Analytics Restaurant Orders dataset to practice SQL data exploration and analysis using MySQL.

The goal is to develop practical SQL skills by answering business questions using a real-world-style relational dataset rather than only completing isolated SQL exercises.

## Dataset

**Source:** Maven Analytics Data Playground
**Dataset:** Restaurant Orders

The dataset contains restaurant menu information and order details.

I am not including the original dataset files in this repository. The repository contains my SQL analysis and documentation of the questions I explored.

---

# Day 1 — SQL Fundamentals

### Concepts Practiced

* `SELECT`
* `FROM`
* `WHERE`
* `ORDER BY`
* `ASC`
* `DESC`
* `COUNT()`
* Column aliases using `AS`

### Questions Explored

* What menu items are available?
* How many menu items are there?
* What is the least expensive item?
* What is the most expensive item?
* How many Italian dishes are available?
* What are the least and most expensive Italian dishes?

See the Day 1 SQL queries:

`day-01.sql`

---

# Day 2 — Aggregation & Order Analysis

## Concepts Practiced

Day 2 introduced several new SQL concepts:

* `GROUP BY`
* Aggregate functions
* `COUNT()`
* `AVG()`
* `DISTINCT`
* `HAVING`
* Subqueries
* Aggregated sorting with `ORDER BY`

---

## 1. Menu Items by Category

### Question

How many dishes are in each category?

### Query

```sql
SELECT 
    category, 
    COUNT(menu_item_id) AS dish_count
FROM menu_items
GROUP BY category;
```

### Result

| Category | Dish Count |
| -------- | ---------: |
| American |          6 |
| Asian    |          8 |
| Mexican  |          9 |
| Italian  |          9 |

### Observation

Italian and Mexican dishes had the highest number of menu items, with 9 dishes each.

---

## 2. Average Price by Category

### Question

What is the average price of dishes in each category?

### Query

```sql
SELECT 
    category, 
    AVG(price) AS average_price
FROM menu_items
GROUP BY category;
```

### Result

| Category | Average Price |
| -------- | ------------: |
| American |        $10.07 |
| Asian    |        $13.48 |
| Mexican  |        $11.80 |
| Italian  |        $16.75 |

### Observation

Italian dishes had the highest average price at approximately $16.75.

---

## 3. Exploring Order Details

### Question

What is the date range of the order data?

### Query

```sql
SELECT 
    MIN(order_date) AS oldest_date,
    MAX(order_date) AS newest_date
FROM order_details;
```

### Result

* Oldest order date: March 1, 2023
* Newest order date: March 31, 2023

The dataset covers one month of order activity.

---

## 4. Counting Unique Orders

### Question

How many orders were made during this period?

### Query

```sql
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM order_details;
```

### Result

**5,370 unique orders**

### What I learned

An order can contain multiple items, so counting rows would not necessarily represent the number of orders.

`DISTINCT` allows me to count each unique `order_id` only once.

---

## 5. Counting Items Ordered

### Question

How many items were ordered?

### Query

```sql
SELECT COUNT(*) AS total_items
FROM order_details;
```

### Result

**12,234 items**

This differs from the number of orders because each order can contain multiple items.

---

## 6. Finding the Largest Orders

### Question

Which orders had the most items?

### Query

```sql
SELECT 
    order_id, 
    COUNT(item_id) AS item_count
FROM order_details
GROUP BY order_id
ORDER BY item_count DESC;
```

### What I learned

`GROUP BY` allowed me to calculate the number of items associated with each individual order.

I then used `ORDER BY ... DESC` to rank the orders from largest to smallest.

---

## 7. Filtering Aggregated Results with HAVING

### Question

How many orders contained more than 12 items?

### Query

```sql
SELECT COUNT(*) AS orders_with_more_than_12_items
FROM (
    SELECT 
        order_id, 
        COUNT(item_id) AS item_count
    FROM order_details
    GROUP BY order_id
    HAVING item_count > 12
) AS item_count;
```

### Result

**20 orders**

### What I learned

`HAVING` is used to filter aggregated results after `GROUP BY`.

For example:

```sql
HAVING COUNT(item_id) > 12
```

allows me to filter orders based on the number of items they contain.

I also introduced **subqueries**, where the result of one query can be used as a temporary table for another query.

---

# Key Takeaways from Day 2

Day 2 was my first significant step from simply retrieving data toward analyzing data.

I learned how to:

1. Group records into categories.
2. Calculate aggregate metrics such as counts and averages.
3. Count unique values using `DISTINCT`.
4. Filter grouped results using `HAVING`.
5. Use subqueries to perform multi-step analysis.
6. Rank aggregated results using `ORDER BY`.

## Next Steps

For the next session, I plan to continue practicing:

* `GROUP BY`
* Aggregate functions
* `HAVING`
* `DISTINCT`
* `LIMIT`

I will then begin working with SQL `JOIN`s and more complex analytical questions.
