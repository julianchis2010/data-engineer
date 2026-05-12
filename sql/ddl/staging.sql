CREATE SCHEMA IF NOT EXISTS staging;

CREATE TABLE staging.clientes (
    cliente_id VARCHAR(50),
    tipo_documento VARCHAR(20),
    numero_documento VARCHAR(50),
    nombres VARCHAR(100),
    apellidos VARCHAR(100),
    email VARCHAR(200),
    telefono VARCHAR(50),
    fecha_registro DATE,
    estado_cliente VARCHAR(50),
    ciudad VARCHAR(100),
    segmento VARCHAR(50),
    fecha_nacimiento DATE,
    ingresos_mensuales NUMERIC
);

CREATE TABLE staging.creditos (
    credito_id VARCHAR(50),
    cliente_id VARCHAR(50),
    fecha_solicitud DATE,
    fecha_desembolso DATE,
    monto_aprobado NUMERIC,
    plazo_meses INT,
    tasa_interes_mensual NUMERIC,
    estado_credito VARCHAR(50),
    producto VARCHAR(100),
    fecha_vencimiento DATE,
    canal VARCHAR(50)
);

CREATE TABLE staging.pagos (
    pago_id VARCHAR(50),
    credito_id VARCHAR(50),
    fecha_pago DATE,
    monto_pago NUMERIC,
    metodo_pago VARCHAR(50),
    estado_pago VARCHAR(50),
    referencia_transaccion VARCHAR(100)
);

CREATE TABLE staging.error_records (
    id SERIAL PRIMARY KEY,
    source_table VARCHAR(100),
    error_reason VARCHAR(255),
    record_data JSONB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);