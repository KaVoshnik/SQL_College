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
![img] (/Day%201/img/day01_ex01.png)

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
