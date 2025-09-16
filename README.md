# PHONE SECURITY TOOL - MAR PD

**Purpose:** Backup your phone's Contacts, SMS, Calllog, and recent Media to rclone remote.

> ⚠️ Use ONLY on your OWN device.

## Files
- `phone_backup.sh` — main backup script
- `install.sh` — install prerequisites + banner
- `.gitignore` — ignores logs/cache/rclone secrets
- `rclone_config_SAMPLE.txt` — rclone setup guide

## INSTALLATION 

`- pkg update -y -
  -pkg upgrade -y -
  -pkg install git curl wget nano unzip -y -
  -pkg install termux-api -y -
  -pkg install cronie -y -
  -git clone https://github.com/master-pd/Phone-Security-MAR-PD.git -
  -cd Phone-Security-MAR-PD -
  -chmod +x install.sh phone_backup.sh -
  -bash install.sh -`

## SESSION 2 

`-pkg install rclone -y -
 -rclone config -
 -./phone_backup.sh - `

## DAYLY BACKUP 
`crontab -e
0 2 * * * /data/data/com.termux/files/home/Phone-Security-MAR-PD/phone_backup.sh
-crond -`

## INFORMESSION 
- •CREATOR 
- •NAME 
- •CONTACT
- •YOUTUBE
- •TIKTOK
- •FACEBOOK
- •TOOL NAME
- •EMAIL
- •TELEGRAM 
- •TUTORIAL
- •USESS
- •AGE
- •SKILL
- •WORK


## Quick Setup (Termux)
1. Install Termux & Termux:API from Play Store/F-Droid.
2. Clone repo:
```bash

