-- Payment Behavior Analysis

SELECT 
    i.InvoiceID,
    i.CustomerID,
    i.InvoiceDate,
    i.DueDate,
    p.PaymentDate,
    i.InvoiceAmount,
    p.PaymentAmount,

    -- Days difference between due date and payment
    DATEDIFF(day, i.DueDate, p.PaymentDate) AS Days_Difference,

    -- Classification
    CASE 
        WHEN p.PaymentDate < i.DueDate THEN 'Early'
        WHEN p.PaymentDate = i.DueDate THEN 'On-Time'
        ELSE 'Late'
    END AS Payment_Status,

    -- Discount usage indicator
    CASE 
        WHEN p.DiscountTaken > 0 THEN 'Discount Taken'
        ELSE 'No Discount'
    END AS Discount_Flag

FROM Fact_Invoice i
LEFT JOIN Fact_Payment p
    ON i.InvoiceID = p.InvoiceID;
