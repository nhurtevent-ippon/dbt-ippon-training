with restaurant as (
    select * from {{ ref('restaurant') }}
)

select 
    sum(nb_employees) as sum_employees
from restaurant