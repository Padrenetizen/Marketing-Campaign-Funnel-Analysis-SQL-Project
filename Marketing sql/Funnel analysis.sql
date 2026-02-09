SELECT *
FROM market_lagging;

-- total customers
SELECT COUNT(DISTINCT id) Total_customers
FROM market_lagging;

-- customers who didn't accept the campaign
SELECT COUNT(id) AS not_accepted_customers
FROM market_lagging
WHERE accepted_cmp1 < 1;

-- customers that accepted the campaign
SELECT COUNT(id) AS accepted_customers
FROM market_lagging
WHERE accepted_cmp1 >= 1;

-- high value customers
SELECT COUNT(id) AS high_value_customers
FROM market_lagging
WHERE recency < 30;

-- building the funnel
SELECT 'Total Customers' AS stage,
COUNT(DISTINCT id) AS users
FROM market_lagging

UNION ALL

SELECT 'Not Accepted Customers' AS stage,
COUNT(id) AS not_accepted_customers
FROM market_lagging
WHERE accepted_cmp1 < 1

UNION ALL

SELECT 'Accepted Customers' AS stage,
COUNT(id) AS accepted_customers
FROM market_lagging
WHERE accepted_cmp1 >= 1

UNION ALL

SELECT 'High Value Customers' AS stage,
COUNT(id) AS users
FROM market_lagging
WHERE recency < 30;

WITH funnel AS(
SELECT 'Total Customers' AS stage,
COUNT(DISTINCT id) AS users
FROM market_lagging

UNION ALL

SELECT 'Not Accepted Customers' AS stage,
COUNT(id) AS not_accepted_customers
FROM market_lagging
WHERE accepted_cmp1 < 1

UNION ALL

SELECT 'Accepted Customers' AS stage,
COUNT(id) AS accepted_customers
FROM market_lagging
WHERE accepted_cmp1 >= 1

UNION ALL

SELECT 'High Value Customers' AS stage,
COUNT(id) AS users
FROM market_lagging
WHERE recency < 30
)
SELECT stage,
users,
ROUND(users/LAG(users) OVER()*100,2) AS conversion_rate
FROM funnel;

SELECT *
FROM market_lagging;