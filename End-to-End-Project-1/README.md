## Loan Default Analysis
**Tools used :** Power BI Desktop, SQL Server Mangaement Studio
**Data Source :** Dataflow
**Domain :** Banking

## Objective
To build an interactive power BI report using a Loan Default Dataset, aimed at identifying key factors that influence loan repayment. The goal is to help bank officials make informed decisions by highlighting patterns in borrowing profiles and past defaults, ultimately reducing future loan risks.

## Data Preparation
- Connected Power BI to a SQL Server source via Dataflow and imported data into Power BI Desktop.
- Cleaned and transformed data using Power Query Editor (data types, column renaming, profiling).
## DAX measures for key business metrics
  - Average Income by Employment Type (DAX used : CALCULATE modifies the filter context to apply custom conditions, AVERAGEX computes the average over a table      expression, and ALLEXCEPT removes all filters except the specified column to maintain group-level context.)
```dax
Avg Income By Emp type = 
CALCULATE(AVERAGE('Loan Dataset'[Income]),
ALLEXCEPT('Loan Dataset','Loan Dataset'[EmploymentType]))
```
  - Default Rate by Employment Type using DIVIDE, COUNTROWS, ALL, and ALLEXCEPT.
```dax
Default Rate = 
DIVIDE(
    CALCULATE(COUNTROWS('LoanData'), 'LoanData'[LoanStatus] = "Default"),
    CALCULATE(COUNTROWS('LoanData')),
    0
)
``` 
  - Average Loan by Age Group using AVERAGEX and VALUES.
  - Median Loan Amount by Credit Score Category using MEDIAN.
## Implemented time intelligence
  - YOY (Year-over-Year) percentage change in defaulted loans by comparing the current year's count of defaults to the previous year's, using CALCULATE, FILTER, and       DIVIDE to handle row context, date logic, and avoid divide-by-zero errors.
  - YTD (Year-to-Date) loan amount is calculated using CALCULATE and DATESYTD to sum loans from the beginning of the year up to the current date, while ALLEXCEPT        keeps the grouping by Credit Score Bins and Marital Status.
- Visualization:
- Performed data validation to ensure accuracy and consistency of key metrics and calculated measures.
- Enabled scheduled refresh for the Dataflow, configured incremental refresh, and published the report to Power BI Service with report-level scheduled updates.

## Key Insights

## Report
Power BI report available in the repository.
