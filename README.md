# Некоторые заметки по работе

1. Используются:
 - Ubuntu Server.
 - GitLab.
 - Docker Hub.

2. При работе с Terraform создаем файл variables.tf с указанием данных для подключения к облаку.

3. Не забываем отредактировать файл Ansible inventory - внести актуальные IP-адреса серверов.

4. После развертывания инфраструктуры с помощью Ansible, регистрируем Runner на Gitlab:

```
gitlab-runner register
```

На вопрос "Enter an executor" отвечаем "docker".

5. В настройках CI/CD Gitlab добавляем две переменные - DOCKER_USERNAME и DOCKER_PASSWORD. Соответственно, логин и пароль для прохождения валидации в репозитории Docker Hub.

6. Для корректной работы kubectl на srv берем содержимое файла /etc/kubernetes/admin.conf с мастера kubernetes и копируем его в такой же файл на srv.
