CREATE OR REPLACE VIEW `project-pra-477112.marketing_analysis_data.orders_clean` AS
SELECT *
FROM `bigquery-public-data.thelook_ecommerce.orders`
WHERE status = "Complete"
  AND DATE(created_at) <= DATE('2025-11-06')
