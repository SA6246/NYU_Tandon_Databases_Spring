SELECT 
   c.email_address,
   (SUM(i.item_price) * i.quantity) as item_price_total,
   (SUM(i.discount_amount) * i.quantity) as discount_amount_total
FROM
   customers as c
JOIN 
   orders as o ON c.customer_id = o.customer_id
JOIN
   order_items as i ON o.order_id = i.order_id
GROUP BY
   c.email_address,
   i.quantity
ORDER BY 
   item_price_total DESC;