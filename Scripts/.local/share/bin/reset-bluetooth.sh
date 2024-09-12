# 2. Enable and start the Bluetooth service
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service

# 3. Unblock Bluetooth using rfkill
rfkill list bluetooth
sudo rfkill unblock bluetooth

# 4. Load necessary Bluetooth kernel modules
sudo modprobe btusb

# 5. Restart the Bluetooth service
sudo systemctl restart bluetooth.service

# 6. Power on the Bluetooth adapter using bluetoothctl
bluetoothctl power on

# 7. Check for errors in system logs
journalctl -u bluetooth -e



