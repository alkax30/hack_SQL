--- 26-08-2024 08:53:04
--- PostgreSQL
create table countries(
  id_country serial primary key,
  name varchar(50) not null  
);

create table users(
 id_users serial primary key,
 id_country integer not null,
 email varchar(100) not null,
 name varchar (50) not null,
 foreign key (id_country) references countries (id_country)   
);

--- 26-08-2024 08:53:46
--- PostgreSQL
/***** ERROR ******
Error 42P07 relation "countries" already exists
 ----- 
create table countries(
  id_country serial primary key,
  name varchar(50) not null  
);

create table users(
 id_users serial primary key,
 id_country integer not null,
 email varchar(100) not null,
 name varchar (50) not null,
 foreign key (id_country) references countries (id_country)   
);
*****/

--- 26-08-2024 08:56:08
--- PostgreSQL
/***** ERROR ******
Error 42601 syntax error at or near ":"
 ----- 
INSERT INTO countries (name) VALUES ('Argentina'), ('Colombia'), ('Chile'):
SELECT * from countries;
*****/

--- 26-08-2024 08:56:15
--- PostgreSQL
INSERT INTO countries (name) VALUES ('Argentina'), ('Colombia'), ('Chile');
SELECT * from countries;

--- 26-08-2024 08:58:16
--- PostgreSQL
insert into users (id_country, email, name) VALUES (2, 'foo@foo.com', 'fooziman'), (3, 'bar@bar.com', 'barziman'); 
SELECT * from users;

--- 26-08-2024 08:59:36
--- PostgreSQL
delete from users where email = 'bar@bar.com';

--- 26-08-2024 09:00:03
--- PostgreSQL
update users set email = 'foo@foo.foo', name = 'fooz' where id_users = 1;
SELECT * FROM users;

--- 26-08-2024 09:01:16
--- PostgreSQL
update users set email = 'foo@foo.foo', name = 'fooz' where id_users = 1;
SELECT * FROM users;

--- 26-08-2024 09:01:44
--- PostgreSQL
update users set email = 'foo@foo.foo', name = 'fooz' where id_users = 1;
select * from users;

--- 26-08-2024 09:01:54
--- PostgreSQL
select * from users inner join  countries on users.id_country = countries.id_country;

--- 26-08-2024 09:02:04
--- PostgreSQL
select u.id_users as id, u.email, u.name as fullname, c.name 
  from users u inner join  countries c on u.id_country = c.id_country;

--- 26-08-2024 09:22:15
--- PostgreSQL
CREATE TABLE priorities (id_priority SERIAL PRIMARY KEY, type_name VARCHAR(50) NOT NULL);

--- 26-08-2024 09:37:04
--- PostgreSQL
CREATE TABLE contact_request (id_email VARCHAR(100) PRIMARY KEY, id_country INTEGER NOT NULL, id_priority INTEGER NOT NULL, name VARCHAR(50) NOT NULL, datail VARCHAR(100), physical_address VARCHAR(255), FOREIGN KEY (id_country) REFERENCES countries (id_country), FOREIGN KEY (id_priority) REFERENCES priorities (id_priority));

--- 26-08-2024 09:39:15
--- PostgreSQL
INSERT INTO countries (name) VALUES ('Bolivia'), ('Brasil'), ('Estados Unidos'), ('Mexico'), ('Panama');

--- 26-08-2024 09:39:29
--- PostgreSQL
SELECT * FROM countries;

--- 26-08-2024 10:26:42
--- PostgreSQL
INSERT INTO priorities (type_name) VALUES ('Alta'), ('Media'), ('Baja');

--- 26-08-2024 10:26:56
--- PostgreSQL
SELECT * FROM priorities;

--- 26-08-2024 10:35:56
--- PostgreSQL
INSERT INTO contact_request (id_email, id_country, id_priority, name, datail, physical_address) 
VALUES ('andres123@ejemplo.com', 1, 1, 'Andres', 'Ejemplo de solicitud', 'El polvorin calle 13 av. la salle'),
('valetina321@ejemplo.com', 2, 2, 'Valentina', 'Pedir contacto', 'San Antonio de los altos, edificio Primavera, piso 2 apt 23'),
('carolina421@ejemplo.com', 3, 3, 'Carolina', 'Pesimo servicio', 'Fuerte tiuna al lado de la casona');

--- 26-08-2024 10:36:12
--- PostgreSQL
SELECT * FROM contact_request;

--- 26-08-2024 10:37:12
--- PostgreSQL
SELECT * from users;

--- 26-08-2024 10:40:48
--- PostgreSQL
 DELETE FROM contact_request
WHERE id_email = (SELECT id_email FROM contact_request ORDER BY id_email DESC LIMIT 1);

--- 26-08-2024 10:44:36
--- PostgreSQL
UPDATE contact_request SET name = 'Andres Act.', datail = 'Ejemplo de Solicitud Actualizada', physical_address = 'El polvorin calle 13 av. la salle casa Numero 43';

--- 26-08-2024 10:44:50
--- PostgreSQL
SELECT * FROM contact_request;

--- 26-08-2024 10:48:30
--- PostgreSQL
CREATE table roles (id_role SERIAL PRIMARY KEY, name VARCHAR(50) NOT NULL);

--- 26-08-2024 10:53:55
--- PostgreSQL
CREATE TABLE taxes (id_tax SERIAL PRIMARY KEY, percentage DECIMAL (5, 2) NOT NULL);

--- 26-08-2024 10:54:53
--- PostgreSQL
CREATE table offers (id_offer SERIAL PRIMARY KEY, status VARCHAR(50) NOT NULL);

--- 26-08-2024 11:08:34
--- PostgreSQL
CREATE table discounts (id_discount SERIAL PRIMARY KEY, status VARCHAR(50) NOT NULL, percentage DECIMAL(5,2) NOT NULL);

--- 26-08-2024 11:14:44
--- PostgreSQL
CREATE TABLE payments (id_payment SERIAL PRIMARY KEY, type VARCHAR(50) NOT NULL);

--- 26-08-2024 11:19:24
--- PostgreSQL
/***** ERROR ******
Error 42601 syntax error at or near ";"
 ----- 
CREATE TABLE customers (email VARCHAR(100) PRIMARY KEY, id_country INTEGER not NULL, id_role INTEGER NOT NULL, name VARCHAR(100) NOT NULL, age INTEGER, PASSWORD VARCHAR (100) NOT NULL, physical_address VARCHAR(255);
*****/

--- 26-08-2024 11:20:27
--- PostgreSQL
CREATE TABLE customers (email VARCHAR(100) PRIMARY KEY,
                        id_country INTEGER not NULL,
                        id_role INTEGER NOT NULL,
                        name VARCHAR(100) NOT NULL,
                        age INTEGER,
                        PASSWORD VARCHAR (100) NOT NULL,
                        physical_address VARCHAR(255));

--- 26-08-2024 11:43:34
--- PostgreSQL
/***** ERROR ******
Error 42804 foreign key constraint "fk_roles" cannot be implemented
 ----- 
ALTER TABLE roles ADD CONSTRAINT fk_roles FOREIGN KEY (id_role) REFERENCES customers(email);
*****/

--- 26-08-2024 11:43:55
--- PostgreSQL
/***** ERROR ******
Error 42804 foreign key constraint "fk_customers" cannot be implemented
 ----- 
ALTER TABLE roles ADD CONSTRAINT fk_customers FOREIGN KEY (id_role) REFERENCES customers(email);
*****/

--- 26-08-2024 11:47:58
--- PostgreSQL
/***** ERROR ******
Error 42804 foreign key constraint "fkroles" cannot be implemented
 ----- 
ALTER TABLE roles ADD CONSTRAINT fkroles FOREIGN KEY (id_role) REFERENCES customers(email);
*****/

--- 26-08-2024 11:52:09
--- PostgreSQL
/***** ERROR ******
Error 42601 syntax error at or near "CONSTRAINT"
 ----- 
ALTER TABLE roles CONSTRAINT fk_roles FOREIGN KEY (id_role) REFERENCES customers(email);
*****/

--- 26-08-2024 11:57:30
--- PostgreSQL
/***** ERROR ******
Error 42830 there is no unique constraint matching given keys for referenced table "customers"
 ----- 
alter TABLE countries ADD CONSTRAINT fk_countries FOREIGN KEY (id_country) REFERENCES customers(id_country);
*****/

--- 26-08-2024 11:59:18
--- PostgreSQL
alter table customers ADD CONSTRAINT fk_country FOREIGN KEY (id_country) REFERENCES countries(id_country);

--- 26-08-2024 12:00:58
--- PostgreSQL
alter table customers ADD CONSTRAINT fk_role FOREIGN KEY (id_role) REFERENCES roles(id_role);

--- 26-08-2024 12:05:34
--- PostgreSQL
CREATE TABLE invoice_status(id_invoice_status SERIAL PRIMARY KEY, status VARCHAR(50) NOT NULL);

--- 26-08-2024 12:12:00
--- PostgreSQL
create table products (id_product SERIAL PRIMARY KEY,
                       id_discount INTEGER NOT NULL,
                       id__offer INTEGER not NULL, 
                       id_tax INTEGER NOT NULL, 
                       name VARCHAR(100) NOT NULL, 
                       details VARCHAR(255), 
                       minimum_stock INTEGER NOT NULL, 
                       maximun_stock INTEGER NOT NULL, 
                       current_stock INTEGER NOT NULL, 
                       price DECIMAL(10,2) NOT NULL, 
                       price_with_tax DECIMAL (10, 2));

--- 26-08-2024 12:18:08
--- PostgreSQL
CREATE TABLE product_customers (id_product SERIAL PRIMARY KEY,
                                id_customer INTEGER not NULL);

--- 26-08-2024 12:21:06
--- PostgreSQL
create TABLE invoices (id_invoice SERIAL PRIMARY KEY, 
                       id_customer INTEGER not NULL, 
                       id_payment INTEGER NOT NULL, 
                       id_invoice_status INTEGER NOT NULL, 
                       date DATE NOT NULL, 
                       total_to_pay DECIMAL(10, 2));

--- 26-08-2024 12:27:11
--- PostgreSQL
CREATE TABLE orders (id_order SERIAL PRIMARY key,
                     id_invoice INTEGER NOT NULL,
                     id_product INTEGER not NULL,
                     datail VARCHAR(255),
                     amount INTEGER NOT NULL,
                     price DECIMAL(10,2) NOT NULL);

--- 26-08-2024 12:29:35
--- PostgreSQL
/***** ERROR ******
Error 42830 there is no unique constraint matching given keys for referenced table "orders"
 ----- 
alter table products add CONSTRAINT fk_idproduct FOREIGN key (id_product) REFERENCES orders (id_product);
*****/

--- 26-08-2024 12:31:29
--- PostgreSQL
alter table products add CONSTRAINT fk_discount FOREIGN KEY (id_discount) REFERENCES discounts(id_discount);

--- 26-08-2024 12:32:31
--- PostgreSQL
/***** ERROR ******
Error 42703 column "id_offer" referenced in foreign key constraint does not exist
 ----- 
alter table products add CONSTRAINT fk_offer FOREIGN KEY (id_offer) REFERENCES offers(id_offer);
*****/

--- 26-08-2024 12:33:02
--- PostgreSQL
ALTER TABLE products RENAME COLUMN id__offer TO id_offer;

--- 26-08-2024 12:33:16
--- PostgreSQL
alter table products add CONSTRAINT fk_offer FOREIGN KEY (id_offer) REFERENCES offers(id_offer);

--- 26-08-2024 12:33:46
--- PostgreSQL
alter table products add CONSTRAINT fk_tax FOREIGN KEY (id_tax) REFERENCES taxes(id_tax);

--- 26-08-2024 12:38:33
--- PostgreSQL
alter table product_customers add CONSTRAINT fk_product FOREIGN key (id_product) REFERENCES products(id_product);

--- 26-08-2024 12:39:07
--- PostgreSQL
/***** ERROR ******
Error 42804 foreign key constraint "fk_customer" cannot be implemented
 ----- 
alter table product_customers add CONSTRAINT fk_customer FOREIGN key (id_customer) REFERENCES customers(email);
*****/

--- 26-08-2024 12:48:00
--- PostgreSQL
/***** ERROR ******
Error 42804 foreign key constraint "fk_product" cannot be implemented
 ----- 
ALTER table product_customers ALTER COLUMN id_product TYPE VARCHAR(100);
*****/

--- 26-08-2024 12:51:38
--- PostgreSQL
alter table invoices add CONSTRAINT fk_payment FOREIGN key (id_payment) REFERENCES payments(id_payment);

--- 26-08-2024 12:52:19
--- PostgreSQL
alter table invoices add CONSTRAINT fk_invoice_status FOREIGN key (id_invoice_status) REFERENCES invoice_status(id_invoice_status);

--- 26-08-2024 12:54:55
--- PostgreSQL
alter table orders add CONSTRAINT fk_invoice FOREIGN KEY (id_invoice) REFERENCES invoices(id_invoice);

--- 26-08-2024 12:55:24
--- PostgreSQL
alter table orders add CONSTRAINT fk_product FOREIGN KEY (id_product) REFERENCES products(id_product);

--- 26-08-2024 12:57:43
--- PostgreSQL
alter table invoices alter COLUMN id_customer TYPE VARCHAR(100);

--- 26-08-2024 12:58:29
--- PostgreSQL
alter table invoices add CONSTRAINT fk_customer FOREIGN key (id_customer) REFERENCES customers(email);

--- 26-08-2024 12:59:29
--- PostgreSQL
alter table product_customers alter COLUMN id_customer type VARCHAR(100);

--- 26-08-2024 13:00:00
--- PostgreSQL
alter table product_customers add CONSTRAINT fk_customers FOREIGN key (id_customer) REFERENCES customers(email);

--- 26-08-2024 13:02:34
--- PostgreSQL
SELECT * from countries;

--- 26-08-2024 13:06:49
--- PostgreSQL
INSERT into countries (name) VALUES ('Japon'), ('Nueva Zelanda'), ('Rusia');

--- 26-08-2024 13:06:58
--- PostgreSQL
SELECT * from countries;

--- 26-08-2024 13:08:07
--- PostgreSQL
insert into roles (name) VALUES ('Presidente'), ('Asistente'), ('Usuario');

--- 26-08-2024 13:09:17
--- PostgreSQL
INSERT INTO taxes (percentage) VALUES
    (16.00),
    (10.00),
    (8.00);

--- 26-08-2024 13:10:02
--- PostgreSQL
INSERT INTO offers (status) VALUES
    ('Activo'),
    ('Inactivo'),
    ('Gratis');

--- 26-08-2024 13:10:14
--- PostgreSQL
SELECT * FROM offers;

--- 26-08-2024 13:10:53
--- PostgreSQL
INSERT INTO discounts (status, percentage) VALUES
    ('Active', 15.00),
    ('Inactive', 10.00),
    ('Active', 5.00);

--- 26-08-2024 13:13:51
--- PostgreSQL
INSERT INTO customers (email, id_country, id_role, name, age, password, physical_address) VALUES
    ('Maria_ge@ejemplo.com', 1, 1, 'Maria', 60, 'password123', 'Caracas, Catia av cuartel'),
    ('David01@ejemplo.com', 2, 2, 'David', 49, 'david9021', 'Los Teques, Calle la quebrada'),
    ('edwin902@ejemplo.com', 3, 3, 'Edwin', 58, 'Pelocorto212', 'Caracas, Petroleo retrogrado');

--- 26-08-2024 13:14:04
--- PostgreSQL
SELECT * from customers;

--- 26-08-2024 13:15:15
--- PostgreSQL
/***** ERROR ******
Error 42703 column "id_customer" of relation "payments" does not exist
 ----- 
INSERT INTO payments (id_customer, type) VALUES
    ('Maria_ge@ejemplo.com', 'Pago Movil'),
    ('David01@ejemplo.com', 'American Express'),
    ('edwin902@ejemplo.com', 'Bank Transfer');
*****/

--- 26-08-2024 13:15:45
--- PostgreSQL
SELECT * from customers;

--- 26-08-2024 13:18:44
--- PostgreSQL
INSERT INTO payments (type) VALUES ('Pago Movil'), ('Transferencia'), ('Zelle');

--- 26-08-2024 13:18:54
--- PostgreSQL
SELECT * from payments;

--- 26-08-2024 13:20:08
--- PostgreSQL
INSERT INTO invoice_status (status) VALUES
    ('Pago'),
    ('Pendiente'),
    ('Cancelado');

--- 26-08-2024 13:23:53
--- PostgreSQL
/***** ERROR ******
Error 42703 column "discount" of relation "products" does not exist
 ----- 
INSERT INTO products (discount, id_tax, id_offer, name, details, minimum_stock, maximum_stock, current_stock, price, price_with_tax) VALUES
    (1, 1, 1, 'Camisa Oversize', 'Detalles del producto 1', 1, 1200, 110, 20.00, 28.00),
    (2, 2, 2, 'Pantalon Shein', 'Detalles del producto 2', 1, 510, 50, 50.00, 65.00),
    (3, 3, 1, 'Silla de Ruedas', 'Detalles del producto 3', 1, 10, 5, 500.00, 615.00);
*****/

--- 26-08-2024 13:24:16
--- PostgreSQL
/***** ERROR ******
Error 42703 column "maximum_stock" of relation "products" does not exist
 ----- 
INSERT INTO products (id_discount, id_tax, id_offer, name, details, minimum_stock, maximum_stock, current_stock, price, price_with_tax) VALUES
    (1, 1, 1, 'Camisa Oversize', 'Detalles del producto 1', 1, 1200, 110, 20.00, 28.00),
    (2, 2, 2, 'Pantalon Shein', 'Detalles del producto 2', 1, 510, 50, 50.00, 65.00),
    (3, 3, 1, 'Silla de Ruedas', 'Detalles del producto 3', 1, 10, 5, 500.00, 615.00);
*****/

--- 26-08-2024 13:24:30
--- PostgreSQL
INSERT INTO products (id_discount, id_tax, id_offer, name, details, minimum_stock, maximun_stock, current_stock, price, price_with_tax) VALUES
    (1, 1, 1, 'Camisa Oversize', 'Detalles del producto 1', 1, 1200, 110, 20.00, 28.00),
    (2, 2, 2, 'Pantalon Shein', 'Detalles del producto 2', 1, 510, 50, 50.00, 65.00),
    (3, 3, 1, 'Silla de Ruedas', 'Detalles del producto 3', 1, 10, 5, 500.00, 615.00);

--- 26-08-2024 13:24:48
--- PostgreSQL
select * from products;

--- 26-08-2024 13:25:31
--- PostgreSQL
select * from customers;

--- 26-08-2024 13:26:26
--- PostgreSQL
/***** ERROR ******
Error 23503 insert or update on table "product_customers" violates foreign key constraint "fk_product"
 ----- 
INSERT INTO product_customers (id_product, id_customer) VALUES
    (4, 'Maria_ge@ejemplo.com'),
    (5, 'David01@ejemplo.com'),
    (6, 'edwin902@ejemplo.com');
*****/

--- 26-08-2024 13:26:58
--- PostgreSQL
INSERT INTO product_customers (id_product, id_customer) VALUES
    (1, 'Maria_ge@ejemplo.com'),
    (2, 'David01@ejemplo.com'),
    (3, 'edwin902@ejemplo.com');

--- 26-08-2024 13:31:42
--- PostgreSQL
INSERT INTO invoices (id_customer, id_payment, id_invoice_status, date, total_to_pay) VALUES
('Maria_ge@ejemplo.com', 1, 3, '2024-8-10', 300.00),
('David01@ejemplo.com', 3, 2, '2024-2-20', 200.00),
('edwin902@ejemplo.com', 2, 1, '2024-8-25', 1000.00);

--- 26-08-2024 13:31:51
--- PostgreSQL
SELECT * from invoices;

--- 26-08-2024 13:33:25
--- PostgreSQL
/***** ERROR ******
Error 42703 column "detail" of relation "orders" does not exist
 ----- 
INSERT INTO orders (id_invoice, id_product, detail, amount, price) VALUES
    (1, 2, 'Orden de producto 2', 10, 800.00),
    (2, 1, 'Orden de producto 1', 4, 540.00),
    (3, 3, 'Orden de producto 3', 2, 100.00);
*****/

--- 26-08-2024 13:33:43
--- PostgreSQL
INSERT INTO orders (id_invoice, id_product, datail, amount, price) VALUES
    (1, 2, 'Orden de producto 2', 10, 800.00),
    (2, 1, 'Orden de producto 1', 4, 540.00),
    (3, 3, 'Orden de producto 3', 2, 100.00);

--- 26-08-2024 13:33:54
--- PostgreSQL
select * from orders;

--- 26-08-2024 13:35:55
--- PostgreSQL
/***** ERROR ******
Error 42703 column "id" does not exist
 ----- 
DELETE from customers where id = (SELECT max(id) from customers);
*****/

--- 26-08-2024 13:36:20
--- PostgreSQL
/***** ERROR ******
Error 42601 syntax error at or near ")"
 ----- 
);
*****/

--- 26-08-2024 13:37:59
--- PostgreSQL
/***** ERROR ******
Error 23503 update or delete on table "customers" violates foreign key constraint "fk_customer" on table "invoices"
 ----- 
DELETE from customers where email = (SELECT email FROM customers ORDER BY email DESC LIMIT 1);
*****/

--- 26-08-2024 13:39:09
--- PostgreSQL
select * from customers;

--- 26-08-2024 13:50:56
--- PostgreSQL
alter table invoices drop CONSTRAINT fk_customer;

--- 26-08-2024 13:52:07
--- PostgreSQL
alter table invoices add CONSTRAINT fk_customer FOREIGN key (id_customer) REFERENCES customers(email) on DELETE CASCADE;

--- 26-08-2024 13:52:20
--- PostgreSQL
/***** ERROR ******
Error 23503 update or delete on table "customers" violates foreign key constraint "fk_customers" on table "product_customers"
 ----- 
DELETE FROM customers
WHERE email = (SELECT email FROM customers ORDER BY email DESC LIMIT 1);
*****/

--- 26-08-2024 13:53:24
--- PostgreSQL
alter table product_customers drop CONSTRAINT fk_customers;

--- 26-08-2024 13:54:14
--- PostgreSQL
alter table product_customers add CONSTRAINT fk_customers FOREIGN key (id_customer) REFERENCES customers(email) on DELETE CASCADE;

--- 26-08-2024 13:54:24
--- PostgreSQL
/***** ERROR ******
Error 23503 update or delete on table "invoices" violates foreign key constraint "fk_invoice" on table "orders"
 ----- 
DELETE FROM customers
WHERE email = (SELECT email FROM customers ORDER BY email DESC LIMIT 1);
*****/

--- 26-08-2024 13:55:15
--- PostgreSQL
alter table orders drop CONSTRAINT fk_invoice;

--- 26-08-2024 13:56:46
--- PostgreSQL
alter table orders add CONSTRAINT fk_invoice FOREIGN KEY (id_invoice) REFERENCES invoices(id_invoice) ON DELETE CASCADE;

--- 26-08-2024 13:56:53
--- PostgreSQL
DELETE FROM customers
WHERE email = (SELECT email FROM customers ORDER BY email DESC LIMIT 1);

--- 26-08-2024 13:57:04
--- PostgreSQL
SELECT * from customers;

--- 26-08-2024 14:00:02
--- PostgreSQL
UPDATE taxes
SET percentage = percentage + 8.00;

--- 26-08-2024 14:00:37
--- PostgreSQL
UPDATE products
SET price = price * 1.30,
    price_with_tax = price_with_tax * 1.30;

