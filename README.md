# E-commerce Growth vs Retention: LTV, Cohorts & Funnel Diagnostics

End-to-end customer analytics project using the **thelook_ecommerce** public dataset in Google BigQuery, focused on understanding **why strong acquisition and YoY growth do not translate into long-term customer value.**

The analysis combines **sales KPIs, funnel diagnostics, RFM segmentation, cohort retention, and ARPU/LTV modeling** to identify where value is created and where it breaks down.

## Why this project
Despite strong acquisition and YoY growth, the business shows a clear constraint: **most customers do not return after the first purchase**.

This project investigates whether revenue growth is driven by sustainable customer behavior or by continued acquisition masking weak retention.

Business questions answered:
- What’s driving revenue growth in 2025?
- Which customer segments contribute most of the revenue?
- Where does the funnel leak by traffic source?
- How does retention evolve after the first purchase?
- What does observed retention imply for realistic LTV, not theoretical LTV?

## Dataset
- **Source:** Google BigQuery public dataset: `thelook_ecommerce` 
- **Time period analyzed:** Jan 2019 – Nov 2025
- **Scale (raw):** ~2.43M events, ~125K orders, ~181K ordered items

## Deliverables
- **Executive slides (PDF):** [slides](slides/) 
- **Full report (PDF):** [report](report/)  
- **Dashboard (Tableau):** [dashboard](dashboard/) (external link + navigation notes)
- **SQL queries:** [sql](sql/)

### Dashboard pages (4 tabs inside one Tableau workbook)
- Sales Dashboard
- RFM Dashboard
- Funnel Dashboard
- Cohorts Dashboard

> Note: The funnel in this project is **event-level**, not a strict user-session funnel.

## Key results (2025 YTD: Jan-Nov)
- Revenue: **~$862K** (**+46% YoY**)
- Orders: **9,915** (**+44% YoY**)
- Customers: **9,304** (**+41% YoY**)
- AOV: **$87** **(+1.2% YoY)**

### What changed vs last year
Growth is primarily driven by **more customers and more orders**, while **AOV is mostly flat** (small lift).

### Retention & repeat behavior
- Only **~12% of customers make a repeat purchase**, making retention the primary constraint on long-term value.

### RFM insights
- **Champions + Loyal Customers** contribute **~40% of long-term revenue**
- **Needs Attention + Hibernating** represent **~44% of historical revenue** (large reactivation opportunity) 

### Cohorts & LTV interpretation 
- Newer cohorts (2022–2023) show **slightly better early repurchase**, but this improvement **does not sustain long-term**.
- **Most customer value is created at the first purchase**, with a steep drop after Year 1; LTV is constrained by retention. 

## Recommendations
- Improve **Year-1 retention** through lifecycle email and second-purchase nudges. Email is the strongest owned channel and the fastest lever to impact repeat rate.
- Reactivate **dormant segments** with targeted offers and timing, tailored by last purchased category.
- Improve **funnel efficiency** at weak stages (e.g., `view_item → add_to_cart`) through UX and UI tests.
- Build a **test-and-learn loop** focused on repeat purchase rate and early-life retention, not just acquisition.
- Use **channel insights** to guide spend: email and organic show strong contribution; paid channels require ROI-focused optimization.

## Method
- Built clean SQL views in BigQuery; excluded non-completed transactions; standardized timestamps; joined events + orders + order_items + users.
- **RFM segmentation** at customer level.
- **Cohort retention**: tested weekly/monthly/yearly; used **yearly cohorts** because short-term repeats were low, and yearly cohorts reduced noise and better matched long-term questions. 
- **ARPU & LTV modeling**: cohort-level cumulative ARPU with cautious forward projection.

## Notes / limitations
- Funnel analysis is event-level (not strict user-level sessions). 
- Long-range LTV projection is treated cautiously due to weak repeat behavior.
