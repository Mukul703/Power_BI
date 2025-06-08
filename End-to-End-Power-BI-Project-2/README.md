## Table of Contents
- [Objective](#objective)
- [Data Preparation](#data-preparation)
- [Custom Columns Created](#custom-columns-created)
- [DAX Measures for Key Business Metrics](#dax-measures-for-key-business-metrics)
- [Visualization](#visualization)
- [Key Insights](#key-insights)
- [Report Publishing](#report-publishing)
## Inventory Management Dashboard
**Tools used :**
---
| Tool         | Purpose                         |
|--------------|---------------------------------|
| Power BI     | Dashboard creation              |
| SQL Server   | Data joins, cleaning, KPIs      |
| MySQL        | Production environment & testing|
| DAX          | Measures & KPI logic            |
| Power Query  | Data transformation & migration |
---
 
**Data Source :** Raw data in CSV format, imported into SQL Server (test) and MySQL (production) for dashboard development in Power BI.
- Test Data  
  - Test Environment Inventory Dataset.csv (DA Table): Contains sample inventory records for development and test         purposes, including daily product demand and availability.
- Production Data  
  - Prod Env Inventory Dataset.csv: Complete inventory records from the production environment for final analysis.
- Reference Data 
  - Products.csv: Contains products details like Product ID, Name, and Unit Price used to link product details and        caculate KPIs. 

**Domain :** Retail

## Objective
Developed an inventory dashboard in Power BI to simulate a real-world enterprise reporting system with a focus on clean, validated reporting workflow.
-  Designing and validating the solution in a test environment
-  Creating insightful KPIs and DAX measures for supply-demand monitoring
-  Transitioning the dashboard to a production environment
-  Switching the data source from SQL Server to MySQL

# Data Preparation
## Test Environment
- Imported raw CSV files into the SQL Server test environment to simulate a real-world data source.
- Joined the Products and Test Inventory tables using a LEFT JOIN to merge product details with inventory records.
- Imported the merged dataset into Power BI Desktop.
- Handled NULL values and ensured clean entries in fields like Order Date, Product ID, Demand, and Availability.
- Updated data types (e.g., Order Date to Date), renamed tables, and applied consistent background themes.
## Production Environment
- Imported production inventory data into SQL Server.
- Cleaned the dataset by fixing invalid product IDs (e.g., 21-7, 22-11) using SQL UPDATE queries.
- Reapplied the same LEFT JOIN logic with the Products table.
- Transitioned the Power BI report from test to production by updating Data Source Settings and validated the results.
## Notes
- The production environment setup was later replicated in MySQL by rewriting SQL logic and updating Power BI           connections via the Advanced Editor.
## Custom Columns Created
- 
## DAX measures for key business metrics
- 
## Implemented time intelligence
- 
## Visualization
-  
## Key Insights
-   
## Report Publishing
- 
## Conclusion

