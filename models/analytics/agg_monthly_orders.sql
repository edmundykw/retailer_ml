WITH orders AS (
    SELECT
        InvoiceMonth,
        InvoiceYear,
        CustomerID,
        Country,
        ROUND(SUM(TotalOrderValue), 2) AS TotalMonthOrderValue
    FROM {{ref('int_orders')}}
    GROUP BY
        1, 2, 3, 4
),

months AS (
    {{months()}}
),

unique_customer AS (
    SELECT
        DISTINCT
            InvoiceYear,
            CustomerID,
            Country
    FROM orders
),

complete_months AS (
    SELECT
        uc.InvoiceYear,
        m.month_num,
        uc.CustomerID,
        uc.Country
    FROM unique_customer AS uc
    CROSS JOIN months AS m
),

complete_montly_orders AS (
    SELECT
        cm.InvoiceYear,
        cm.month_num AS InvoiceMonth,
        cm.CustomerID,
        cm.Country,
        COALESCE(o.TotalMonthOrderValue, 0) AS TotalMonthOrderValue
    FROM complete_months AS cm
    LEFT JOIN orders AS o
    ON cm.InvoiceYear = o.InvoiceYear
    AND cm.month_num = o.InvoiceMonth
    AND cm.CustomerID = o.CustomerID
    AND cm.Country = o.Country
)

SELECT
    *,
    ROUND(AVG(TotalMonthOrderValue) OVER (
        PARTITION BY CustomerID, InvoiceYear
        ORDER BY InvoiceYear, InvoiceMonth
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ), 2) AS Rolling3MonthAvgOrderValue
FROM complete_montly_orders

