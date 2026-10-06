val=$(awk -F: '$3 >= 1000 && $3 < 65000 || $3 == 27 {print $1}' /etc/group)
echo "${val[@]}"


users=()

for user in "${val[@]}"; do
    users+=("$user")
done 


echo "${users[@]}"




