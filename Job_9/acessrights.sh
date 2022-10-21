#!/bin/bash
while IFS="," read -r id prenom nom mdp role
do
  mdpc=$(perl -e 'print crypt($ARGV[0], "salt")', $mdp)
  sudo useradd -m -p "$mdpc" "$prenom$nom" --uid "$id"
  if [[ "$role" =~ .*Admin.* ]]; then
    sudo adduser "$prenom$nom" sudo
    sudo adduser "$prenom$nom" adm
  else
    echo "$prenom$nom a le role user"
  fi
done < <(tail -n +2 Shell_Userlist.csv)
