/* 1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине. */

SELECT order_id FROM orders_products WHERE total > 0; -- узнаем id товара, который был когда-либо куплен

SELECT user_id FROM orders WHERE id IN (SELECT order_id FROM orders_products WHERE total > 0); -- узнаем, кто купил

-- находим покупателей по именам
SELECT name FROM users WHERE id IN (SELECT user_id FROM orders WHERE id IN (SELECT order_id FROM orders_products WHERE total > 0));
-- пыталась сделать результирующую таблицу, выводящую соответствие покупателя с купленным им товаром, но не вышло


/* 2. Выведите список товаров products и разделов catalogs, который соответствует товару.*/

SELECT products.name as 'название', catalogs.name as 'тип' FROM products, catalogs WHERE 
	products.catalog_id = catalogs.id;




