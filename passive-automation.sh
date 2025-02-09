#!/bin/bash
#🛠️ Passive Automation Script 🛠️
# 
#This script automates passive reconnaissance, reducing 
# hours of work to just 10-15 minutes. It helps gather 
# essential and valuable information about the target while 
# ensuring legality by using only passive methods.
#
# Development Time: 14-16 hours
# First Bash Project by: M. Izaz Haider
#
# Special Thanks: 
# - To my teachers for building my strong programming foundation.
# - To my parents and supporters for their encouragement.
# - Most importantly, Alhamdulillah for making this possible!
#
# InshaAllah, more projects coming soon!

echo -e "Starting the Passive Automation Tool....Developed by M.Izaz Haider" | pv -qL 15
echo -e "\n"

# ASCII Banner which i want to show at startup
echo -e "\e[31m" # Set text color to red
# Display the title "Passive Automation V.3.1" in a stylish ASCII font using FIGlet.
# The `-f slant` option applies the "slant" font style to make it look cooler.
figlet -f slant "Passive Automation V.3.1" | pv -qL 50
echo -e "\e[0m" # Reset text color
echo -e "\e[97m Information is power, but knowing how to gather it is intelligence. 🕵️‍♂️ " | pv -qL 18 #quote
# Author & Description
echo -e "\e[34m========================================\e[0m" # Prints a blue-colored separator line for better readability
echo -e " Author    : M. IZAZ HAIDER" # Prints author/developer name 
echo -e " Description: Automates passive reconnaissance efficiently" # Prints author/developer name 
echo -e " Importance : Automates reconnaissance for efficient information gathering" # Importance of script's work
echo -e " Github: github.com/mizazhaider-ceh" # Tells the developer's GitHub profile
echo -e "\e[34m========================================\e[0m\n" # Prints a blue-colored separator line for better readability

echo -e "\e[33m A hacker’s first step is not to break, but to understand. 🧠 \e[0m " | pv -qL 18 #quote
# Temporary file to store output
# Create a temporary file with a unique name
# The file will be stored in the default system temp directory (usually /tmp/)
temp_file=$(mktemp)

# Run the script and store output
{
  echo "Running project script..." | pv -qL 15
  echo "--------------------------"
#Colors i used
WHITE="\e[97m"
GREEN="\e[32m"
RED="\e[31m"
YELLOW="\e[33m"
BLUE="\e[34m"
MAGENTA="\e[35m"
CYAN="\e[36m"
NC="\e[0m"

#This Project Will check whether the Passive Information Gathering tools are installed or not

echo -e  "${WHITE}Testing availability of passive data collection tools...${NC}" | pv -qL 18

if ! command -v host &>/dev/null; then # Check if the 'host' command is available
  echo -e "${RED}> Host tool is not installed${NC}"
  else
  echo -e  ">${RED}✅host is.......................installed ${NC}" | pv -qL 28
fi

if ! command -v whatweb &>/dev/null; then # Check if the 'whatweb' command is available
  echo -e "${RED}> whatweb tool is not installed${NC}"
  else
  echo -e ">✅whatweb is....................installed" | pv -qL 28
fi

if ! command -v dnsrecon  &>/dev/null; then # Check if the 'dnsrecon' command is available
  echo -e "${RED}> dnsrecon tool is not installed${NC}"
    else
  echo -e ">${CYAN}✅dnsrecon is...................installed${NC}" | pv -qL 28
fi


if ! command -v dig  &>/dev/null; then # Check if the 'dig' command is available
  echo -e "${RED}> dig tool is not installed${NC}"
  else
  echo -e ">${YELLOW}✅dig is........................installed${NC}" | pv -qL 28
fi

if ! command -v nslookup &>/dev/null; then # Check if the 'nslookup' command is available
  echo -e "${RED}> nslookup tool is not installed${NC}"
  else
  echo -e ">${RED}✅nslookup is...................installed${NC}" | pv -qL 28
fi

if ! command -v whois &>/dev/null; then # Check if the 'whois' command is available
  echo -e "${RED}> whois tool is not installed${NC}"
  else
  echo -e ">✅whois is......................installed" | pv -qL 28
fi

if ! command -v theHarvester &>/dev/null; then # Check if the 'theHarvester' command is available
  echo -e "${RED}> theHarvester tool is not installed${NC}"
  else
  echo -e ">${CYAN}✅theHarvester is...............installed${NC}" | pv -qL 28
fi

if ! command -v wafw00f  &>/dev/null; then # Check if the 'wafw00f' command is available
  echo -e "${RED}> wafw00f tool is not installed${NC}"
  else
  echo -e ">${MAGENTA}✅wafw00f is....................installed${NC}" | pv -qL 28
fi

if ! command -v sublist3r  &>/dev/null; then # Check if the 'sublist3r' command is available
  echo -e "${RED}> sublist3r tool is not installed${NC}"
  else
  echo -e ">${YELLOW}✅sublist3r  is.................installed${NC}" | pv -qL 28
fi

if ! command -v amass  &>/dev/null; then # Check if the 'amass' command is available
  echo -e "${RED}> amass tool is not installed${NC}"
  else
  echo -e ">${RED}✅amass  is.....................installed${NC}" | pv -qL 28
fi
echo -e "\e[34m========================================\e[0m" # Prints a blue-colored separator line for better readability

echo -e "${Red}A hacker’s greatest weapon isn’t code, it’s patience. ⏳${NC}" | pv -qL 28

echo -e "${WHITE}That's All ....Now Lets Move on Next....${NC}" | pv -qL 28

echo "Please enter the target website address (e.g., example.com, not http://example.com):"

# Prompting user for the target website
echo -e "${RED}Enter Your target Web Address below${NC}" | pv -qL 20
read target 

# Checking if the target is a valid domain using 'host' command
if host "$target" &>/dev/null; then
    echo -e "\e[33m Target is valid, proceeding next...\e[0m" | pv -qL 24
    
    # Checking if the target is online using 'ping'
    if ping -c 2 "$target" &>/dev/null; then
        echo -e "${WHITE}Target is up${NC}"  | pv -qL 18
        
        # Asking user if they want to gather passive information about the target
        echo -e "${CYAN}Do you want to gather passive information about the target${NC}: $target?" | pv -qL 15
        echo -e "${YELLOW}If yes, enter > Y or y. If no, enter > N or n${NC}:" | pv -qL 15
        read choice

        # If user chooses 'Y' or 'y', start passive reconnaissance
        if [[ "$choice" == "Y" || "$choice" == "y" ]]; then
            echo -e "${White}Remember that : Patience and persistence turn a good hacker into a great one💡${NC}" | pv -qL 24
            echo -e "${RED}Ok...Then wait with patience... Script will take time...${NC}" | pv -qL 20
            echo -e "\n-------------------------"
            
            # Running various passive reconnaissance tools one by one
            echo -e "🔍 Checking with Host..." | pv -qL 15
            host_result=$(host $target) # Perform a DNS lookup on the target and store the result in 'host_result'
            echo -e "${WHITE}✅ Host Result:\n${NC}$host_result" | pv -qL 85
            echo -e "\e[34m========================================\e[0m\n"

            echo -e "\n🔍 Checking with WhatWeb..." | pv -qL 15
            whatweb_result=$(whatweb $target) # Scan the target with WhatWeb to identify technologies and store the result
            echo -e "${RED}✅ WhatWeb Result:\n${NC}$whatweb_result" | pv -qL 85
            echo -e "\e[34m========================================\e[0m\n"

            echo -e "\n🔍 Checking with DNSRecon..." | pv -qL 15
            dnsrecon_result=$(dnsrecon -d $target) # Perform DNS reconnaissance using dnsrecon
            echo -e "${YELLOW}✅ DNSRecon Result:\n${NC}$dnsrecon_result" | pv -qL 85
            echo -e "\e[34m========================================\e[0m\n"

            echo -e "\n🔍 Checking with Dig..." | pv -qL 15
            dig_result=$(dig $target) # Query domain information using dig
            echo -e "${CYAN}✅ Dig Result:\n${NC}$dig_result" | pv -qL 85
            echo -e "\e[34m========================================\e[0m\n"

            echo -e "\n🔍 Checking with NSLookup..." | pv -qL 15
            nslookup_result=$(nslookup $target) # Perform DNS lookup using nslookup
            echo -e "${WHITE}✅ NSLookup Result:\n${NC}$nslookup_result" | pv -qL 85
            echo -e "\e[34m========================================\e[0m\n"

            echo -e "\n🔍 Checking with WHOIS..." | pv -qL 15
            whois_result=$(whois $target) # Retrieve WHOIS information for the target domain
            echo -e "${RED}✅ WHOIS Result:\n${NC}$whois_result" | pv -qL 85
            echo -e "\e[34m========================================\e[0m\n"

            echo -e "\n🔍 Checking with TheHarvester..." | pv -qL 15
            theHarvester_result=$(theHarvester -d $target) # Gather subdomains and emails using theHarvester
            echo -e "${BLUE}✅ TheHarvester Result:\n${NC}$theHarvester_result" | pv -qL 100
            echo -e "\e[34m========================================\e[0m\n"

            echo -e "\n🔍 Checking with WAFW00F..." | pv -qL 15
            wafw00f_result=$(wafw00f $target) # Detect the presence of a Web Application Firewall (WAF) using Wafw00f
            echo -e "${YELLOW}✅ WAFW00F Result:\n${NC}$wafw00f_result" | pv -qL 100
            echo -e "\e[34m========================================\e[0m\n"

            echo -e "🔹 Running amass on $target..." | pv -qL 15
            amass_result=$(amass enum -passive -d  $target) # Enumerate subdomains passively using Amass
            echo -e "${CYAN}✅ Amass Results:\n${NC}$amass_result" | pv -qL 85


            echo -e "\n-------------------------" 
        else
            echo -e "❌ Invalid choice. Exiting..." # Execute if condition failed / if choice is invalid
        fi
    else
        echo -e "❌ Target is down." # Execute if the target seems down / no packet received from target
    fi    
else
    echo -e "❌ Please enter a valid target." # Execute if entered target is wrong / wrong website address
fi
} | tee "$temp_file"

echo -e "\e[33m Information without storage is like a weapon without a wielder. ⚔️💿\e[0m" | pv -qL 16 #quote

#asking user wheter to save or not
echo -e "\e[97m Save it now, or regret it later. Your choice. (yes/no) ⏳🖥️ \e[0m" | pv -qL 15 
read choice

if [[ "$choice" == "yes" || "$choice" == "y" ]]; then
    echo -e "\n\e[33mChoose file format: markdown (md), text (txt), or log\e[0m" #Providing Three formats to store the result 
    read format
    echo -e "\e[97mPlease enter the name of file below (e.g result,report,etc) \e[0m"
    read name 
    if [[ "$format" == "md" ]]; then
        filename="$name.md"
    elif [[ "$format" == "txt" ]]; then
        filename="$name.txt"
    elif [[ "$format" == "log" ]]; then
        filename="$name.log"
    else 
        echo -e "Invalid choice so saving with .txt extension"
        filename="$name.txt"
    fi

  # Ask for directory path
  echo -e ">Enter the directory path where you want to save the file or by default it will be in /HOME/Document...if you want to save in default folder just hit enter" | pv -qL 13
  read dir_path
  
  # Set default path if user input is empty
  if [[ -z "$dir_path" ]]; then
    dir_path="$HOME/Documents"
  fi

  # Create the directory if it doesn't exist
  mkdir -p "$dir_path"

  # Move the temporary file to the chosen location
  mv "$temp_file" "$dir_path/$filename"

  echo -e "\e[32mOutput saved as $dir_path/$filename\e[0m" #file be saved to desired path
  echo -e "\e[31m Passive info collected, mission successful! Thanks for making this script feel useful. 😁" | pv -qL 12
else
    rm "$temp_file" #removes the temp file if the if condition failed
    echo "Output not saved ❌"
fi
