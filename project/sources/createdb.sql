-- Create the database
DROP DATABASE IF EXISTS expansive_store;
CREATE DATABASE expansive_store;
USE expansive_store;
-- Create tables
CREATE TABLE customers (
  customer_id         INT            PRIMARY KEY   AUTO_INCREMENT,
  first_name          VARCHAR(100)   NOT NULL,
  last_name           VARCHAR(100)   NOT NULL,
  email               VARCHAR(255)   NOT NULL      UNIQUE,
  phone               VARCHAR(20)                    DEFAULT NULL,
  address             VARCHAR(255)                  DEFAULT NULL
);
CREATE TABLE orders (
  order_id            INT            PRIMARY KEY   AUTO_INCREMENT,
  customer_id         INT            NOT NULL,
  order_date          DATETIME       NOT NULL,
  ship_amount         DECIMAL(10,2)  NOT NULL,
  tax_amount          DECIMAL(10,2)  NOT NULL,
  ship_date           DATETIME                   DEFAULT NULL,
  ship_address        VARCHAR(255)   NOT NULL,
  card_type           VARCHAR(50)    NOT NULL,
  card_number         VARCHAR(20)    NOT NULL,
  card_expires        VARCHAR(7)     NOT NULL,
  billing_address     VARCHAR(255)   NOT NULL
);
CREATE TABLE products (
  product_id          INT            PRIMARY KEY   AUTO_INCREMENT,
  category_id         INT            NOT NULL,
  product_code        VARCHAR(20)    NOT NULL      UNIQUE,
  product_name        VARCHAR(255)   NOT NULL,
  description         TEXT           NOT NULL,
  list_price          DECIMAL(10,2)  NOT NULL,
  discount_percent    DECIMAL(10,2)  NOT NULL      DEFAULT 0.00,
  date_added          DATETIME                     DEFAULT NULL,
  manufacturer        VARCHAR(100)                DEFAULT NULL,
  material            VARCHAR(100)                DEFAULT NULL
);
CREATE TABLE order_items (
  item_id             INT            PRIMARY KEY   AUTO_INCREMENT,
  order_id            INT            NOT NULL,
  product_id          INT            NOT NULL,
  item_price          DECIMAL(10,2)  NOT NULL,
  discount_amount     DECIMAL(10,2)  NOT NULL,
  quantity            INT            NOT NULL,
  CONSTRAINT items_fk_orders
    FOREIGN KEY (order_id)
    REFERENCES orders (order_id),
  CONSTRAINT items_fk_products
    FOREIGN KEY (product_id)
    REFERENCES products (product_id)
);
CREATE TABLE categories (
  category_id         INT            PRIMARY KEY   AUTO_INCREMENT,
  category_name       VARCHAR(255)   NOT NULL      UNIQUE
);
CREATE TABLE addresses (
  address_id          INT            PRIMARY KEY   AUTO_INCREMENT,
  customer_id         INT            NOT NULL,
  line1               VARCHAR(100)   NOT NULL,
  line2               VARCHAR(100)                   DEFAULT NULL,
  city                VARCHAR(100)   NOT NULL,
  state               VARCHAR(50)    NOT NULL,
  zip_code            VARCHAR(20)    NOT NULL,
  phone               VARCHAR(20)                    DEFAULT NULL,
  CONSTRAINT addresses_fk_customers
    FOREIGN KEY (customer_id)
    REFERENCES customers (customer_id)
);
CREATE TABLE administrators (
  admin_id            INT            PRIMARY KEY   AUTO_INCREMENT,
  email_address       VARCHAR(255)   NOT NULL,
  password            VARCHAR(255)   NOT NULL,
  first_name          VARCHAR(100)   NOT NULL,
  last_name           VARCHAR(100)   NOT NULL
);
-- Additional tables for an expansive store
CREATE TABLE warehouses (
  warehouse_id        INT            PRIMARY KEY   AUTO_INCREMENT,
  warehouse_name      VARCHAR(255)   NOT NULL      UNIQUE,
  location            VARCHAR(255)   NOT NULL
);
CREATE TABLE suppliers (
  supplier_id         INT            PRIMARY KEY   AUTO_INCREMENT,
  supplier_name       VARCHAR(255)   NOT NULL      UNIQUE,
  contact_name        VARCHAR(100)   NOT NULL,
  email               VARCHAR(255)   NOT NULL,
  phone               VARCHAR(20)    NOT NULL
);
CREATE TABLE inventory (
  inventory_id        INT            PRIMARY KEY   AUTO_INCREMENT,
  product_id          INT            NOT NULL,
  warehouse_id        INT            NOT NULL,
  quantity            INT            NOT NULL,
  last_restock_date   DATETIME       NOT NULL,
  CONSTRAINT inventory_fk_products
    FOREIGN KEY (product_id)
    REFERENCES products (product_id),
  CONSTRAINT inventory_fk_warehouses
    FOREIGN KEY (warehouse_id)
    REFERENCES warehouses (warehouse_id)
);
CREATE TABLE supplier_products (
  supplier_product_id INT            PRIMARY KEY   AUTO_INCREMENT,
  supplier_id         INT            NOT NULL,
  product_id          INT            NOT NULL,
  unit_price          DECIMAL(10,2)  NOT NULL,
  CONSTRAINT supplier_products_fk_suppliers
    FOREIGN KEY (supplier_id)
    REFERENCES suppliers (supplier_id),
  CONSTRAINT supplier_products_fk_products
    FOREIGN KEY (product_id)
    REFERENCES products (product_id)
);
-- Print success message
SELECT 'Database and tables created successfully!' AS Message;
