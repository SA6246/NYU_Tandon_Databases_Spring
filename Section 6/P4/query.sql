SELECT
   c.email_address,
   COUNT(distinct(o.order_id)) as order_count,
   SUM((i.item_price - i.discount_amount) * i.quantity) as order_total
FROM
   my_guitar_shop.customers as c
JOIN
   my_guitar_shop.orders as o ON c.customer_id = o.customer_id
JOIN
   my_guitar_shop.order_items as i ON o.order_id = i.order_id
GROUP BY
   c.email_address
HAVING
   COUNT(distinct(o.order_id)) > 1
ORDER BY
   order_total DESC;