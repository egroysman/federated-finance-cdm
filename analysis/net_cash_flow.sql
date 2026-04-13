-- Net Cash Flow (Cash In - Cash Out)

SELECT 
    COALESCE(ci.ExpectedPaymentDate, co.ExpectedPaymentDate) AS Date,
    COALESCE(ci.ProjectedCashIn, 0) AS CashIn,
    COALESCE(co.ProjectedCashOut, 0) AS CashOut,
    COALESCE(ci.ProjectedCashIn, 0) - COALESCE(co.ProjectedCashOut, 0) AS NetCash

FROM CashInProjection ci
FULL OUTER JOIN CashOutProjection co
    ON ci.ExpectedPaymentDate = co.ExpectedPaymentDate
ORDER BY Date;
