import pandas as pd


def clean_pagos(df):

    df.columns = df.columns.str.lower()

    df['fecha_pago'] = pd.to_datetime(
        df['fecha_pago'],
        errors='coerce'
    )

    df = df[df['fecha_pago'].notnull()]

    return df