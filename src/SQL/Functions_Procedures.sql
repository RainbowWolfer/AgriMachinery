DROP PROCEDURE DeleteTractor;

DELIMITER @@
CREATE PROCEDURE DeleteTractor 
(IN tractor_id INT) 
BEGIN
	DECLARE _count INT;
	SET _count = (SELECT COUNT(*) FROM user_owned WHERE o_tractor_id = tractor_id);
	IF _count = 0 THEN
		DELETE FROM tractors WHERE t_id = tractor_id;
		SELECT 'Successfully Done' AS 'TRUE';
	ELSE
		SELECT 'CANNOT DO DELETE' AS 'FALSE';
	END IF;
END @@

CALL DeleteTractor(1);