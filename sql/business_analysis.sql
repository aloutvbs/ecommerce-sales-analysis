-- ============================================
-- BUSINESS ANALYSIS - Sales Data
-- Database: sales_data (3933 rows)
-- By : Alya Shandy
-- ============================================

-- Query 1: Total Revenue
SELECT SUM(revenue) AS total_revenue
FROM sales_data
WHERE order_status = 'Completed';

-- Query 2: Total Orders
SELECT COUNT(*) AS total_orders
FROM sales_data
WHERE order_status = 'Completed';

-- Query 3: Average Order Value
SELECT ROUND(SUM(revenue) / COUNT(*), 2) AS avg_order_value
FROM sales_data
WHERE order_status = 'Completed';

-- Query 4: Top Products
SELECT product_name,
       SUM(revenue) AS total_revenue,
       SUM(quantity) AS total_quantity
FROM sales_data
WHERE order_status = 'Completed'
GROUP BY product_name
ORDER BY total_revenue DESC
LIMIT 10;

-- Query 5: Top Categories
SELECT category,
       SUM(revenue) AS total_revenue,
       SUM(quantity) AS total_quantity
FROM sales_data
WHERE order_status = 'Completed'
GROUP BY category
ORDER BY total_revenue DESC;

-- Query 6: Monthly Sales
SELECT DATE_FORMAT(STR_TO_DATE(order_date, '%m/%d/%Y'), '%Y-%m') AS month,
       SUM(revenue) AS total_revenue,
       COUNT(*) AS total_orders
FROM sales_data
WHERE order_status = 'Completed'
GROUP BY month
ORDER BY month;

-- Query 7: Regional Sales
SELECT region,
       SUM(revenue) AS total_revenue,
       COUNT(*) AS total_orders
FROM sales_data
WHERE order_status = 'Completed'
GROUP BY region
ORDER BY total_revenue DESC;

-- Query 8: Repeat Customers
SELECT customer_id,
       customer_name,
       COUNT(*) AS total_orders
FROM sales_data
WHERE order_status = 'Completed'
GROUP BY customer_id, customer_name
HAVING COUNT(*) > 1
ORDER BY total_orders DESC;

-- Query 9: Highest-Value Customers
SELECT customer_id,
       customer_name,
       SUM(revenue) AS total_spent,
       COUNT(*) AS total_orders
FROM sales_data
WHERE order_status = 'Completed'
GROUP BY customer_id, customer_name
ORDER BY total_spent DESC
LIMIT 10;

-- Query 10: Lowest-Performing Products
SELECT product_name,
       SUM(revenue) AS total_revenue,
       SUM(quantity) AS total_quantity
FROM sales_data
WHERE order_status = 'Completed'
GROUP BY product_name
ORDER BY total_revenue ASC
LIMIT 10;

-- Query 11: Growth MoM (Month-over-Month)
SELECT month,
       total_revenue,
       ROUND(
         (total_revenue - LAG(total_revenue) OVER (ORDER BY month))
         / LAG(total_revenue) OVER (ORDER BY month) * 100, 2
       ) AS growth_pct
FROM (
    SELECT DATE_FORMAT(STR_TO_DATE(order_date, '%m/%d/%Y'), '%Y-%m') AS month,
           SUM(revenue) AS total_revenue
    FROM sales_data
    WHERE order_status = 'Completed'
    GROUP BY month
) AS monthly
ORDER BY month;

-- Query 12: Category Contribution (%)
SELECT category,
       SUM(revenue) AS category_revenue,
       ROUND(SUM(revenue) / (SELECT SUM(revenue) FROM sales_data WHERE order_status = 'Completed') * 100, 2) AS contribution_pct
FROM sales_data
WHERE order_status = 'Completed'
GROUP BY category
ORDER BY contribution_pct DESC;

-- Query 13: Average Revenue per Customer
SELECT ROUND(SUM(revenue) / COUNT(DISTINCT customer_id), 2) AS avg_revenue_per_customer
FROM sales_data
WHERE order_status = 'Completed';

-- Query 14: Sales by Weekday
SELECT DAYNAME(STR_TO_DATE(order_date, '%m/%d/%Y')) AS weekday,
       SUM(revenue) AS total_revenue,
       COUNT(*) AS total_orders
FROM sales_data
WHERE order_status = 'Completed'
GROUP BY weekday
ORDER BY FIELD(weekday, 'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday');

-- Query 15: Sales Trend (Cumulative Revenue)
SELECT month,
       total_revenue,
       SUM(total_revenue) OVER (ORDER BY month) AS cumulative_revenue
FROM (
    SELECT DATE_FORMAT(STR_TO_DATE(order_date, '%m/%d/%Y'), '%Y-%m') AS month,
           SUM(revenue) AS total_revenue
    FROM sales_data
    WHERE order_status = 'Completed'
    GROUP BY month
) AS monthly
ORDER BY month;