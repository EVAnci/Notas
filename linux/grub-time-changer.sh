#!/bin/bash

yes_no_validate() {
    message="$1"
    default="$2"
    while true; do
        read -p "$message" input
        input=$(echo "$input" | tr '[:upper:]' '[:lower:]')
        if [[ -z "$input" ]]; then
            input="$default"
            break
        elif [[ "$input" == "s" || "$input" == "si" ]]; then
            input="s"
            break
        elif [[ "$input" == "n" || "$input" == "no" ]]; then
            restorde="n"
            break
        else
            echo "La entrada proporcionada es invalida!"
        fi
    done
    echo $input
}

if [[ $(find /etc/default -name grub.bkp -type f | grep .) ]]; then
    restore=$(yes_no_validate "Deseas reestaurar tu archivo grub [s/N]: " "n")
    if [[ $(find /etc/default -name grub.bkp -type f | grep .) && $restore == "s" ]]; then
        echo "[+] Restaurando archivo..."
        cp /etc/default/grub.bkp /etc/default/grub
        continue=$(yes_no_validate "Desea continuar editando el archivo grub? [s/N)" "n")
    elif [[ "$restore" == "s" ]] && ! [[ $(find /etc/default -name grub.bkp -type f | grep .) ]]; then
        echo "[!] El achivo de reespaldo no ha sido encontrado"
        continue=$(yes_no_validate "Desea continuar? [S/n]: " "s")
    else
        echo "[+] Saltando recuperación. Se generará un archivo de reespaldo a partir del archivo actual."
        continue=$(yes_no_validate "Desea continuar? [S/n]: " "s")
    fi
    if [[ $continue == 'n' ]]; then
        echo "[-] Saliendo..."
        exit 0
    fi
else
    restore="n"
    echo "[+] Se generará una copia del archivo original"
fi

read -p "Cantidad de segundos para el cargador de arranque [5-120]: " grub_timeout

while [[ $grub_timeout -lt "5" || $grub_timeout -gt "120" ]]; do
    echo "La cantidad ingresada no está en el rango indicado"
    read -p "Cantidad de segundos para el cargador de arranque [5-120]: " grub_timeout
done

cp /etc/default/grub /etc/default/grub.bkp

sed -i "s/^GRUB_TIMEOUT=[^\"]*/GRUB_TIMEOUT=$grub_timeout/" /etc/default/grub

echo "[+] Generando archivo de configuración del GRUB"

grub-mkconfig -o /boot/grub/grub.cfg

echo "[+] El tiempo de espera del GRUB ha sido cambiado a $grub_timeout segundos"