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
PASSWORD="SENHA_DA_REDE"

WPA_CONF="/etc/wpa_supplicant/wpa_supplicant-wlan1.conf"

echo "[*] Ativando interface wlan1..."
ip link set wlan1 up

echo "[*] Gerando arquivo de configuração do wpa_supplicant..."
wpa_passphrase "$SSID" "$PASSWORD" > "$WPA_CONF"

echo "[*] Iniciando wpa_supplicant..."
killall wpa_supplicant 2>/dev/null
wpa_supplicant -B -i wlan1 -c "$WPA_CONF"

sleep 2

echo "[*] Solicitando IP via DHCP..."
dhclient wlan1

sleep 2

echo "[*] Testando conexão..."
ping -c 3 8.8.8.8 && echo "[+] Conectado com sucesso!" || echo "[!] Falha na conexão."