SELECT
  ROUND(SUM(sale_price), 2) AS revenue,
  COUNT(*) AS line_items,
  COUNT(DISTINCT order_id) AS orders_in_items
FROM `project-pra-477112.marketing_analysis_data.order_items_clean`
