#!/usr/bin/env bash

id_check() {
    if [[ $(id -u) -eq 0 ]] ; then
        return 0;
    else 
        return 1;     
    fi

}

main() {
    printf "%s\n", "---------- Начало работы скрипта... -----------"
    if [[ $(id_check) -eq "$?" ]]; then
        printf "%s\n", "Установка приложений..."
        printf "%s\n" "Обновление базы.."
        urpmi --auto-update
        urpmi gcc gcc-c++ gdb make cmake git wget curl discover flatpak discover-backend-flatpak  
    else 
        printf  "%s\n", "Для работы скрипта требуются права админа..!"    
    fi
    printf "%s\n", "---------- Работа скрипта завершена.-----------"
}

main
