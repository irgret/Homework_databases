/*1. Проанализировать запросы, которые выполнялись на занятии, 
определить возможные корректировки и/или улучшения (JOIN пока не применять).*/
-- тут мне нечего прокомментировать, я еле успеваю вникать, не то, что улучшать.

/*2. Пусть задан некоторый пользователь. 
Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.*/
-- разбор ДЗ я не смотрела, разбиралась сама
USE vk;
SELECT COUNT(*), from_user_id FROM messages WHERE to_user_id = 2 AND from_user_id IN (
	SELECT initiator_user_id FROM friend_requests WHERE (target_user_id = 2) AND status = 'approved'
		UNION
	SELECT target_user_id FROM friend_requests WHERE (initiator_user_id = 2) AND status = 'approved'
);

/*3. Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.*/

SELECT user_id, COUNT(*) FROM likes WHERE user_id IN (
	SELECT *  FROM (SELECT user_id FROM profiles WHERE user_id IN (SELECT user_id FROM likes) ORDER BY birthday DESC LIMIT 10) AS list)
GROUP BY user_id;

/*4. Определить кто больше поставил лайков (всего) - мужчины или женщины?*/
select gender, count(*) as total_like
from likes l
join users u 
	on l.user_id = u.id
join profiles p 
	on u.id = p.user_id
group by gender;

/*5. Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.*/
-- в процессе