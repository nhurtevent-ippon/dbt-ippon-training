with restaurant as (
    select * from {{ source('restaurant', 'restaurant') }}
)

select * from restaurant