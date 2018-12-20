DELIMITER $$

USE `bigdas`$$

DROP FUNCTION IF EXISTS `get_menu_id`$$

CREATE DEFINER=`root`@`localhost` FUNCTION `get_menu_id`(parentId BIGINT(20)) RETURNS BIGINT(20)
BEGIN
    DECLARE c BIGINT;
	SELECT parentId*1000+101+id FROM bigdas_sequence_menuid WHERE pid=parentId INTO c;
	RETURN c;
  END$$

DELIMITER ;