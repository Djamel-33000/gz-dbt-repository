SELECT
    o.orders_id,
    o.date_date,
    o.margin,
    s.shipping_fee,
    s.logcost,
    s.ship_cost,
    -- Calcul sécurisé
    ROUND(
        CAST(o.margin AS FLOAT64) + 
        CAST(s.shipping_fee AS FLOAT64) - 
        (CAST(s.logcost AS FLOAT64) + CAST(s.ship_cost AS FLOAT64)), 
        2
    ) AS operational_margin
FROM {{ ref('int_orders_margin') }} o
LEFT JOIN {{ ref('stg_raw__livraison') }} s 
    -- On force la comparaison entre deux STRING pour éviter l'erreur d'incompatibilité
    ON CAST(o.orders_id AS STRING) = CAST(s.orders_id AS STRING)

    