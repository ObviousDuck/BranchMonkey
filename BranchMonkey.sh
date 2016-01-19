#!/bin/bash

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
    --title "Utility" \
    --clear \
    --cancel-label "Exit" \
    --menu "Please select:" $HEIGHT $WIDTH 10 \
    "1" "Return to Parent Directory" \
    "2" "Return to Home Directory" \
    "3" "Print Directory" \
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
      dialog --title "Directory" \
    --no-collapse \
    --msgbox "$PWD" 0 0
      ;;
  esac
done
