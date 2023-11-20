with restaurants as (
    select * from {{ source('restaurants', 'restaurants') }}
)

select * from restaurants