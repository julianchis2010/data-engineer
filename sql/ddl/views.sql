CREATE OR REPLACE VIEW dwh.vw_cartera_total AS
SELECT
    SUM(monto_aprobado) AS cartera_total
FROM dwh.fact_creditos;

CREATE OR REPLACE VIEW dwh.vw_pagos_metodo AS
SELECT
    metodo_pago,
    COUNT(*) AS cantidad_pagos,
    SUM(monto_pago) AS total_pagado
FROM dwh.fact_pagos
GROUP BY metodo_pago;

CREATE OR REPLACE VIEW dwh.vw_creditos_ciudad AS
SELECT
    dc.ciudad,
    COUNT(*) AS cantidad_creditos,
    SUM(fc.monto_aprobado) AS total_creditos
FROM dwh.fact_creditos fc
JOIN dwh.dim_cliente dc
    ON fc.cliente_key = dc.cliente_key
GROUP BY dc.ciudad;

CREATE OR REPLACE VIEW dwh.vw_clientes_segmento AS
SELECT
    segmento,
    COUNT(*) AS total_clientes
FROM dwh.dim_cliente
GROUP BY segmento;

CREATE OR REPLACE VIEW dwh.vw_clientes_activos AS
SELECT COUNT(*)
FROM dwh.dim_cliente
WHERE estado_cliente = 'ACTIVO';

CREATE OR REPLACE VIEW dwh.vw_creditos_aprobados AS
SELECT COUNT(*)
FROM dwh.fact_creditos
WHERE estado_credito = 'APROBADO';

CREATE OR REPLACE VIEW dwh.vw_promedio_pagos AS
SELECT AVG(monto_pago)
FROM dwh.fact_pagos;
