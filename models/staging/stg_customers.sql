select
    trim(customer_id)::text as customer_id,
    trim(customer_unique_id)::text as customer_unique_id,
    lpad(trim(customer_zip_code_prefix::text), 5, '0')::varchar(5) as customer_zip_code_prefix,
    lower(
        regexp_replace(
            unaccent(trim(customer_city)),
            '[^a-zA-Z''\s]',
            '',
            'g'
        )
    )::varchar(50) as customer_city,
    trim(customer_state)::varchar(2) as customer_state
from {{ source('raw', 'customers') }}
