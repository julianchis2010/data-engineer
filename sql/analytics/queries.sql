SELECT
    d.nombres,
    d.apellidos,
    SUM(f.monto_aprobado) AS total_creditos
FROM dwh.fact_creditos f
JOIN dwh.dim_cliente d
ON f.cliente_key = d.cliente_key
GROUP BY d.nombres, d.apellidos
ORDER BY total_creditos DESC;
