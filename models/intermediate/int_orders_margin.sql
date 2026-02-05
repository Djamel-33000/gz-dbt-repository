SELECT
  orders_id,
  date_date,
  ROUND(SUM(CAST(revenue AS FLOAT64)),2) as revenue,
  ROUND(SUM(CAST(quantity AS FLOAT64)),2) as quantity,
  ROUND(SUM(CAST(purchase_cost AS FLOAT64)),2) as purchase_cost,
  ROUND(SUM(CAST(margin AS FLOAT64)),2) as margin
FROM {{ ref("int_sales_margin") }}
GROUP BY orders_id,date_date

