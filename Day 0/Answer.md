# Answers for day 00

Day00_ex00:
![img](./tasks/img/day00_ex00.png)

```sql
SELECT
  name,
  age
FROM
  person
WHERE
  address = 'Kazan';
```

Day00_ex01:
![img](./tasks/img/day00_ex01.png)

```sql
SELECT
  name,
  age
FROM
  person
WHERE
  address = 'Kazan'
  AND gender = 'female'
ORDER BY
  name;
```

Day00_ex02:
![img](./tasks/img/day00_ex02_1.png)

```sql
SELECT
  name,
  rating
FROM
  pizzeria
WHERE
  rating >= 3.5
  AND rating <= 5
ORDER BY
  rating;
```

![img](./tasks/img/day00_ex02_2.png)

```sql
SELECT
  name,
  rating
FROM
  pizzeria
WHERE
  rating BETWEEN 3.5
  AND 5
ORDER BY
  rating;
```

Day00_ex03:
![img](./tasks/img/day00_ex03.png)

```sql
SELECT
  DISTINCT person_id
FROM
  person_visits
WHERE
  (
    visit_date BETWEEN '2022-01-06'
    AND '2022-01-09'
  )
  OR (pizzeria_id = 2)
ORDER BY
  person_id DESC;
```

Day00_ex04:
![img](./tasks/img/day00_ex04.png)

```sql
SELECT
  CONCAT(
    name, ' (age:', age, ', gender:', gender,
    ', address:', address, ')'
  ) AS person
FROM
  person
ORDER BY
  person ASC;
```

Day00_ex05:
![img](./tasks/img/day00_ex05.png)

```sql
SELECT
  name
FROM
  person
WHERE
  id IN (
    SELECT
      person_id
    FROM
      person_order
    WHERE
      menu_id IN (13, 14, 18)
      AND order_date = '2022-01-07'
  );
```

Day00_ex06:
![img](./tasks/img/day00_ex06.png)

```sql
SELECT
    name,
    CASE
        WHEN EXISTS (
            SELECT 1
            FROM person_order
            WHERE person_order.person_id = person.id
            AND menu_id IN (13, 14, 18)
            AND order_date = '2022-01-07'
        ) THEN 'Has Order'
        ELSE 'No Order'
    END AS check_name
FROM
    person
WHERE
    id IN (
        SELECT
            person_id
        FROM
            person_order
        WHERE
            menu_id IN (13, 14, 18)
            AND order_date = '2022-01-07'
    );
```

Day00_ex07:
![img](./tasks/img/day00_ex07.png)

```sql
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
```

Day00_ex08:
![img](./tasks/img/day00_ex08.png)

```sql
SELECT
  *
FROM
  person_order
WHERE
  id % 2 = 0
ORDER BY
  id ASC;
```

Day00_ex09:
![img](./tasks/img/day00_ex09.png)

```sql
SELECT
    (SELECT name FROM person WHERE id = pv.person_id) AS person_name,
    (SELECT name FROM pizzeria WHERE id = pv.pizzeria_id) AS pizzeria_name
FROM
    (SELECT person_id, pizzeria_id
     FROM person_visits
     WHERE visit_date BETWEEN '2022-01-07' AND '2022-01-09') AS pv
ORDER BY
    person_name ASC,
    pizzeria_name DESC;
```
