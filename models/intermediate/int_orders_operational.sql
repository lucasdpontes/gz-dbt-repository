SELECT
s.orders_id
,o.date_date
,ROUND((o.margin + s.shipping_fee - s.log_cost - CAST(s.ship_cost AS FLOAT64)),2) AS operational_margin
,o.quantity

FROM {{ ref('stg_raw__ship')}} s
LEFT JOIN {{ ref('int_orders_margin')}} o USING (orders_id)

ORDER BY orders_id DESC

--Operational margin = margin + shipping fee - log_cost - ship_cost