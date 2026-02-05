SELECT
    o.orders_id,
    o.date_date,
    o.revenue,
    o.margin,
    o.purchase_cost, -- <--- CETTE COLONNE MANQUAIT AUSSI
    o.quantity,      -- <--- VÉRIFIE QUE CELLE-CI EST LÀ POUR FINANCE_DAYS
    s.shipping_fee,
    s.logcost,
    s.ship_cost,
    ROUND(CAST(o.margin AS FLOAT64) + s.shipping_fee - (s.logcost + s.ship_cost), 2) AS operational_margin
FROM {{ ref('int_orders_margin') }} o
LEFT JOIN {{ ref('stg_raw__livraison') }} s 
    ON CAST(o.orders_id AS STRING) = CAST(s.orders_id AS STRING)

    