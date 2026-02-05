SELECT
    -- On crée la clé unique ici (concaténation simple ou avec dbt_utils)
    CONCAT(orders_id, '_', product_id) AS sales_id,
    orders_id,
    product_id,
    revenue,
    quantity
FROM {{ source('raw', 'vente') }}