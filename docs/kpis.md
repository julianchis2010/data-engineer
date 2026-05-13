# Business KPIs

## 1. Total Approved Portfolio

### Description
Total amount approved in loans.

### Formula

```sql
SELECT SUM(monto_aprobado)
FROM dwh.fact_creditos;
```

### Business Value
Measures the total loan portfolio exposure.


## 2. Average Payment Amount

### Description
Average amount paid by customers.

### Formula

```sql
SELECT AVG(monto_pago)
FROM dwh.fact_pagos;
```

### Business Value
Helps identify average customer payment behavior.


## 3. Active Customers

### Description
Total number of active customers.

### Formula

```sql
SELECT COUNT(*)
FROM dwh.dim_cliente
WHERE estado_cliente = 'ACTIVO';
```

### Business Value
Measures the active customer base.


## 4. Approved Loans

### Description
Total number of approved loans.

### Formula

```sql
SELECT COUNT(*)
FROM dwh.fact_creditos
WHERE estado_credito = 'APROBADO';
```

### Business Value
Measures credit approval volume.


## 5. Top Customers by Loan Amount

### Description
Customers with the highest approved loan amounts.

### Formula

```sql
SELECT
    d.nombres,
    d.apellidos,
    SUM(f.monto_aprobado) AS total_creditos
FROM dwh.fact_creditos f
JOIN dwh.dim_cliente d
ON f.cliente_key = d.cliente_key
GROUP BY d.nombres, d.apellidos
ORDER BY total_creditos DESC;
```

### Business Value
Identifies high-value customers.