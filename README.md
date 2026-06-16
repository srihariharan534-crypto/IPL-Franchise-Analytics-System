# 🏏 IPL Franchise Analytics System

> **Enterprise-grade Data Warehouse, Business Intelligence, Forecasting, Auction Intelligence, Decision Support, API Platform, Monitoring & Executive Reporting System for IPL Franchises.**

[![CI](https://github.com/yourfranchise/IPL-Franchise-Analytics-System/actions/workflows/ci.yml/badge.svg)](https://github.com/yourfranchise/IPL-Franchise-Analytics-System/actions)
[![Coverage](https://img.shields.io/badge/coverage-85%25-brightgreen)]()
[![Python](https://img.shields.io/badge/python-3.11%2B-blue)]()
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![FastAPI](https://img.shields.io/badge/FastAPI-0.111-009688)]()
[![Streamlit](https://img.shields.io/badge/Streamlit-1.35-FF4B4B)]()
[![MySQL](https://img.shields.io/badge/MySQL-8.0-4479A1)]()
[![Docker](https://img.shields.io/badge/Docker-Compose-2496ED)]()

---

## 📋 Table of Contents

- [Overview](#overview)
- [Architecture](#architecture)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Quick Start](#quick-start)
- [Data Sources](#data-sources)
- [ETL Pipeline](#etl-pipeline)
- [Analytics Modules](#analytics-modules)
- [API Documentation](#api-documentation)
- [Streamlit Dashboards](#streamlit-dashboards)
- [Power BI Reports](#power-bi-reports)
- [Monitoring](#monitoring)
- [Testing](#testing)
- [Deployment](#deployment)
- [Contributing](#contributing)

---

## 🎯 Overview

The **IPL Franchise Analytics System** is a complete end-to-end analytics platform designed for IPL franchise management teams. It enables fully data-driven decisions across:

| Domain | Capability |
|---|---|
| 🏏 Player Valuation | Impact scores, contextual value, ranking |
| 💰 Auction Intelligence | ROI, bid efficiency, undervalued players |
| 🎯 Squad Strategy | Retention, gap analysis, best XI |
| 🏟️ Match Intelligence | Phase analysis, win probability, momentum |
| 📈 Forecasting | Performance trends, auction price forecasting |
| 🤖 Decision Support | Retain/Release/Replace recommendations |
| 📊 Executive Reporting | Weekly, monthly, executive PDF reports |
| 🔌 REST API | Full JWT-secured API platform |

---

## 🏗️ Architecture

```
┌─────────────────────────────────────────────────────────┐
│                     Data Sources                         │
│   matches.csv  deliveries.csv  players.csv  auctions.csv │
└──────────────────────┬──────────────────────────────────┘
                       │ ETL Pipeline
┌──────────────────────▼──────────────────────────────────┐
│              Data Warehouse (MySQL)                       │
│   Star Schema: Fact Tables + Dimension Tables            │
│   Views | Procedures | Triggers | Indexes                │
└──────────────────────┬──────────────────────────────────┘
                       │
          ┌────────────┼────────────┐
          │            │            │
┌─────────▼──────┐ ┌───▼───┐ ┌────▼─────────┐
│ Analytics Layer│ │ ML /  │ │  Decision    │
│ Player Value   │ │Forecast│ │  Support     │
│ Auction Intel  │ │Engine │ │  Engine      │
│ Match Intel    │ └───┬───┘ └──────┬───────┘
└─────────┬──────┘     │           │
          └────────────┴──────┬────┘
                              │
                   ┌──────────▼──────────┐
                   │    FastAPI Layer      │
                   │  JWT Auth | Swagger  │
                   └──────────┬──────────┘
                              │
               ┌──────────────┼──────────────┐
               │              │              │
        ┌──────▼─────┐ ┌─────▼──────┐ ┌────▼──────┐
        │  Streamlit  │ │  Power BI  │ │ Monitoring│
        │  Dashboards │ │  Reports   │ │  & Alerts │
        └─────────────┘ └────────────┘ └───────────┘
```

---

## ✨ Features

### Data Engineering
- ✅ Complete ETL framework with retry logic, logging, config-driven execution
- ✅ Data quality validation (null checks, type validation, business rules)
- ✅ Referential integrity validation

### Data Warehouse
- ✅ Full star schema (3 fact tables, 4 dimension tables)
- ✅ 50+ optimized SQL KPI queries
- ✅ Stored procedures, triggers, views, indexes

### Analytics
- ✅ Player Value Intelligence (batting, bowling, fielding, contextual)
- ✅ Auction Intelligence (ROI, bid efficiency, undervalued/overpriced detection)
- ✅ Advanced Auction Modules (simulator, optimizer, gap analysis)
- ✅ Franchise Strategy (venue, toss, batting order, bowling combos)
- ✅ Match Intelligence (powerplay, middle overs, death overs, momentum)
- ✅ Investment Analytics (cost per run/wicket, franchise ROI)

### Forecasting
- ✅ Player performance trends (time series, rolling averages)
- ✅ Auction price benchmarking
- ✅ Win probability forecasting
- ✅ Retention risk analysis

### Decision Support
- ✅ Retain/Release/Replace/Monitor engine
- ✅ Replacement cost analysis
- ✅ Best Playing XI optimizer

### Model Explainability
- ✅ SHAP analysis
- ✅ Feature importance
- ✅ Decision explainer

### API Platform
- ✅ FastAPI with JWT authentication
- ✅ Auto-generated Swagger/ReDoc documentation
- ✅ 20+ REST endpoints

### Dashboards
- ✅ 6 Streamlit dashboard pages with Plotly
- ✅ Power BI design specifications

### Monitoring
- ✅ ETL monitoring, KPI monitoring
- ✅ Email alerting
- ✅ Audit logging

### Reporting
- ✅ Automated weekly/monthly/executive PDF reports

### Testing
- ✅ 13 test modules, 85%+ coverage
- ✅ Unit, integration, API, SQL, dashboard tests

### Deployment
- ✅ Docker + Docker Compose
- ✅ Kubernetes manifests
- ✅ Nginx reverse proxy
- ✅ GitHub Actions CI/CD

---

## 🛠️ Tech Stack

| Category | Technology |
|---|---|
| Language | Python 3.11+, SQL |
| Database | MySQL 8.0 |
| ORM | SQLAlchemy 2.0 |
| Data Engineering | Pandas, NumPy |
| ML/Forecasting | scikit-learn, statsmodels, XGBoost |
| Explainability | SHAP |
| API | FastAPI, Pydantic, JWT |
| Web App | Streamlit, Plotly |
| Testing | Pytest, pytest-cov |
| Containers | Docker, Docker Compose, Kubernetes |
| Web Server | Nginx |
| CI/CD | GitHub Actions |
| Monitoring | Python logging, custom monitors |
| Reporting | ReportLab, FPDF2 |

---

## 📁 Project Structure

```
IPL-Franchise-Analytics-System/
├── .github/workflows/          # CI/CD pipelines
├── data/                       # Data lake zones
│   ├── raw/                    # Source CSV files
│   ├── staging/                # Intermediate processing
│   ├── processed/              # Cleaned data
│   ├── curated/                # Business-ready data
│   └── warehouse/              # DW exports
├── etl/                        # ETL framework
│   ├── extract/                # Data extractors
│   ├── transform/              # Data transformers
│   ├── validate/               # Validators
│   ├── load/                   # Loaders
│   ├── orchestration/          # Pipeline orchestration
│   └── utils/                  # ETL utilities
├── database/                   # Database layer
│   ├── ddl/                    # Schema DDL
│   ├── dml/                    # Seed data
│   ├── views/                  # SQL views
│   ├── procedures/             # Stored procedures
│   ├── triggers/               # Database triggers
│   ├── indexes/                # Index definitions
│   ├── star_schema/            # Star schema scripts
│   └── data_dictionary/        # Documentation
├── sql/                        # Analytics SQL
│   ├── kpis/                   # 50+ KPI queries
│   ├── reports/                # Report queries
│   ├── procedures/             # Proc definitions
│   └── views/                  # View definitions
├── analytics/                  # Analytics modules
│   ├── player_value/           # Player valuation
│   ├── auction/                # Auction intelligence
│   ├── franchise_strategy/     # Strategy modules
│   ├── match_intelligence/     # Match analysis
│   └── investment/             # ROI analytics
├── forecasting/                # Forecasting models
├── decision_support/           # Decision engine
├── model_explainability/       # SHAP & explainability
├── api/                        # FastAPI application
│   ├── routes/                 # API routes
│   ├── services/               # Business logic
│   ├── schemas/                # Pydantic schemas
│   ├── middleware/             # Auth, logging, errors
│   └── utils/                  # API utilities
├── streamlit_app/              # Streamlit dashboards
├── powerbi/                    # Power BI design specs
├── monitoring/                 # Monitoring & alerting
│   ├── logging/                # Logger modules
│   ├── metrics/                # Metric monitors
│   ├── alerts/                 # Alert managers
│   └── dashboards/             # Monitoring dashboards
├── reports/                    # Executive reports
├── tests/                      # Test suite
├── deployment/                 # Docker, K8s, Nginx
├── docs/                       # Documentation
├── notebooks/                  # Jupyter notebooks
├── assets/                     # Diagrams, images
├── config.yaml                 # Master configuration
├── requirements.txt            # Dependencies
├── setup.py                    # Package setup
└── .env.example                # Environment template
```

---

## 🚀 Quick Start

### Prerequisites
- Python 3.11+
- MySQL 8.0+
- Docker & Docker Compose (optional)

### 1. Clone Repository
```bash
git clone https://github.com/yourfranchise/IPL-Franchise-Analytics-System.git
cd IPL-Franchise-Analytics-System
```

### 2. Set Up Environment
```bash
python -m venv venv
source venv/bin/activate   # Windows: venv\Scripts\activate
pip install -r requirements.txt
pip install -e .
```

### 3. Configure Environment
```bash
cp .env.example .env
# Edit .env with your database credentials and JWT secret
```

### 4. Initialize Database
```bash
mysql -u root -p < database/star_schema/create_star_schema.sql
mysql -u root -p ipl_analytics < database/ddl/create_all_tables.sql
mysql -u root -p ipl_analytics < database/indexes/create_indexes.sql
mysql -u root -p ipl_analytics < database/views/create_all_views.sql
mysql -u root -p ipl_analytics < database/procedures/create_all_procedures.sql
mysql -u root -p ipl_analytics < database/triggers/create_all_triggers.sql
```

### 5. Place Data Files
```bash
# Copy your CSV files to data/raw/
cp matches.csv data/raw/
cp deliveries.csv data/raw/
cp players.csv data/raw/
cp auctions.csv data/raw/
```

### 6. Run ETL Pipeline
```bash
python etl/orchestration/master_pipeline.py
```

### 7. Start API Server
```bash
uvicorn api.app:app --host 0.0.0.0 --port 8000 --reload
```

### 8. Launch Streamlit Dashboard
```bash
streamlit run streamlit_app/main.py
```

### Docker Compose (Recommended)
```bash
docker-compose up -d
```

Access:
- **Streamlit Dashboard**: http://localhost:8501
- **FastAPI Docs**: http://localhost:8000/docs
- **ReDoc**: http://localhost:8000/redoc

---

## 📊 Data Sources

| File | Description | Key Columns |
|---|---|---|
| `matches.csv` | Match-level data per IPL season | match_id, season, date, team1, team2, winner, venue |
| `deliveries.csv` | Ball-by-ball delivery data | match_id, inning, over, ball, batsman, bowler, runs |
| `players.csv` | Player profiles and metadata | player_id, name, role, nationality, dob, batting/bowling style |
| `auctions.csv` | Auction transaction data | player_id, season, team, base_price, sold_price, bid_count |

---

## 🔌 API Endpoints

| Method | Endpoint | Description |
|---|---|---|
| POST | `/api/v1/auth/token` | Get JWT token |
| GET | `/api/v1/players/` | List all players |
| GET | `/api/v1/players/{id}/value` | Player value score |
| GET | `/api/v1/players/{id}/forecast` | Performance forecast |
| GET | `/api/v1/auction/recommendations` | Auction targets |
| GET | `/api/v1/auction/simulate` | Run auction simulation |
| GET | `/api/v1/franchise/roi` | Franchise ROI |
| GET | `/api/v1/franchise/best-xi` | Optimal playing XI |
| GET | `/api/v1/decision/retain-release` | Retain/Release matrix |
| GET | `/api/v1/decision/buy-recommendations` | Buy recommendations |

Full API docs at: `http://localhost:8000/docs`

---

## 🧪 Testing

```bash
# Run all tests
pytest tests/ -v --cov=. --cov-report=html

# Run specific test modules
pytest tests/test_etl.py -v
pytest tests/test_api.py -v
pytest tests/test_kpis.py -v
```

---

## 🚢 Deployment

### Docker Compose
```bash
docker-compose up -d --build
```

### Kubernetes
```bash
kubectl apply -f deployment/kubernetes.yaml
```

See [deployment/deployment_guide.md](deployment/deployment_guide.md) for full instructions.

---

## 📄 License

MIT License — see [LICENSE](LICENSE)

---

## 🏏 Built for IPL Franchise Excellence

*Making every auction bid, player selection, and match strategy data-driven.*
