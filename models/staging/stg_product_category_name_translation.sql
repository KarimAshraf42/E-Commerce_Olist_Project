SELECT
    LOWER(
        REGEXP_REPLACE(
            UNACCENT(TRIM(product_category_name)),
            '[^a-zA-Z''\s]',
            ' ',
            'g'
        )
    )::text AS product_category_name,
    LOWER(
        REGEXP_REPLACE(
            UNACCENT(TRIM(product_category_name_english)),
            '[^a-zA-Z''\s]',
            ' ',
            'g'
        )
    )::text AS product_category_name_english
FROM {{ source('raw', 'product_category_name_translation') }}
