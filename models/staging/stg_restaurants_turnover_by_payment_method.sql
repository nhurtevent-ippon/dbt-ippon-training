/*{% set get_payment_method_query%}
    select distinct(payment_method) from {{ source('orders', 'orders') }}
{% endset %}

{% set payment_methods=run_query(get_payment_method_query)%}

{% if execute %}
{# Return the first column #}
{% set payment_methods_list = payment_methods.columns[0].values() %}
{% else %}
{% set payment_methods_list = [] %}
{% endif %}
*/

{% set payment_methods=dbt_utils.get_column_values(table=source('orders', 'orders'), column='payment_method') %}

with restaurants_orders as (
    select * from {{ ref('stg_restaurants_orders') }}
)

select 
    max(restaurant_identifier) as restaurant_identifier, 
    {% for payment_method in payment_methods_list %}
        sum(case when payment_method = '{{payment_method}}' then amount end) as {{payment_method}}_amount,        
    {% endfor %}
    max(name) as name, 
    max(address) as address

from restaurants_orders 
group by restaurant_identifier