SELECT
    SUBSTRING(RawInvoiceDate, 1, 10) AS InvoiceDate,
    SUBSTRING(RawInvoiceDate, 6, 2) AS InvoiceMonth,
    SUBSTRING(RawInvoiceDate, 1, 4) AS InvoiceYear,
    RawInvoiceDate,
    InvoiceNo,
    StockCode,
    Description,
    ABS(Quantity) AS Quantity,
    UnitPrice,
    /*To handle missing CustomerID. 25% of entry for CustomerID is NULL*/
    COALESCE(CustomerID, 0) AS CustomerID, 
    Country
FROM {{ref('base_retailer_transactions')}}