with restaurant_orders as (
    select * from {{ ref('stg_restaurants_orders') }}
)

select 
    max(restaurant_identifier.identifier) as restaurant_identifier, 
    max(r.name) as name, 
    max(r.address) as address, 
    sum(r.amount) as turnover
from restaurants r