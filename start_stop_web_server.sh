#!/bin/bash
#read -p "Enter the name of the server you want to start/stop. apache2 or nginx: " server_name
#read -p "Enter the action you want to take upon the server. start or stop: " action

echo "Please enter the name of the server you want to start or stop"
select server in apache2 nginx; do
    case $server in apache2|nginx)
        server_name=$server
        break;;
        *) echo "Invalid option. Please pick a number that is listed in the menu and try again.";;
    esac
done

echo "Please enter the action you want to take upon the server"
select action in start stop; do
    case $action in start|stop)
        action=$action
        break;;
        *) echo "Invalid option. Please pick a number that is listed in the menu and try again.";;
    esac    
done

start_server() {
    if [ "$(get_server_status)" == "active" ]; then
       echo -e "The server \e[1;35m$server_name\e[0m is already running."
    else
       sudo systemctl start $server_name
       echo -e "The server \e[1;35m$server_name\e[0m has been started successfully."
    fi 
}

stop_server() {
    if [ "$(get_server_status)" == "inactive" ]; then
       echo -e "The server \e[1;35m$server_name\e[0m is already stopped."
    else
       sudo systemctl stop $server_name
       echo -e "The server \e[1;35m$server_name\e[0m has been stopped successfully."
    fi 
}

get_server_status() {
    if [ "$server_name" == "apache2" ] || [ "$server_name" == "nginx" ]; then
       sudo systemctl status $server_name | awk 'NR==3 { print $2 }'       
    else
       echo "The server name '$server_name', you entered is not valid. Please enter a valid server name: 'nginx' or 'apache2' and try again."
               
    fi
}

# validate the server name
if [ "$(get_server_status)" == "active" ] || [ "$(get_server_status)" == "inactive" ]; then
    get_server_status > /dev/null
else
    echo "$(get_server_status)"
    exit 1
fi

# Validate action input and call the appropriate function
if [ "$action" == "start" ] || [ "$action" == "stop" ]; then
    if [ "$action" == "start" ] ; then
        start_server
    elif [ "$action" == "stop" ] ; then
        stop_server
    fi
else
    echo "The action you entered is not valid. Please enter a valid action: 'start' or 'stop' and try again."
    exit 1
fi