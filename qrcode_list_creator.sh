#!/bin/bash

current_counter=$1
num_to_produce=$2

file=qrcode_list_$1_$2
output_file='./'$file'.txt'

rm -f $output_file

touch $output_file

array=( 0 1 2 3 4 5 6 7 8 9 A B C D E F G H I J K L M N O P Q R S T U V W X Y Z a b c d e f g h i j k l m n o p q r s t u v w x y z )
len=${#array[@]}

serial=( C 0 0 0 0 0 0 0 0 )
serial_len=${#serial[@]}

counter_to_serial(){
    counter=$1

    quotient=$(( $counter/$len ))
    remainder=$(( $counter%$len ))

    j=$serial_len-1

    serial[j]=${array[$remainder]}

    while [ $quotient -ne 0 ]
    do
        #echo $quotient
        #echo $remainder

        j=$(( j-1 ))
        counter=$quotient

        quotient=$(( $counter/$len ))
        remainder=$(( $counter%$len ))

        serial[j]=${array[$remainder]}
    done

    printf '%s' "${serial[@]}" >> $output_file
    printf '\n' >> $output_file
}

BEGIN=$(( $current_counter+1 ))
END=$(( $current_counter+$num_to_produce ))

#echo "len=$len"
#echo "serial len=$serial_len"

for ((i=$BEGIN; i<=$END; i++))
do
    counter_to_serial $i
done
