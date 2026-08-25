# E-Commerce Sales Analysis
7-day Data Analyst portfolio project — from data cleaning to dashboard and business case study.

## Progress
- [x] Day 1 — Data Cleaning (Excel)
- [x] Day 2 — Excel Analysis
- [x] Day 3 — SQL
- [x] Day 4 — Python EDA
- [x] Day 5 — Tableau Dashboard
- [ ] Day 6 — Business Case Study
- [ ] Day 7 — Portfolio Publication

## Day 1: Data Cleaning
Raw dataset (4,100 rows) cleaned down to 3,933 analysis-ready rows: duplicates, missing values, outliers, and formatting inconsistencies were identified and handled. Full documentation available in `docs/` (Indonesian and English versions).

## Day 2: Excel Analysis
Built 5 pivot tables (Top Products, Top Categories, Monthly Revenue Trend, Regional Performance, Customer Segments), a KPI summary (Total Revenue, Total Orders, Average Order Value) using SUMIFS/COUNTIF, a Customer Lookup Tool using INDEX/MATCH, 4 interactive PivotCharts, and 8 business insights. Key findings: the East region drives 75% of revenue, 17.8% of gross revenue comes from non-completed orders, and repeat customers account for 98.8% of orders. Full documentation available in `docs/` (Indonesian and English versions).

## Day 3: SQL Analysis
Imported the cleaned dataset into MySQL and wrote 15 business queries — from core metrics (Total Revenue, Total Orders, Average Order Value) to advanced analysis using window functions (Growth Month-over-Month, Cumulative Revenue Trend). Also covered: Top Products, Top Categories, Monthly Sales, Regional Sales, Repeat Customers, Highest-Value Customers, Lowest-Performing Products, Category Contribution (%), Average Revenue per Customer, and Sales by Weekday. Key findings: the East region accounts for 74.4% of revenue, Electronics is the top-performing category (25.33% of revenue), and Average Order Value ($78.33) is notably lower than average revenue per customer ($288.59) — pointing to a bundling/cross-sell opportunity. Full documentation available in `docs/` (Indonesian and English versions).

## Day 4: Python EDA
Performed exploratory data analysis in Python (pandas, matplotlib, seaborn) on the cleaned dataset — covering data structure validation, descriptive statistics, revenue/quantity distribution (histogram & boxplot), category and region breakdown, a monthly revenue time series, and a correlation heatmap between quantity, unit price, and revenue. Findings cross-validate the Day 2 and Day 3 results: revenue is strongly right-skewed (mean $78.02 vs. median $52.84), ~60% of orders are single-item purchases, Electronics and the East region remain dominant across every cut of the data, monthly revenue is highly volatile with no clear seasonality, and revenue correlates with both price (0.68) and quantity (0.62) while the two are nearly independent of each other (0.02) — reinforcing the bundling/cross-sell opportunity. Notebook and full documentation available in `python/` and `docs/` (Indonesian and English versions).

## Day 5: Tableau Dashboard
Built an interactive dashboard in Tableau Public on the same cleaned dataset — 4 KPI cards (Total Revenue, Total Orders, Total Customers, Average Order Value), 5 charts (Monthly Revenue Trend, Revenue by Category, Revenue by Region, Top 10 Products, Orders by Category), and 3 connected filters (Date, Region, Category). The dashboard re-confirms every prior finding — East region dominance ($229,821 in revenue), Electronics as the top category ($79,289), and a low AOV ($78.02) relative to average revenue per customer — while making the data explorable in real time rather than fixed in a static report. 
**[View the live dashboard on Tableau Public](https://public.tableau.com/app/profile/alya.shandy/viz/E-CommerceSalesPerformanceDashboard_17876681702130/E-CommerceSalesPerformanceDashboard)**. Full documentation available in `docs/` (Indonesian and English versions).

## Folder Structure
- `data/` — `raw_sales_data.csv` and `cleaned_sales_data.csv`
- `excel/` — `Sales_Analysis.xlsx` (pivot tables, KPI summary, charts, insights)
- `sql/` — `business_analysis.sql` (15 business queries)
- `python/` — `01_sales_eda.ipynb` (Python EDA notebook, ID and EN)
- `tableau/` — dashboard screenshots (KPI cards, charts, full dashboard, filter demo)
- `docs/` — full Day 1, Day 2, Day 3, Day 4, and Day 5 reports (ID and EN)
