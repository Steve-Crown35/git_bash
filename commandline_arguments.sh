#!/bin/bash
# Sum of numbers

#read -p "Enter the first number: " num1
#read -p "Enter the second number: " num2
#read -p "Enter the third number: " num3

# Use number of commandline arguments to control the running of the script
check_num_args=$#
if  [ $check_num_args -eq 3 ]; then
    num1=$1
    num2=$2
    num3=$3
    #if [ -z "$num1" ] || [ -z "$num2" ] || [ -z "$num3" ]; then
    #    echo "Please run the script with three numbers as command line arguments: ./commandline_arguments.sh num1 num2 num3, where num1, num2, and num3 are three numbers"
    #else
    # Note: expr command is used to perform arithmetic operations. However, using $(...) is preferred over
    # backticks (``) for command substitution as it's more readable and less error-prone. Therefore, 
    # we shall replace backticks with $(...)

    #result=`expr "$num1 + $num2 + $num3"|bc`
    #result=$(echo "$num1 + $num2 + $num3" | bc)

    result=$((num1 + num2 + num3))       
    echo "The sum of the three numbers is: $result"
else
    echo "Please run the script with three numbers as command line arguments: ./commandline_arguments.sh num1 num2 num3, where num1, num2, and num3 are three numbers"
fi