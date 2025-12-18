DELIMITER //

CREATE TRIGGER after_deposit
AFTER UPDATE ON Accounts
FOR EACH ROW
BEGIN
    IF NEW.Balance > OLD.Balance THEN
        INSERT INTO Transactions (AccountID, Type, Amount)
        VALUES (NEW.AccountID, 'DEPOSIT', NEW.Balance - OLD.Balance);
    END IF;
END;
//

DELIMITER ;
