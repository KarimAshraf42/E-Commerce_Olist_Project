SELECT
    TRIM(seller_id)::text AS seller_id,
    LPAD(TRIM(seller_zip_code_prefix::text), 5, '0')::varchar(5) AS seller_zip_code_prefix,
    LOWER(
        REGEXP_REPLACE(
            UNACCENT(TRIM(seller_city)),
            '[^a-zA-Z''\s]',
            ' ',
            'g'
        )
    )::varchar(50) AS seller_city,
    TRIM(seller_state)::varchar(2) AS seller_state
FROM {{ source('raw', 'sellers') }}
