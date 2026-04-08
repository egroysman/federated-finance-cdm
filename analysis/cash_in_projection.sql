-- Cash In Projection Based on Historical Payment Behavior

WITH PaymentHistory AS (
    SELECT 
        i.CustomerID,
        DATEDIFF(day, i.DueDate, p.PaymentDate) AS Days_Difference
    FROM Fact_Invoice i
    JOIN Fact_Payment p 
        ON i.InvoiceID = p.InvoiceID
),

CustomerBehavior AS (
    SELECT 
        CustomerID,
        AVG(Days_Difference) AS Avg_Days_Difference
    FROM PaymentHistory
    GROUP BY CustomerID
),

ProjectedCashIn AS (
    SELECT 
        i.InvoiceID,
        i.CustomerID,
        i.InvoiceAmount,
        i.DueDate,
        
        -- Estimated payment date based on historical behavior
        DATEADD(day, cb.Avg_Days_Difference, i.DueDate) AS ExpectedPaymentDate

    FROM Fact_Invoice i
    LEFT JOIN CustomerBehavior cb
        ON i.CustomerID = cb.CustomerID
)

SELECT 
    CustomerID,
    ExpectedPaymentDate,
    SUM(InvoiceAmount) AS ProjectedCashIn
FROM ProjectedCashIn
GROUP BY CustomerID, ExpectedPaymentDate
ORDER BY ExpectedPaymentDate;
