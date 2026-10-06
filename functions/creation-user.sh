creation-user() {
    username=$(whiptail --inputbox "Name :" 8 39  3>&1 1>&2 2>&3)

    val=$(awk -F: '$3 >= 1000 && $3 < 65000 || $3 == 27 {print $1}' /etc/group)

    echo "$username"

    if [ $username != "" ];
    then 
        password=$(whiptail --passwordbox "Password :" 8 39  3>&1 1>&2 2>&3)

        sudo useradd $username --create-home -p "$password" --shell /bin/bash
    fi
}

creation-user