CREATE OR REPLACE VIEW dwh.vw_cartera_total AS
SELECT
    SUM(monto_aprobado) AS cartera_total
FROM dwh.fact_creditos;

SELECT SUM(monto_aprobado)
FROM dwh.fact_creditos;

SELECT AVG(monto_pago)
FROM dwh.fact_pagos;

SELECT COUNT(*)
FROM dwh.dim_cliente
WHERE estado_cliente = 'ACTIVO';

SELECT COUNT(*)
FROM dwh.fact_creditos
WHERE estado_credito = 'APROBADO';

SELECT
    segmento,
    COUNT(*)
FROM dwh.dim_cliente
GROUP BY segmento;

SELECT
    d.nombres,
    d.apellidos,
    SUM(f.monto_aprobado) AS total_creditos
FROM dwh.fact_creditos f
JOIN dwh.dim_cliente d
ON f.cliente_key = d.cliente_key
GROUP BY d.nombres, d.apellidos
ORDER BY total_creditos DESC;

SELECT
    d.ciudad,
    COUNT(*)
FROM dwh.fact_creditos f
JOIN dwh.dim_cliente d
ON f.cliente_key = d.cliente_key
GROUP BY d.ciudad;