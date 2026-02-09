USE marketing;

CREATE TABLE market_lagging 
LIKE marketing_campaign;

INSERT INTO market_lagging
SELECT *
FROM marketing_campaign;

SELECT *,
ROW_NUMBER() OVER(PARTITION BY id, birth_year, income, dt_customer, recency, num_store_purchases,
z_cost_contact, z_revenue ORDER BY id) AS row_num
FROM market_lagging;

-- checking for duplicate rows using cte
WITH duplicate_cte AS(
SELECT *,
ROW_NUMBER() OVER(PARTITION BY id, birth_year, income, dt_customer, recency, num_store_purchases,
z_cost_contact, z_revenue ORDER BY id) AS row_num
FROM market_lagging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;
-- duplicates were not found to be in this table


SELECT amt_wines
FROM market_lagging
WHERE amt_wines = '';

-- changing the customer joining date column to a real date column
SELECT dt_customer, STR_TO_DATE(dt_customer, '%Y-%m-%d') AS joining_date
FROM market_lagging;

UPDATE market_lagging
SET dt_customer = STR_TO_DATE(dt_customer, '%Y-%m-%d');

SELECT *
FROM market_lagging;
-- there were no blank rows or useless columns in this dataset

SELECT DISTINCT education
FROM market_lagging;

UPDATE market_lagging
SET education = 'Master'
WHERE education = '2n Cycle';

SELECT DISTINCT marital_status
FROM market_lagging;

SELECT DISTINCT marital_status
FROM market_lagging
WHERE marital_status = 'Absurd';

-- deleting useless rows
DELETE
FROM market_lagging
WHERE marital_status = 'Absurd';

-- updating rows with the words that best suite their meanings
UPDATE market_lagging
SET marital_status = 'Single'
WHERE marital_status = 'YOLO';

UPDATE market_lagging
SET marital_status = 'Single'
WHERE marital_status = 'Alone';

SELECT *
FROM market_lagging;