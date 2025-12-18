-- Example: Deposit Procedure
DELIMITER //

CREATE PROCEDURE DepositAmount(
    IN acc_id INT,
    IN amount DECIMAL(15,2)
)
BEGIN
    UPDATE Accounts
    SET Balance = Balance + amount
    WHERE AccountID = acc_id;
END;
//

DELIMITER ;
