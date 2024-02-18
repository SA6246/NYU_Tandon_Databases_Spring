SELECT
  o.order_id,
  o.order_date,
  DATE_ADD(o.order_date, INTERVAL 2 DAY) as approx_ship_date,
  o.ship_date,
  DATEDIFF(o.ship_date, o.order_date) as days_to_ship
FROM
  my_guitar_shop.orders as o
WHERE
  o.ship_date IS NOT NULL AND
  MONTH(o.order_date) = 3 AND 
  YEAR(o.order_date) = 2018
ORDER BY
  o.order_id ASC;
