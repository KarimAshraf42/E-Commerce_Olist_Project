select
    trim(order_id)::text as order_id,
    payment_sequential::int as payment_sequential,
    case
        when lower(trim(payment_type)) = 'credit_card' then 'credit card'
        when lower(trim(payment_type)) = 'debit_card' then 'debit card'
        else lower(trim(payment_type))
    end as payment_type,
    payment_installments::int as payment_installments,
    payment_value::real as payment_value  
from {{ source('raw', 'order_payments') }}
where lower(trim(payment_type)) != 'not_defined'
