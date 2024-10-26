#!/bin/bash -e

# Get service name from the user
read -p "Enter the server name whose status you want to check: " server_name
echo "The server name you entered is: $server_name"
# Check the system if the service exists
if systemctl list-units --type=service --all | grep -q "$server_name"; then
    # Get the status of the service
    service_status=$(sudo systemctl status $server_name | awk 'NR==3 { print $2 }')
    if [ "$service_status" == "active" ]; then
        echo -e "The current status of $server_name server is: \e[1;32m$service_status\e[0m"
    else
        echo -e "The current status of $server_name server is: \e[1;31m$service_status\e[0m"
    fi
else
    echo -e "The service \e[1;35m$server_name\e[0m does not exist on the system. Please install the service and try again."
fi
