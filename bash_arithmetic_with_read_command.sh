#!/bin/bash
# Sum of numbers

read -p "Enter the first number: " num1
read -p "Enter the second number: " num2
read -p "Enter the third number: " num3

result=`expr "$num1 + $num2 + $num3"|bc`

echo "The sum of the three numbers is: $result"
