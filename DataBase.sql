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

CREATE TABLE ORDER_DETAILS (
    order_did BIGINT PRIMARY KEY AUTO_INCREMENT,
    order_id BIGINT NOT NULL,
    product_quantity BIGINT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES `order` (order_id)
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
