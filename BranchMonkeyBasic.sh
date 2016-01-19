#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

menu() {
clear
echo "Current directory: " $PWD
echo " ==== PLEASE CHOOSE ONE OF THE FOLLOWING OPTIONS ==== " 
echo -e	 "	1 Traverse current Directory \n
	2 Return to Parent Directory \n
	3 Return to Home Directory \n
	4 Return to Starting Directory \n
	5 Choose directory \n
	6 Exit \n" 

	while true; do
read -p "Please enter your choice: " input
case $input in
	[1]* ) trav
	       ;;
	[2]* ) parent
	       ;;
	[3]* ) home
	       ;;
	[4]* ) start
	       ;;
	[5]* ) change
	       ;;
	[6]* ) exit
	       ;;

	* ) echo "Invalid option, please try again.";;
   esac
done
}

trav(){
	$DIR/trav.sh > $DIR/trav.txt
	COUNT=$(gawk '{ sum += $3 }; END { print sum }' $DIR/trav.txt)
	echo "total| " $COUNT >> $DIR/trav.txt
	clear
    cat $DIR/trav.txt
    echo "Current directory is now:" $PWD
}

parent(){
cd ..
echo "Current directory is now:" $PWD
}

home(){
cd
echo "Current directory is now:" $PWD
}

start(){
cd $DIR
echo "Current directory is now:" $PWD
}

change(){
echo "Please select a directory."
select d in */; do test -n "$test" && break; echo "Invalid input. Please try again."; done
cd "$test" && pwd
echo "Current directory is now:" $PWD
}

chmod +rx dialogshell.sh
chmod +rx trav.sh

# If Dialog is not found on system, run this version (basicshell.sh) otherwise, run dialogshell.sh.
command -v dialog >/dev/null 2>&1 || { menu; }
sh dialogshell.sh
