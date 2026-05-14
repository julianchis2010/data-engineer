# Data Engineering Technical Challenge

## Overview

The main goal of this project is to process customer, loan, and payment data using a simple ETL pipeline and build a small analytical environment for reporting and visualization.

The project includes:

- CSV ingestion using Python
- Basic data cleaning and validation
- PostgreSQL staging layer
- Dimensional data warehouse model
- Analytical SQL views
- Business queries
- Power BI dashboard
- Dockerized local environment


# Architecture

CSV Files  
↓
Python ETL Pipeline  
↓
PostgreSQL Staging  
↓
Data Warehouse  
↓
SQL Analytics & Power BI Dashboard


# Architecture Diagram

docs/architecture.png


# Star Schema

docs/star_schema.png


# Tech Stack

- Python
- Pandas
- PostgreSQL
- SQLAlchemy
- Docker
- Power BI Desktop
- DBeaver
- Git & GitHub


# Project Structure

data-engineer/
│
├── data/
│   └── raw/
│
├── docs/
│   ├── images/
│   ├── powerbi/
│   │   ├── Dashboard.pbix
│   │   └── data_model.png    
│   ├── screenshots/
│   │   ├── Database Schemas.jpg
│   │   ├── Docket Postgres Running.jpg
│   │   ├── Full Project.jpg
│   │   └── View Running.jpg
│   ├── architecture.png
│   ├── data_dictionary.md
│   ├── kpis.md
│   └── star_schema.png
│
├── sql/
│   ├── ddl/
│   │   ├── staging.sql
│   │   ├── dwh.sql
│   │   └── views.sql
│   │
│   └── analytics/
│       ├── queries.sql
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
└── README.md


# Data Sources

The project works with three datasets:

- Customers
- Loans
- Payments

CSV files are stored inside the `data/raw` folder.


# ETL Process

## Extract

The CSV files are loaded using Pandas.

## Transform

Some basic validations and transformations were applied:

- Column normalization
- Invalid date validation
- Null handling
- Duplicate validation
- Basic cleaning

## Load

The cleaned data is loaded into PostgreSQL staging tables.


# Staging Layer

The staging schema contains:

- staging.clientes
- staging.creditos
- staging.pagos
- staging.error_records

This layer helps separate raw ingestion from the analytical model.


# Data Warehouse

A simple star schema model was created to support reporting in Power BI.

## Dimensions

- dim_cliente
- dim_producto

## Facts

- fact_creditos
- fact_pagos


# Data Quality Checks

Some validation queries were added to identify:

- Invalid dates
- Duplicate customers
- Payments without loans
- Loans without customers
- Invalid amounts

A few invalid records were intentionally kept from the source files to validate the checks.


# Analytical Views

The following SQL views were created:

- vw_cartera_total
- vw_pagos_metodo
- vw_creditos_ciudad
- vw_clientes_segmento
- vw_clientes_activos
- vw_creditos_aprobados
- vw_promedio_pagos


# Business Queries

Some exploratory business queries were added, including:

- Top customers by approved amount
- Portfolio distribution by city
- Payment analysis by method
- Approved loan analysis


# Power BI Dashboard

A Power BI dashboard was created with:

- KPI cards
- Loan analysis by city
- Payment method distribution
- Loan status analysis
- Top customers
- Interactive filters


# Challenges Found

During development some issues were identified in the source data and modeling process:

- Invalid payment dates
- Duplicate records
- Missing relationships between some payments and loans
- Ambiguous relationships between fact tables in Power BI

These cases were reviewed using validation queries and adjustments in the data model.


# How to Run

## 1. Create virtual environment

python -m venv venv

## 2. Activate environment (Windows)

.\venv\Scripts\Activate.ps1

## 3. Install dependencies

pip install -r requirements.txt

## 4. Start PostgreSQL container

docker compose up -d

## 5. Execute ETL pipeline

python -m src.main


# Database Configuration

- Host: localhost
- Port: 5432
- Database: postgres


# Dashboard Preview

## Power BI Dashboard

docs/powerbi/dashboard.pbix


# Power BI Data Model

docs/powerbi/data_model.png


# Author

Julian Gomez