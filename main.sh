#!/bin/bash
main() {
    while true;
    do
        valeur=$(whiptail --title "Check list" --menu "Choose Options" 25 78 16 \
        "<-- Back" "Return to the main menu." \
        "Add User" "Add a user to the system." \
        "Add Group" "Add Groups"\
        "Delete User" "Detele User to the system" \
        "Delete Group" "Detele Group to the system" 3>&1 1>&2 2>&3)


        case "$valeur" in
            "<-- Back")
                exit 0
                ;;
            
            "Add User")
                source ./functions/creation-user.sh
                ;;
            "Add Group")
                source ./functions/group-creation.sh
                ;;
            "Delete User")
                source ./functions/delete-user.sh
                ;;
            "Delete Group")
                source ./functions/delete-group.sh
                ;;
            *)
                echo "choix impossible"
        esac

    done
}

main