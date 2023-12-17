#!/bin/bash

#Banner
python3 -c 'import pyfiglet;print(pyfiglet.figlet_format("Security is a CULTURE"))'

read -p "Enter your username: " username
#Kernel Hardening
#password is password
password="grub.pbkdf2.sha512.10000.3CE73D9FE0E2CA21BA9C421F0CBFBAB2D1F525F42045898C5C9A975EDED3A97EE3A4E39B72738E3820CDBD3B1F1B52B314FCB4F6D72721818EA11173A24836AD.FB62545BBBA6F45F08EF0D3E74E7AB939023632ADE7FAAF2819A4785D97E73B313C0846BDBC8264706D1216999FF50643F785798CFDBB146C108B744A69998DF"

echo "cat <<EOF
set superusers="$username"
password_pbkdf2 $username $password
EOF" >> /etc/grub.d/00_header

sudo update-grub