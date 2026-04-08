-- Customer Cash Profile (Executive View)

WITH PaymentBehavior AS (
    SELECT 
        i.CustomerID,
        DATEDIFF(day, i.DueDate, p.PaymentDate) AS Days_Difference,
        CASE 
            WHEN p.PaymentDate > i.DueDate THEN 1 ELSE 0 
        END AS IsLate
    FROM Fact_Invoice i
    JOIN Fact_Payment p 
        ON i.InvoiceID = p.InvoiceID
)

SELECT 
    CustomerID,
    AVG(Days_Difference) AS AvgDaysLate,
    SUM(IsLate) * 1.0 / COUNT(*) AS LateRate,
    COUNT(*) AS TotalInvoices,

    CASE 
        WHEN SUM(IsLate) * 1.0 / COUNT(*) > 0.5 THEN 'High Risk'
        WHEN SUM(IsLate) * 1.0 / COUNT(*) > 0.2 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS RiskSegment

FROM PaymentBehavior
GROUP BY CustomerID;
