-- Check duplicated customers
SELECT
    cliente_id,
    COUNT(*)
FROM staging.clientes
GROUP BY cliente_id
HAVING COUNT(*) > 1;


-- Check loans without clients
SELECT c.*
FROM staging.creditos c
LEFT JOIN staging.clientes cl
ON c.cliente_id = cl.cliente_id
WHERE cl.cliente_id IS NULL;


-- Check payments without loan
SELECT p.*
FROM staging.pagos p
LEFT JOIN staging.creditos c
ON p.credito_id = c.credito_id
WHERE c.credito_id IS NULL;


-- Check invalid dates
SELECT *
FROM staging.pagos
WHERE fecha_pago IS NULL;


-- Check loans with invalid amounts
SELECT *
FROM staging.creditos
WHERE monto_aprobado <= 0;


-- Check payments with invalid amounts
SELECT *
FROM staging.pagos
WHERE monto_pago <= 0;