SELECT *
FROM market_lagging;

-- customer count
SELECT COUNT(DISTINCT id) AS customers
FROM market_lagging;

SELECT *
FROM market_lagging;

-- customer count by education
SELECT education,
COUNT(id) AS customers
FROM market_lagging
GROUP BY education
ORDER BY customers DESC;
-- graduates make up the majority of our customer base

SELECT *
FROM market_lagging;

-- customer count by marital status
SELECT marital_status,
COUNT(id) AS customers
FROM market_lagging
GROUP BY marital_status
ORDER BY customers DESC;
-- married couples make up the majority of our customer base

SELECT *
FROM market_lagging;

-- median income by education
SELECT education,
SUM(income) as salary
FROM market_lagging
GROUP BY education
ORDER BY salary DESC;
-- the graduate customers earn the most
 
SELECT *
FROM market_lagging;

 -- median income by marital status
 SELECT marital_status,
 SUM(income) AS salary
FROM market_lagging
GROUP BY marital_status
ORDER BY salary DESC;
-- married couples bring in the most revenue

SELECT *
FROM market_lagging;

 -- kid count by marital status
 SELECT marital_status,
 COUNT(kid_home) AS kids_count
FROM market_lagging
GROUP BY marital_status
ORDER BY kids_count DESC;
-- married couple have the highest number of kids, and widows have the least number of kids

SELECT *
FROM market_lagging;

 -- teen count by marital status
 SELECT marital_status,
 COUNT(teen_home) AS teens_count
FROM market_lagging
GROUP BY marital_status
ORDER BY teens_count DESC;
-- married couple have the highest number of teens, and widows have the least number of teens

SELECT *
FROM market_lagging;

 -- date of customer joining in  the 90's
 SELECT COUNT(id)
FROM market_lagging
WHERE dt_customer < '2000-01-01';
-- there were no customers before the 2000's or the company didn't exist before then

SELECT *
FROM market_lagging;

 -- customer count during the early 20's
 SELECT COUNT(id) AS customers
FROM market_lagging
WHERE dt_customer BETWEEN '2000-01-01' AND '2012-12-31';
-- during the early 2000's, there were 489 customers

 SELECT *
FROM market_lagging;

-- customer count after the early 20's
SELECT COUNT(id) AS customers
FROM market_lagging
WHERE dt_customer >= '2013-01-01';
-- more customers joined the company after the early 2000's

SELECT *
FROM market_lagging;

-- first campaign, responses, and revenues by marital status
SELECT marital_status,
 COUNT(accepted_cmp1) AS first,
 COUNT(response) response_count,
 COUNT(z_revenue) revenues_brought
FROM market_lagging
GROUP BY marital_status
ORDER BY first;

SELECT *
FROM market_lagging;

-- number of days since last purchase [recency] by gold and marital status
SELECT marital_status,
AVG(recency) recency_count,
SUM(amt_gold_prods) gold_purchased
FROM market_lagging
GROUP BY marital_status
ORDER BY gold_purchased DESC;
-- married couples and people who are in relationships tend to make purchases 
-- more often than the others, and they are the top 2 purchasers of gold

SELECT *
FROM market_lagging;

-- deals purchases by marital status
SELECT marital_status,
SUM(num_deals_purchases) AS discounted_purchases
FROM market_lagging
GROUP BY marital_status
ORDER BY discounted_purchases DESC;

SELECT *
FROM market_lagging;