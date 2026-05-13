# Data Engineering Technical Challenge

## Overview

This project implements an end-to-end Data Engineering solution for processing financial data related to customers, loans, and payments.

The solution includes:

- CSV ingestion
- Data quality validation
- ETL pipeline in Python
- PostgreSQL staging layer
- Dimensional Data Warehouse
- Analytical SQL views
- Business KPI documentation
- Power BI semantic model
- Interactive dashboard visualization
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
↓  
Power BI Dashboard

---

# Solution Architecture Diagram

![Architecture](docs/images/architecture.png)

---

# Star Schema Model

![Star Schema](docs/images/star_schema.png)

---

# Tech Stack

- Python
- Pandas
- PostgreSQL
- SQLAlchemy
- Docker
- Power BI Desktop
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
├── docs/
│   ├── images/
│   │   ├── architecture.png
│   │   ├── star_schema.png
│   │   ├── dashboard.png
│   │   └── data_model.png
│   │
│   ├── powerbi/
│   │   └── dashboard.pbix
│   │
│   ├── data_dictionary.md
│   ├── kpis.md
│   └── powerbi_semantic_model.md
│
├── sql/
│   ├── ddl/
│   │   ├── staging.sql
│   │   ├── dwh.sql
│   │   └── views.sql
│   │
│   └── analytics/
│       ├── business_queries.sql
│       └── data_quality_checks.sql
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

---

## Transform

Transformation steps include:

- Column normalization
- Invalid date handling
- Null filtering
- Invalid value validation
- Basic data cleaning

---

## Load

The cleaned datasets are loaded into PostgreSQL staging tables.

---

# Staging Layer

The staging layer contains the following tables:

- staging.clientes
- staging.creditos
- staging.pagos
- staging.error_records

---

# Data Warehouse Model

The solution implements a dimensional star schema model.

---

## Dimensions

### dim_cliente

Stores customer descriptive attributes.

### dim_producto

Stores product-related information.

---

## Fact Tables

### fact_creditos

Stores loan transactional metrics.

### fact_pagos

Stores payment transactional metrics.

---

# Data Quality Rules

The following validations were implemented:

- Invalid dates detection
- Duplicate records validation
- Loans without customers
- Payments without loans
- Invalid payment amounts
- Invalid approved loan amounts

---

# Analytical Views

The following analytical views were implemented:

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
- Approved loan analysis
- Active customer analysis

---

# KPI Documentation

Business KPIs documented include:

- Total Portfolio
- Average Payment
- Active Customers
- Approved Loans
- Top Customers by Loan Amount

---

# Power BI Dashboard

The project includes an executive Power BI dashboard with:

- KPI cards
- Portfolio analysis by city
- Payment method analysis
- Loan status analysis
- Top customer analysis
- Interactive slicers

---

# Power BI Semantic Model

The semantic layer includes:

- Star schema relationships
- Business measures
- Analytical filtering strategy
- Fact and dimension modeling

---

# How to Run

## 1. Create virtual environment

```bash
python -m venv venv
```

---

## 2. Activate virtual environment

### Windows

```bash
.\venv\Scripts\Activate.ps1
```

---

## 3. Install dependencies

```bash
pip install -r requirements.txt
```

---

## 4. Start PostgreSQL container

```bash
docker compose up -d
```

---

## 5. Execute ETL pipeline

```bash
python -m src.main
```

---

# Database Configuration

## PostgreSQL

- Host: localhost
- Port: 5432
- Database: postgres

---

# Current Features

- Modular ETL pipeline
- Dockerized PostgreSQL environment
- Staging layer implementation
- Star schema implementation
- Data quality validation
- Analytical SQL layer
- Power BI dashboard
- Semantic modeling
- Documentation layer
- Git version control

---

# Dashboard Preview

## Executive Dashboard

![Dashboard](docs/images/dashboard.png)

---

# Data Model

![Data Model](docs/images/data_model.png)

---

# Author

Julian Gomez