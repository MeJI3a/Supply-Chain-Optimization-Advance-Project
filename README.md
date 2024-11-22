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

   - **Static Visualizations:**
     - **`image1.png` to `image14.png`**: PNG visualizations covering profit distributions, late delivery risks, order frequency, and more.

   - **Interactive Dashboards (Local Only):**
     - **`geo_analysis_map.html`**: Geographic analysis of delivery risks and profits.
     - **`supply_chain_dashboard.html`**: Comprehensive dashboard with key supply chain metrics.
       > **Note:** These dashboards are designed for local viewing and are not hosted. Open the `.html` files in your browser to explore the interactive dashboards.


---

### 4. **Power BI Dashboard**
   This section will include an interactive Power BI dashboard for presenting key metrics and insights. The dashboard aims to enhance stakeholder communication and decision-making by showcasing supply chain metrics in an intuitive, visual format.

   **Note:** The Power BI dashboard is under development and will be completed as part of future portfolio enhancements.

---

### 5. **Python Insights and Scripts**
   Python scripts for advanced analysis and visualization:
   - **`late_delivery_by_region.html`**: Visualization highlighting regions with high delivery risks.
   - **`profit_distribution.html`**: Profit distributions visualized with histogram and summary statistics.
   - **`orders_by_country.html`**: Interactive visualization of order counts by country.

---

### 6. **Key Deliverables**
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
