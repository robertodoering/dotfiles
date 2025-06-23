#!/bin/python

import subprocess

def get_bluetooth_devices():
    result = subprocess.run(['bluetoothctl', 'devices', 'Paired'], capture_output=True, text=True)
    lines = result.stdout.strip().split('\n')

    devices = []

    for line in [line for line in lines if line.startswith('Device ')]:
        parts = line.split(' ', 2)

        if len(parts) == 3:
            devices.append({
                'mac': parts[1],
                'name': parts[2],
                'display': '{} [{}]'.format(parts[2], parts[1])
            })

    return devices

def show_wofi_menu(devices):
    menu_input = '\n'.join(f"{d['display']}" for d in devices)
    result = subprocess.run(['wofi', '--dmenu'], input=menu_input, text=True, capture_output=True)
    selection = result.stdout.strip()

    for device in devices:
        if device['display'] == selection:
            return device

    return None

def connect_device(device):
    mac = device['mac']

    if mac:
        subprocess.run(['bluetoothctl', 'connect', mac])

if __name__ == '__main__':
    devices = get_bluetooth_devices()
    selected_device = show_wofi_menu(devices)

    if selected_device:
        connect_device(selected_device)
