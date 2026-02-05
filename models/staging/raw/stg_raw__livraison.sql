SELECT
    CAST(orders_id AS STRING) AS orders_id,
    shipping_fee,
    logcost,
    CAST(ship_cost AS FLOAT64) AS ship_cost
FROM {{ source('raw', 'livraison') }}