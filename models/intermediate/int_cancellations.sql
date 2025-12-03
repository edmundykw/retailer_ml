
SELECT
    InvoiceDate,
    InvoiceMonth,
    InvoiceYear,
    RawInvoiceDate,
    InvoiceNo,
    StockCode,
    Description,
    ABS(Quantity) AS Quantity,
    UnitPrice,
    CustomerID,
    Country
FROM {{ref('stg_retailer_transactions')}}
WHERE InvoiceNo LIKE 'C%'