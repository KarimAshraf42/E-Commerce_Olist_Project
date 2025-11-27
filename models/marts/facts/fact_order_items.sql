select
     order_id,
     order_item_id,
     product_id,
     seller_id,
     shipping_limit_date,
     price,
     freight_value,
     total_price
from {{ ref('stg_order_items') }}
