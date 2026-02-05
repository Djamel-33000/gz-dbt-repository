with 

source as (

    select * from {{ source('raw', 'vente') }}

),

renamed as (

    SELECT
    -- On combine orders_id et pdt_id (et non product_id)
    CONCAT(orders_id, '_', pdt_id) AS sales_id,
    date_date,
    orders_id,
    pdt_id,
    revenue,
    quantity


    from source

)

select * from renamed