USE project;

CREATE TABLE CUSTOMER (
    customer_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(20) NOT NULL,
    customer_contact VARCHAR(20) NOT NULL
);

CREATE TABLE EMPLOYEE (
    employee_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(20) NOT NULL,
    employee_contact VARCHAR(20) NOT NULL,
    employee_password VARCHAR(100) NOT NULL,
    employee_JoinDate DATE NOT NULL,
    employee_Salary BIGINT NOT NULL,
    employee_Address VARCHAR(200) NOT NULL
);

CREATE TABLE PRODUCT (
    product_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(20) NOT NULL,
    exp_date DATE,
    product_availability BIGINT NOT NULL,
    product_make_price BIGINT NOT NULL,
    product_sell_price BIGINT NOT NULL
);

CREATE TABLE `ORDER` (
    order_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    customer_id BIGINT NOT NULL,
    order_date DATETIME NOT NULL,
    order_total BIGINT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer (customer_id)
);
RENAME TABLE `ORDER` TO ORDERS;

CREATE TABLE ORDER_DETAILS (
    order_did BIGINT PRIMARY KEY AUTO_INCREMENT,
    product_quantity BIGINT NOT NULL,
    order_status varchar(20),
    order_price bigint
);

CREATE TABLE SUPPLIER (
    supplier_id BIGINT NOT NULL AUTO_INCREMENT,
    supplier_name VARCHAR(20) NOT NULL,
    supplier_contact VARCHAR(255) NOT NULL,
    supply_address VARCHAR(200) NOT NULL,
    PRIMARY KEY (supplier_id)
);

CREATE TABLE INGREDIENT (
    ingredient_id BIGINT NOT NULL AUTO_INCREMENT,
    ingredient_name VARCHAR(255) NOT NULL,
    ingredient_price BIGINT NOT NULL,
    Ingredient_quantity FLOAT NOT NULL,
    Ingredient_type VARCHAR(10),
    PRIMARY KEY (ingredient_id)
);

CREATE TABLE Supplies (
    ingredient_id BIGINT PRIMARY KEY,
    supplier_id BIGINT NOT NULL,
    supply_quantity BIGINT NOT NULL,
    supply_date DATE NOT NULL,
    supply_cost BIGINT NOT NULL,
    FOREIGN KEY (ingredient_id) REFERENCES ingredient (ingredient_id),
    FOREIGN KEY (supplier_id) REFERENCES supplier (supplier_id)
);

CREATE TABLE Pays (
    customer_id BIGINT NOT NULL,
    employee_id BIGINT NOT NULL,
    payment_mode VARCHAR(20) NOT NULL,
    payment_date DATETIME NOT NULL,
    PRIMARY KEY(customer_id),
    FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
    FOREIGN KEY (employee_id) REFERENCES employee (employee_id)
);

CREATE TABLE Makes (
    employee_id BIGINT NOT NULL,
    order_id BIGINT NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employee (employee_id),
    FOREIGN KEY (order_id) REFERENCES `order` (order_id),
    PRIMARY KEY(order_id)
);

create table Need (
    product_id bigint not null,
    ingredient_id bigint not null,
    need_quantity bigint not null,
    FOREIGN KEY (product_id) REFERENCES product (product_id),
    FOREIGN KEY (ingredient_id) REFERENCES ingredient (ingredient_id),
    primary key(product_id, ingredient_id)
);

CREATE TABLE Has (
	order_id BIGINT,
    order_did BIGINT,
    FOREIGN KEY(order_id) REFERENCES `order`(order_id),
    FOREIGN KEY(order_did) REFERENCES `order_details`(order_did),
    PRIMARY KEY(order_did)
);

CREATE TABLE `Of`(
    order_did BIGINT,
    product_id BIGINT,
    FOREIGN KEY(order_did) REFERENCES order_details(order_did),
    FOREIGN KEY(product_id) REFERENCES product(product_id),
    PRIMARY KEY(order_did)
);

#data


-- CUSTOMER table
INSERT INTO CUSTOMER (customer_name, customer_contact) VALUES
('Emma Thompson', '555-123-4567'),
('Michael Johnson', '444-789-1234'),
('Sarah Lee', '666-222-3333'),
('David Brown', '777-555-8888'),
('Emily White', '888-777-6666'),
('Chris Harris', '999-444-3333'),
('Rachel Smith', '333-666-9999'),
('Daniel Taylor', '222-888-7777'),
('Michelle Martinez', '111-333-5555'),
('Robert Davis', '555-777-2222');

-- EMPLOYEE table
INSERT INTO EMPLOYEE (employee_name, employee_contact, employee_password, employee_JoinDate, employee_Salary, employee_Address) VALUES
('John Johnson', '111-222-3333', 'password123', '2023-01-15', 60000, '123 Main St'),
('Sarah Williams', '333-444-5555', 'securepassword', '2022-08-20', 55000, '456 Elm St'),
('David Wilson', '666-777-8888', 'password321', '2023-05-10', 58000, '789 Oak St'),
('Jessica Miller', '999-000-1111', 'strongpassword', '2024-02-15', 62000, '101 Pine St'),
('Brian Taylor', '222-333-4444', 'password456', '2022-12-01', 54000, '202 Cedar St'),
('Laura Anderson', '444-555-6666', 'letmein', '2023-09-05', 57000, '303 Maple St'),
('Kevin Garcia', '777-888-9999', 'changeme', '2023-11-20', 59000, '404 Walnut St'),
('Amanda Martinez', '888-999-0000', 'password1234', '2022-06-10', 63000, '505 Cherry St'),
('Steven Clark', '111-222-3333', 'qwerty', '2023-03-15', 61000, '606 Pineapple St'),
('Jennifer Adams', '555-666-7777', 'password!@#', '2024-01-20', 64000, '707 Banana St');

-- PRODUCT table
INSERT INTO PRODUCT (product_name, exp_date, product_availability, product_make_price, product_sell_price) VALUES
('Bananas', '2024-03-31', 150, 1, 2),
('Oranges', '2024-04-15', 120, 2, 3),
('Tomatoes', '2024-04-10', 100, 3, 4),
('Potatoes', '2024-03-25', 200, 2, 3),
('Onions', '2024-04-05', 180, 1, 2),
('Carrots', '2024-04-30', 220, 2, 3),
('Spinach', '2024-03-22', 130, 2, 3),
('Lettuce', '2024-03-28', 140, 1, 2),
('Cucumbers', '2024-04-03', 160, 2, 3),
('Peppers', '2024-04-08', 110, 2, 3);

-- ORDER table
INSERT INTO `ORDER` (customer_id, order_date, order_total) VALUES
(1, '2024-03-21 10:30:00', 12),
(2, '2024-03-21 11:45:00', 9),
(3, '2024-03-20 09:15:00', 18),
(4, '2024-03-20 13:00:00', 15),
(5, '2024-03-19 14:30:00', 24),
(6, '2024-03-18 12:00:00', 11),
(7, '2024-03-17 10:30:00', 8),
(8, '2024-03-16 11:45:00', 14),
(9, '2024-03-15 09:15:00', 20),
(10, '2024-03-14 13:00:00', 17);

-- ORDER_DETAILS table
-- Inserting data into ORDER_DETAILS table
INSERT INTO ORDER_DETAILS (order_did, product_quantity, order_status, order_price) VALUES
(1, 3, 'Processing', 12),
(2, 2, 'Shipped', 9),
(3, 5, 'Delivered', 18),
(4, 4, 'Processing', 15),
(5, 6, 'Shipped', 24),
(6, 3, 'Delivered', 11),
(7, 2, 'Processing', 8),
(8, 4, 'Shipped', 14),
(9, 5, 'Delivered', 20),
(10, 3, 'Processing', 17);

-- SUPPLIER table
INSERT INTO SUPPLIER (supplier_name, supplier_contact, supply_address) VALUES
('Fresh Produce Inc.', '111-222-3333', '123 Supplier St'),
('Organic Farms Ltd.', '444-555-6666', '456 Farm St'),
('Quality Meats Inc.', '777-888-9999', '789 Quality St'),
('Global Foods Ltd.', '888-999-0000', '321 Global St'),
('Garden Fresh Co.', '111-222-3333', '567 Garden St'),
('Natures Bounty Inc.', '333-444-5555', '890 Nature St'),
('Green Harvest Farms', '666-777-8888', '987 Harvest St'),
('Premium Produce Ltd.', '999-000-1111', '654 Premium St'),
('Farm Fresh Foods', '222-333-4444', '321 Farm St'),
('Fresh Market Inc.', '555-666-7777', '456 Market St');

-- INGREDIENT table
INSERT INTO INGREDIENT (ingredient_name, ingredient_price, Ingredient_quantity, Ingredient_type) VALUES
('Flour', 5, 100, 'Dry'),
('Sugar', 3, 80, 'Dry'),
('Milk', 2, 120, 'Liquid'),
('Eggs', 4, 90, 'Raw'),
('Salt', 1, 150, 'Dry'),
('Pepper', 2, 120, 'Dry'),
('Olive Oil', 7, 80, 'Liquid'),
('Garlic', 3, 100, 'Raw'),
('Onion Powder', 2, 120, 'Dry'),
('Paprika', 4, 90, 'Dry');

-- Supplies table
INSERT INTO Supplies (ingredient_id, supplier_id, supply_quantity, supply_date, supply_cost) VALUES
(1, 1, 50, '2024-03-15', 100),
(2, 1, 40, '2024-03-16', 120),
(3, 2, 60, '2024-03-17', 80),
(4, 3, 70, '2024-03-18', 140),
(5, 4, 90, '2024-03-19', 110),
(6, 5, 80, '2024-03-20', 100),
(7, 6, 100, '2024-03-21', 130),
(8, 7, 70, '2024-03-22', 90),
(9, 8, 120, '2024-03-23', 150),
(10, 9, 110, '2024-03-24', 120);

-- Pays table
INSERT INTO Pays (customer_id, employee_id, payment_mode, payment_date) VALUES
(1, 1, 'Credit Card', '2024-03-21 10:45:00'),
(2, 2, 'Cash', '2024-03-21 12:00:00'),
(3, 3, 'Credit Card', '2024-03-20 09:30:00'),
(4, 4, 'Cash', '2024-03-20 13:15:00'),
(5, 5, 'Debit Card', '2024-03-19 15:00:00'),
(6, 6, 'Credit Card', '2024-03-18 14:30:00'),
(7, 7, 'Cash', '2024-03-17 16:00:00'),
(8, 8, 'Debit Card', '2024-03-16 17:45:00'),
(9, 9, 'Credit Card', '2024-03-15 11:30:00'),
(10, 10, 'Cash', '2024-03-14 13:15:00');

-- Makes table
INSERT INTO Makes (employee_id, order_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Need table
INSERT INTO Need (product_id, ingredient_id, need_quantity) VALUES
(1, 1, 10),
(1, 2, 5),
(2, 3, 10),
(3, 4, 15),
(4, 1, 8),
(5, 2, 12),
(6, 3, 7),
(7, 4, 10),
(8, 5, 6),
(9, 1, 15);

-- Has table
INSERT INTO Has (order_id, order_did) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Of table
INSERT INTO `Of` (order_did, product_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);
