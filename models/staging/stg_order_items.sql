select
    trim(order_id)::text as order_id,
    order_item_id::int as order_item_id,
    trim(product_id)::text as product_id,
    trim(seller_id)::text as seller_id,
    to_timestamp(trim(shipping_limit_date), 'YYYY-MM-DD HH24:MI:SS') as shipping_limit_date,
    price::real as price,
    freight_value::real as freight_value,
    (price + freight_value) :: real as total_price
from {{ source('raw', 'order_items') }}
