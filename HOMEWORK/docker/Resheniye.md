
### Кононенко Александр домашнее задание по теме    "Оркестрация группой Docker контейнеров на примере Docker Compose"






# Задача 1

<details>
<summary><strong>Текст Задачи </strong></summary>

1. Установите Docker и Docker Compose Plugin на свою Linux рабочую станцию или ВМ.

2. Если Docker Hub недоступен, создайте файл `/etc/docker/daemon.json` с содержимым:

   ```json
   {
     "registry-mirrors": [
       "https://mirror.gcr.io",
       "https://daocloud.io",
       "https://c.163.com/",
       "https://registry.docker-cn.com"
     ]
   }
   ```

3. Зарегистрируйтесь и создайте публичный репозиторий с именем `custom-nginx` на [Docker Hub](https://hub.docker.com) (ТОЛЬКО ЕСЛИ У ВАС ЕСТЬ ДОСТУП).

4. Скачайте образ `nginx:1.29.0`.

5. Создайте Dockerfile и реализуйте в нём замену дефолтной индекс-страницы (`/usr/share/nginx/html/index.html`) на файл `index.html` с содержимым:

   ```html
   <html>
   <head>
   Hey, Netology
   </head>
   <body>
   <h1>I will be DevOps Engineer!</h1>
   </body>
   </html>
   ```

6. Соберите и отправьте созданный образ в свой Docker Hub репозиторий с тегом `1.0.0` (ТОЛЬКО ЕСЛИ ЕСТЬ ДОСТУП).

7. Предоставьте ответ в виде ссылки:

   `https://hub.docker.com/r/<username>/custom-nginx/general`

</details>

## Решение1


<details>
<summary><strong>Ссылка на решение </strong></summary>

[Docker Hub — custom-nginx](https://hub.docker.com/repository/docker/alcost/custom-nginx/general)

</details>
