CREATE OR REPLACE VIEW `project-pra-477112.marketing_analysis_data.rfm_base` AS
WITH rfm_base AS (
  SELECT
    user_id,
    MIN(DATE(order_date)) AS first_purchase_date,
    MAX(DATE(order_date)) AS last_purchase_date,
    COUNT(order_id) AS frequency,
    SUM(order_revenue) AS monetary
  FROM `project-pra-477112.marketing_analysis_data.order_revenue`
  GROUP BY user_id
)
  SELECT
    user_id,
    frequency,
    monetary,
    DATE_DIFF(DATE('2025-11-06'), DATE(last_purchase_date), DAY) AS recency --- Analysis date: 2025-11-06 (freeze recency numbers for reproducibility)
  FROM rfm_base
