CREATE OR REPLACE VIEW `project-pra-477112.marketing_analysis_data.event_view_base` AS
SELECT
  user_id,
  created_at,
  event_type,
  traffic_source,
  browser,
  state,
  city
FROM `bigquery-public-data.thelook_ecommerce.events`
WHERE DATE(created_at) <= DATE('2025-11-06')
