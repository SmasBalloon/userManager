delete_user() {
    # 1. Récupération des utilisateurs
    val=( $(awk -F: '$3 >= 1000 && $3 < 65000 {print $1}' /etc/passwd) )

    users=()
    for user in "${val[@]}"; do
        users+=("$user" "" OFF)
    done 

    if [ ${#users[@]} -eq 0 ]; then 
        whiptail --title "Information" --msgbox "Aucun utilisateur détecté." 8 78
    else
        choix=$(whiptail --title "Sélection" --checklist "Choisissez un utilisateur :" 20 78 10 \
                        "${users[@]}" 3>&1 1>&2 2>&3)

        if [ -n "$choix" ]; then
            eval set -- "$choix"  
            
            for elem in "$@"; do
                if [ -n "$elem" ]; then
                    sudo deluser "$elem" --remove-home
                fi
            done
        fi
    fi
}

delete_user
