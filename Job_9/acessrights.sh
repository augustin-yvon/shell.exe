#!/bin/bash
while IFS="," read -r id prenom nom mdp role
do
  sudo useradd -m -p "$mdp" "$prenom$nom" --uid "$id"
  if [[ "$role" =~ .*Admin.* ]]; then
    sudo adduser "$prenom$nom" sudo
    sudo adduser "$prenom$nom" adm
  else
    echo "$prenom$nom a le role user"
  fi
done < <(tail -n +2 Shell_Userlist.csv)
