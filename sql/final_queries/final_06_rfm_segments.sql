WITH scored AS (
  SELECT
    user_id,
    recency,
    frequency,
    monetary,
    recency_score,
    frequency_score,
    monetary_score,
    rfm_score
  FROM `project-pra-477112.marketing_analysis_data.rfm_scored`
)
  SELECT
    *,
    CASE
      WHEN recency_score = 1 
        AND frequency_score = 1 
        AND monetary_score = 1 
        THEN 'Champions'

      WHEN recency_score IN (1,2) 
        AND frequency_score IN (1,2) 
        AND monetary_score IN (1,2) 
        THEN 'Loyal Customers'

      WHEN recency_score = 1 
        AND frequency_score IN (1,2) 
        THEN 'Potential Loyal Customers'

      WHEN recency_score = 1
        AND frequency_score = 4
        THEN 'New Customers'
      
      WHEN recency_score IN (1,2)
        AND frequency_score = 3
        THEN 'Promising'
      
      WHEN recency_score IN (2,3)
        AND frequency_score IN (2,3)
        THEN 'Needs Attention'
      
      WHEN recency_score = 3
        AND frequency_score IN (1,2)
        THEN 'About to Sleep'

      WHEN recency_score = 4
        AND frequency_score IN (1,2)
        THEN 'At Risk'
      
      WHEN recency_score IN (3,4)
        AND frequency_score IN (3,4)
        THEN 'Hibernating'
      
      ELSE 'Other'
    END AS segment
  FROM scored
