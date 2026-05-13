# Data Dictionary

## staging.clientes

| Column | Data Type | Description |
|---|---|---|
| cliente_id | TEXT | Unique customer identifier |
| tipo_documento | TEXT | Document type |
| numero_documento | TEXT | Document number |
| nombres | TEXT | Customer first names |
| apellidos | TEXT | Customer last names |
| email | TEXT | Customer email |
| telefono | TEXT | Customer phone number |
| fecha_registro | DATE | Customer registration date |
| estado_cliente | TEXT | Customer status |
| ciudad | TEXT | Customer city |
| segmento | TEXT | Customer segment |
| fecha_nacimiento | DATE | Birth date |
| ingresos_mensuales | NUMERIC | Monthly income |


## staging.creditos

| Column | Data Type | Description |
|---|---|---|
| credito_id | TEXT | Unique loan identifier |
| cliente_id | TEXT | Customer identifier |
| monto_aprobado | NUMERIC | Approved loan amount |
| tasa_interes | NUMERIC | Loan interest rate |
| plazo_meses | INTEGER | Loan term in months |
| estado_credito | TEXT | Loan status |
| fecha_desembolso | DATE | Loan disbursement date |


## staging.pagos

| Column | Data Type | Description |
|---|---|---|
| pago_id | TEXT | Unique payment identifier |
| credito_id | TEXT | Related loan identifier |
| fecha_pago | DATE | Payment date |
| monto_pago | NUMERIC | Payment amount |
| metodo_pago | TEXT | Payment method |
| estado_pago | TEXT | Payment status |
| referencia_transaccion | TEXT | Transaction reference |


## dwh.dim_cliente

| Column | Data Type | Description |
|---|---|---|
| cliente_key | SERIAL | Surrogate primary key |
| cliente_id | TEXT | Business customer identifier |
| nombres | TEXT | Customer names |
| apellidos | TEXT | Customer last names |
| ciudad | TEXT | Customer city |
| segmento | TEXT | Customer segment |
| estado_cliente | TEXT | Customer status |


## dwh.fact_creditos

| Column | Data Type | Description |
|---|---|---|
| credito_key | SERIAL | Surrogate primary key |
| cliente_key | INTEGER | Foreign key to customer dimension |
| monto_aprobado | NUMERIC | Approved loan amount |
| tasa_interes | NUMERIC | Loan interest rate |
| estado_credito | TEXT | Loan status |


## dwh.fact_pagos

| Column | Data Type | Description |
|---|---|---|
| pago_key | SERIAL | Surrogate primary key |
| credito_key | INTEGER | Foreign key to loan fact |
| monto_pago | NUMERIC | Payment amount |
| fecha_pago | DATE | Payment date |
| estado_pago | TEXT | Payment status |