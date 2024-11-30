#!/bin/bash

# Install required tools
echo "Ensuring required tools are installed..."
sudo apt-get update
sudo apt-get install -y iputils-ping nmap nikto

# Prompt for the target
read -p "Enter the target (IP or domain): " TARGET

# Check if target is provided
if [ -z "$TARGET" ]; then
  echo "No target provided. Exiting..."
  exit 1
fi

# Log files
NMAP_PORT_LOG="nmap_ports_$TARGET.log"
NIKTO_LOG="nikto_scan_$TARGET.log"

echo "========== Scanning Target: $TARGET =========="

# Step 1: Use Nmap to find open ports
echo "[1] Scanning for open ports with Nmap..."
OPEN_PORTS=$(nmap -p- --open -T4 -n "$TARGET" | grep open | awk -F/ '{print $1}' | paste -sd, -)
echo "Open ports detected: $OPEN_PORTS"

# Save the open ports to a log file
if [ -n "$OPEN_PORTS" ]; then
  echo "Open ports: $OPEN_PORTS" > "$NMAP_PORT_LOG"
else
  echo "No open ports detected. Exiting..."
  exit 1
fi

# Step 2: Run Nikto on the detected open ports
echo "[2] Running Nikto scan on open ports..."
nikto -h "$TARGET" -port "$OPEN_PORTS" -C all -timeout 10 -useragent "Mozilla/5.0 (compatible; Nikto/2.1)" -ssl | tee "$NIKTO_LOG"

echo "Nikto scan completed. Results saved in $NIKTO_LOG."
echo "========== Scanning Completed =========="

