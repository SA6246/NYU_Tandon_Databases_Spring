SELECT 
    product_name, 
    list_price, 
    discount_percent, 
    ROUND(discount_percent * list_price/100, 2) AS discount_amount,
    ROUND(list_price - (discount_percent * list_price/100), 2) AS discount_price
FROM 
    products
ORDER BY 
    discount_price DESC
LIMIT 5;
