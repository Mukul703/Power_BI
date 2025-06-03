## Table of Contents
- [Objective](#objective)
- [Data Preparation](#data-preparation)
- [Custom Columns Created](#custom-columns-created)
- [DAX Measures for Key Business Metrics](#dax-measures-for-key-business-metrics)
- [Visualization](#visualization)
- [Key Insights](#key-insights)
- [Report Publishing](#report-publishing)
## Loan Default Analysis
**Tools used :** Power BI Desktop, SQL Server Management Studio
**Data Source :** Dataflow
**Domain :** Banking

## Objective
To build an interactive power BI report using a Loan Default Dataset, aimed at identifying key factors that influence loan repayment. The goal is to help bank    officials make informed decisions by highlighting patterns in borrowing profiles and past defaults, ultimately reducing future loan risks.

## Data Preparation
- Connected Power BI to a SQL Server source via Dataflow and imported data into Power BI Desktop.
- Cleaned and transformed data using Power Query Editor (data types, column renaming, profiling).
## Custom Columns Created
- Age Grouped : Categorized borrowers into age-based segments to support analysis of loan patterns across different life stages.
- Credit Score Bins : Grouped borrowers by credit score to highlight differences in risk and repayment patterns.
- Income Brackets : Grouped borrowers by income levels to analyze loan trends.
## DAX measures for key business metrics
- Average Income by Employment Type : Calculates average income by employment type using `CALCULATE` and `ALLEXCEPT` to maintain group context while removing      other filters.
```dax
Avg Income By Emp type = 
CALCULATE(AVERAGE('Loan Dataset'[Income]),
ALLEXCEPT('Loan Dataset','Loan Dataset'[EmploymentType]))
```
- Default Rate by Employment Type : Calculates the default rate by employment type using `DIVIDE` and `CALCULATE` to apply row filters and handle division safely.
```dax
Default Rate = 
DIVIDE(
    CALCULATE(COUNTROWS('LoanData'), 'LoanData'[LoanStatus] = "Default"),
    CALCULATE(COUNTROWS('LoanData')),
    0
)
``` 
- Avg Loan Amt (High Credit) : Calculates the average loan amount for entries where the credit score is categorized as "High".
```
Avg Loan Amt(High Credit) = 
AVERAGEX(FILTER('Loan Dataset','Loan Dataset'[Credit Score Bins] = "High"),'Loan Dataset'[LoanAmount])
```
- Median Loan Amount by Credit Score Category using MEDIAN.
## Implemented time intelligence
- YOY (Year-over-Year) percentage change in defaulted loans by comparing the current year's count of defaults to the previous year's, using CALCULATE, FILTER, and   DIVIDE to handle row context, date logic, and avoid divide-by-zero errors.
```YOY Default Loan Change By Year = 
DIVIDE(
    CALCULATE(COUNTROWS(FILTER('Loan Dataset','Loan Dataset'[Default]=True())),'Loan Dataset'[Year] = YEAR(MAX('Loan Dataset'[Loan_Date_DD_MM_YYYY]))) - 
    CALCULATE(COUNTROWS(FILTER('Loan Dataset','Loan Dataset'[Default]=True())),'Loan Dataset'[Year] = YEAR(MAX('Loan Dataset'[Loan_Date_DD_MM_YYYY]))-1),
    CALCULATE(COUNTROWS(FILTER('Loan Dataset','Loan Dataset'[Default]=True())),'Loan Dataset'[Year] = YEAR(MAX('Loan Dataset'[Loan_Date_DD_MM_YYYY]))-1),0) * 100
```
- YTD (Year-to-Date) loan amount is calculated using CALCULATE and DATESYTD to sum loans from the beginning of the year up to the current date, while ALLEXCEPT      keeps the grouping by Credit Score Bins and Marital Status.
```YTD Loan Amount By Credit Score Bins & Martial Status = 
CALCULATE(SUM('Loan Dataset'[LoanAmount]),DATESYTD('Loan Dataset'[Loan_Date].[Date]),ALLEXCEPT('Loan Dataset','Loan Dataset'[Credit Score Bins],'Loan Dataset'[MaritalStatus]))
```
## Visualization
- Donut Chart : Visualizes the average loan amount for high credit score customers segmented by martial Status and age group.
  [View Donutchart](images/Donutchart.png)
- Line Chart : Shows year-over-year change in loan defaults across different years.
  [View Linechart](images/Linechart.png)
- Ribbon Chart : The ribbon chart visualizes the YTD loan amount across credit score bins, segmented by marital status, showing value distribution and rank          changes. YTD is dynamically calculated based on the latest year in the dataset.
  [View Ribbon_chart](images/Ribbon_chart.png)
- Used a Decomposition Tree to analyze Loan Amount by Income Bracket and Employment Type, enabling interactive drilldowns and insights.
  [View Decomposition-tree](images/Decomposition-tree.png)
  
## Key Insights
- 
## Report Publishing
- Performed data validation to ensure accuracy and consistency of key metrics and calculated measures.
- Enabled scheduled refresh for the Dataflow, configured incremental refresh, and published the report to Power BI Service with report-level scheduled updates.

