CREATE OR REPLACE VIEW `project-pra-477112.marketing_analysis_data.orders_with_offset` AS
WITH first_purchase AS (
  SELECT
    user_id,
    MIN(DATE(created_at)) AS first_purchase_date
  FROM `project-pra-477112.marketing_analysis_data.orders_clean`
  GROUP BY user_id
),

cohort_base AS (
  SELECT
    user_id,
    DATE_TRUNC(first_purchase_date, YEAR) AS cohort_year
  FROM first_purchase
),

order_revenue AS (
  SELECT
    order_id,
    user_id,
    order_date,
    order_year,
    SUM(sale_price) AS order_revenue
  FROM `project-pra-477112.marketing_analysis_data.order_items_clean`
  GROUP BY order_id, user_id, order_date, order_year
)

SELECT
  r.user_id,
  r.order_id,
  r.order_date,
  r.order_year,
  c.cohort_year,
  DATE_DIFF(r.order_year, c.cohort_year, YEAR) AS year_offset,
  r.order_revenue
FROM order_revenue r
JOIN cohort_base c
  ON r.user_id = c.user_id
