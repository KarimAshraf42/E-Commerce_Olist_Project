SELECT
    foi.*,
    op.payment_sequential,
    op.payment_type,
    op.payment_installments,
    op.payment_value
FROM {{ ref('fact_orders_items') }} AS foi
LEFT JOIN {{ ref('stg_order_payments') }} AS op
    ON foi.order_id = op.order_id
