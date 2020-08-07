-- TABLE CREATION --
-- Create Customer Table --
CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	email VARCHAR(150),
	contact_num VARCHAR(15),
	address VARCHAR(200)
);

-- Create Salesperson Table --
CREATE TABLE salesperson(
	seller_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	email VARCHAR(150),
	contact_num VARCHAR(15),
	address VARCHAR(200)
);

-- Create Cars Table --
CREATE TABLE cars(
	serial_id SERIAL PRIMARY KEY,
	make VARCHAR(50),
	model VARCHAR(100),
	model_year INTEGER,
	price NUMERIC(9,2),
	seller_id INTEGER,
	customer_id INTEGER,
	FOREIGN KEY(seller_id) REFERENCES salesperson(seller_id),
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

-- Create Sales Invoice Table -- 
CREATE TABLE sales_invoice(
	invoice_id SERIAL PRIMARY KEY,
	amount NUMERIC(9,2),
	purchase_date DATE,
	serial_id INTEGER,
	customer_id INTEGER,
	seller_id INTEGER,
	FOREIGN KEY(serial_id) REFERENCES cars(serial_id),
	FOREIGN KEY(seller_id) REFERENCES salesperson(seller_id),
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

-- Create Service Invoice Table --
CREATE TABLE service_invoice(
	service_id SERIAL PRIMARY KEY,
	description VARCHAR(500),
	serv_date DATE,
	labor_cost NUMERIC(7,2),
	total_cost NUMERIC(8,2),
	serial_id INTEGER,
	customer_id INTEGER,
	FOREIGN KEY(serial_id) REFERENCES cars(serial_id),
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

-- Create Mechanics Table --
CREATE TABLE mechanic(
	mechanic_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	email VARCHAR(150),
	contact_num VARCHAR(15),
	address VARCHAR(200)
);

-- Create Mechanic Record Table --
CREATE TABLE mechanic_record(
	mech_rec_id SERIAL PRIMARY KEY,
	mechanic_id INTEGER,
	service_id INTEGER,
	FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id),
	FOREIGN KEY(service_id) REFERENCES service_invoice(service_id)
);

-- Create Parts Table --
CREATE TABLE parts(
	part_id SERIAL PRIMARY KEY,
	part_type VARCHAR(200),
	part_cost numeric(6,2),
	service_id INTEGER,
	FOREIGN KEY(service_id) REFERENCES service_invoice(service_id)
);

-- DATA INPUTTING --
-- Inputting Customers --
INSERT INTO customer(customer_id, first_name, last_name, email, contact_num, address)
VALUES(1,'Frodo','Baggins','frodobaggins@thegreendragon.com','888-123-4567','1 Bag End Way, West Farthing, the Shire');

INSERT INTO customer(customer_id, first_name, last_name, email, contact_num, address)
VALUES(2,'Sam','Gamgee','samwise@thegreendragon.com','888-234-5678','17 Bagshot Row, West Farthing, the Shire');

INSERT INTO customer(customer_id, first_name, last_name, email, contact_num, address)
VALUES(3,'Aragorn','Elessar','theking@minastirith.gov','111-123-4567','The Palace, Minas Tirith, Gondor');

INSERT INTO customer(customer_id, first_name, last_name, email, contact_num, address)
VALUES(4,'Gandalf','The White','gandalf@wizards.org','000-234-5555','The Prancing Pony, Room 11, Bree, Eriador');

INSERT INTO customer(customer_id, first_name, last_name, email, contact_num, address)
VALUES(5,'Legolas','Greenleaf','legolas@mirkwood.com','000-012-3456','1 Mirkwood Way, Mirkwood');

--Inputting Salespersons --
INSERT INTO salesperson(seller_id, first_name, last_name, email, contact_num, address)
VALUES(1,'Eowyn','Princess','iamnoman@rohan.com','444-876-5432','The Golden Hall, Edoras, Rohan');

INSERT INTO salesperson(seller_id, first_name, last_name, email, contact_num, address)
VALUES(2,'Faramir','Steward','stewardofgondor@minastirith.gov','111-123-3579','The Palace, Minas Tirith, Gondor');

INSERT INTO salesperson(seller_id, first_name, last_name, email, contact_num, address)
VALUES(3,'Grima','Wormtongue','grima@orthanc.gov','511-223-4964','Orthanc, Isengard');

-- Inputting Cars -- 
INSERT INTO cars(serial_id, make, model, model_year, price, seller_id, customer_id)
VALUES(1,'Toyota','Camry',2005, 3000.00, 2, 1);

INSERT INTO cars(serial_id, make, model, model_year, price, seller_id, customer_id)
VALUES(2,'Ford','Mustang',2019, 40000.00, 1, 4);

INSERT INTO cars(serial_id, make, model, model_year, price, seller_id, customer_id)
VALUES(3,'GMC','Sierra',2018, 25000.00, 1, 3);

INSERT INTO cars(serial_id, make, model, model_year, price, seller_id, customer_id)
VALUES(4,'Honda','Accord',2010, NULL, NULL, 2);

INSERT INTO cars(serial_id, make, model, model_year, price, seller_id, customer_id)
VALUES(5,'Toyota','Prius',2012, NULL, NULL, 5);

-- Inputting Sales Invoices --
INSERT INTO sales_invoice(invoice_id, amount, purchase_date, serial_id, customer_id, seller_id)
VALUES(1, 3500.00, '11/15/2014', 1, 1, 2);

INSERT INTO sales_invoice(invoice_id, amount, purchase_date, serial_id, customer_id, seller_id)
VALUES(2, 45000.00, '04/22/2019', 2, 4, 1);

INSERT INTO sales_invoice(invoice_id, amount, purchase_date, serial_id, customer_id, seller_id)
VALUES(3, 30000.00, '07/23/2018', 3, 3, 1);

-- Inputting Service Invoices --
INSERT INTO service_invoice(service_id, description, serv_date, labor_cost, total_cost, serial_id, customer_id)
VALUES(1, 'Re-alignment of the Accord, plus replacing the wheels.', '02/02/2017', 3500.00, 4500.00, 4, 2);

INSERT INTO service_invoice(service_id, description, serv_date, labor_cost, total_cost, serial_id, customer_id)
VALUES(2, 'Major work done on engine and transmission.', '08/28/2017', 2000.00, 3500.00, 1, 1);

INSERT INTO service_invoice(service_id, description, serv_date, labor_cost, total_cost, serial_id, customer_id)
VALUES(3, 'Annual checkup on the Sierra.', '07/28/2019', 500.00, 500.00, 3, 3);

-- Inputting Parts --
INSERT INTO parts(part_id, part_type, part_cost, service_id)
VALUES(1, 'Honda Accord wheels x4', 1000.00, 1);

INSERT INTO parts(part_id, part_type, part_cost, service_id)
VALUES(2, 'Toyota Camry engine parts', 1000.00, 2);

INSERT INTO parts(part_id, part_type, part_cost, service_id)
VALUES(3, 'Toyota Camry transmission parts', 500.00, 2);

-- Inputting Mechanics --
INSERT INTO mechanic(mechanic_id, first_name, last_name, email, contact_num, address)
VALUES(1,'Eomer','Horsemaster','Eomer@rohan.com','444-851-7893','The Golden Hall, Edoras, Rohan');

INSERT INTO mechanic(mechanic_id, first_name, last_name, email, contact_num, address)
VALUES(2,'Gimli','Sonofgloin','Lord@glitteringcaves.net','535-121-5912','The Glittering Caves, Helms Deep, Rohan');

INSERT INTO mechanic(mechanic_id, first_name, last_name, email, contact_num, address)
VALUES(3,'Tom','Bombadil','Tom@Withywindle.com','744-145-2044','Near the Old Forest, The Valley of Withywindle');

INSERT INTO mechanic(mechanic_id, first_name, last_name, email, contact_num, address)
VALUES(4,'Boromir','Steward', 'sonofgondor@minastirith.gov','111-123-3578','The Palace, Minas Tirith, Gondor');

-- Inputting Mechanic Record --
INSERT INTO mechanic_record(mech_rec_id, mechanic_id, service_id)
VALUES(1,1,2);

INSERT INTO mechanic_record(mech_rec_id, mechanic_id, service_id)
VALUES(2,1,1);

INSERT INTO mechanic_record(mech_rec_id, mechanic_id, service_id)
VALUES(3,2,2);

INSERT INTO mechanic_record(mech_rec_id, mechanic_id, service_id)
VALUES(4,4,2);

INSERT INTO mechanic_record(mech_rec_id, mechanic_id, service_id)
VALUES(5,3,3);

SELECT *
FROM cars;