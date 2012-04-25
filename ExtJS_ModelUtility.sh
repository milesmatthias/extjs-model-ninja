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
if [ $1 -eq "--help" -o $1 -eq "-h" ]
then
  printf "Usage: $0 [-u ui_filename] [-c create_filename] model_filename\n"
  exit
fi


# Figure out which argument is the model filename.
if [ $# -eq 1 ]
then
  modelFN=$1
else if [ $# -eq 3 ]
then
  modelFN=$3
else if [ $# -eq 5 ]
then
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

