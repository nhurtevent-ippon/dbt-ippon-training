{% macro mockable_source(source_name, table_name, mocked_source) %}
    {% if target.name.lower() in ['ci', 'prod', 'dev'] %}
        {{ ref(mocked_source) }}
    {% else %}
        {{ source(source_name, table_name) }}
    {% endif %}
{% endmacro %}