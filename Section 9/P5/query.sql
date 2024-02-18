SELECT
  a.email_address,
  SUBSTRING_INDEX(a.email_address, '@', 1) AS user_name,
  SUBSTRING_INDEX(a.email_address, '@', -1) AS domain_name
FROM
  my_guitar_shop.administrators as a
ORDER BY
  a.email_address ASC;