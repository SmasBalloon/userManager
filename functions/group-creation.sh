creation_group() {
    name=$(whiptail --inputbox "Group Name :" 8 39  3>&1 1>&2 2>&3)

    if [ $name != "" ];
    then 
        sudo groupadd "$name"
    else
        whiptail --title "Information" --msgbox "Aucun nom de groupe saisi." 8 78
    fi
}

creation_group