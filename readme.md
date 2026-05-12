# Data Engineering Technical Challenge

## Overview

This project implements an end-to-end Data Engineering pipeline for processing financial data related to customers, loans, and payments.

The solution includes:

- CSV ingestion
- Data cleaning and transformation
- PostgreSQL staging layer
- Dimensional Data Warehouse model
- Analytical SQL views
- Business-oriented analytical queries
- Dockerized local environment

---

# Architecture

CSV Files  
↓  
Python ETL Pipeline  
↓  
PostgreSQL Staging Layer  
↓  
Dimensional Data Warehouse  
↓  
Analytical Views & Queries

---

# Tech Stack

- Python
- Pandas
- PostgreSQL
- SQLAlchemy
- Docker
- DBeaver
- Git & GitHub

---

# Project Structure

```bash
data-engineer/
│
├── data/
│   └── raw/
│
├── sql/
│   ├── ddl/
│   │   ├── staging.sql
│   │   ├── dwh.sql
│   │   └── views.sql
│   │
│   └── analytics/
│       └── business_queries.sql
│
├── src/
│   ├── extract/
│   ├── transform/
│   ├── load/
│   └── main.py
│
├── docker-compose.yml
├── requirements.txt
├── .env
└── README.md
```

---

# Data Sources

The project processes three datasets:

- Customers
- Loans
- Payments

---

# ETL Pipeline

## Extract

CSV files are extracted using Pandas.

## Transform

Transformation steps include:

- Column normalization
- Invalid date handling
- Basic data cleaning
- Null filtering

## Load

The cleaned datasets are loaded into PostgreSQL staging tables.

---

# Data Warehouse Model

The solution implements a star schema model.

## Dimensions

- dim_cliente
- dim_producto

## Fact Tables

- fact_creditos
- fact_pagos

---

# Analytical Views

The following views were implemented:

- vw_cartera_total
- vw_pagos_metodo
- vw_creditos_ciudad
- vw_clientes_segmento
- vw_clientes_activos
- vw_creditos_aprobados
- vw_promedio_pagos

---

# Business Queries

The project includes analytical SQL queries such as:

- Top customers by approved amount
- Portfolio distribution by city
- Payment status distribution

---

# How to Run

## 1. Create virtual environment

```bash
python -m venv venv
```

## 2. Activate virtual environment

### Windows

```bash
.\venv\Scripts\Activate.ps1
```

## 3. Install dependencies

```bash
pip install -r requirements.txt
```

## 4. Start PostgreSQL container

```bash
docker compose up -d
```

## 5. Execute ETL pipeline

```bash
python -m src.main
```

---

# Current Features

- Dockerized PostgreSQL environment
- Modular ETL pipeline
- Staging layer implementation
- Star schema implementation
- Analytical SQL layer
- Git version control

---

# Author

Julian Gomez