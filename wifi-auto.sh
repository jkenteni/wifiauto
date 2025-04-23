#!/bin/bash

# ==========================================
# WIFI-AUTOCONNECT
# Script para conectar Wi-Fi no BlackArch Slim
# Projeto: Karkov
# Créditos: Tropa da Turquia | Dev: Kenteni Alves | GitHub: @jkenteni
# ==========================================

# LOGO ASCII
echo """
 ██ ▄█▀▄▄▄       ██▀███   ██ ▄█▀ ▒█████   ██▒   █▓      █     █░ ██▓  █████▒██▓
 ██▄█▒▒████▄    ▓██ ▒ ██▒ ██▄█▒ ▒██▒  ██▒▓██░   █▒     ▓█░ █ ░█░▓██▒▓██   ▒▓██▒
▓███▄░▒██  ▀█▄  ▓██ ░▄█ ▒▓███▄░ ▒██░  ██▒ ▓██  █▒░     ▒█░ █ ░█ ▒██▒▒████ ░▒██▒
▓██ █▄░██▄▄▄▄██ ▒██▀▀█▄  ▓██ █▄ ▒██   ██░  ▒██ █░░     ░█░ █ ░█ ░██░░▓█▒  ░░██░
▒██▒ █▄▓█   ▓██▒░██▓ ▒██▒▒██▒ █▄░ ████▓▒░   ▒▀█░   ██▓ ░░██▒██▓ ░██░░▒█░   ░██░
▒ ▒▒ ▓▒▒▒   ▓▒█░░ ▒▓ ░▒▓░▒ ▒▒ ▓▒░ ▒░▒░▒░    ░ ▐░   ▒▓▒ ░ ▓░▒ ▒  ░▓   ▒ ░   ░▓  
░ ░▒ ▒░ ▒   ▒▒ ░  ░▒ ░ ▒░░ ░▒ ▒░  ░ ▒ ▒░    ░ ░░   ░▒    ▒ ░ ░   ▒ ░ ░      ▒ ░
░ ░░ ░  ░   ▒     ░░   ░ ░ ░░ ░ ░ ░ ░ ▒       ░░   ░     ░   ░   ▒ ░ ░ ░    ▒ ░
░  ░        ░  ░   ░     ░  ░       ░ ░        ░    ░      ░     ░          ░  
                                              ░     ░                          
                                |Projeto Karkov|
    Créditos: Tropa da Turquia | Dev: Kenteni Alves | GitHub: @jkenteni
"""

# CONFIGURAÇÃO - Edite esses dois:
SSID="NOME_DA_REDE"


echo "[*] Ativando interface wlan1..."
ip link set wlan1 up

echo "[*] Gerando conexão..."
iw dev wlan1 connect "$SSID"
sleep 2

echo "[*] Solicitando IP via DHCP..."
dhclient wlan1

sleep 2

echo "[*] Testando conexão..."
ping -c 3 8.8.8.8 && echo "[+] Conectado com sucesso!" || echo "[!] Falha na conexão."

echo "Seleção da Turquia - Automação Modders"