#!/bin/bash

#Devon Schweizer
#Homework Assignment 1
#Operating Systems CompSci - 386

#This project reads from a properties file, and opens the applications
#listed in that file.

# open the properties.txt so the user can modify what programs the want to
#start
modifyProperties(){
	nano properties.txt #open properties.txt and allow modification in the terminal
	displayMenu
}
#Open programs that are in the file
openApplications(){
	while IFS='' read -r line; do
		echo "Launching $line"		
		exec $line & disown $line
		echo "Done Launching $line"
	done < "properties.txt"
}
#write the menu to terminal editProperties and openPrograms
displayMenu(){
	echo "Welcome to simple start"
	echo "1.) Open Applications"
	echo "2.) Modify"
	echo "(1 or 2):"
	read choice

	if [ $choice = "1" ];then
		openApplications
	elif [ $choice = "2" ]; then
		modifyProperties
	else
		echo "Please enter 1 or 2"
		displayMenu
	fi
}

displayMenu
echo "Done launching all applications"

