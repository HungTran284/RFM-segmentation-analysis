# Customer Analysis Dashboard for Adventureworks Cycles

<a href="https://project.novypro.com/P0z7tU" target="_blank"> Click here to View the Dashboard!</a>

## Company:
AdventureWorks Cycles, a leading multinational bicycle manufacturer and distributor across North America, Europe, and Asia, aims to expand market share by focusing on high-value customers, optimizing product performance, and improving territory-level sales efficiency.

## Objective:
This dashboard aims to analyze customer behavior and sales performance using RFM (Recency, Frequency, Monetary) metrics. It helps identify AdventureWorks Cycles’ most valuable customers, understand product popularity across different segments, and provide insights for optimizing sales strategies by territory. Key questions include:

- Who are the top customers and which segments should the sales team prioritize for long-term relationships?
- Which products are most popular, and how does their performance vary across customer segments?
- How can sales and marketing efforts be optimized across different territories?

## Tools:
- **SQL Server Management Studio (SSMS):** Used for data extraction, transformation, and modeling. Also wrote SQL queries to analyze sales performance, RFM metrics, product trends, and territory distribution.
- **PowerBI:** Visualization.

## Analysis Context
- **Stakeholder:** Sales Department Manager  
- **Report Date:** July 4, 2014  
- **Analysis Period:** May 2011 – June 2014

This dashboard provides detailed visual insights that help the Sales Manager make strategic decisions to optimize sales performance across segments and territories, while also strengthening key customer relationships.
<img width="1301" height="731" alt="image" src="https://github.com/user-attachments/assets/084c9cc0-1677-42be-aa49-98ec165e225c" />

## Insight:
- The percentage of new customers is 18.5%, and lost customers is 7.8% over the past two years.
- The average number of days since a customer last placed an order is 184 days.
- The average amount spent by a customer is $6,225.
- There are 11 customer segments based on order quantity, total order value, and recency:
  - **Promising:** New customers with recent purchases, high spending but infrequent orders (1-2 orders).
  - **New Customer:** Recently made a purchase, low basket value, infrequent orders.
  - **Hibernating:** Long time since last purchase, low spending and infrequent orders.
  - **At Risk:** Long time since last purchase, previously frequent buyers with moderate spending.
  - **Cannot Lose Them:** Long time since last purchase, previously frequent and high spenders.
  - **Need Attention:** Moderate spending and order frequency, recently inactive.
  - **Potential Loyalist:** Recently made a purchase, moderate spending, multiple purchases.
  - **Loyal:** Frequent purchases (3-4 orders), moderate to high spending.
  - **About to Sleep:** Long time since last purchase, low spending and infrequent orders.
  - **Champions:** Frequent buyers (4-12 orders), high spending, recent purchases.
  - **Lost Customer:** Long time since last purchase, very low spending and frequency.

- Promising customers make up the largest segment at nearly 24%, followed by New Customers at 18.5%. Champions, Loyal, and Potential Loyal customers each make up only 2-3%.
- Customers who spend the most typically make 4-12 purchases. Key order milestones generating high revenue are 4, 8, and 12 orders.
- High-value customers often make another purchase within 50-150 days (1-2 quarters).
- Frequent buyers tend to have a shorter time since their last purchase.
