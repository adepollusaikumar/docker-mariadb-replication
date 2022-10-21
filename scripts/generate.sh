DATABASES="d1 d2 d3 d4 d5 d6"
MYSQL="mysql -uroot -proot -h127.0.0.1 -P3306"

for d in $DATABASES
do
$MYSQL -e"CREATE DATABASE  IF NOT EXISTS $d"
$MYSQL -D$d  -e"CREATE TABLE IF NOT EXISTS table_$d (
    id int NOT NULL AUTO_INCREMENT,
    value varchar(255) NOT NULL,
    PRIMARY KEY (id)
);"

done

while :

do
q=$((((RANDOM + RANDOM) % 6) + 1))
$MYSQL -Dd$q -e"insert into table_d$q(value) values(MD5(RAND()))"
echo "INSERT  INTO d$q.table_d$q"
done
