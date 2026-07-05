 
CREATE DATABASE  onlinegrocery; 
use onlinegrocery; 
 
CREATE TABLE products ( 
    product_id INT PRIMARY KEY, 
    product_name VARCHAR(100) NOT NUll 
); 
CREATE TABLE prices ( 
    product_id INT PRIMARY KEY, 
    price INT NOT NULL CHECK (price < 100000),
    FOREIGN KEY (product_id) REFERENCES products(product_id) 
); 
CREATE TABLE customers ( 
    customer_id INT PRIMARY KEY, 
    customer_name VARCHAR(100) NOT NULL, 
    bank_account INT NOT NULL 
); 
CREATE TABLE delivery_guys ( 
    delivery_id INT AUTO_INCREMENT PRIMARY KEY, 
    delivery_name VARCHAR(100) NOT NULL 
); 
CREATE TABLE sales ( 
    sale_id INT AUTO_INCREMENT PRIMARY KEY, 
    product_id INT, 
    quantity_sold INT NOT NULL, 
    FOREIGN KEY (product_id) REFERENCES products(product_id) 
); 
CREATE TABLE product_losses ( 
    product_id INT PRIMARY KEY, 
    reason VARCHAR(255), 
    FOREIGN KEY (product_id) REFERENCES products(product_id) 
); 
CREATE TABLE customer_balances ( 
    customer_id INT, 
    balance_amount INT NOT NULL, 
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) 
); 
CREATE TABLE profits ( 
    profit_date DATE, 
    product_id INT, 
    profit_amount INT NOT NULL, 
    FOREIGN KEY (product_id) REFERENCES products(product_id) 
); 
CREATE TABLE customer_carts ( 
    cart_id INT AUTO_INCREMENT PRIMARY KEY, 
    customer_id INT, 
    product_id INT, 
    quantity INT NOT NULL, 
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id), 
    FOREIGN KEY (product_id) REFERENCES products(product_id)); 
INSERT INTO products (product_id, product_name) VALUES 
(1, 'Apple'), 
(2, 'Carrot'), 
(3, 'Shampoo'),
(4, 'Aspirin'), 
(5, 'Chicken'); 
INSERT INTO prices (product_id, price) VALUES 
(1, 50), 
(2, 30), 
(3, 120), 
(4, 150), 
(5, 200); 
INSERT INTO customers (customer_id, customer_name, bank_account) VALUES 
(1, 'Bilal', 8899), 
(2, 'Ubaid', 7799), 
(3, 'Haider', 6655), 
(4, 'Ali', 2244), 
(5, 'Ahmed', 1122); 
INSERT INTO delivery_guys (delivery_name) VALUES 
('Bilal'), ('Ubaid'), ('Haider'), ('Ali'), ('Ahmed'); 
INSERT INTO sales (product_id, quantity_sold) VALUES 
(1, 100), 
(2, 80), 
(3, 50), 
(4, 30), 
(5, 70); 
INSERT INTO product_losses (product_id, reason) VALUES 
(1, 'Damaged in transit'), 
(3, 'Expired stock'); 
INSERT INTO customer_balances (customer_id, balance_amount) VALUES 
(1, 10000), 
(2, 8000), 
(3, 7000), 
(4, 9000), 
(5, 7500); 
INSERT INTO profits (profit_date, product_id, profit_amount) VALUES 
('2025-05-01', 1, 1000), 
('2025-05-02', 2, 800), 
('2025-05-03', 3, 1200), 
('2025-05-04', 4, 600), 
('2025-05-05', 5, 900); 
INSERT INTO customer_carts (customer_id, product_id, quantity) VALUES 
(1, 1, 5), 
(2, 2, 10), 
(3, 3, 2), 
(4, 4, 3), 
(5, 5, 4); 
SELECT p.product_name, pr.price
FROM products p 
INNER JOIN prices pr ON p.product_id = pr.product_id; 
SELECT DISTINCT 
    c.customer_name, 
    p.product_name, 
    cc.quantity, 
    pr.price 
FROM customer_carts cc 
INNER JOIN customers c ON cc.customer_id = c.customer_id 
INNER JOIN products p ON cc.product_id = p.product_id 
INNER JOIN prices pr ON p.product_id = pr.product_id 
ORDER BY c.customer_name; 
SELECT  
    c.customer_name, 
    SUM(cc.quantity * pr.price) AS total_bill 
FROM customer_carts cc 
INNER JOIN customers c ON cc.customer_id = c.customer_id 
INNER JOIN prices pr ON cc.product_id = pr.product_id 
GROUP BY c.customer_name 
ORDER BY total_bill DESC; 
SELECT DISTINCT 
    p.product_name, 
    prf.profit_date, 
    prf.profit_amount 
FROM profits prf 
INNER JOIN products p ON prf.product_id = p.product_id 
ORDER BY prf.profit_date; 
SELECT  
    sum(cc.quantity) AS total_quantitysold 
FROM customer_carts cc; 
select  
    sum(p.profit_amount) as total_profit 
FROM profits as p;
