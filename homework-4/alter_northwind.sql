ALTER TABLE products ADD CONSTRAINT check_unit_price CHECK (unit_price > 0);

ALTER TABLE products ADD CONSTRAINT check_discontinued CHECK (discontinued IN (0, 1));

CREATE TABLE discontinued_products AS 
SELECT * FROM products WHERE discontinued = 1;

ALTER TABLE order_details DROP CONSTRAINT fk_order_details_products;

ALTER TABLE order_details 
ADD CONSTRAINT fk_order_details_products 
FOREIGN KEY (product_id) REFERENCES products(product_id) 
ON DELETE CASCADE;

DELETE FROM products WHERE discontinued = 1;