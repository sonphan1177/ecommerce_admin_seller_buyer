-- Tạo database (cơ sở dữ liệu)
CREATE DATABASE ecommerce;
USE ecommerce;

-- Bảng roles (vai trò người dùng)
CREATE TABLE roles (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL
);

-- Dữ liệu vai trò
INSERT INTO roles (name) VALUES
('admin'),  -- quản trị
('seller'), -- người bán
('buyer');  -- người mua

-- Bảng users (người dùng)
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50),  -- tên đăng nhập
    password VARCHAR(255), -- mật khẩu
    role_id INT,           -- vai trò
    FOREIGN KEY (role_id) REFERENCES roles(id)
);

-- Bảng products (sản phẩm)
CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100), -- tên sản phẩm
    price FLOAT,       -- giá
    seller_id INT,     -- người bán
    FOREIGN KEY (seller_id) REFERENCES users(id)
);

-- Bảng orders (đơn hàng)
CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    buyer_id INT,   -- người mua
    total FLOAT,    -- tổng tiền
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (buyer_id) REFERENCES users(id)
);

-- Bảng order_items (chi tiết đơn hàng)
CREATE TABLE order_items (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,   -- đơn hàng
    product_id INT, -- sản phẩm
    quantity INT,   -- số lượng
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);
