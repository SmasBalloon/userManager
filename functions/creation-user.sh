creation-user() {
    username=$(whiptail --inputbox "Name :" 8 39  3>&1 1>&2 2>&3)


    if [ $username != "" ];
    then 
        password=$(whiptail --passwordbox "Password :" 8 39  3>&1 1>&2 2>&3)

        mapfile -t val < <(awk -F: '($3 >= 1000 && $3 < 65000) || $3 == 27 {print $1}' /etc/group)

        groups=()
        for group in "${val[@]}"; do
            groups+=("$group" "" OFF)
        done 
        
        groupUser=$(whiptail --title "Group" --checklist "Choose a group :" 20 78 10 \
                "${groups[@]}" 3>&1 1>&2 2>&3)

        sudo useradd "$username"  -m --password "$(openssl passwd -1 "$password")" --groups "$(echo '"sudo" "docker"' | tr -d '"' | sed 's/ /,/g')"    
    
    else
        whiptail --title "Information" --msgbox "Aucun nom d'utilisateur saisi." 8 78
    fi
}

creation-user