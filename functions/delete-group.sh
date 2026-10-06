delete_group() {
    # 1. Récupération des groupes
    val=( $(awk -F: '$3 >= 1000 && $3 < 65000 {print $1}' /etc/group) )

    groups=()
    for group in "${val[@]}"; do
        groups+=("$group" "" OFF)
    done 

    if [ ${#groups[@]} -eq 0 ]; then 
        whiptail --title "Information" --msgbox "Aucun groupe détecté." 8 78
    else
        choix=$(whiptail --title "Sélection" --checklist "Choisissez un groupe :" 20 78 10 \
                        "${groups[@]}" 3>&1 1>&2 2>&3)

        if [ -n "$choix" ]; then
            eval set -- "$choix"

            for elem in "$@"; do
                if [ -n "$elem" ]; then
                    sudo delgroup "$elem"
                fi
            done
        fi
    fi
}
delete_group
