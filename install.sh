#!/bin/bash

function calc_terminal_width() {
  tput cols
}

function calc_terminal_height() {
  tput lines
}

function display_header() {
    echo -e "\e[1;34m*******************************\e[0m"
    echo -e "\e[1;34m*      Katoolin Installer     *\e[0m"
    echo -e "\e[1;34m*******************************\e[0m"
    echo ""
}

function sudo_check() {
  if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit
  fi
}

function package_manager() {
	echo "Checking your package manager..."
	if [ -x "$(command -v apt-get)" ]; then
		pm="apt"
	elif [ -x "$(command -v yum)" ]; then
		pm="yum"
	elif [ -x "$(command -v pacman)" ]; then
		pm="pacman"
	elif [ -x "$(command -v brew)" ]; then
		pm="brew"
	else
		echo "No package manager found."
		exit 1
	fi
	echo -e "Detected package manager: \e[32m$pm\e[0m"
	echo ""
	sleep 1
}