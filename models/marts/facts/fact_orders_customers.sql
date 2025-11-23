SELECT
    fop.*,
    c.customer_unique_id,
    c.customer_zip_code_prefix,
    c.customer_city,
    c.customer_state
FROM {{ ref('fact_orders_products') }} AS fop
LEFT JOIN {{ ref('dim_customers') }} AS c
    ON fop.customer_id = c.customer_id
