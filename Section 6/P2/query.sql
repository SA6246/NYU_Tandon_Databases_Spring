SELECT 
   c.category_name,
   COUNT(p.product_code) as product_count,
   MAX(p.list_price) as most_expensive_product
FROM
   categories as c
JOIN 
   products as p ON c.category_id = p.category_id
GROUP BY
    c.category_name
ORDER BY 
    product_count DESC;