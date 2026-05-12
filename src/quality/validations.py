import pandas as pd


def validate_not_null(df, column_name):
    valid = df[df[column_name].notnull()]
    invalid = df[df[column_name].isnull()]

    return valid, invalid


def validate_positive(df, column_name):
    valid = df[df[column_name] > 0]
    invalid = df[df[column_name] <= 0]

    return valid, invalid


def validate_duplicates(df, column_name):
    invalid = df[df.duplicated(column_name, keep=False)]
    valid = df.drop_duplicates(column_name)

    return valid, invalid