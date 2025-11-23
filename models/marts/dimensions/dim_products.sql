SELECT
    p.product_id,
    p.product_category_name,
    pct.product_category_name_english
FROM {{ ref('stg_products') }} AS p
LEFT JOIN {{ ref('stg_product_category_name_translation') }} AS pct
    ON p.product_category_name = pct.product_category_name
