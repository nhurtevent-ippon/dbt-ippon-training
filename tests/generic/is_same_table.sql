{% is_same_table(model, column_name, compare_model, compare_columns) %}

    select *
    from table(
        {{dbutils.equality(model, compare_model, compare_columns=None)}}
    )

{% endtest %}