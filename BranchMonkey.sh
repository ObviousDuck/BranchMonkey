#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DIALOG_CANCEL=1
DIALOG_ESC=255
HEIGHT=20
WIDTH=50

display_result() {
  dialog --title "$1" \
    --no-collapse \
    --msgbox "$result" 0 0
}

while true; do
  exec 3>&1
  selection=$(dialog \
    --title $PWD \
    --clear \
    --cancel-label "Exit" \
    --menu "Please select:" $HEIGHT $WIDTH 10 \
    "1" "Return to Parent Directory" \
    "2" "Return to Home Directory" \
    "3" "Return to Starting Directory" \
    "4" "Choose Directory..." \
    2>&1 1>&3)
  exit_status=$?
  exec 3>&-
  case $exit_status in
    $DIALOG_CANCEL)
      clear
      echo "Program terminated."
      exit
      ;;
    $DIALOG_ESC)
      clear
      echo "Program aborted." >&2
      exit 1
      ;;
  esac
  case $selection in
    0 )
      clear
      echo "Program terminated."
      ;;
    1 )
      cd ..
      ;;
    2 )
      cd 
      ;;
    3 )
      cd $DIR
      ;;
    4 )
      DIALOG=${DIALOG=dialog}

FILE=`$DIALOG --stdout --title "Please choose a file" --fselect $PWD/ 14 48`

case $? in
	0)
		echo "\"$FILE\" chosen"
      		cd $FILE;;
	1)
		echo "Cancel pressed.";;
	255)
		echo "Box closed.";;
esac
      ;;
  esac
done
