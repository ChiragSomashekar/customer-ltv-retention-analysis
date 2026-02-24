# E-Commerce Growth vs Retention  
### LTV, Cohort & Funnel Diagnostics (BigQuery + Tableau)

---

## Executive Summary

Revenue grew +46% YoY in 2025, primarily driven by new customer acquisition (+41%).  
However, only ~12% of customers return after their first purchase.

Growth is acquisition-led, while long-term value is retention-constrained.

---

## Strategic Questions

- Is revenue growth durable or acquisition-dependent?
- Where does customer lifetime value decay, and why?
- Which segments generate most long-term value?
- Where does conversion friction occur?
- How does observed retention constrain realistic LTV and marketing ROI?

---

## Key Insights

### Growth Is Volume-Driven  
- Revenue: ~$862K (+46% YoY)  
- Orders: +44%  
- Customers: +41%  
- AOV: +1.2%  

Growth is driven by customer volume, not increased per-customer value.

### Retention Is the Structural Constraint  
- Only ~12% of customers repeat.  
- ARPU flattens after Year 1.  
- Most customer value is captured at first purchase.  

### Revenue Concentration  
- Champions + Loyal Customers generate ~40% of revenue.  
- Dormant and “Needs Attention” segments represent ~44% of historical revenue, indicating reactivation opportunity.

### Funnel Leakage 
Event-level diagnostics show a material drop between `view_item → add_to_cart`, indicating optimisation opportunity in the product evaluation stage.

---

## Strategic Answers

- Revenue growth is acquisition-dependent and not structurally durable.
- Customer lifetime value decays sharply after Year 1.
- Long-term revenue is concentrated in a small loyal base.
- Funnel friction exists, but retention is the dominant constraint.
- Improving repeat purchase rate offers higher marginal ROI than incremental acquisition spend.

---

## Strategic Recommendations
- Shift KPI focus toward repeat purchase rate and Year-1 retention.
- Implement lifecycle nudges targeting second purchase behavior.
- Launch structured reactivation campaigns for dormant segments.
- Run UX experiments on weak funnel stages.
- Apply ROI discipline to paid acquisition.

---

## Analytical Framework

- Data Engineering: SQL modeling in BigQuery (clean views, joins, exclusions)
- Lifecycle Analytics: RFM segmentation, cohort retention, ARPU & LTV modeling
- Funnel Diagnostics: Event-level conversion analysis
- Visualization: Executive storytelling in Tableau

---

## Deliverables

- **Executive slides (PDF):** [slides](slides/) 
- **Full report (PDF):** [report](report/)  
- **Dashboard (Tableau):** [dashboard](dashboards/) (external link + navigation notes)
- **SQL queries:** [sql](sql/)

---

## Limitations

- Funnel analysis is event-level (not session-based).
- Long-term LTV projections treated conservatively due to low repeat rate.
