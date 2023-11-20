
{{ config(materialized='table') }}

with src_fuzzy_orders as (select * from {{ source('orders', 'fuzzy_orders') }})

select 
    d.value as dish,
    f.payment_method,
    f.amount,
    f.created_at
 from src_fuzzy_orders f,
   lateral flatten(input => parse_json(f.dishes_names)) d