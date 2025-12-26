SELECT
  COUNT(*) AS joined_rows,
  COUNT(DISTINCT o.order_id) AS distinct_orders_after_join,
  COUNT(DISTINCT oi.order_id) AS distinct_orders_in_items,
  COUNT(DISTINCT o.user_id) AS distinct_customers_after_join
FROM `project-pra-477112.marketing_analysis_data.orders_clean` o
JOIN `project-pra-477112.marketing_analysis_data.order_items_clean` oi
  ON o.order_id = oi.order_id
