#!/bin/bash

# Function to start React apps in separate terminal tabs
start_react_app() {
    gnome-terminal --tab --title="Server Node" --working-directory="/home/sourav/Work/bid_and_shops/Server" -- npm run dev
    if [ "$1" = "start_admin_panel" ]; then
        gnome-terminal --tab --title="Admin Panel" --working-directory="/home/sourav/Work/bid_and_shops/admin_panel" -- npm run dev
    fi
}

# Ask the user if they want to start the Admin Panel
read -p "Do you want to start the Admin Panel? (y/n): " choice
case "$choice" in
  y|Y )
    start_react_app start_admin_panel
    ;;
  n|N )
    start_react_app
    ;;
  * )
    echo "Invalid option. Starting only Server Node."
    start_react_app
    ;;
esac
