with restaurant_orders as (
    select * from {{ ref('stg_restaurants_orders') }}
)

select 
    restaurant_identifier, 
    max(r.name) as name, 
    max(r.address) as address, 
    sum(r.amount) as turnover
from restaurant_orders r
group by restaurant_identifier