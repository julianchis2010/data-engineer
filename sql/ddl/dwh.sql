CREATE SCHEMA IF NOT EXISTS dwh;

CREATE TABLE IF NOT EXISTS dwh.dim_cliente AS
SELECT DISTINCT
    ROW_NUMBER() OVER() AS cliente_key,
    cliente_id,
    nombres,
    apellidos,
    ciudad,
    segmento,
    estado_cliente,
    ingresos_mensuales,
    fecha_registro
FROM staging.clientes;

CREATE TABLE IF NOT EXISTS dwh.dim_producto AS
SELECT DISTINCT
    ROW_NUMBER() OVER() AS producto_key,
    producto,
    canal
FROM staging.creditos;

CREATE TABLE IF NOT EXISTS dwh.fact_creditos AS
SELECT
    ROW_NUMBER() OVER() AS credito_key,
    c.credito_id,
    dc.cliente_key,
    c.monto_aprobado,
    c.plazo_meses,
    c.tasa_interes_mensual,
    c.estado_credito
FROM staging.creditos c
JOIN dwh.dim_cliente dc
ON c.cliente_id = dc.cliente_id;

CREATE TABLE IF NOT EXISTS dwh.fact_pagos AS
SELECT
    ROW_NUMBER() OVER() AS pago_key,
    pago_id,
    credito_id,
    fecha_pago,
    monto_pago,
    metodo_pago,
    estado_pago
FROM staging.pagos;

CREATE INDEX IF NOT EXISTS idx_cliente_id
ON dwh.dim_cliente(cliente_id);

CREATE INDEX IF NOT EXISTS idx_fact_creditos_cliente_key
ON dwh.fact_creditos(cliente_key);