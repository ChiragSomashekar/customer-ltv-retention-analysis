CREATE OR REPLACE VIEW `project-pra-477112.marketing_analysis_data.order_items_clean` AS
SELECT
  oi.*,
  DATE(o.created_at) AS order_date,
  DATE_TRUNC(DATE(o.created_at), YEAR) AS order_year,
  o.created_at AS order_created_at
FROM `bigquery-public-data.thelook_ecommerce.order_items` AS oi
JOIN `project-pra-477112.marketing_analysis_data.orders_clean` AS o
  ON oi.order_id = o.order_id
