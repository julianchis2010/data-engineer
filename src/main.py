from src.extract.extractor import read_csv
from src.transform.clean_clientes import clean_clientes
from src.load.postgres_loader import load_dataframe

clientes = read_csv('data/raw/clientes.csv')

clientes = clean_clientes(clientes)

load_dataframe(clientes, 'clientes')

print('Carga completada')