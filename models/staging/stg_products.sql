SELECT
    TRIM(product_id)::text AS product_id,
    LOWER(
        REGEXP_REPLACE(
            UNACCENT(TRIM(product_category_name)),
            '[^a-zA-Z''\s]',
            ' ',
            'g'
        )
    )::text AS product_category_name
FROM {{ source('raw', 'products') }}
WHERE product_category_name IS NOT NULL
