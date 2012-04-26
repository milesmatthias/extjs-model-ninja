#!/bin/sh

#########################################
# ExtJS_ModelUtility.sh			#
# by Miles Matthias			#
#					#
# Takes an ExtJS model definition	#
# and allows the user to ouput an 	#
# Ext.create() statement or a form	#	
# of UI controls for the given model. 	#
#					#
#########################################

# Handle invalid arguments
if [ $# -eq 0 -o $# -eq 2 -o $# -eq 4 -o $# -gt 5 ]
then
  printf "Usage: $0 [-u ui_filename] [-c create_filename] model_filename\n"
  exit
fi

# Handle a help argument
if [ $1 == "--help" -o $1 == "-h" ]
then
  printf "Usage: $0 [-u ui_filename] [-c create_filename] model_filename\n"
  exit
fi

# Figure out which argument is the model filename.
if [ $# -eq 1 ]; then
  modelFN=$1
elif [ $# -eq 3 ]; then
  modelFN=$3
elif [ $# -eq 5 ]; then
  modelFN=$5
fi  

# See if the given model filename exists and has something in it.
if [ -s $modelFN ]
then
  printf "\n"
else
  printf "$1 either doesn\'t exist or doesn\'t have any models in it.\n"
  exit
fi

properties=`cat $modelFN | grep name | awk -F' ' '{print $2}' | awk -F',' '{print $1}' | tr -d \'`
for i in $properties
do
  echo $i
done

echo

types=`cat $modelFN | grep name | awk -F' ' '{print $4}' | awk -F',' '{print $1}' | tr -d \'}`
for j in $types
do
  echo $j
done

