#!/bin/bash
# 
# Author: VENCERT
#
# Description: 
# Separa en dos grupos 
#
# Syntax
# grupoAleatorio {personal Vencert}.txt


usuarios=$1
usuarios=${usuarios:?'no suministrado'}

total=`wc -l $usuarios | awk '{ print $1 }'`


if [ `expr $total % 2` ]; then
    divisor=`expr $total / 2`
else
    divisor=`expr $total % 2`
fi

a=1
b=1

function ra() {
    echo $(($RANDOM%2))
}

while read usuario; do

var=`ra`

if [ $var -eq 0 ] && [ $a -le $divisor ]; then
    echo $usuario - Grupo A 
    let "a=a+1"
elif [ $b -le $divisor ]; then
    echo $usuario - Grupo B
    let "b=b+1"
else
    echo $usuario - Grupo A
    let "a=a+1"
fi

done < $usuarios

