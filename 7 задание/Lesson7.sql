ALTER TABLE
 	orders 
CHANGE COLUMN
 	user_id user_id BIGINT(20) UNSIGNED NOT NULL;
 
ALTER TABLE orders
ADD CONSTRAINT fk_user_id
 	FOREIGN KEY (user_id)
 	REFERENCES users(id)
 	ON DELETE RESTRICT
 	ON UPDATE RESTRICT;

-- заполняем немного orders 

INSERT INTO orders (user_id, created_at) VALUES
  (1, '2017-01-25'),
  (3, '2015-01-15'),
  (2, '2019-05-25');

 -- 1 задание

SELECT * FROM orders;
SELECT id,name FROM users;

SELECT 
	users.id AS user_id, users.name,
	orders.id AS order_id
FROM 
	users
RIGHT JOIN
	orders
ON
	users.id = orders.user_id;

-- 2 задание
SELECT 
	p.id, p.name, p.price,
	c.id AS cat_id,
	c.name AS catalog
FROM
	products AS p
JOIN
	catalogs AS c
ON 
	p.catalog_id = c.id; 

-- 3 задание

CREATE TABLE IF NOT EXISTS flights(
 	id SERIAL PRIMARY KEY,
 	`from` VARCHAR(50) NOT NULL COMMENT 'en', 
 	`to` VARCHAR(50) NOT NULL COMMENT 'en'
 );

CREATE TABLE  IF NOT EXISTS cities(
 	label VARCHAR(50) PRIMARY KEY COMMENT 'en', 
 	name VARCHAR(50) COMMENT 'ru'
 );


ALTER TABLE flights
ADD CONSTRAINT fk_from_label
FOREIGN KEY(`from`)
REFERENCES cities(label);

ALTER TABLE flights
ADD CONSTRAINT fk_to_label
FOREIGN KEY(`to`)
REFERENCES cities(label);

INSERT INTO cities VALUES
 	('Moscow', 'Москва'),
 	('Saint Petersburg', 'Санкт-Петербург'),
 	('Omsk', 'Омск'),
 	('Tomsk', 'Томск'),
 	('Ufa', 'Уфа');


INSERT INTO flights VALUES
 	(NULL, 'Moscow', 'Saint Petersburg'),
 	(NULL, 'Saint Petersburg', 'Omsk'),
 	(NULL, 'Omsk', 'Tomsk'),
 	(NULL, 'Tomsk', 'Ufa'),
 	(NULL, 'Ufa', 'Moscow');


SELECT
	id,
	(SELECT name FROM cities WHERE label = `from`) AS `from_city`,
	(SELECT name FROM cities WHERE label = `to`) AS `to_city`
FROM
	flights
ORDER BY
	id;





