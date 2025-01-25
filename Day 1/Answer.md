# Answers for day 01

Day01_ex00:
![img](/Day%201/img/day01_ex00.png)

```sql
SELECT
    menu.id AS object_id,
    menu.pizza_name AS object_name
FROM
    menu
UNION ALL
SELECT
    person.id AS object_id,
    person.name AS object_name
FROM
    person
ORDER BY
    object_id,
    object_name;
```

Day01_ex01:
![img](/Day%201/img/day01_ex01.png)

```sql
SELECT
    menu.pizza_name AS object_name
FROM
    menu
UNION ALL
SELECT
    person.name AS object_name
FROM
    person
ORDER BY
    object_name;
```

Day01_ex02:
![img](/Day%201/img/day01_ex02.png)

```sql
SELECT pizza_name
FROM (
    SELECT pizza_name, ROW_NUMBER() OVER (PARTITION BY pizza_name ORDER BY pizza_name) as rn
    FROM menu
) ranked_pizzas
WHERE rn = 1
ORDER BY pizza_name DESC;
```

Day01_ex03:
![img](/Day%201/img/day01_ex03.png)

```sql
SELECT person_id, order_date AS action_date
FROM person_order

INTERSECT

SELECT person_id, visit_date AS action_date
FROM person_visits

ORDER BY action_date ASC, person_id DESC;
```

Day01_ex04:
![img](/Day%201/img/day01_ex04.png)

```sql
SELECT
  person_id
FROM
  person_order
WHERE
  order_date = '2022-01-07'
  AND person_id NOT IN (
    SELECT
      person_id
    FROM
      person_visits
    WHERE
      visit_date = '2022-01-07'
  );
```

Day01_ex05:
![img](/Day%201/img/day01_ex05.png)

```sql
SELECT
    p.id AS person_id,
    p.name AS person_name,
    p.age,
    p.gender,
    p.address,
    pi.id AS pizzeria_id,
    pi.name AS pizzeria_name,
    pi.rating
FROM
    person p
CROSS JOIN
    pizzeria pi
ORDER BY
    p.id,
    pi.id;
```

Day01_ex06:
![img](/Day%201/img/day01_ex06.png)

```sql
SELECT
    p.name,
    po.order_date AS action_date
FROM
    person p
JOIN
    person_order po ON p.id = po.id
UNION ALL
SELECT
    p.name,
    pv.visit_date AS action_date
FROM
    person p
JOIN
    person_visits pv ON p.id = pv.id
ORDER BY
    action_date ASC,
    name DESC;
```

Day01_ex07:
![img](/Day%201/img/day01_ex07.png)

```sql
SELECT
    po.order_date,
    CONCAT(p.name, ' (age:', p.age, ')') AS person_information
FROM
    person_order po
JOIN
    person p ON po.person_id = p.id
ORDER BY
    po.order_date ASC,
    person_information ASC;
```

Day01_ex08:
![img](/Day%201/img/day01_ex08.png)

```sql
SELECT
    order_date,
    CONCAT(name, ' (age:', age, ')') AS person_information
FROM
    person_order NATURAL JOIN (
    SELECT id AS person_id, name, age
 FROM person
  )
 AS id
 ORDER BY
 order_date ASC,
 person_information ASC;
```

Day01_ex09:
![img](/Day%201/img/day01_ex09.png)

```sql
SELECT name
FROM pizzeria
WHERE id NOT IN (
    SELECT DISTINCT pizzeria_id
    FROM person_visits
);
```

Day01_ex10:
![img](/Day%201/img/day01_ex10.png)

```sql
SELECT
  person.name AS person_name,
  menu.pizza_name,
  pizzeria.name AS pizzeria_name
FROM
  person
  JOIN person_order ON person.id = person_order.person_id
  JOIN menu ON person_order.menu_id = menu.id
  JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY
  person_name ASC,
  menu.pizza_name ASC,
  pizzeria_name ASC;
```
