#  Project 8: Supply Chain Optimization Project

## Overview
This project focuses on analyzing supply chain data to identify bottlenecks and propose optimizations to reduce costs and improve efficiency. The analysis incorporates data cleaning, SQL queries, Python-based data analysis, and visualization techniques to generate actionable insights. 

This project is designed as part of a **Data Analyst portfolio**, focusing on showcasing skills in data preparation, SQL, visualization, and basic dashboard creation.

## Project Structure
Below is an overview of the project folder structure and the role of each file:

### 1. **Data Preparation**
   - **`DataCoSupplyChainDataset.csv`**: The raw dataset containing supply chain information.
   - **`cleaned_supply_chain_data.csv`**: The cleaned version of the dataset prepared for analysis.

   - **Scripts for Cleaning:**
     - **`Cleaning.ipynb`**: Jupyter notebook containing data cleaning processes using pandas in Python.

   - **Data Validation Outputs:**
     - **`correlation_matrix.png`**: Heatmap of correlations among numeric features.

---

### 2. **SQL Work**
   SQL scripts and queries were used to create, manipulate, and extract insights from a relational database.

   - **Database Scripts:**
     - **`CreateView.sql`**: Script to create a SQL view combining multiple tables for easier analysis.
     - **`TablesCreation.sql`**: Script for creating normalized tables for customers, orders, products, shipping, and more.
     - **`TemporaryDatabase.sql`**: Temporary table creation for loading and processing raw data.

   - **Data Updates:**
     - **`UpdateData.sql`**: SQL script for updating or enriching data within the database.

   - **Query Results:**
     - **`avg_profit_by_segment.html`**: Visualization of average profit per customer segment generated from SQL queries.
     - **`late_delivery_by_region.html`**: SQL-based insights on regions with the highest late delivery risks.
     - **`shipping_delays.html`**: Analysis of shipping delays across the supply chain.

---

### 3. **Data Analysis and Visualization**
   The project utilized Python and visualization libraries (Matplotlib, Seaborn, Plotly, and Dash) to analyze and visualize the data.

   - **Jupyter Notebooks:**
     - **`Exploratory data analysis (EDA).ipynb`**: Detailed exploratory analysis of cleaned data.

---

### 4. **Python Insights and Scripts**
   Python scripts for advanced analysis and visualization:
   - **`late_delivery_by_region.html`**: Visualization highlighting regions with high delivery risks.
   - **`profit_distribution.html`**: Profit distributions visualized with histogram and summary statistics.
   - **`orders_by_country.html`**: Interactive visualization of order counts by country.

---

### 5. **Key Deliverables**
   - Insights into shipping delays, delivery risks, and profit metrics.
   - Static and interactive dashboards for deeper exploration of trends and inefficiencies.
   - SQL scripts to manage and query the relational database effectively.

---

## Setup Instructions

### Prerequisites
1. Install Python (3.8+) and Jupyter Notebook.
2. Install MySQL Workbench or any SQL client.
3. Install required Python libraries using:
   ```bash
   pip install pandas matplotlib seaborn plotly dash mysql-connector-python
