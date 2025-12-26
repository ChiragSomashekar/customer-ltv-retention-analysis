WITH cohort_sizes AS (
  SELECT
    cohort_year,
    COUNT(DISTINCT user_id) AS cohort_users
  FROM `project-pra-477112.marketing_analysis_data.orders_with_offset`
  GROUP BY cohort_year
),

returning_users AS (
  SELECT
    cohort_year,
    year_offset,
    COUNT(DISTINCT user_id) AS retained_users
  FROM `project-pra-477112.marketing_analysis_data.orders_with_offset`
  GROUP BY cohort_year, year_offset
)

SELECT
  r.cohort_year,
  r.year_offset,
  r.retained_users,
  c.cohort_users,
  ROUND(r.retained_users / c.cohort_users * 100, 2) AS retention_pct
FROM returning_users r
JOIN cohort_sizes c
ON r.cohort_year = c.cohort_year
ORDER BY cohort_year, year_offset
