SELECT
   p.product_id,
   p.product_name,
   p.list_price
FROM
   my_guitar_shop.products as p
WHERE
   p.list_price > (
                     SELECT 
                        AVG(list_price) 
                     FROM 
                        my_guitar_shop.products
                  )
ORDER BY
   p.list_price DESC;