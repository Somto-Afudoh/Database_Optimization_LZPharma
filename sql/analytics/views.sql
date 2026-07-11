-- Create the analytics Schema
CREATE SCHEMA IF NOT EXISTS analytics;
-- Analytics Questions
-- 1. Monthly Drug Sales (drug_id, drug name, month, sum of
-- order, quantity) - orders, drugs, stock

CREATE MATERIALIZED VIEW analytics.monthly_sale AS
SELECT 
d.drug_id, 
d.name AS drug_name,
TO_CHAR(o.order_datetime, 'Month') AS month,
SUM(o.total_amount) AS All_month_sale,
COUNT(d.drug_id) AS All_month_orders
FROM operations.orders o
JOIN inventory.drugs d 
	ON o.drug_id = d.drug_id
GROUP BY d.drug_id, d.name, 
TO_CHAR(o.order_datetime, 'Month');

SELECT * FROM analytics.monthly_sale;

REFRESH MATERIALIZED VIEW analytics.monthly_sale;

-- Prescription/Order Metrics per Employee

-- Dispatch/Order Metrics per Employee

-- Research & Regulatory Drug Approvals Summary