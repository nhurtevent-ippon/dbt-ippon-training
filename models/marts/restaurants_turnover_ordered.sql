{% set nb_restaurants_to_show=5 %}

with stg_restaurant_turnover as (
    select * from {{ ref('stg_restaurants_turnover') }}
)

select 
    * 
from stg_restaurant_turnover 
order by turnover desc
limit {{nb_restaurants_to_show}}