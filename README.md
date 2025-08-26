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

## RFM Overall Insight:

This RFM dashboard provides comprehensive insights into customer segments based on Recency, Frequency, and Monetary value, enabling the Sales Manager to better understand customer behaviors, identify high-value groups, and design targeted strategies to improve retention and revenue growth.

<img width="1298" height="730" alt="image" src="https://github.com/user-attachments/assets/f37c7628-7a28-43cf-b72e-ad2552cd52b2" />

### Customer Summary
- New Customers: ~18.0% of total base  
- Lost Customers: ~7.6%  
- Promising is the largest segment (~23.3%), followed by New Customers (~18%)  
- High-value groups (Champions, Loyal, Potential Loyalists) are relatively small, only 2–3% each  

### Customer Behavior
- Average days since last order: ~200 days  
- Average spending per customer: ~$6,445  
- High-value customers typically return within 90–150 days (3-5 months)  
- Frequent buyers have shorter recency, showing stronger engagement  

### Segmentation Overview (11 RFM groups)
- **Promising**: Recent purchase, high spend, but few orders (1–2)  
- **New Customers**: First purchase recently, low value, low frequency  
- **Hibernating**: Long inactive, low spend, low frequency  
- **At Risk**: Long inactive, historically moderate spend & frequent  
- **Cannot Lose Them**: Previously high-value, now long inactive  
- **Need Attention**: Moderate spend/frequency, recently inactive  
- **Potential Loyalists**: Recent purchase, moderate spend, multiple orders  
- **Loyal Customers**: Frequent (3–4 orders), consistent moderate/high spend  
- **About to Sleep**: Low spend/frequency, nearing inactivity  
- **Champions**: 4–12 orders, high spend, recent activity  
- **Lost**: Very low spend/frequency, long inactive

## Customer Segment's Product Insight:

This dashboard highlights product performance across customer segments, helping identify which groups drive order volume and revenue for specific product categories.

<img width="1271" height="717" alt="image" src="https://github.com/user-attachments/assets/26100205-5a47-4848-b956-1a61c46afd67" />

### High-value Segments (Champions, Loyal Customers)
- Strongest demand in **Bikes** and **Accessories**, consistently higher than all other segments.  
- Champions show **order peaks in Bikes**, confirming this as the main revenue driver.  
- Loyal Customers maintain stable contribution, more consistency compared to Champions.

### Medium-value Segments (Promising, Potential Loyalists, New Customers)
- **Promising** and **Potential Loyalists** have steady demand across categories which are good candidates for targeted upselling.  
- **New Customers** are active mainly in **Accessories**, suggesting a low-entry point product for onboarding.  

### At-risk Segments (At Risk, Can’t Lose Them, Need Attention)
- Still contribute noticeable volume, especially in **Bikes**.  
- **Can’t Lose Them** shows decline after initial activity, it is in high churn danger if not re-engaged.  
- **Need Attention** customers spread thin across categories, no strong product preference.  

### Inactive Segments (Lost, Hibernating, About to Sleep)
- Minimal contribution across all product categories.  
- **Hibernating** and **Lost** almost negligible so they should not be prioritized in the short term.  
- **About to Sleep** still has small volume in Accessories but trending downward.  

## Geographic & Territory Analysis Insight:

<img width="1269" height="716" alt="image" src="https://github.com/user-attachments/assets/6be6d642-02cc-4192-9aea-399ba597b597" />


## Recommendations:

## Concludsion:

