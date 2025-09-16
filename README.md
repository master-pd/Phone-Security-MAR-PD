# PHONE SECURITY TOOL - MAR PD

**Purpose:** Backup your phone's Contacts, SMS, Calllog, and recent Media to rclone remote.

> ⚠️ Use ONLY on your OWN device.

---

## **FULL SETUP & INFORMATION **

```bash

```
# ==============================
# PHONE SECURITY TOOL - MAR PD
# FULL SETUP + INFORMATION
# ==============================

# --- STEP 1: UPDATE & INSTALL PACKAGES ---

```|
pkg update -y && pkg upgrade -y
pkg install git python bash curl wget nano unzip -y
pkg install termux-api -y
pkg install rclone -y
pkg install cronie -y

```

# --- STEP 2: CLONE REPO & MAKE SCRIPTS EXECUTABLE ---
```
git clone https://github.com/master-pd/Phone-Security-MAR-PD.git
cd Phone-Security-MAR-PD
chmod +x install.sh phone_backup.sh
```

# --- STEP 3: RUN INSTALLER ---
```
bash install.sh
```

# --- STEP 4: RCLONE CONFIGURATION ---
```
rclone config
```
# Follow prompts to setup remote (example: gdrive)

# --- STEP 5: TEST BACKUP ---
```
./phone_backup.sh
```

# --- STEP 6: OPTIONAL DAILY BACKUP VIA CRON ---
```
crontab -e
```

# Add the following line inside crontab editor:
# 0 2 * * * /data/data/com.termux/files/home/Phone-Security-MAR-PD/phone_backup.sh
crond

# ==============================
# TOOL INFORMATION
# ==============================
# CREATOR: MASTER
# NAME: RANA
# CONTACT: https://t.me/+x8ecchGxWF03NGFl
# YOUTUBE: https://youtube.com/@rana_editz_00?si=Dmbr8hgYortVoL5b
# TIKTOK: https://www.tiktok.com/@free_bussnes?_t=ZS-8zmh3gXsebS&_r=1
# FACEBOOK: https://www.facebook.com/share/1Fz3VCw5AP/
# TOOL NAME: PHONE SECURITY TOOL - MAR PD
# EMAIL: mdranasheikhe2005@gmail.com
# TELEGRAM CHANNEL: https://t.me/master_account_remover_channel
# TUTORIAL: …
# USE: TERMUX
# AGE: 20+
# SKILL: SCRIPT CREATOR
# WORK: SECURITY
# ==============================


## Copy past setup 
``
pkg update -y && pkg upgrade -y
pkg install git python bash curl wget nano unzip -y
pkg install termux-api -y
pkg install rclone -y
pkg install cronie -y
git clone https://github.com/master-pd/Phone-Security-MAR-PD.git
cd Phone-Security-MAR-PD
chmod +x install.sh phone_backup.sh
bash install.sh
rclone config
./phone_backup.sh
crontab -e
0 2 * * * /data/data/com.termux/files/home/Phone-Security-MAR-PD/phone_backup.sh
crond
``
