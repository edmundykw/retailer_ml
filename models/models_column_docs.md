# Column Documentation

This file contains reusable dbt docs blocks for columns in the retailer_ml project. Each column is defined once and can be referenced across multiple models to maintain consistency and reduce duplication.

## How to Use

Reference any column's documentation in your model YAML by using:
```yaml
description: "{{ docs('column_name') }}"
```

For example:
```yaml
- name: InvoiceNo
  description: "{{ docs('invoice_no') }}"
```

{% docs invoice_no %}
Invoice number for the transaction
{% enddocs %}

{% docs stock_code %}
Product stock code
{% enddocs %}

{% docs description %}
Product description
{% enddocs %}

{% docs quantity %}
Quantity ordered (may be negative for cancellations)
{% enddocs %}

{% docs unit_price %}
Unit price of the item
{% enddocs %}

{% docs customer_id %}
Unique customer identifier
{% enddocs %}

{% docs country %}
Country of the customer
{% enddocs %}

{% docs raw_invoice_date %}
Original invoice date string from the source
{% enddocs %}

{% docs invoice_date %}
Derived invoice date
{% enddocs %}

{% docs invoice_month %}
Derived invoice month
{% enddocs %}

{% docs invoice_year %}
Derived invoice year
{% enddocs %}