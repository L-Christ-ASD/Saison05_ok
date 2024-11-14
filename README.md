# Exo 2

Se connecter au terminal du conteneur MySQL :

- `docker ps` → `S05E02-compose_exo-db-1`
- `docker exec -it S05E02-compose_exo-db-1 bash`
- `mysqldump --no-tablespaces  -u user -p mydb > /dump.sql`
- `exit` → on sort du terminal du conteneur DB
- `docker cp S05E02-compose_exo-db-1:dump.sql ./init.sql` → on copie le fichier dump depuis le conteneur

Ajouter `init.sql` dans db :

```yml
  db:
    image: mysql:8.0
    restart: always
    environment:
      MYSQL_DATABASE: mydb
      MYSQL_USER: user
      MYSQL_PASSWORD: pwd
      MYSQL_RANDOM_ROOT_PASSWORD: '1'
    volumes:
      - ./init.sql:/docker-entrypoint-initdb.d/init.sql
```