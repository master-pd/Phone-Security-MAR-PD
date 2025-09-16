#!/data/data/com.termux/files/usr/bin/bash
# install.sh - Termux installer for PHONE SECURITY TOOL - MAR PD

set -e

# ---------------- Banner ----------------
echo "==============================================="
echo "      PHONE SECURITY TOOL - MAR PD"
echo "==============================================="
echo "[*] Starting installation..."
echo
# ----------------------------------------

# Update & install required packages
pkg update -y && pkg upgrade -y
pkg install -y git rclone termux-api cronie nano

# Make scripts executable
chmod +x phone_backup.sh

# Installation complete message
echo
echo "-----------------------------------------------"
echo "[*] Installation complete!"
echo
echo "Next Steps:"
echo "1) Configure rclone remote (example: gdrive):"
echo "   rclone config"
echo "2) Give Termux permissions: Contacts, SMS, Phone, Storage"
echo "   (Settings → Apps → Termux → Permissions)"
echo "3) Test backup:"
echo "   ./phone_backup.sh"
echo
echo "Optional: Setup daily cron job:"
echo "0 2 * * * /data/data/com.termux/files/home/Phone-Security-MAR-PD/phone_backup.sh"
echo "Start cron daemon with: crond"
echo
echo "==============================================="
echo "       INSTALLATION COMPLETE - MAR PD"
echo "==============================================="