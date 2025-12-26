SELECT
  MIN(DATE(created_at)) AS min_order_date,
  MAX(DATE(created_at)) AS max_order_date,
  COUNT(DISTINCT order_id) AS orders,
  COUNT(DISTINCT user_id) AS customers
FROM `project-pra-477112.marketing_analysis_data.orders_clean`
