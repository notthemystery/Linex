#!/bin/bash

echo " _     _                 "
echo "| |   (_)_ __   ___  __  "
echo "| |   | | '_ \ / _ \/ _ \/ /"
echo "| |___| | | | |  __/  __/  "
echo "|_____|_|_| |_|\___|\___|  "
echo "          L I N E X"

echo
echo "1. CopyFail Exploit"
echo "2. Polkit (CVE-2021-3560) Exploit"
echo "3. Telnet (Telnet should be installed, needs another computer)"
echo
read -rp ": " input

case "$input" in
  1)
    echo "Running option 1..."
    python3 Exploits/Python/copyfail.py
    ;;
    
  2)
    echo "Enter username:"
    read -r un
    echo "Running option 2 with: $un"
    ./Exploits/Shell/polkitbug.sh "$un"
    ;;
    
  3)
    echo "Enter IP address:"
    read -r ip

    echo "Enter port (optional):"
    read -r port

    echo "Enter username (optional):"
    read -r us

    if [ -z "$port" ]; then
      echo "No port provided, using default..."
      port=23
    fi

    echo "IP: $ip"
    echo "Port: $port"
    echo "User: $us"

    python3 Exploits/Python/telnetbug.py "$ip" "$port" "$us"
    ;;
    
  *)
    echo "Invalid option"
    ;;
esac
