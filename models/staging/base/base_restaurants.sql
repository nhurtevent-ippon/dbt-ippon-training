with restaurants as (
    select * from {{ mockable_source('restaurants', 'restaurants', 'sample_restaurants') }}
)

select * from restaurants