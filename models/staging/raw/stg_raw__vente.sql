with source as (
    select * from {{ source('raw', 'vente') }}
),

renamed as (
    SELECT
        CONCAT(orders_id, '_', pdt_id) AS sales_id,
        date_date,
        orders_id,
        pdt_id AS products_id, -- <--- ON RENOMME ICI !
        revenue,
        quantity
    from source
)

select * from renamed