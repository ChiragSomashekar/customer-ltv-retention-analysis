WITH cohort_sizes AS (
  SELECT
    cohort_year,
    COUNT(DISTINCT user_id) AS cohort_users
  FROM `project-pra-477112.marketing_analysis_data.orders_with_offset`
  GROUP BY cohort_year
),

cohort_revenue AS (
  SELECT
    cohort_year,
    year_offset,
    SUM(order_revenue) AS revenue
  FROM `project-pra-477112.marketing_analysis_data.orders_with_offset`
  GROUP BY cohort_year, year_offset
)

SELECT
  r.cohort_year,
  r.year_offset,
  r.revenue,
  c.cohort_users,
  ROUND(r.revenue / c.cohort_users, 2) AS arpu
FROM cohort_revenue AS r
JOIN cohort_sizes AS c
ON r.cohort_year = c.cohort_year
ORDER BY cohort_year, year_offset
