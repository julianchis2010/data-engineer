from src.extract.extractor import read_csv
from src.transform.clean_clientes import clean_clientes
from src.transform.clean_pagos import clean_pagos
from src.load.postgres_loader import load_dataframe


# =========================
# CLIENTES
# =========================

clientes = read_csv('data/raw/clientes.csv')
clientes = clean_clientes(clientes)
load_dataframe(clientes, 'clientes')
print('Clientes cargados correctamente')


# =========================
# CREDITOS
# =========================

creditos = read_csv('data/raw/creditos.csv')
load_dataframe(creditos, 'creditos')
print('Creditos cargados correctamente')


# =========================
# PAGOS
# =========================

pagos = read_csv('data/raw/pagos.csv')
pagos = clean_pagos(pagos)
load_dataframe(pagos, 'pagos')
print('Pagos cargados correctamente')

print('Pipeline ejecutado correctamente')