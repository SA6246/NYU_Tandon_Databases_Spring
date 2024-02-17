SELECT 
   email_address as email_address,
   MAX(order_total) as max_order_total, 
   MIN(order_id) as min_order_id
FROM
   (
      SELECT 
         c.email_address as email_address,
         o.order_id as order_id,
         SUM((i.item_price - i.discount_amount) * i.quantity) as order_total
      FROM
         my_guitar_shop.customers as c
      JOIN
         my_guitar_shop.orders as o ON c.customer_id = o.customer_id
      JOIN
         my_guitar_shop.order_items as i ON o.order_id = i.order_id
      GROUP BY
         c.email_address,
         o.order_id
   ) as dt
GROUP BY
email_address
ORDER BY
max_order_total DESC;
