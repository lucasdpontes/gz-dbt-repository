SELECT
o.orders_id
,o.date_date
,o.revenue
,o.margin
,ROUND((o.margin + s.shipping_fee - s.log_cost - CAST(s.ship_cost AS FLOAT64)),2) AS operational_margin
,o.quantity

FROM {{ ref('int_orders_margin')}} o
LEFT JOIN {{ ref('stg_raw__ship')}} s USING (orders_id)

ORDER BY orders_id DESC

--Operational margin = margin + shipping fee - log_cost - ship_cost