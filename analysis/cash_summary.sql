-- Executive Cash Summary

SELECT
    SUM(CashIn) AS TotalProjectedCashIn,
    SUM(CashOut) AS TotalProjectedCashOut,
    SUM(NetCash) AS TotalProjectedNetCash
FROM NetCashFlow;
