with orders as (
    select * from {{ source('orders', 'orders') }}
)

select * from orders