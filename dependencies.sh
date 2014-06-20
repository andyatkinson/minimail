declare -a dependencies=(mail uuencode)

for d in "${dependencies[@]}"
do

  which $d &> /dev/null
  retval=$?
  if [ $retval -eq 0 ]; then
    echo "good to go"
  else
    echo "Missing dependency: ${d}"
  fi

done
