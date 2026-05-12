from src.utils.db import get_engine


def load_dataframe(df, table_name, schema='staging'):

    engine = get_engine()

    df.to_sql(
        table_name,
        engine,
        schema=schema,
        if_exists='append',
        index=False
    )