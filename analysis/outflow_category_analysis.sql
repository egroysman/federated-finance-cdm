-- Cash Outflow by Category

SELECT
    Category,
    SUM(InvoiceAmount) AS TotalProjectedCashOut
FROM AP_Invoices
GROUP BY Category
ORDER BY TotalProjectedCashOut DESC;
