SELECT 
  CONCAT(
    name, ' (age:', age, ', gender:', gender, 
    ', address:', address, ')'
  ) AS person 
FROM 
  person 
ORDER BY 
  person ASC;
