#!/bin/sh

read -a time_array <<< $(date.exe -R)
IFS=":" read -a arr <<< ${time_array[4]}
day=$(echo ${time_array[0]} | sed 's/,/)/g')
unset time_array[0]
unset time_array[4]
unset time_array[5]
case ${arr[0]} in
    12)
        addon="pm"
        ;;
    *)
        if [ ${arr[0]} -lt 12 ]; then
            addon="am"
        else
            addon="pm"
            arr[0]=$((${arr[0]} - 12))
        fi
esac

echo ${arr[0]}":"${arr[1]}$addon
echo ${time_array[*]}" ("$day