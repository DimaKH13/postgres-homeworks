SELECT 
    c.company_name, 
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN employees e ON o.employee_id = e.employee_id
JOIN shippers s ON o.ship_via = s.shipper_id
WHERE c.city = 'London' 
  AND e.city = 'London' 
  AND s.company_name = 'United Package';

SELECT 
    p.product_name, 
    p.units_in_stock, 
    s.contact_name, 
    s.phone
FROM products p
JOIN suppliers s ON p.supplier_id = s.supplier_id
JOIN categories c ON p.category_id = c.category_id
WHERE p.discontinued != 1 
  AND p.units_in_stock < 25 
  AND c.category_name IN ('Dairy Products', 'Condiments')
ORDER BY p.units_in_stock ASC;

SELECT 
    c.company_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

SELECT DISTINCT 
    p.product_name
FROM products p
WHERE p.product_id IN (
    SELECT od.product_id 
    FROM order_details od 
    WHERE od.quantity = 10
);