# Kimia Farma Business Performance Analytics (2020–2023)

## 📌 Project Overview
This project was developed as part of a virtual internship at **Kimia Farma** for the role of **Big Data Analytics Intern**.  
The main objective was to evaluate the business performance of Kimia Farma between **2020 and 2023** by analyzing transaction, product, inventory, and branch data.

## 📊 Dataset
The following datasets were provided:
- `kf_final_transaction.csv`
- `kf_inventory.csv`
- `kf_kantor_cabang.csv`
- `kf_product.csv`

All datasets were imported into **Google BigQuery** as tables for further processing.

## 🛠 Tools & Technologies
- **Excel** → Dataset preparation
- **Google BigQuery & SQL** → Data storage, cleaning, transformation, and analysis
- **Google Looker Studio** → Interactive dashboard and visualization

## 🔎 Methodology
1. **Data Import**: Uploaded the four CSV files into BigQuery.  
2. **Data Transformation**: Built an **analysis table** by joining and aggregating multiple datasets.  
   - Transaction details (ID, date, customer, branch).  
   - Branch information (city, province, rating).  
   - Product details (ID, name, actual price, discount, profit margin).  
   - Calculated fields: `nett_sales`, `nett_profit`, `persentase_gross_laba`.  
3. **Visualization**: Connected the analysis table to Looker Studio and created an interactive dashboard.

## 📈 Dashboard Features
- KPI Summary Cards (Total Sales, Nett Profit, Transactions, Products Sold, Branch Rating)  
- Yearly Revenue Comparison (2020–2023)  
- Top 10 Provinces by Transaction Volume  
- Top 10 Provinces by Nett Sales  
- Top 5 Branches with High Ratings but Low Transaction Ratings  
- Geo Map of Profit by Province  
- Distribution of Transactions by City (Pie Chart)  

## 🚀 Results
- Revenue trends fluctuated between 2020 and 2023, showing significant growth in certain years.  
- **East Java** emerged as the leading province in both transaction volume and nett sales.  
- Several branches maintained high ratings overall but received low transaction ratings, suggesting possible gaps in customer transaction experience.  
- Profit distribution varied significantly across provinces, with certain regions dominating the overall profit.  
- Transaction activity was heavily concentrated in **Jakarta**, compared to other cities.  

## 🔗 Live Dashboard
https://lookerstudio.google.com/reporting/6e60f786-4d88-460f-9728-6af51a91be9c

---

Created by Fyantika Qirani Asmara 🌟 | Built with SQL + BigQuery + Looker Studio
