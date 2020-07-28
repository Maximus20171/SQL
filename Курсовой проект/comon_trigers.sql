DROP TRIGGER IF EXISTS not_null;
delimiter //
CREATE TRIGGER not_null AFTER INSERT ON strategy
FOR EACH ROW
BEGIN
	IF NEW.min_summa < 30000 THEN 
		SET min_summa=30000;
	END IF;
END //
delimiter ;