# Airline Delay Analysis ✈️

## 📌 Project Overview
This project analyzes airline delays using:
- **Python & Pandas** for EDA and data cleaning
- **MySQL** for structured storage and SQL queries
- **Power BI** for interactive dashboards and visualizations

## 🛠 Project Structure
- `data/` → Raw dataset (CSV)
- `notebooks/` → Jupyter notebook with EDA
- `sql/` → SQL schema + analytical queries
- `scripts/` → Python sync pipeline (Pandas ↔ MySQL)
- `powerbi/` → Power BI dashboard file
- `README.md` → Project documentation

## 🔗 Steps to Run
1. Import dataset into MySQL using `create_tables.sql`
2. Run `sync_pipeline.py` to sync Pandas ↔ SQL
3. Open `Airline_Delay.pbix` in Power BI to explore dashboards
