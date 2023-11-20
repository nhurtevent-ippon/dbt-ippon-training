with restaurant_turnover_by_payment_method as (
    select * from {{ ref('stg_restaurants_turnover_by_payment_method') }}
)

select * from restaurant_turnover_by_payment_method