#!/bin/bash
# ==============================
# PHONE SECURITY TOOL - MAR PD
# ADVANCED VERSION
# ==============================

# --- COLORS ---
RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
NC="\033[0m"

# --- BANNER ---
echo -e "${GREEN}"
echo "====================================="
echo "      PHONE SECURITY TOOL - MAR PD    "
echo "====================================="
echo -e "${NC}"
echo -e "${YELLOW}Setup starting... Please follow the steps.${NC}\n"

# --- STEP 1: UPDATE & INSTALL PACKAGES ---
echo -e "${BLUE}[1/6] Updating packages...${NC}"
pkg update -y && pkg upgrade -y
pkg install git curl wget nano unzip -y
pkg install termux-api -y
pkg install cronie -y
pkg install rclone -y

# --- STEP 2: CLONE REPO & MAKE SCRIPTS EXECUTABLE ---
echo -e "${BLUE}[2/6] Cloning repo and preparing scripts...${NC}"
git clone https://github.com/master-pd/Phone-Security-MAR-PD.git
cd Phone-Security-MAR-PD
chmod +x install.sh phone_backup.sh

# --- STEP 3: RUN INSTALLER ---
echo -e "${BLUE}[3/6] Running installer...${NC}"
bash install.sh

# --- STEP 4: RCLONE CONFIGURATION ---
echo -e "${BLUE}[4/6] Configuring rclone remote...${NC}"
echo -e "${YELLOW}Follow the prompts to setup your remote (example: gdrive).${NC}"
rclone config

# --- STEP 5: TEST BACKUP ---
echo -e "${BLUE}[5/6] Testing backup script...${NC}"
./phone_backup.sh

# --- STEP 6: OPTIONAL DAILY BACKUP VIA CRON ---
echo -e "${BLUE}[6/6] Setup daily backup with cron (optional)...${NC}"
echo -e "${YELLOW}You can add the following line in crontab:${NC}"
echo "0 2 * * * /data/data/com.termux/files/home/Phone-Security-MAR-PD/phone_backup.sh"
crontab -e
crond

# --- TOOL INFORMATION ---
echo -e "${GREEN}"
echo "====================================="
echo "          TOOL INFORMATION           "
echo "====================================="
echo -e "${NC}"
echo "CREATOR: MASTER"
echo "NAME: RANA"
echo "CONTACT: https://t.me/+x8ecchGxWF03NGFl"
echo "YOUTUBE: https://youtube.com/@rana_editz_00?si=Dmbr8hgYortVoL5b"
echo "TIKTOK: https://www.tiktok.com/@free_bussnes?_t=ZS-8zmh3gXsebS&_r=1"
echo "FACEBOOK: https://www.facebook.com/share/1Fz3VCw5AP/"
echo "TOOL NAME: PHONE SECURITY TOOL - MAR PD"
echo "EMAIL: mdranasheikhe2005@gmail.com"
echo "TELEGRAM CHANNEL: https://t.me/master_account_remover_channel"
echo "TUTORIAL: …"
echo "USE: TERMUX"
echo "AGE: 20+"
echo "SKILL: SCRIPT CREATOR"
echo "WORK: SECURITY"
echo -e "${GREEN}=====================================${NC}"

echo -e "${YELLOW}Setup complete! You can now use the tool safely on your device.${NC}"
