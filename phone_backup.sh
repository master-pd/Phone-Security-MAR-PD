#!/data/data/com.termux/files/usr/bin/bash
# phone_backup.sh - Phone Security Tool - MAR PD
# Backup Contacts, SMS, Calllog, Media to rclone remote

set -e

# --------------- CONFIG ----------------
REMOTE_NAME="gdrive"
REMOTE_PATH="PhoneBackups"
DEVICE_NAME="$(getprop ro.product.model 2>/dev/null || echo 'AndroidDevice')"
BACKUP_ROOT="$HOME/Phone-Security-MAR-PD"
TMP_DIR="$BACKUP_ROOT/tmp"
LOGFILE="$BACKUP_ROOT/backup.log"
KEEP_DAYS=30
# --------------------------------------

timestamp() { date +"%Y-%m-%d_%H-%M-%S"; }

mkdir -p "$TMP_DIR" "$BACKUP_ROOT"

echo "==============================================="
echo "  PHONE SECURITY TOOL - MAR PD"
echo "  BACKUP STARTED: $(timestamp)"
echo "==============================================="

# Export contacts
echo "[*] Exporting contacts..."
termux-contact-list > "$TMP_DIR/contacts_$(timestamp).json" 2>>"$LOGFILE" || echo "contacts export failed" >>"$LOGFILE"

# Export SMS
echo "[*] Exporting SMS..."
termux-sms-list > "$TMP_DIR/sms_$(timestamp).json" 2>>"$LOGFILE" || echo "sms export failed" >>"$LOGFILE"

# Export call log
echo "[*] Exporting call log..."
termux-call-log > "$TMP_DIR/calllog_$(timestamp).json" 2>>"$LOGFILE" || echo "calllog export failed" >>"$LOGFILE"

# List installed apps
echo "[*] Listing installed packages..."
pm list packages -f > "$TMP_DIR/packages_$(timestamp).txt" 2>>"$LOGFILE" || echo "package list failed" >>"$LOGFILE"

# Copy recent media (last 30 days)
echo "[*] Copying recent media..."
PHOTOS_SRC="/sdcard/DCIM /sdcard/Pictures /sdcard/Download"
DEST_MEDIA="$TMP_DIR/media"
mkdir -p "$DEST_MEDIA"

DAYS=30
for src in $PHOTOS_SRC; do
  if [ -d "$src" ]; then
    find "$src" -type f -mtime -$DAYS -print0 | \
    xargs -0 -I{} bash -c 'f="{}"; d="$1"; mkdir -p "$d/$(dirname "${f#*/}")"; cp -u "$f" "$d/${f#*/}"' _ "$DEST_MEDIA" 2>/dev/null || true
  fi
done

# Create archive
ARCHIVE="$BACKUP_ROOT/backup_${DEVICE_NAME}_$(timestamp).tar.gz"
echo "[*] Creating archive $ARCHIVE"
tar -czf "$ARCHIVE" -C "$TMP_DIR" . 2>>"$LOGFILE" || echo "tar failed" >>"$LOGFILE"

# Upload via rclone
REMOTE_TARGET="${REMOTE_NAME}:${REMOTE_PATH}/${DEVICE_NAME}"
echo "[*] Uploading to remote: $REMOTE_TARGET ..."
rclone copyto "$ARCHIVE" "${REMOTE_TARGET}/$(basename "$ARCHIVE")" --progress 2>>"$LOGFILE" || { echo "rclone upload failed"; exit 1; }

# Delete remote files older than KEEP_DAYS
if [ "$KEEP_DAYS" -gt 0 ]; then
  echo "[*] Deleting remote files older than $KEEP_DAYS days..."
  rclone delete "${REMOTE_TARGET}" --min-age "${KEEP_DAYS}d" 2>>"$LOGFILE" || true
fi

# Cleanup tmp
rm -rf "$TMP_DIR"/*

echo "==============================================="
echo "  BACKUP COMPLETED: $(timestamp)"
echo "==============================================="