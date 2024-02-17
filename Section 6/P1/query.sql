SELECT 
    COUNT(order_id) as order_count, 
    SUM(tax_amount) as tax_total,
    AVG(tax_amount) as tax_average
FROM
    orders;