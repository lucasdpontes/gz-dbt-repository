SELECT
s.date_date
,s.revenue
,s.orders_id
,p.products_id
,p.purchase_price AS purchase_price
,CAST(s.quantity AS INT64) * CAST(p.purchase_price AS FLOAT64) AS purchase_cost
,ROUND(s.revenue - s.revenue*CAST(p.purchase_price AS FLOAT64),2) AS margin
FROM {{ ref('stg_raw__product')}} p
LEFT JOIN {{ ref('stg_raw__sales')}} s ON p.products_id = s.products_id

--Margin = Revenue - Purchase_cost
--Purchase_cost = Quantity * Purchase_price