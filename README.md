### 環境構築
***
## docker
コンテナ
- backend: Rails7 API サーバー
- db: DB　MySQL:8
- frontend: React.js

## 起動
各URLのリポジトリをcloneして任意のディレクトリに配置  
https://github.com/tatsuhiko-e/yosakoi_schedule_front 
https://github.com/tatsuhiko-e/yosakoi_schedule_back  

任意のディレクトリ  
├─yosakoi_schedule_front  
└─yosakoi_schedule_back  

任意のディレクトリ直下にdocker-compose.yml作成  
``` docker-compose.yml
version: '3.8'

services:
  db:
    image: mysql:8.0
    command: --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci
    environment:
      MYSQL_ROOT_PASSWORD: password
      MYSQL_DATABASE: sample
      MYSQL_PASSWORD: password
    ports:
      - 4306:3306
    volumes:
      - mysql-db:/var/lib/mysql
  backend:
    tty: true
    depends_on:
      - db
    build:
      context: ./yosakoi_schedule_back/
      dockerfile: Dockerfile
    ports:
      - 3000:3000
    volumes:
      - ./yosakoi_schedule_back:/app
    command: rails server -b 0.0.0.0
  frontend:
    build:
      context: ./yosakoi_schedule_front/
      dockerfile: Dockerfile
    volumes:
      - ./frontend:/usr/src/app
    command: sh -c "cd app && npm install &&  npm start"
    ports:
      - "4000:3000"
volumes:
  mysql-db:
    driver: local

```

任意のディレクトリ  
├─yosakoi_schedule_front  
├─yosakoi_schedule_back  
└─docker-compose.yml  

任意のディレクトリに移動しbuild
```
docker-compose build
```

#### 各コンテナの起動

```bash
docker-compose up
```

Rails: http://localhost:3000/  
React: http://localhost:4000/
