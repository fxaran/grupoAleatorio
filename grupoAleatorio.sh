#!/bin/bash
# 
# Author: VENCERT
#
# Description: 
# Separa en dos grupos 
#
# Syntax
# grupoAleatorio {names}.txt
#
# file {names}:
# pedro
# pablo
# juan

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

while read usuario; do

var=`echo $(($RANDOM%2))`

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

