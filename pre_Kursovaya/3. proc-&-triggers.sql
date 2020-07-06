/* 1. Процедура, которая подсчитывает количество закрытых проектов за год и сравнивает их с планом */
DELIMITER // 
SET @z = 10// -- это план по закрытию проектов в год
SET @a = '2019-01-01'// -- это начало года
SET @b = '2019-12-31'// -- конец года
DROP PROCEDURE IF EXISTS p5//
CREATE PROCEDURE p5 (inout value INT) COMMENT ''
	BEGIN 
			SET @x = value;
            SET value = @z - value;
	END//
    
SET @y = (SELECT COUNT(*) FROM orders o 
				WHERE o.o_status_id = (SELECT os.id FROM o_status os WHERE os.name = 'завершен')
				AND o.created_at BETWEEN @a AND @b);

CALL p5(@y);

SELECT @z as 'план', @x as 'факт', @y as 'до выполнения плана';
