# 📊 Kimia Farma - Transaction Analysis

This repository contains SQL scripts to analyze transaction data from Kimia Farma using Google BigQuery.

## 📁 Dataset Used

- `kf_final_transaction`
- `kf_inventory`
- `kf_kantor_cabang`
- `kf_product`

## 📌 Output Table: `kf_tabel_analisis`

This table contains enriched and aggregated data ready for dashboard visualization in Looker Studio.

### 🎯 Key Metrics:
- **nett_sales**: Net sales after discount
- **nett_profit**: Net profit based on gross margin and discount
- **rating_cabang** and **rating_transaksi**: For performance evaluation

## 🛠 SQL Logic Overview

- Joins transactions with branch and product data
- Calculates gross margin and net sales
- Outputs clean and ready-to-use transactional summary data

## 📈 Visualization


---
Created by Fyantika Qirani Asmara 🌟 | Built with SQL + BigQuery
