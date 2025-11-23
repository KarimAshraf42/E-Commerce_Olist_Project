SELECT
    TRIM(order_id)::text AS order_id,
    TRIM(customer_id)::text AS customer_id,
    LOWER(TRIM(order_status))::varchar(30) AS order_status,
    to_timestamp(trim(order_purchase_timestamp), 'YYYY-MM-DD HH24:MI:SS') AS order_purchase_timestamp,
    to_timestamp(trim(order_approved_at), 'YYYY-MM-DD HH24:MI:SS') AS order_approved_at,
    to_timestamp(trim(order_delivered_carrier_date), 'YYYY-MM-DD HH24:MI:SS') AS order_delivered_carrier_date,
    to_timestamp(trim(order_delivered_customer_date), 'YYYY-MM-DD HH24:MI:SS') AS order_delivered_customer_date,
    to_timestamp(trim(order_estimated_delivery_date), 'YYYY-MM-DD HH24:MI:SS') AS order_estimated_delivery_date
FROM {{ source('raw', 'orders') }}
