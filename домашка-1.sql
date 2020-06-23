/* Практическое задание по теме “Операторы, фильтрация, сортировка и ограничение”. 
1. Пусть в таблице users поля created_at и updated_at оказались незаполненными. 
Заполните их текущими датой и временем.*/

DROP DATABASE IF EXISTS DB1;
CREATE DATABASE DB1; 
USE DB1;

DROP TABLE IF EXISTS users;
CREATE TABLE users(
	id SERIAL PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phone BIGINT,
    birthday DATE,
	created_at DATETIME, -- DEFAULT NOW(), не включаю для задания
    updated_at DATETIME, -- DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, не включаю для задания
    INDEX(email),
    INDEX(phone)
);

INSERT INTO users (firstname, lastname, email, phone) VALUES
('Arnoldo','Larson','mabelle58@example.com','739'),
('Wanda','Hills','chauncey71@example.com','1'),
('Loyce','Osinski','jasper44@example.org','287'),
('Pearl','Beier','buckridge.dawson@example.net','1'),
('Birdie','Will','gerlach.maeve@example.com','0'),
('Saige','Ankunding','berge.murray@example.com','1'),
('Tianna','Kilback','bayer.stephen@example.org','438'),
('Ilene','Wintheiser','eloise.connelly@example.net','1'),
('Mozelle','Lowe','austen.torphy@example.org','1'),
('Danyka','Ziemann','russel.mack@example.org','0');
SELECT * FROM DB1.users;

-- вторая часть, сначала выполнить первую и убедиться, что даты не заполнены.
SET SQL_SAFE_UPDATES = 0; -- в безопасном режиме не дает внести изменения
USE DB1;
UPDATE users SET
	created_at = NOW(),
    updated_at = NOW();
    
SELECT * FROM DB1.users;