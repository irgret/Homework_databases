/* В таблице складских запасов storehouses_products в поле value могут встречаться 
самые разные цифры: 0, если товар закончился и выше нуля, если на складе имеются запасы. 
Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. 
Однако, нулевые запасы должны выводиться в конце, после всех записей. */

(SELECT * FROM storehouses_products WHERE value > 1 ORDER BY value)
	UNION
(SELECT * FROM storehouses_products WHERE value = 0);