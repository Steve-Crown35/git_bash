#!/bin/bash

# 1. for loop
#for num in $(seq 1 5); do 
for num in {1..10}; do # we can also use curly braces to specify the list for the loop expression
    echo "The number is: $num"
done

# 2. while loop
count=1
while  [ $count -le 5 ]; do
     echo "Count is: $count"
     #count=$((count+1))
     count=`expr "$count + 1" |bc`
done

# 3. until loop
count=3
until [ $count -ge 100 ]; do 
    echo "count is : $count"
    (( count*=2 ))
done
echo "The loop stopped at: $count because this is the count value at which the loop condition was met"

# 4. Looping through files
for file in * ; do
    echo "The currently processed file is: $file"
done  

# 5. Nested Loops
for i in {1..5}; do
    for j in {a..c}; do
        echo "($i,$j)"
    done
done

# 6. break and continue

# break
for i in {1..10}; do
    if [ $i -eq 6 ]; then
        echo "Breaking the loop at: $i"
        break
    fi
    echo "the number is: $i"
done

# continue

for i in {1..10}; do
    if [[ $i -eq 3 || $i -eq 7 || $i -eq 9 ]]; then
        echo "Skipping the number: $i"
        continue
    fi
    echo "the number is: $i"
done

# 7. select loop
echo "Please select a fruit:"
select fruit in Apple Banana Orange Mango Grape Exit; do
    #echo "The selected fruit is: $fruit"
    echo $fruit
    break
done