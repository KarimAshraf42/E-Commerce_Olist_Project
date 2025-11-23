SELECT
    fop.*,
    orv.review_id,
    orv.review_score,
    orv.review_label,
    orv.review_comment_title,
    orv.review_comment_message,
    orv.review_creation_date,
    orv.review_answer_timestamp
FROM {{ ref('fact_orders_payments') }} AS fop
LEFT JOIN {{ ref('stg_order_reviews') }} AS orv
    ON fop.order_id = orv.order_id
