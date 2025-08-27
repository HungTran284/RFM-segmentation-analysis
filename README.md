# Customer Analysis Dashboard for Adventureworks Cycles

<a href="https://project.novypro.com/CaRTap" target="_blank"> Click here to View the Dashboard!</a>

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

<img width="1200" height="684" alt="image" src="https://github.com/user-attachments/assets/d9b85c29-ca47-46e0-9c56-6e2c03bfa4e0" />


### Product & Customer Segments

- The Water Bottle - 30 oz is the top-selling item across most customer groups, while Mountain-200-Black 38 generates the highest net value, making it a key driver of profitability.
- The most purchased categories are Accessories and Bikes, confirming their role as the core of AdventureWorks’ product category.
- Among Champions, orders are distributed relatively evenly across categories, reflecting both strong engagement and diverse interests.
- In contrast, segments such as Promising and About to Sleep show almost no purchases of Components, likely because these groups have limited need for technical upgrades and prefer more accessible items like accessories or entry-level bikes.
- Similarly, New Customers, Hibernating, Potential Loyalists, and Lost customers tend not to buy Bikes or Components. This suggests they are either not yet fully engaged or no longer committed, so they avoid high-value items and stick to low-risk, smaller purchases.
- Purchase activity declines sharply in February, April, and November. This can be explained by seasonal effects: post-holiday slowdowns early in the year, lack of major sales events in mid-year, and anticipation of big promotions like Black Friday at the end of November.
- A clear contrast appears in May to July, when the number of orders is high but revenue is relatively lower. This indicates that lower-priced products such as clothing and accessories sell particularly well during the summer, while high-value items like bikes contribute less.
- Another key observation is the parallel movement of revenue and order volume across most months, showing that demand is closely tied to purchase volume under a stable pricing strategy. However, months with divergence, such as summer, highlight opportunities to adjust the product mix seasonally to balance order quantity and profitability.

## Geographic & Territory Analysis Insight:
This dashboard provides a regional breakdown of customers, revenue, and growth, enabling the Sales Manager to evaluate market performance and uncover high-potential territories.
<img width="1269" height="716" alt="image" src="https://github.com/user-attachments/assets/6be6d642-02cc-4192-9aea-399ba597b597" />

### Revenue and Customer Segment by Region
- North America is the dominant region, contributing over 70% of total revenue, with an average revenue per customer of around 8,000. This confirms it as the company’s core market and the main driver of growth.
- Europe accounts for about 18% of revenue and maintains steady contributions, though the average revenue per customer (3,500) is less than half that of North America. The Pacific region makes up less than 10% and also shows relatively low spending per customer.
- The revenue trend chart highlights North America’s strong seasonality with sharp peaks, while Europe and Pacific show more gradual and stable growth patterns. This suggests that demand in North America is campaign-driven or event-sensitive, whereas other regions are less volatile but also less profitable.
- Customer distribution by country shows that segments such as Promising and New Customers are heavily concentrated in U.S. subregions like the Northeast, Southeast, and Southwest, indicating that market penetration is deepest in domestic territories. In contrast, European countries like Germany, France, and the UK show smaller but consistent participation across segments, which could serve as a foundation for long-term expansion.
- In Australia, the largest groups are Promising (924) and At Risk (670). This suggests that while there is strong acquisition, retention is a challenge, as many customers risk disengagement.
- Canada has a relatively balanced distribution, but Promising and Hibernating stand out, indicating moderate engagement yet limited conversion into Champions or Loyal Customers.
- In France and Germany, the majority of customers fall into New Customers and Promising, showing that these markets are still in an early growth phase. The small number of Loyal Customers here suggests that retention strategies are not yet fully effective.
- For the United Kingdom, Promising (510) and New Customers (321) dominate, but At Risk and Lost segments are also significant. This indicates that while new acquisition is happening, a sizable portion of customers fail to transition into loyal segments.

## Recommendations:

### For Product Category:
- In most months, revenue and order volume move together, meaning sales depend mainly on how many items customers buy. But in the summer, this pattern changes, suggesting the product mix should be adjusted seasonally to keep both sales volume and profit balanced.
- Seasonal adjustments to the product mix are needed to maintain both sales volume and profitability.  
- Focus on promoting low-entry products (e.g., Accessories, Clothing) during summer to drive conversions.  
- Introduce cross-selling bundles (e.g., Accessories with Bikes) to increase basket size.  
- Monitor product lifecycle closely to identify when to refresh or phase out underperforming items.

### For Region:
- AdventureWorks relies heavily on North America for revenue, but Europe and Pacific represent underdeveloped opportunities. Expanding engagement in these regions, especially by converting Promising and New Customers into Loyal Customers, could help diversify the customer base and reduce dependency on a single market.
- Engagement strategies should aim to convert Promising and New Customers into Loyal Customers to diversify the customer base.  
- Launch localized marketing campaigns in Europe and Pacific to build brand presence.  
- Explore partnerships or regional promotions to accelerate adoption in emerging markets.

## Concludsion:
- AdventureWorks demonstrates strong sales performance but lacks regional balance.
- Seasonal demand shifts highlight the need for proactive product mix strategies.
- Untapped regions such as Europe and Pacific represent key opportunities for expansion.
- Long-term growth and sustainability depend on both market diversification and improved customer retention.
