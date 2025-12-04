SELECT
    STRFTIME(STRPTIME(InvoiceDate, '%d/%m/%Y %H:%M'),'%Y-%m-%d %H:%M') AS RawInvoiceDate,
    InvoiceNo,
    StockCode,
    Description,
    Quantity,
    UnitPrice,
    CustomerID, 
    Country
FROM {{source('raw', 'raw_online_retail')}}