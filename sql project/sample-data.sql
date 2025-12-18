
-- Insert initial data
INSERT INTO Accounts (Name, Balance)
VALUES 
('Gunavarman', 5000.00),
('Arun', 10000.00);

-- Deposit
START TRANSACTION;
UPDATE Accounts SET Balance = Balance + 5000 WHERE AccountID = 1;
COMMIT;

-- Withdrawal
START TRANSACTION;
UPDATE Accounts SET Balance = Balance - 2000 
WHERE AccountID = 1 AND Balance >= 2000;

INSERT INTO Transactions (AccountID, Type, Amount)
VALUES (1, 'WITHDRAWAL', 2000);
COMMIT;

-- Transfer
START TRANSACTION;
UPDATE Accounts SET Balance = Balance - 1000 WHERE AccountID = 1;
UPDATE Accounts SET Balance = Balance + 1000 WHERE AccountID = 2;

INSERT INTO Transactions (AccountID, Type, Amount)
VALUES (1, 'WITHDRAWAL', 1000);
COMMIT;
