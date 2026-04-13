-- Cash Out Projection (based on due dates)

SELECT 
    DueDate AS ExpectedPaymentDate,
    SUM(InvoiceAmount) AS ProjectedCashOut
FROM AP_Invoices
GROUP BY DueDate
ORDER BY DueDate;
