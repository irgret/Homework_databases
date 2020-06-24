/* 1.	В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. 
Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции. */

START TRANSACTION;
INSERT INTO sample.users (SELECT * FROM shop.users WHERE id = 1);
DELETE FROM shop.users WHERE id = 1;
COMMIT;

/* 2. Создайте представление, которое выводит название name товарной позиции 
из таблицы products и соответствующее название каталога name из таблицы catalogs. */

USE shop;
CREATE VIEW cat AS SELECT p.name as 'товар', c.name as 'тип' 
FROM products p
JOIN catalogs c
	ON c.id = p.catalog_id;
    
SELECT * FROM cat;

/* 3. (по желанию) Пусть имеется таблица с календарным полем created_at. 
В ней размещены разряженые календарные записи за август 2018 года '2018-08-01', '2016-08-04', 
'2018-08-16' и 2018-08-17. Составьте запрос, который выводит полный список дат за август, 
выставляя в соседнем поле значение 1, если дата присутствует в исходном таблице и 0, если она отсутствует. */
use sample;
drop table if exists tbl3;
create table tbl3 (
	id SERIAL PRIMARY KEY,
    created_at DATE
);
INSERT INTO tbl3 (created_at) VALUES
('2018-08-01'),
(null),
(null),
('2018-08-04'),
(null),
(null),
(null),
(null),
(null),
(null),
(null),
(null),
(null),
(null),
(null),
('2018-08-16'),
('2018-08-17'),
(null),
(null),
(null),
(null),
(null),
(null),
(null),
(null),
(null),
(null),
(null),
(null),
(null),
(null);

-- так можно вывести дополнительный столбец с полным списком дат за август:
SET @num := 0;
SELECT DATE_ADD( '2018-07-31', interval @num := @num + 1 day) AS date_sequence, created_at FROM tbl3;

-- так можно создать представление example с вычисляемым столбцом info:
CREATE OR REPLACE VIEW example (id, created_at, info) 
AS SELECT id, created_at, (какая-то формула) FROM tbl3;

-- вопрос - как задать формулу, выдающую 1 если created_at is not null?
-- и как объединить полный список дат с представлением?