 SELECT 
   p.list_price,
   FORMAT(CAST(p.list_price as DECIMAL), 1) as price_format,
   CONVERT(CAST(p.list_price as DECIMAL), DECIMAL) as price_convert,
   CAST(p.list_price as DECIMAL) as price_cast
FROM
   my_guitar_shop.products as p 
ORDER BY
   p.list_price ASC;
   
