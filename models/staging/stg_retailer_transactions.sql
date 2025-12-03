SELECT
    SUBSTRING(InvoiceDate, 1, 9) AS InvoiceDate,
    SUBSTRING(InvoiceDate, 3, 7) AS InvoiceMonth,
    SUBSTRING(InvoiceDate, 6, 4) AS InvoiceYear,
    InvoiceDate AS RawInvoiceDate,
    InvoiceNo,
    StockCode,
    Description,
    Quantity,
    UnitPrice,
    /*To handle missing CustomerID. 25% of entry for CustomerID is NULL*/
    COALESCE(CustomerID, 0) AS CustomerID, 
    Country
FROM {{ref('base_retailer_transactions')}}