SELECT 
   order_date,
   DATE_FORMAT(CAST(o.order_date  as DATE), '%Y') as order_year,
   DATE_FORMAT(CAST(o.order_date  as DATE), '%b-%d-%Y') as order_date_formatted,
   DATE_FORMAT(o.order_date, '%l:%i %p') as order_time,
   DATE_FORMAT(o.order_date, '%m/%d/%y %H:%i') as order_datetime
FROM
   my_guitar_shop.orders as o
ORDER BY
   o.order_date;