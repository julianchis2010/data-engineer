-- DUPLICADOS CLIENTES

SELECT
    cliente_id,
    COUNT(*)
FROM staging.clientes
GROUP BY cliente_id
HAVING COUNT(*) > 1;


-- CREDITOS SIN CLIENTE

SELECT c.*
FROM staging.creditos c
LEFT JOIN staging.clientes cl
ON c.cliente_id = cl.cliente_id
WHERE cl.cliente_id IS NULL;


-- PAGOS SIN CREDITO

SELECT p.*
FROM staging.pagos p
LEFT JOIN staging.creditos c
ON p.credito_id = c.credito_id
WHERE c.credito_id IS NULL;


-- FECHAS INVALIDAS

SELECT *
FROM staging.pagos
WHERE fecha_pago IS NULL;