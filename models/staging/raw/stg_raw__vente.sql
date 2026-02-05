with 

source as (

    select * from {{ source('raw', 'vente') }}
),

renamed as (
    SELECT
        -- On utilise pdt_id (le nom réel dans ta source) pour créer la clé unique
        CONCAT(orders_id, '_', pdt_id) AS sales_id,
        date_date,
        orders_id,
        pdt_id,
        revenue,
        quantity
    from source
)

select * from renamed