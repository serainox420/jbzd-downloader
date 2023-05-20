#!/bin/bash

# Display the menu and get the user's choice
choice=$(dialog --menu "JBZD Downloader" 10 40 3 \
        1 "Glowna" \
        2 "Oczekujace" \
        3 "README.md" \
        2>&1 >/dev/tty)

# Execute the corresponding command based on the user's choice
case $choice in
    1)
        bash 1.sh
        # Replace the following line with your desired command
        ;;
    2)
        bash 2.sh
        # Replace the following line with your desired command
        ;;
    3)
        cat README.md
        # Replace the following line with your desired command
        ;;
    *)
        echo "Invalid choice"
        ;;
esac
