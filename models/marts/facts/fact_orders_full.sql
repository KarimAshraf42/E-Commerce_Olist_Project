SELECT
    foc.*,
    s.seller_zip_code_prefix,
    s.seller_city,
    s.seller_state
FROM {{ ref('fact_orders_customers') }} AS foc
LEFT JOIN {{ ref('dim_sellers') }} AS s
    ON foc.seller_id = s.seller_id
