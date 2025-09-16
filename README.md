# PHONE SECURITY TOOL - MAR PD

**Purpose:** Backup your phone's Contacts, SMS, Calllog, and recent Media to rclone remote.

> ⚠️ Use ONLY on your OWN device.

## Files
- `phone_backup.sh` — main backup script
- `install.sh` — install prerequisites + banner
- `.gitignore` — ignores logs/cache/rclone secrets
- `rclone_config_SAMPLE.txt` — rclone setup guide

## Quick Setup (Termux)
1. Install Termux & Termux:API from Play Store/F-Droid.
2. Clone repo:
```bash
git clone https://github.com/<your-username>/Phone-Security-MAR-PD.git
cd Phone-Security-MAR-PD