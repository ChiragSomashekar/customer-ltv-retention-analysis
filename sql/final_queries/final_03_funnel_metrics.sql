SELECT
  traffic_source,
  COUNT(*) AS total_events,
  COUNTIF(event_type = 'product') AS product_events,
  COUNTIF(event_type = 'department') AS department_events,
  COUNTIF(event_type = 'cart') AS cart_events,
  COUNTIF(event_type = 'purchase') AS purchase_events,
  COUNTIF(event_type = 'cancel') AS cancel_events,
  COUNTIF(event_type = 'home') AS home_events
FROM `project-pra-477112.marketing_analysis_data.event_view_base`
GROUP BY traffic_source
ORDER BY total_events DESC
