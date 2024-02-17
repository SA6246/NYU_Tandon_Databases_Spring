 SELECT 
   p.list_price,
   p.discount_percent,
   ROUND(((p.list_price * p.discount_percent) / 100),2) as discount_amount
FROM
   my_guitar_shop.products as p 
ORDER BY
   discount_amount ASC;
   

