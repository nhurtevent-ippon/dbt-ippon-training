with orders as (
    select * from {{ mockable_source('orders', 'orders', 'sample_orders') }}
)

select * from orders