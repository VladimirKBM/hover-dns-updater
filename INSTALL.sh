#!/bin/sh

# Make sure the service is stopped
sudo service hover-dns-updater stop

sudo mkdir /etc/hover-dns-updater
sudo cp -f ./hover-dns-updater.py /etc/hover-dns-updater
sudo cp -f ./hover-dns-updater.service /etc/systemd/system/hover-dns-updater.service

# Run it in test mode to create the config json if it doesn't already exist
sudo python3 /etc/hover-dns-updater/hover-dns-updater.py --config /etc/hover-dns-updater/hover-dns-updater.json --test

sudo chown root:root /etc/hover-dns-updater/*
sudo chown root:root /etc/systemd/system/hover-dns-updater.service

# Install service into systemd
sudo systemctl daemon-reload
sudo systemctl enable hover-dns-updater


