SELECT 
   email_address as email_address,
   MIN(order_id) as oldest_order_id,
   MIN(order_date) as oldest_order_date
  
FROM
   (
      SELECT DISTINCT
         c.email_address as email_address,
         c.customer_id as customer_id,
         o.order_id as order_id,
         o.order_date
         
      FROM
         my_guitar_shop.customers as c
      JOIN
         my_guitar_shop.orders as o ON c.customer_id = o.customer_id
      JOIN
         my_guitar_shop.order_items as i ON o.order_id = i.order_id
      GROUP BY
         c.email_address,
         c.customer_id,
         o.order_id
   ) as dt
GROUP BY
   email_address
ORDER BY
   MIN(order_id),
   MIN(order_date) DESC;