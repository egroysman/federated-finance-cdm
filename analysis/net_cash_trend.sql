-- Net Cash Trend by Date

SELECT
    CashDate,
    CashIn,
    CashOut,
    NetCash
FROM NetCashFlow
ORDER BY CashDate;
