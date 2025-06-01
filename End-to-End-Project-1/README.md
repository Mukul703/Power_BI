## Loan Default Analysis
**Tools used :** Power BI Desktop, SQL Server Mangaement Studio
**Data Source :** Dataflow
**Domain :** Banking

## Objective
To build an interactive power BI report using a Loan Default Dataset, aimed at identifying key factors that influence loan repayment. The goal is to help bank officials make informed decisions by highlighting patterns in borrowing profiles and past defaults, ultimately reducing future loan risks.

## What I Did
- Connected Power BI to a SQL Server source via Dataflow and imported data into Power BI Desktop.
- Cleaned and transformed data using Power Query Editor (data types, column renaming, profiling).
- Created DAX measures for key business metrics:
  - Average Income by Employment Type (CALCULATE, AVERAGE, ALLEXCEPT(removes all filters except 'Employment Type', so the average is calculated per group, even if other slicers or visuals apply filters on the report.))

## Key Insights

## Report
Power BI report available in the repository.
