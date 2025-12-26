WITH rfm AS (
  SELECT
    user_id,
    recency,
    frequency,
    monetary
  FROM `project-pra-477112.marketing_analysis_data.rfm_base`
),

scores AS (
  SELECT
    user_id,
    recency,
    frequency,
    monetary,
    NTILE(4) OVER (ORDER BY recency ASC) AS recency_score,
    NTILE(4) OVER (ORDER BY frequency DESC) AS frequency_score,
    NTILE(4) OVER (ORDER BY monetary DESC) AS monetary_score
  FROM rfm
)

SELECT
  *,
  CONCAT('R', recency_score, 'F', frequency_score, 'M', monetary_score) AS rfm_score
FROM scores
