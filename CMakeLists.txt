cmake_minimum_required(VERSION 2.8)
project(win-php-config NONE)



set(PHP_URL "http://windows.php.net/downloads/releases/php-7.0.10-nts-Win32-VC14-x86.zip")
set(NGINX_URL "http://nginx.org/download/nginx-1.11.3.zip")
set(MARIADB_URL "https://downloads.mariadb.org/interstitial/mariadb-10.1.17/win32-packages/mariadb-10.1.17-win32.zip")



# Generate config files
file(MAKE_DIRECTORY "${CMAKE_SOURCE_DIR}/htdocs/")
configure_file("${CMAKE_SOURCE_DIR}/src/conf-php.ini.in" "${CMAKE_SOURCE_DIR}/conf-php.ini" @ONLY)
configure_file("${CMAKE_SOURCE_DIR}/src/conf-nginx.conf.in" "${CMAKE_SOURCE_DIR}/conf-nginx.conf" @ONLY)
configure_file("${CMAKE_SOURCE_DIR}/src/conf-my.ini.in" "${CMAKE_SOURCE_DIR}/conf-my.ini" @ONLY)



# PHP
if(EXISTS "${CMAKE_BINARY_DIR}/php.zip")
    message(STATUS "Found php.zip")
else()
    file(DOWNLOAD ${PHP_URL} ${CMAKE_BINARY_DIR}/php.zip SHOW_PROGRESS)
endif()

if(EXISTS "${CMAKE_SOURCE_DIR}/php")
    message(STATUS "Nginx already extracted")
else()
    file(MAKE_DIRECTORY "${CMAKE_BINARY_DIR}/php/")
    execute_process(
        COMMAND ${CMAKE_COMMAND} -E tar xzf ${CMAKE_BINARY_DIR}/php.zip
        WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/php/"
    )
    file(GLOB PHP_DIR "${CMAKE_BINARY_DIR}/php")
    file(RENAME "${PHP_DIR}" "${CMAKE_SOURCE_DIR}/php/")
endif()



# NGINX
if(EXISTS "${CMAKE_BINARY_DIR}/nginx.zip")
    message(STATUS "Found nginx.zip")
else()
    file(DOWNLOAD ${NGINX_URL} ${CMAKE_BINARY_DIR}/nginx.zip SHOW_PROGRESS)
endif()

if(EXISTS "${CMAKE_SOURCE_DIR}/nginx")
    message(STATUS "Nginx already extracted")
else()
    execute_process(
        COMMAND ${CMAKE_COMMAND} -E tar xzf ${CMAKE_BINARY_DIR}/nginx.zip
        WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/"
    )
    file(GLOB NGINX_DIR "${CMAKE_BINARY_DIR}/nginx-*")
    file(RENAME "${NGINX_DIR}" "${CMAKE_SOURCE_DIR}/nginx/")
endif()



# MARIA DB
if(EXISTS "${CMAKE_BINARY_DIR}/mariadb.zip")
    message(STATUS "Found mariadb.zip")
else()
    file(DOWNLOAD ${MARIADB_URL} "${CMAKE_BINARY_DIR}/mariadb.zip" SHOW_PROGRESS)
endif()

if(EXISTS "${CMAKE_SOURCE_DIR}/mariadb")
    message(STATUS "Mariadb already extracted")
else()
    execute_process(
        COMMAND ${CMAKE_COMMAND} -E tar xzf "${CMAKE_BINARY_DIR}/mariadb.zip"
        WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/"
    )
    file(GLOB MARIADB_DIR "${CMAKE_BINARY_DIR}/mariadb-*")
    file(RENAME "${MARIADB_DIR}" "${CMAKE_SOURCE_DIR}/mariadb/")
endif()



# Start all services
message(STATUS "")
message(STATUS "Starting php webserver now...")
execute_process(
        COMMAND start.bat
        WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}/"
    )