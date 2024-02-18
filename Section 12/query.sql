CREATE VIEW customer_addresses AS
SELECT DISTINCT
  c.customer_id,
  c.email_address,
  c.last_name,
  c.first_name,
  a.bill_line1,
  a.bill_line2,
  a.bill_city,
  a.bill_state,
  a.bill_zip,
  a.ship_line1,
  a.ship_line2,
  a.ship_city,
  a.ship_state,
  a.ship_zip
FROM
  my_guitar_shop.customers c
JOIN
  my_guitar_shop.addresses a ON c.customer_id = a.customer_id;

/*
Create a view named customer_addresses that shows the shipping and billing addresses
for each customer.

This view should return these columns from the Customers
table: customer_id, email_address, last_name and first_name.
This view should return these columns from the Addresses
table: bill_line1, bill_line2, bill_city, bill_state, bill_zip, ship_line1, ship_line2, ship_city, ship_state, and ship_zip.

THIS DOESN'T WORK YET!
*/
