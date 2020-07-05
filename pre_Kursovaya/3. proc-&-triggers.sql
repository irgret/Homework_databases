DELIMITER // 

DROP PROCEDURE IF EXISTS `p1`//
CREATE PROCEDURE `p1`() COMMENT 'Кол-во завершенных проектов за год'
	BEGIN 
			(SELECT '2019' AS 'год', COUNT(*) AS 'закрытых проектов' FROM orders o 
				WHERE o.o_status_id = (SELECT os.id FROM o_status os WHERE os.name = 'завершен')
				AND o.created_at BETWEEN '2019-01-01' AND '2019-12-31')
		UNION
			(SELECT '2020', COUNT(*) FROM orders o 
				WHERE o.o_status_id = (SELECT os.id FROM o_status os WHERE os.name = 'завершен')
				AND o.created_at BETWEEN '2020-01-01' AND '2020-12-31');
	END//
    
CALL p1//