/*1. Проанализировать запросы, которые выполнялись на занятии, 
определить возможные корректировки и/или улучшения (JOIN пока не применять).*/
-- тут мне нечего прокомментировать, я еле успеваю вникать, не то, что улучшать.

/*2. Пусть задан некоторый пользователь. 
Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.*/
-- разбор ДЗ я не смотрела, разбиралась сама
USE vk;
SELECT from_user_id, COUNT(*) FROM messages WHERE to_user_id = 48 GROUP BY from_user_id;

/*3. Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.*/
-- на такой скрип выдает ошибку, изучаю дальше

SELECT user_id, COUNT(*) FROM likes WHERE user_id IN 
	(SELECT user_id FROM profiles ORDER BY birthday LIMIT 10) 
GROUP BY user_id;

/*4. Определить кто больше поставил лайков (всего) - мужчины или женщины?*/
-- в процессе выполнения, пока не знаю, как это сделать

/*5. Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.*/
-- в процессе