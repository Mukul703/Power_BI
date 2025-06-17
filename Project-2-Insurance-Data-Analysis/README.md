## Insurance Data Analysis 
This is an end-to-end business intelligence project built in Power BI to analyze insurance policies, claims, and customer feedback. The project demonstrates SQL integration, data modeling, DAX, sentiment analysis, RLS implementation, and deployment to Power BI Service.

**Tools used**
---

| Tool             | Purpose                                                                 |
|------------------|-------------------------------------------------------------------------|
| Power BI Desktop | Data modeling, creating visuals, and designing interactive dashboards   |
| SQL Server       | Importing raw CSV, data storage, relational joins, and data preparation |
| Power Query      | Data cleaning, transformation, and creating custom calculated columns   |
| Power BI Service | Report publishing, RLS setup, dashboard creation, and scheduled refresh |
| Text Analytics   | Performing sentiment analysis on customer feedback in Power Query       |

---
**Data Source**
- **Raw File:** `InsuranceData.csv` – Contains policy, customer, and claim details.
- **Feedback File:** `InsuranceCustomerFeedback.xlsx` – Customer comments for sentiment analysis.
- **Staging:** Both files were imported into **SQL Server** for structured joins and processing.
- **Final Load:** Connected SQL Server tables to **Power BI Desktop**.
  
**Domain** Insurance 

## Objective
To analyze insurance policies, claims, and customer feedback to identify claim patterns, segment risks, track business KPIs, and evaluate customer satisfaction using Power BI.

## Data Preparation
- Applied data profiling and transformation in Power Query Editor.  
- Created conditional columns including **Age Group Bins** for demographic insights.  
- Merged and cleaned customer feedback data from Excel.  
- Performed sentiment scoring using **Text Analytics** in Power Query.

## Visualization
### Page 1: Insurance Portfolio Overview
![Page1](Page1.png)

- **Card Visuals**: Premium Amount, Coverage Amount, Claim Amount.  
- **Multi-row Card**: Total number of Male and Female customers using `Gender` field.
- **Ribbon Chart**: Count of Claim Status across Settled, Rejected, and Pending.  
- **Bar Chart**: Premium Amount by Policy Type.  
- **Line Chart**: Sum of Claim Amount by Age Group.  
- **Matrix Visual**: Policy-wise claims breakdown.  
- **Donut Chart**: Claim Distribution across statuses.  
- **Slicers**: Enabled for Policy Number, Customer ID, Claim Number.

### Page2: Detailed Policy & Claim View
- **Table Visual**: Displays detailed policy and claim records with drillthrough support.

### Page3: Feedback & Sentiment Analysis
- **Word Cloud**: Highlights frequently used keywords from customer feedback.  
- **Bar Chart**: Shows count of customer feedback by sentiment classification (Good vs Needs Improvement).  
- **Table Visual**: Displays customer name, sentiment score, and feedback text for detailed review.

## Key Insights
- Travel Insurance leads in total claim amount.
- 58% policies are active, with 53% overall claim approval rate.
- Customer sentiment is largely positive, with keywords like "support", "coverage", and "quick".

## Report Publishing
- Published the report to **Power BI Service**.  
- Created a **dashboard** from report pages.  
- Configured **Scheduled Refresh** using Semantic Model:  
  - Installed and configured **Data Gateway**  
  - Set up credentials and refresh frequency.

## Security & Filters  
- **Drillthrough Filter**: Enabled on `Policy Type` from Page 1 → Page 2 Table.  
- **Role-Level Security (RLS)**:  
  - Created roles for Policy Managers (Travel, Health) in Power BI Desktop  
  - Tested using **"View as Role"** and also in **Power BI Service**

## Conclusion
This end-to-end project demonstrated how to integrate SQL, Excel, and Power BI for enterprise-level insurance reporting.  
It covers technical aspects like RLS, scheduled refresh, drillthrough, and sentiment analytics, making it both data-rich and business-relevant.
