SELECT
    products_id,
    date_date,
    orders_id,
    revenue,
    quantity,
    purchase_price,
    -- Calcul du coût d'achat (qté * prix)
    ROUND(CAST(quantity AS FLOAT64) * CAST(purchase_price AS FLOAT64), 2) AS purchase_cost,
    -- Calcul de la marge (CA - coût d'achat)
    ROUND(CAST(revenue AS FLOAT64) - (CAST(quantity AS FLOAT64) * CAST(purchase_price AS FLOAT64)), 2) AS margin
FROM {{ ref("stg_raw__vente") }}
LEFT JOIN {{ ref("stg_raw__produit") }}
    USING (products_id)















