SELECT
date_date
,COUNT(orders_id) AS nb_transactions
,SUM(revenue)
,AVG(revenue) AS average_basket
,SUM(margin)
,SUM(operational_margin)

FROM {{ ref('int_orders_operational')}}

GROUP BY date_date