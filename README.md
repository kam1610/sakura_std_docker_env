さくらレンタルサーバー，スタンダードプラン"風の"環境です

# Usage

    docker-compose down && docker-compose up --build

# Log in to mysql server

    $ docker exec -it mysql8 bash
    bash-5.1# mysql -uuser00 -p

# Log in to apache server

    $ docker exec -it apache2 bash
    root@4b0c86065b4a:/# mysql -h mysql8 -uuser00 -p

# Access to cgi and static page

    http://localhost:8080/index.html
    http://localhost:8080/index.rb?param=value1
