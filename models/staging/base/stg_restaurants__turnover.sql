with orders as (
    select * from {{ ref('base_orders') }}
),

restaurants as (
    select * from {{ ref('base_restaurants') }}
)

select max(r.identifier) as restaurant_identifier, max(r.name) as name, max(r.address) as address, sum(o.amount) as turnover
    from orders o
    full outer join restaurants r
    on r.identifier = o.restaurant_identifier
    group by restaurant_identifier