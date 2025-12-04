
SELECT
    InvoiceDate,
    InvoiceMonth,
    InvoiceYear,
    RawInvoiceDate,
    InvoiceNo,
    StockCode,
    Description,
    Quantity,
    UnitPrice,
    ROUND(Quantity * UnitPrice, 2) AS TotalCancelledValue,
    CustomerID,
    Country
FROM {{ref('stg_retailer_transactions')}}
WHERE InvoiceNo LIKE 'C%'