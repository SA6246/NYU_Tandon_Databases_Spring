SELECT 
   product_name,
   list_price,
   discount_percent
FROM (
         SELECT 
            DISTINCT(p.discount_percent),
            p.product_name,
            p.list_price
         FROM
            my_guitar_shop.products as p
         ORDER BY
            p.product_name
      ) as dt
WHERE 
   discount_percent != 30
ORDER BY
   product_name