with orders as (
    select * from {{ ref('base_orders') }}
),

restaurants as (
    select * from {{ ref('base_restaurants') }}
)

select r.identifier as restaurant_identifier, r.name as name, r.address as address, o.amount as amount, o.payment_method as payment_method
    from orders o
    full outer join restaurants r
    on r.identifier = o.restaurant_identifier