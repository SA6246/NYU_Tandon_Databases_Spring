SELECT 
   "SHIPPED" as ship_status,
   order_id,
   order_date
FROM
   orders
WHERE
   ship_date is not NULL

UNION (
   SELECT
      "NOT SHIPPED" as ship_status,
      order_id,
      order_date
   FROM
      orders
   WHERE
      ship_date is NULL
)
ORDER BY
   order_date;