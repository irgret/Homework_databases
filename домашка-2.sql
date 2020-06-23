/*Таблица users была неудачно спроектирована. 
Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения 
в формате "20.10.2017 8:10". Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.*/

DROP DATABASE IF EXISTS DB2;
CREATE DATABASE DB2;
USE DB2;

DROP TABLE IF EXISTS users;
CREATE TABLE users(
	id SERIAL PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phone BIGINT,
    created_at VARCHAR(100), -- создаем неправильно спроектированные столбцы дат
    updated_at VARCHAR(100),
    INDEX(email),
    INDEX(phone)
);

INSERT INTO users (firstname, lastname, email, phone, created_at, updated_at) VALUES
('Arnoldo','Larson','mabelle58@example.com','739', '20.10.2017 8:10', '20.10.2017 8:10'),
('Wanda','Hills','chauncey71@example.com','1', '12.05.2019 6:15', '12.05.2019 6:15'),
('Loyce','Osinski','jasper44@example.org','287', '17.09.2018 16:45', '17.09.2018 16:45'),
('Pearl','Beier','buckridge.dawson@example.net','1', '18.10.2018 17:24', '18.10.2018 17:24'),
('Birdie','Will','gerlach.maeve@example.com','0', '07.08.2018 19:53', '07.08.2018 19:53');

SELECT * FROM users;
DESCRIBE users;

UPDATE users SET
	created_at = STR_TO_DATE(created_at, '%d.%m.%Y %H:%i'),
    updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %H:%i');
    
DESCRIBE users; -- всё ещё varchar
    
ALTER TABLE users CHANGE 
	created_at created_at DATETIME DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE users CHANGE 
	updated_at updated_at DATETIME DEFAULT CURRENT_TIMESTAMP;
    
DESCRIBE users;
SELECT * FROM users; -- теперь все ок