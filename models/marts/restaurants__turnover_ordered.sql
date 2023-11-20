with stg_restaurant_turnover as (
    select * from {{ ref('stg_restaurants__turnover') }}
)

select 
    * 
from stg_restaurant_turnover 
order by turnover desc