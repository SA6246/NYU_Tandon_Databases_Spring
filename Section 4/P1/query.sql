SELECT 
   categories.category_name,
   products.product_name,
   products.list_price
FROM
    categories
JOIN 
    products ON categories.category_id = products.category_id
ORDER BY 
    categories.category_name ASC, 
    products.product_name ASC;

    
