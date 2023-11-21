with restaurants as (
    select * from {{ ref('restaurants') }}
)

select 
    sum(nb_employees) as sum_employees
from restaurants