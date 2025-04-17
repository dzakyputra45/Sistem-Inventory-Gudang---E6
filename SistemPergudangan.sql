CREATE TABLE products (
    product_id CHAR(6) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    stock_quantity INT DEFAULT 0,
);

CREATE TABLE salesman (
    salesman_id CHAR(6) PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    phone VARCHAR(13),
	CONSTRAINT chk_phone_format CHECK (phone LIKE '08%' AND LEN(phone) BETWEEN 3 AND 13)

);

CREATE TABLE delivery (
    delivery_id CHAR(6) PRIMARY KEY,
    delivery_date DATE DEFAULT GETDATE(),
    salesman_id CHAR(6) NULL,
    product_id CHAR(6) NOT NULL,
    quantity INT NOT NULL,
    created_at DATE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_delivery_product FOREIGN KEY (product_id) REFERENCES products(product_id) ON UPDATE CASCADE,
    CONSTRAINT fk_delivery_salesman FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id) ON UPDATE CASCADE
);