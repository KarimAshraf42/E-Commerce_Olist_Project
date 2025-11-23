SELECT
    trim(review_id)::text AS review_id,
    trim(order_id)::text AS order_id,
    review_score::int AS review_score,
    CASE
        WHEN review_score = 5 THEN 'excellent'
        WHEN review_score = 4 THEN 'very good'
        WHEN review_score = 3 THEN 'good'
        WHEN review_score = 2 THEN 'poor'
        WHEN review_score = 1 THEN 'very bad'
        ELSE 'unknown'
    END::varchar(15) AS review_label,
    COALESCE(
    LOWER(
        REGEXP_REPLACE(
            TRIM(review_comment_title),
            '[^a-zA-ZÀ-ÿ''\s]', 
            '', 
            'g'
        )
    ),
    'no comment title'
) AS review_comment_title,

    COALESCE(
    LOWER(
        REGEXP_REPLACE(
            TRIM(review_comment_message),
            '[^a-zA-ZÀ-ÿ''\s]', 
            '', 
            'g'
        )
    ),
    'no comment message'
) AS review_comment_message,

    to_date(trim(review_creation_date), 'YYYY-MM-DD') AS review_creation_date,
    to_timestamp(trim(review_answer_timestamp), 'YYYY-MM-DD HH24:MI:SS') AS review_answer_timestamp
FROM {{ source('raw', 'order_reviews') }}
