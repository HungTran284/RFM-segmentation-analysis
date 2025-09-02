--1. Doanh thu, số lượng đơn hàng, số lượng sản phẩm bán ra và giá trị trung bình mỗi đơn hàng (AOV) theo tháng là bao nhiêu?
SELECT
	DATEFROMPARTS(YEAR(soh.OrderDate), MONTH(soh.OrderDate), 1) AS OrderMonth,
	COUNT(DISTINCT soh.SalesOrderID) AS Orders,
	SUM(sod.OrderQty) AS Units,
	CAST(SUM(sod.LineTotal) AS DECIMAL(18,2)) AS Revenue,
	CAST(SUM(sod.LineTotal) / COUNT(DISTINCT soh.SalesOrderID) AS DECIMAL(18,2)) AS AOV
FROM Sales.SalesOrderHeader soh
JOIN Sales.SalesOrderDetail sod 
	ON soh.SalesOrderID = sod.SalesOrderID
GROUP BY DATEFROMPARTS(YEAR(soh.OrderDate), MONTH(soh.OrderDate), 1)
ORDER BY OrderMonth;

--2. Tốc độ tăng trưởng doanh thu theo tháng, so sánh với cùng kỳ năm trước (YoY) ra sao? RevenuePrevYear YoY_Growth
WITH cte1 AS 
	(SELECT 
		DATEFROMPARTS(YEAR(soh.OrderDate), MONTH(soh.OrderDate), 1) AS OrderMonth,
		SUM(CAST(sod.LineTotal AS DECIMAL(18,2))) AS Revenue
	FROM Sales.SalesOrderHeader soh
	LEFT JOIN Sales.SalesOrderDetail sod
		ON soh.SalesOrderID = sod.SalesOrderID
	GROUP BY DATEFROMPARTS(YEAR(soh.OrderDate), MONTH(soh.OrderDate), 1))
SELECT 
	cte1.OrderMonth,
	cte1.Revenue,
	cte2.Revenue AS RevenuePrevYear,
	CAST((cte1.Revenue - cte2.Revenue) * 100 / NULLIF(cte1.Revenue,0) AS DECIMAL(18,2)) AS YoY_Growth
FROM cte1
LEFT JOIN cte1 AS cte2
	ON cte2.OrderMonth = DATEADD(YEAR,-1,cte1.OrderMonth)
ORDER BY cte1.OrderMonth;

--3. Doanh thu được phân bổ theo nhóm sản phẩm (Category/Subcategory) như thế nào?
SELECT 
    pc.Name AS ProductCategory,
    psc.Name AS ProductSubcategory,
    SUM(sod.LineTotal) AS Revenue
FROM Sales.SalesOrderDetail sod
JOIN Production.Product p ON sod.ProductID = p.ProductID
JOIN Production.ProductSubcategory psc ON p.ProductSubcategoryID = psc.ProductSubcategoryID
JOIN Production.ProductCategory pc ON psc.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.Name, psc.Name
ORDER BY Revenue DESC;

--4. Top 10 sản phẩm mang lại doanh thu cao nhất là những sản phẩm nào?
SELECT TOP 10
    p.Name AS ProductName,
    SUM(sod.LineTotal) AS Revenue
FROM Sales.SalesOrderDetail sod
JOIN Production.Product p ON sod.ProductID = p.ProductID
GROUP BY p.Name
ORDER BY Revenue DESC;

--5. Doanh thu phân bổ theo thị trường (Sales Territory/Region) ra sao? Khu vực nào mạnh nhất?
SELECT 
    st.Name AS Region,
    SUM(sod.LineTotal) AS Revenue
FROM Sales.SalesOrderDetail sod
JOIN Sales.SalesOrderHeader soh ON sod.SalesOrderID = soh.SalesOrderID
JOIN Sales.SalesTerritory st ON soh.TerritoryID = st.TerritoryID
GROUP BY st.Name
ORDER BY Revenue DESC;

--6. Theo thời gian, số khách hàng mới và khách hàng quay lại chiếm tỷ lệ thế nào?
WITH FirstOrder AS (
    SELECT 
        CustomerID,
        MIN(OrderDate) AS FirstOrderDate
    FROM Sales.SalesOrderHeader
    GROUP BY CustomerID
)
SELECT 
    YEAR(soh.OrderDate) AS Year,
    MONTH(soh.OrderDate) AS Month,
    SUM(CASE WHEN soh.OrderDate = fo.FirstOrderDate THEN 1 ELSE 0 END) AS NewCustomers,
    SUM(CASE WHEN soh.OrderDate > fo.FirstOrderDate THEN 1 ELSE 0 END) AS ReturningCustomers
FROM Sales.SalesOrderHeader soh
JOIN FirstOrder fo ON soh.CustomerID = fo.CustomerID
GROUP BY YEAR(soh.OrderDate), MONTH(soh.OrderDate)
ORDER BY Year, Month;

--7. Doanh thu được phân bổ theo từng năm (hoặc theo quý) như thế nào?
SELECT 
    YEAR(OrderDate) AS OrderYear,
    DATEPART(QUARTER, OrderDate) AS OrderQuarter,
    SUM(SubTotal) AS Revenue
FROM Sales.SalesOrderHeader
GROUP BY YEAR(OrderDate), DATEPART(QUARTER, OrderDate)
ORDER BY OrderYear, OrderQuarter;


--8. Doanh thu theo phương thức thanh toán (Credit Card, Purchase Order, Other) có sự khác biệt như thế nào?
SELECT 
    cc.CardType AS PaymentMethod,
    SUM(soh.SubTotal) AS Revenue
FROM Sales.SalesOrderHeader soh
JOIN Sales.CreditCard cc ON soh.CreditCardID = cc.CreditCardID
GROUP BY cc.CardType
ORDER BY Revenue DESC;

--9. Bảng tổng hợp R, F, M cho từng khách hàng
WITH MaxDataDate AS (
    SELECT MAX(soh.OrderDate) AS LastDataDate
    FROM Sales.SalesOrderHeader soh
),
RFM_Base AS (
    SELECT
        c.CustomerID,
        MAX(soh.OrderDate) AS LastPurchaseDate,
        COUNT(DISTINCT soh.SalesOrderID) AS Frequency,
        SUM(sod.LineTotal) AS Monetary
    FROM Sales.Customer c
    JOIN Sales.SalesOrderHeader soh
        ON soh.CustomerID = c.CustomerID
    JOIN Sales.SalesOrderDetail sod 
        ON soh.SalesOrderID = sod.SalesOrderID
    GROUP BY c.CustomerID
),
RFM_Score AS (
    SELECT
        b.CustomerID,
        DATEDIFF(DAY, b.LastPurchaseDate, m.LastDataDate) AS Recency, -- tính tới ngày cuối dataset
        b.Frequency,
        b.Monetary
    FROM RFM_Base b
    CROSS JOIN MaxDataDate m
),
RFM_Ranked AS (
    SELECT
        CustomerID,
        Recency,
        Frequency,
        Monetary,
        6 - NTILE(5) OVER (ORDER BY Recency ASC) AS R_Score,
        NTILE(5) OVER (ORDER BY Frequency DESC) AS F_Score,
        NTILE(5) OVER (ORDER BY Monetary DESC) AS M_Score
    FROM RFM_Score
),
RFM_Tag AS (
    SELECT
        *,
        CAST(R_Score AS varchar(1)) 
        + CAST(F_Score AS varchar(1)) 
        + CAST(M_Score AS varchar(1)) AS RFM_Score
    FROM RFM_Ranked
),
RFM_Segment AS (
    SELECT
        CustomerID, Recency, Frequency, Monetary, R_Score, F_Score, M_Score, RFM_Score,
        CASE 
            WHEN RFM_Score IN ('555','554','545','544','455','454','445') THEN 'Champions'
            WHEN RFM_Score IN ('543','444','435','355','354','345','344','335') THEN 'Loyal Customers'
            WHEN RFM_Score IN ('553','551','552','541','542','533','532','531','452','451','442','441','431',
                               '453','433','432','423','353','352','351','342','341','333','323') THEN 'Potential Loyalist'
            WHEN RFM_Score IN ('512','511','422','421','412','411','311') THEN 'Recent Customers'
            WHEN RFM_Score IN ('525','524','523','522','521','515','514','513','425','424','415','414','413','315','314','313') THEN 'Promising'
            WHEN RFM_Score IN ('535','534','443','434','343','334','325','324') THEN 'Customers Needing Attention'
            WHEN RFM_Score IN ('331','321','312','221','213') THEN 'About To Sleep'
            WHEN RFM_Score IN ('255','254','245','244','253','252','243','242','235','234','225','224',
                               '153','152','145','143','142','135','134','133','125','124') THEN 'At Risk'
            WHEN RFM_Score IN ('155','154','144','215','214','115','114','113') THEN 'Cannot Lose Them'
            WHEN RFM_Score IN ('332','322','231','241','251','233','232','223','222','132','123','122','212','211') THEN 'Hibernating'
            WHEN RFM_Score IN ('111','112','121','131','141','151') THEN 'Lost'
            ELSE 'Customers Needing Attention'
        END AS Segment
    FROM RFM_Tag
),
Segment_Revenue AS (
    SELECT 
        Segment,
        SUM(Monetary) AS SegmentRevenue,
        SUM(Monetary) * 1.0 / SUM(SUM(Monetary)) OVER() AS RevenueShare
    FROM RFM_Segment
    GROUP BY Segment
)
SELECT 
    r.CustomerID,
    r.Recency,
    r.Frequency,
    r.Monetary,
    r.R_Score,
    r.F_Score,
    r.M_Score,
    r.RFM_Score
FROM RFM_Segment r
JOIN Segment_Revenue s 
    ON r.Segment = s.Segment
ORDER BY r.CustomerID;