/* 1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине. */

SELECT order_id FROM orders_products WHERE total > 0; -- узнаем id товара, который был когда-либо куплен

SELECT user_id FROM orders WHERE id IN (SELECT order_id FROM orders_products WHERE total > 0); -- узнаем, кто купил

-- находим покупателей по именам и товар, кторый купил покупатель
SELECT u.name as 'клиент', p.name as 'товар', total 'кол-во' FROM users u
	JOIN orders o
		ON u.id = o.user_id
	JOIN orders_products op
		ON o.id = op.order_id
	JOIN products p
		ON op.product_id = p.id;


/* 2. Выведите список товаров products и разделов catalogs, который соответствует товару.*/

SELECT products.name as 'название', catalogs.name as 'тип' FROM products, catalogs WHERE 
	products.catalog_id = catalogs.id;


/* 3. 3.	(по желанию) Пусть имеется таблица рейсов flights (id, from, to) 
и таблица городов cities (label, name). Поля from, to и label содержат английские названия городов, 
поле name — русское. Выведите список рейсов flights с русскими названиями городов. */

-- не знаю, как сделать

