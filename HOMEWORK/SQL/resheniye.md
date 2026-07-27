
### Кононенко Александр  домашнее задание по теме Расширенные возможности SQL
---
 
 ## Задание 1. 
  <details><summary><b> Текст Задания.</b> (нажмите, чтобы раскрыть)</summary>
<br>
Одним запросом получите информацию о магазине, в котором обслуживается более 300 покупателей, и выведите в результат следующую информацию:

* фамилия и имя сотрудника из этого магазина;
* город нахождения магазина;
*  количество пользователей, закреплённых в этом магазине.
  
</details>

#### Решение 
<details>
<summary><b>Текст запроса</b> (нажмите, чтобы раскрыть)</summary>

```sql
SELECT 
    CONCAT(s.first_name, ' ', s.last_name) AS staff_name,
    c.city AS city,
    COUNT(cu.customer_id) AS customer_count
FROM store st
JOIN staff s ON st.store_id = s.store_id
JOIN address a ON st.address_id = a.address_id
JOIN city c ON a.city_id = c.city_id
JOIN customer cu ON st.store_id = cu.store_id
GROUP BY st.store_id, s.first_name, s.last_name, c.city
HAVING COUNT(cu.customer_id) > 300;
```
</details>

**Вывод Запроса:**

![Скриншот вывода запроса](Scrins/resheniye1.png)

## Задание 2
<details><summary><b> Текст Задания </b> (нажмите, чтобы раскрыть)</summary>
<br>

 * Получите количество фильмов, продолжительность которых больше средней продолжительности всех фильмов.
</details>

#### Решение 
<details>
<summary><b>Текст запроса</b> (нажмите, чтобы раскрыть)</summary>

```sql
SELECT 
    store_id,
    COUNT(customer_id) AS customer_count
FROM customer
GROUP BY store_id;
```
</details>


