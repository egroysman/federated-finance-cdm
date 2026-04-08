CREATE TABLE Fact_Invoice (
    InvoiceID INT PRIMARY KEY,
    CustomerID INT,
    InvoiceDate DATE,
    DueDate DATE,
    InvoiceAmount DECIMAL(10,2)
);

CREATE TABLE Fact_Payment (
    PaymentID INT PRIMARY KEY,
    InvoiceID INT,
    PaymentDate DATE,
    PaymentAmount DECIMAL(10,2),
    DiscountTaken DECIMAL(10,2)
);

CREATE TABLE Dim_Customer (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(255),
    CreditAccountID INT,
    Region VARCHAR(100)
);
