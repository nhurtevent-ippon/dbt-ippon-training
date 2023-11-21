from fuzzywuzzy import process

import pandas as pd

def model(dbt, session):
    dbt.config(
        materialized = "table",
        packages = ["fuzzywuzzy"]
    )

    dishes_df = dbt.source("dishes", "dishes").to_pandas()
    fuzzy_orders_df = dbt.ref("stg_fuzzy_orders").to_pandas()

    dishes = dishes_df["name"]

    fuzzy_orders_df["dish"] = fuzzy_orders_df["dish"].apply(lambda dish: process.extractOne(dish, dishes))

    return fuzzy_orders_df