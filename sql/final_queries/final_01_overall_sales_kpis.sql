SELECT
  COUNT(DISTINCT o.order_id) AS orders,
  COUNT(DISTINCT o.user_id) AS customers,
  SUM(oi.sale_price) AS revenue,
  SAFE_DIVIDE(SUM(oi.sale_price), COUNT(DISTINCT o.order_id)) AS aov
FROM `project-pra-477112.marketing_analysis_data.orders_clean` o
JOIN `project-pra-477112.marketing_analysis_data.order_items_clean` oi
  ON o.order_id = oi.order_id
