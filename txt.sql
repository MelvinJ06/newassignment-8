CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    address VARCHAR(255)
);
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    description TEXT
);
INSERT INTO customers (name, email, address) 
VALUES 
('John', 'john@example.com', '123 Elm Street'),
('Jane ', 'jane@example.com', '456 Oak Avenue'),
('Alice', 'alice@example.com', '789 Pine Road');

INSERT INTO orders (customer_id, order_date, total_amount) 
VALUES 
(1, '2024-09-20', 150.00),
(2, '2024-09-21', 200.00),
(3, '2024-09-22', 250.00);

INSERT INTO products (name, price, description) 
VALUES 
('Laptop', 1000.00, '15-inch screen, 8GB RAM, 512GB SSD'),
('Smartphone', 800.00, '5G, 128GB storage, 12MP camera'),
('Headphones', 150.00, 'Wireless, Noise-cancelling');

SELECT DISTINCT c.name, c.email, c.address
FROM customers c
JOIN orders o ON c.id = o.customer_id
WHERE o.order_date >= CURDATE() - INTERVAL 30 DAY;


SELECT c.name, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.id = o.customer_id
GROUP BY c.name;

UPDATE products
SET price = 45.00
WHERE name = 'Headphones';


ALTER TABLE products
ADD COLUMN discount DECIMAL(5, 2) DEFAULT 0.00;

SELECT name, price
FROM products
ORDER BY price DESC
LIMIT 3;

SELECT DISTINCT c.name
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
WHERE p.name = 'Laptop';

SELECT c.name, o.order_date
FROM customers c
JOIN orders o ON c.id = o.customer_id;

SELECT c.name, o.order_date
FROM customers c
JOIN orders o ON c.id = o.customer_id;

CREATE TABLE order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

SELECT AVG(total_amount) AS average_order_total
FROM orders;


