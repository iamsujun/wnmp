@echo off

rem "set path"
SET base_path=%cd%
SET config_path=%base_path%\config

SET nginx_path=%base_path%\nginx
SET php_path=%base_path%\php
SET redis_path=%base_path%\redis
SET memcache_path=%base_path%\memcached

echo Starting Redis...
RunHiddenConsole.exe %redis_path%\redis-server.exe

echo Starting memcache...
RunHiddenConsole.exe %memcache_path%\memcached.exe

echo Starting PHP FastCGI...
RunHiddenConsole.exe %php_path%\php-cgi.exe -b 127.0.0.1:9000 -c %base_path%\php.ini

echo starting Nginx...
RunHiddenConsole.exe %nginx_path%\nginx.exe -p %nginx_path%
