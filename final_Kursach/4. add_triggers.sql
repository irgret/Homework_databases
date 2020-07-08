/* 3. При присвоению одному из кандидатов статуса 3 - финалист, триггер меняет статус соответствующего проекта
на 3 - закрыт */

DELIMITER //
DROP TRIGGER IF EXISTS trg1//
CREATE TRIGGER trg1 AFTER UPDATE ON users_orders
FOR EACH ROW
	begin
		IF new.u_status_id = 3 THEN
			UPDATE orders 
            SET o_status_id = 3 WHERE id = 6; -- если конкретно указать номер проекта, то всё работает
		END IF;
    END//

-- а вто если указать вложенный запрос, то не работает почему-то. Причем DISTINCT не помогает.    
DELIMITER //
DROP TRIGGER IF EXISTS trg1//
CREATE TRIGGER trg1 AFTER UPDATE ON users_orders
FOR EACH ROW
	begin
		IF new.u_status_id = 3 THEN
			UPDATE orders 
            SET o_status_id = 3 WHERE id = (SELECT order_id FROM users_orders WHERE new.u_status_id = 3);
		END IF;
    END//
   
/* 4. триггер, который должен отклонять присвоение второму кандидату в проекте статус 3 "финалист". В проекте может быть
только один финалист. */

DELIMITER //
DROP TRIGGER IF EXISTS trg2//
CREATE TRIGGER trg2 BEFORE UPDATE ON users_orders
FOR EACH ROW
	BEGIN 
		IF new.u_status_id = 3 AND new.u_status_id = u_status_id THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = ' В проекте уже есть финалист, проект закрыт';
		END IF;
	END //