SELECT 
   customers.first_name,
   customers.last_name,
   addresses.line1,
   addresses.city,
   addresses.state,
   addresses.zip_code
FROM
   customers
JOIN 
   addresses ON customers.customer_id = addresses.customer_id
WHERE
    customers.shipping_address_id = addresses.address_id
ORDER BY 
    addresses.zip_code ASC;