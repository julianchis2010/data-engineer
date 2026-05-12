import pandas as pd


def clean_clientes(df):

    df.columns = df.columns.str.lower()

    df['email'] = (
        df['email']
        .astype(str)
        .str.lower()
        .str.strip()
    )

    df['nombres'] = df['nombres'].str.strip()
    df['apellidos'] = df['apellidos'].str.strip()

    df['fecha_registro'] = pd.to_datetime(
        df['fecha_registro'],
        errors='coerce'
    )

    return df