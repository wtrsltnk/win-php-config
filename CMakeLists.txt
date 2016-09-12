cmake_minimum_required(VERSION 2.8)

project(phpserver)

set(PHP_URL "http://windows.php.net/downloads/releases/php-7.0.10-nts-Win32-VC14-x86.zip")
set(NGINX_URL "http://nginx.org/download/nginx-1.11.3.zip")
set(MARIADB_URL "https://downloads.mariadb.org/interstitial/mariadb-10.1.17/win32-packages/mariadb-10.1.17-win32.zip")



# PHP
if(NOT EXISTS ${CMAKE_SOURCE_DIR}/php.zip)
		file(DOWNLOAD ${PHP_URL} ${CMAKE_BINARY_DIR}/php.zip SHOW_PROGRESS)
endif()

file(MAKE_DIRECTORY "${CMAKE_BINARY_DIR}/php/")
execute_process(
		COMMAND ${CMAKE_COMMAND} -E tar xzf ${CMAKE_BINARY_DIR}/php.zip
		WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/php/"
)
file(GLOB PHP_DIR "${CMAKE_BINARY_DIR}/php")
file(RENAME "${PHP_DIR}" "${CMAKE_SOURCE_DIR}/php/")


# NGINX
if(NOT EXISTS ${CMAKE_SOURCE_DIR}/nginx.zip)
		file(DOWNLOAD ${NGINX_URL} ${CMAKE_BINARY_DIR}/nginx.zip SHOW_PROGRESS)
endif()

execute_process(
		COMMAND ${CMAKE_COMMAND} -E tar xzf ${CMAKE_BINARY_DIR}/nginx.zip
		WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/"
)
file(GLOB NGINX_DIR "${CMAKE_BINARY_DIR}/nginx-*")
file(RENAME "${NGINX_DIR}" "${CMAKE_SOURCE_DIR}/nginx/")



# MARIA DB
if(NOT EXISTS ${CMAKE_SOURCE_DIR}/matiadb.zip)
		file(DOWNLOAD ${MARIADB_URL} ${CMAKE_BINARY_DIR}/mariadb.zip SHOW_PROGRESS)
endif()

execute_process(
		COMMAND ${CMAKE_COMMAND} -E tar xzf ${CMAKE_BINARY_DIR}/mariadb.zip
		WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/"
)
file(GLOB MARIADB_DIR "${CMAKE_BINARY_DIR}/mariadb-*")
file(RENAME "${MARIADB_DIR}" "${CMAKE_SOURCE_DIR}/mariadb/")
