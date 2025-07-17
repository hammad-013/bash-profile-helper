#!/bin/bash

#Author: Hammad Shabbir
#Purpose: .bashrc file customization
#Last Modification Date: 17-07-25

bashrc_file="$HOME/.bashrc"
add_alias(){
	input_alias="alias "$1"	#Added by profile-helper"
	cat "$bashrc_file" | grep "$input_alias" > /dev/null 2>&1
	alias_exists="$?"
	if [ "$alias_exists" = "0" ]; then
		echo "alias $1 already exists."
	else
		echo "Adding to .bashrc file"
		echo "$input_alias" >> "$bashrc_file"
		echo "Added: $input_alias"
	fi	
}
set_var(){
	input_var="export "$1"	#Added by profile-helper"
	cat "$bashrc_file" | grep "$input_var" > /dev/null 2>&1
	var_exists="$?"
	if [ "$var_exists" = "0" ]; then
		echo "variable $1 already exists."
	else
		echo "Adding to .bashrc file"
		echo "$input_var" >> "$bashrc_file"
		echo "Added: $input_var"
	fi
}
set_ps1(){
	echo "Include username? (y/n)"
	read username_choice
	input_ps1="empty"
	case "$username_choice" in
		y | Y)
			input_ps1="\u"
			;;
	esac
	echo "Include hostname? (y/n)"
	read hostname_choice
	case "$hostname_choice" in
		y | Y)
			input_ps1=$input_ps1" \h"
			;;
	esac
	echo "Include current directory? (y/n)"
	read dir_choice
	case "$dir_choice" in
		y | Y)
			input_ps1=$input_ps1" \w"
			;;
	esac
	echo "Include no. of commands used in current session? (y/n)"
	read cmd_choice
	case "$cmd_choice" in
		y | Y)
			input_ps1=$input_ps1" - \#"
				;;
	esac
	echo "Choose color? (red, green, yellow, blue)"
	read color_choice
	case "$color_choice" in
		red)
			input_ps1="\[\e[1;31m\]"$input_ps1"\[\e[0m\]"
			;;
		yellow)
			input_ps1="\[\e[1;33m\]"$input_ps1"\[\e[0m\]"
			;;
		blue)
			input_ps1="\[\e[1;34m\]"$input_ps1"\[\e[0m\]"
			;;
		green)
			input_ps1="\[\e[1;32m\]"$input_ps1"\[\e[0m\]"
			;;
	esac
	if [ "$input_ps1" = "empty" ]; then
		echo "No customization of ps1."
	else
		input_ps1="PS1=\""$input_ps1": \"	#Added by profile-helper"
		echo "$input_ps1"  >> "$bashrc_file"
	fi
	echo "Added your customizations."
}
backup(){
	mkdir "$HOME/profile-helper-backups"
	cp "$bashrc_file" "$HOME/profile-helper-backups/bashrc.backup"
	echo "created backup to $HOME/profile-helper-backups/bashrc.backup"
}
restore(){
	cat "$HOME/profile-helper-backups/bashrc.backup" > "$bashrc_file"
	echo "restored backup from $HOME/profile-helper-backups/bashrc.backup"
}
list(){
	list_customizations=$(cat "$HOME/.bashrc" | grep -i "added by profile-helper")
	echo "$list_customizations"
}
help(){
	echo "profile-helper - Bash Environment Customizer"
	echo
	echo "Usage:"
	echo "  ./profile-helper.sh [option]"
	echo
	echo "Options:"
	echo "  --add-alias \"name='command'\"   Add a custom alias"
	echo "  --set-var \"VAR=value\"          Set an environment variable"
	echo "  --set-ps1                        Customize your PS1 shell prompt"
	echo "  --backup                         Backup current .bashrc"
	echo "  --restore                        Restore .bashrc from backup"
	echo "  --list                           List all aliases and variables added"
	echo "  --help                           Show this help page"
	echo "  --version                        Show version info"
	echo ""
	echo 'Always run source ~/.bashrc after customizations.'
}
version(){
	echo "profile-helper version 1.0.0"
	echo -e "Developed by \e]8;;https://github.com/hammad-013/\agithub.com/hammad-013\e]8;;\a"
	echo "A simple CLI tool to manage your bash profile settings."

}
error() {
  echo "Error: Invalid option or missing argument."
  echo "Use './profile-helper.sh --help' to see available options."
}

	case $1 in
		--add-alias)
			case "$2" in
				"")
					error
					;;
				*=*)
					add_alias "$2"
					;;
				*)
					error
					;;
			esac
			;;
		--set-var)
			case "$2" in
				"")
					error
					;;
				*=*)
					set_var "$2"
					;;
				*)
					error
					;;
			esac
			;;
		--set-ps1)
			case "$2" in
				"")
					set_ps1
					;;
				*)
					error
					;;
			esac
			;;
		--backup)
			case "$2" in
				"")
					backup
					;;
				*)
					error
					;;
			esac
			;;
		--restore)
			case "$2" in
				"")
					restore
					;;
				*)
					error
					;;
			esac
			;;
		--list)
			case "$2" in
				"")
					list
					;;
				*)
					error
					;;
			esac
			;;
		--help)
			case "$2" in
				"")
					help
					;;
				*)
					error
					;;
			esac
			;;
		--version)
			case "$2" in
				"")
					version
					;;
				*)
					error
					;;
			esac
			;;
		*)
			error

	esac
