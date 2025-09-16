# Used Car Sales Analysis (SQL + Python + Tableau)

## About the Dataset
**Context**  
This dataset contains ~160,000 records of used car sales in the U.S. over a 20-month period (2019–2020), scraped from Ebay. I was published on Kaggle: https://www.kaggle.com/datasets/tsaustin/us-used-car-sales-data?select=used_car_sales.csv

**Content**  
Each record includes details such as:  
- Selling price  
- Location  
- Make, model, year  
- Mileage and other attributes  

The dataset was pre-filtered by the original author to avoid duplicates from re-listed vehicles.

---

## Project Goal
The aim of this project is to:  
1. **Clean** the raw dataset in SQL (standardize makes, handle duplicates, remove invalid values).  
2. **Export** the cleaned data for further analysis in Python (Jupyter).  
3. **Visualize** results in Tableau or similar BI tools.  
4. **Generate insights** that could be useful for a hypothetical used car dealership — e.g., identifying the most popular brands, average prices, and market trends.  

---

## Workflow
1. **SQL (Data Cleaning)**  
   - Handled inconsistent brand names (e.g., `ponitac`, `PONTlAC` → `Pontiac`).  
   - Removed invalid categories such as “Other Makes” and “Replica/Kit.”  
   - Deduplicated repeated entries.  
   - Reduced the dataset from ~144k to ~120k valid rows.  

2. **Python (Analysis)** *(planned)*  
   - Use `pandas` for aggregations and descriptive statistics.  
   - Explore average selling prices, mileage, and brand frequencies.  

3. **Tableau (Visualization)** *(planned)*  
   - Build interactive dashboards to highlight the most popular brands and models.  
   - Compare average prices across makes and model years.  

---

## Interim Insights
- Early cleaning shows that the dataset was heavily affected by duplicate and invalid entries.  
- The most common makes are expected to be Ford, Chevrolet, Toyota, Honda, and Nissan.  
- By combining SQL cleaning with Python analysis and Tableau visualization, the project will provide dealership-style recommendations on which brands/models offer the best balance of popularity and value.  

---

## Next Steps
- Finalize SQL regex mappings to cover modern EV brands (Rivian, Lucid, Polestar, Genesis).  
- Conduct exploratory analysis in Python (average prices, mileage distributions).  
- Create Tableau dashboards to communicate insights visually.  
- Summarize recommendations for a used car dealership (e.g., which makes/models to prioritize).  

---

## Skills Demonstrated
- SQL for data cleaning and preprocessing  
- Data export pipelines into Python/BI tools  
- Descriptive analysis with Python (pandas, matplotlib)  
- Data visualization with Tableau  
- Business insight generation from raw data  

