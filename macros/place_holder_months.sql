{% macro months() %}
    SELECT
        LPAD(CAST(month_num AS VARCHAR), 2, '0') AS month_num
    FROM generate_series(1, 12) AS t(month_num)
{% endmacro %}