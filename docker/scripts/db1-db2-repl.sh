#!/bin/bash
mysql -uroot -ss -e 'GRANT REPLICATION SLAVE ON *.* TO "repl"@"%" IDENTIFIED BY "p@ssw0rd"' --host 127.0.0.1 --port 13306 -pp3rc0na
mysql -uroot -ss -e 'CHANGE MASTER TO MASTER_HOST="db1", MASTER_USER="repl", MASTER_PASSWORD="p@ssw0rd", MASTER_CONNECT_RETRY=10, MASTER_RETRY_COUNT=36' --host 127.0.0.1 --port 23306 -pp3rc0na
mysql -uroot -ss -e 'START SLAVE' --host 127.0.0.1 --port 23306 -pp3rc0na
