SELECT 
    name,
    age,
    gender,
    address,
    CONCAT(name, ' (age:', age, ', gender:', gender, ', address:', address, ')') AS person_information,
    CASE 
        WHEN age >= 18 THEN 'Adult'
        ELSE 'Minor'
    END AS check_name
FROM 
    person
ORDER BY 
    person_information ASC;
