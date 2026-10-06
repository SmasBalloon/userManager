#!/bin/bash
main() {
    while true;
    do
        valeur=$(whiptail --title "Check list" --menu "Choose Options" 25 78 16 \
        "<-- Back" "Return to the main menu." \
        "Add User" "Add a user to the system." \
        "Add Group" "Add Groups"\
        "Delete User" "Detele User to the system" 3>&1 1>&2 2>&3)



        case "$valeur" in
            "<-- Back")
                exit 0
                ;;
            
            "Add User")
                source ./functions/creation-user.sh
                ;;
            "Delete User")
                source ./functions/delete-user.sh
                ;;
            *)
                echo "choix impossible"
        esac

    done
}

main