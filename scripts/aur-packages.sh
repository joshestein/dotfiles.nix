#!/bin/bash

packages=(
    "tlp"
    "tlp-rdw"
    "slack-desktop"
)

for package in "${packages[@]}"; do
    echo "Installing $package"
    yay -S --noconfirm --needed "$package"
done
