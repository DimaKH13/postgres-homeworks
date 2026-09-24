
SELECT contact_name, city 
FROM customers;

SELECT order_id, shipped_date - order_date AS days_difference 
FROM orders;

SELECT DISTINCT city 
FROM customers;

SELECT COUNT(*) AS total_orders 
FROM orders;

SELECT COUNT(DISTINCT ship_country) AS total_countries 
FROM orders; 