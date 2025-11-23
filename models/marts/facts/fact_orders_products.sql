SELECT
    forv.*,
    p.product_category_name,
    p.product_category_name_english
FROM {{ ref('fact_orders_reviews') }} AS forv
LEFT JOIN {{ ref('dim_products') }} AS p
    ON forv.product_id = p.product_id
