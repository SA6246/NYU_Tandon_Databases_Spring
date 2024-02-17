 SELECT
   o.card_number,
   LENGTH(CAST(o.card_number AS CHAR)) AS card_number_length,
   RIGHT(CAST(o.card_number AS CHAR), 4) AS last_four_digits,
   CASE
      WHEN LENGTH(CAST(o.card_number AS CHAR)) = 16 THEN CONCAT('XXXX-XXXX-XXXX-', RIGHT(CAST(o.card_number AS CHAR), 4))
      WHEN LENGTH(CAST(o.card_number AS CHAR)) = 15 THEN CONCAT('XXXX-XXXXXX-X', RIGHT(CAST(o.card_number AS CHAR), 4))
   END AS formatted_number
FROM
   my_guitar_shop.orders AS o
ORDER BY
   o.card_number ASC;