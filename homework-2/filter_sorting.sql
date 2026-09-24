SELECT * 
FROM orders 
WHERE ship_country IN ('France', 'Germany', 'Spain');

SELECT DISTINCT ship_country, ship_city 
FROM orders 
ORDER BY ship_country, ship_city;

SELECT AVG(shipped_date - order_date) AS average_delivery_days
FROM orders 
WHERE ship_country = 'Germany';

SELECT MIN(unit_price) AS min_price, MAX(unit_price) AS max_price
FROM products 
WHERE discontinued != 1;

SELECT MIN(unit_price) AS min_price, MAX(unit_price) AS max_price
FROM products 
WHERE discontinued != 1 AND units_in_stock >= 20;