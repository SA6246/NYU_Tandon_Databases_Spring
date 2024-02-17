SELECT 
   c.last_name,
   c.first_name,
   o.order_date,
   p.product_name,
   oi.item_price,
   oi.discount_amount,
   oi.quantity
FROM
   customers as c
JOIN 
   orders as o ON c.customer_id = o.customer_id
JOIN
   order_items as oi ON o.order_id = oi.order_id
JOIN
   products as p ON oi.product_id = p.product_id
ORDER BY 
    c.last_name,
    o.order_date,
    p.product_name;
