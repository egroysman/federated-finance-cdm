-- Net Cash Flow Projection
-- Combines projected cash inflows and projected cash outflows

WITH CashInProjection AS (
    SELECT
        ExpectedPaymentDate,
        SUM(InvoiceAmount) AS ProjectedCashIn
    FROM ProjectedCashIn
    GROUP BY ExpectedPaymentDate
),
CashOutProjection AS (
    SELECT
        DueDate AS ExpectedPaymentDate,
        SUM(InvoiceAmount) AS ProjectedCashOut
    FROM AP_Invoices
    GROUP BY DueDate
)

SELECT
    COALESCE(ci.ExpectedPaymentDate, co.ExpectedPaymentDate) AS CashDate,
    COALESCE(ci.ProjectedCashIn, 0) AS CashIn,
    COALESCE(co.ProjectedCashOut, 0) AS CashOut,
    COALESCE(ci.ProjectedCashIn, 0) - COALESCE(co.ProjectedCashOut, 0) AS NetCash
FROM CashInProjection ci
FULL OUTER JOIN CashOutProjection co
    ON ci.ExpectedPaymentDate = co.ExpectedPaymentDate
ORDER BY CashDate;
