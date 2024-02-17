 SELECT 
   p.date_added,
   CAST(p.date_added as DATE) as added_date,
   DATE_FORMAT(CAST(p.date_added  as DATE), '%Y-%m') as added_char7,
   CAST(p.date_added as TIME) as added_time
FROM
   my_guitar_shop.products as p 
ORDER BY
   p.date_added ASC;