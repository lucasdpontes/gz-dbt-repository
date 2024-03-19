SELECT
date_date
,revenue
,orders_id
,quantity
,purchase_cost
,margin
FROM {{ ref('int_sales_margin')}}