## Table of Contents
- [Objective](#objective)
- [Data Preparation](#data-preparation)
- [Custom Columns Created](#custom-columns-created)
- [DAX Measures for Key Business Metrics](#dax-measures-for-key-business-metrics)
- [Visualization](#visualization)
- [Key Insights](#key-insights)
- [Report Publishing](#report-publishing)

## Housing Data Analysis 

This is an end-to-end business intelligence project built using Power BI, showcasing expertise in data cleaning, DAX calculations, and interactive visualizations. It features cloud integration with Google BigQuery, SQL-based transformations, and deployment to the Power BI Service.

**Tools used :**

---

| Tool         | Purpose                         |
|--------------|---------------------------------|
| Power BI     | Dashboard creation              |
| SQL Server   | Data joins, cleaning, KPIs      |
| DAX          | Measures & KPI logic            |
| Power Query  | Data transformation & migration |
| Google Big Query  | Cloud-based data storage & SQL operations |

---

**Data Source :** 

- **Google BigQuery** (connected to Power BI)
- Original CSV file: `Housing Data.csv`

**Domain :** Real Estate Analytics

## Objective

To analyze housing market data and generate actionable insights on sales trends, pricing patterns, regional performance, and property features using Power BI for effective decision-making.

## Data Preparation

- Loaded raw CSV data into **Google BigQuery** and connected it to **Power BI**.
- Used **SQL in BigQuery** for data exploration and transformation:
  - Applied aggregations and conditional logic.
  - Calculated average purchase price by sales type.
  - Normalized area data by setting `SQM = 100` where `no_rooms = 3`.
- Used **Power Query Editor** for further data cleaning:
  - Removed duplicates and renamed columns for clarity.
  - Replaced null values:
    - `Inflation Rate` → 1.85  
    - `Yield on Mortgage Credit Bonds` → 1.47
  - Performed column profiling and data quality checks.
- Final dataset was cleaned, structured, and ready for reporting and DAX modeling in Power BI.

## Custom Columns Created

- **Age of Property** 
  Calculates how old the property is at the time of sale.  
  *Used to analyze the relationship between property age and purchase price in visualizations.* 
```Dax
Age = ABS(YEAR('Housing Data'[date]) - 'Housing Data'[year_build])
```
- **Estimated Offer Price**
  Calculates the initial offer price based on the final purchase price and the percentage change between them.
  *Helps visualize negotiation patterns and understand pricing strategy differences.*
```Dax
Offer Price = (100*'Housing Data'[purchase_price])/(100-'Housing Data'[%_change_between_offer_and_purchase])
```

## DAX measures for key business metrics
- Average Income by Employment Type: Calculates average income by employment type using `CALCULATE` and `ALLEXCEPT` to maintain group context    while removing other filters.
```dax
Avg Income By Emp type = 
CALCULATE(AVERAGE('Loan Dataset'[Income]),
ALLEXCEPT('Loan Dataset','Loan Dataset'[EmploymentType]))
```
- Default Rate by Employment Type: Calculates the default rate by employment type using `DIVIDE` and `CALCULATE` to apply row filters and        handle division safely.
```dax
Default Rate = 
DIVIDE(
    CALCULATE(COUNTROWS('LoanData'), 'LoanData'[LoanStatus] = "Default"),
    CALCULATE(COUNTROWS('LoanData')),
    0
)
``` 
- Avg Loan Amt (High Credit): Calculates the average loan amount for entries where the credit score is categorized as "High".
```
Avg Loan Amt(High Credit) = 
AVERAGEX(FILTER('Loan Dataset','Loan Dataset'[Credit Score Bins] = "High"),'Loan Dataset'[LoanAmount])
```
- Median Loan Amount by Credit Score Category using MEDIAN.
## Implemented time intelligence
- YOY (Year-over-Year) percentage change in defaulted loans by comparing the current year's count of defaults to the previous year's, using CALCULATE, FILTER, and   DIVIDE to handle row context, date logic, and avoid divide-by-zero errors.
```YOY Default Loan Change By Year = 
DIVIDE(
    CALCULATE(COUNTROWS(FILTER('Loan Dataset','Loan Dataset'[Default]=True())),'Loan Dataset'[Year] = YEAR(MAX('Loan Dataset'[Loan_Date]))) - 
    CALCULATE(COUNTROWS(FILTER('Loan Dataset','Loan Dataset'[Default]=True())),'Loan Dataset'[Year] = YEAR(MAX('Loan Dataset'[Loan_Date]))-1),
    CALCULATE(COUNTROWS(FILTER('Loan Dataset','Loan Dataset'[Default]=True())),'Loan Dataset'[Year] = YEAR(MAX('Loan Dataset'[Loan_Date))-1),0) * 100
```
- YTD (Year-to-Date) loan amount is calculated using CALCULATE and DATESYTD to sum loans from the beginning of the year up to the current date, while ALLEXCEPT      keeps the grouping by Credit Score Bins and Marital Status.
```YTD Loan Amount By Credit Score Bins & Marital Status = 
CALCULATE(SUM('Loan Dataset'[LoanAmount]),DATESYTD('Loan Dataset'[Loan_Date].[Date]),ALLEXCEPT('Loan Dataset','Loan Dataset'[Credit Score Bins],'Loan Dataset'[MaritalStatus]))
```
## Visualization
- Donut Chart: Visualizes the average loan amount for high credit score customers segmented by marital Status and age group.
  [View Donutchart](images/Donutchart.png)
- Line Chart: Displays year-over-year changes in loan default rates.
  [View Linechart](images/Linechart.png)
- Ribbon Chart: The ribbon chart visualizes the YTD loan amount across credit score bins, segmented by marital status, showing value distribution and rank           changes. YTD is dynamically calculated based on the latest year in the dataset.
  [View Ribbon_chart](images/Ribbon_chart.png)
- Used a Decomposition Tree to analyze Loan Amount by Income Bracket and Employment Type, enabling interactive drilldowns and insights.
  [View Decomposition-tree](images/Decomposition-tree.png)
  
## Key Insights
- Unemployment drives the highest default rate (3.39%), making employment status a key risk indicator.
  - Helps refine approval criteria based on job stability.
- Default rates remained consistent between 11.5%–11.75% from 2013 to 2018, indicating long-term risk stability.
  - Useful for forecasting and long-term risk planning.
- Loan amounts are evenly distributed across purposes and age groups, with an average of approximately $127K.
  - Suggests consistent lending behavior across demographics. 
- High credit score borrowers, especially married ones, receive the largest median loans and show better repayment, confirming credit scoring’s role in risk         segmentation.
  - Supports credit-based loan prioritization. 
  
## Report Publishing
- Performed data validation to ensure accuracy and consistency of key metrics and calculated measures.
- Enabled scheduled refresh for the Dataflow, configured incremental refresh, and published the report to Power BI Service with report-level scheduled updates.
## Conclusion
This project demonstrates how data storytelling in Power BI can drive better decision-making in financial institutions.
