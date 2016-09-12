@echo off

set SCRIPT_PATH=%~dp0

set NGINX_PATH=%SCRIPT_PATH%nginx\
set PHP_PATH=%SCRIPT_PATH%php\
set MARIA_PATH=%SCRIPT_PATH%mariadb\

cd %NGINX_PATH%
start nginx.exe -c %SCRIPT_PATH%conf-nginx.conf

cd %PHP_PATH%
start php-cgi.exe -b 127.0.0.1:9000 -c %SCRIPT_PATH%conf-php.ini

cd %MARIA_PATH%
start bin\mysqld.exe --defaults-file=%SCRIPT_PATH%conf-my.ini

cd %SCRIPT_PATH%
start http://localhost:8383/info.php