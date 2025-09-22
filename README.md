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

2. **Python (Analysis)** 
   - Use `pandas` for aggregations and descriptive statistics.  
   - Explore average selling prices, mileage, and brand frequencies.  

3. **Tableau (Visualization)** 
   - Build interactive dashboards to highlight the most popular brands and models.  
   - Compare average prices across makes and model years.
  
---

## Dashboard Preview
![Dashboard Preview](/"Used Car Sales in the US, 2018–2020, Through eBay.png")

👉 Explore the interactive version here: [Tableau Public Dashboard]((https://public.tableau.com/views/used_car_sales/UsedCarSalesintheUS20182020ThrougheBay?:language=en-GB&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link))

---

## Key Insights
- **Market dominated by older cars:** The average listing is **26 years old**, with **~100k miles** and an average price of **$11,600**.  
- **Private sellers drive supply:** Many low-value, older cars are listed by individuals rather than dealerships.  
- **Price vs. age pattern:** Prices generally fall as cars age, but pick up again for **1970s and earlier models**, where **collector demand drives value**.  
- **Brand trends:** Ford, Chevrolet, Toyota, Honda, and Nissan dominate the used-car landscape.  

---

## Skills Demonstrated
- SQL for data cleaning and preprocessing  
- Data export pipelines into Python/BI tools  
- Descriptive analysis with Python (pandas, matplotlib)  
- Data visualization with Tableau  
- Business insight generation from raw data  

