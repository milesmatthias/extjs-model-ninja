#!/bin/sh

#########################################
# model-ninja.sh			#
# by Miles Matthias			#
#					#
# Takes an ExtJS model definition	#
# and allows the user to ouput an 	#
# Ext.create() statement or a form	#	
# of UI controls for the given model. 	#
#					#
#########################################

handleFlag(){
  flag=$1
  outFile=$2
  modelname=$3
  props=$4
  types=$5

  if [ $flag == "-c" ]; then
    echo "Ext.create('$modelname', {" >> $outFile
    
    for k in $props; do
      echo "\t$k: values.$k," >> $outFile
    done

    echo "});" >> $outFile
  fi

  if [ $flag == "-u" ]; then
    echo "{" >> $outFile
    for i in $props; do
      echo "\txtype: 'textfield'," \
           "\n\tfieldLabel: '$i'," \
           "\n\tname: '$i'" \
           "\n},{" >> $outFile
    done
    echo "}" >> $outFile
  fi

  exit
}

# Handle invalid arguments
if [ $# -eq 0 -o $# -eq 2 -o $# -eq 4 -o $# -gt 5 ]
then
  printf "Usage: model-ninja [-u ui_filename] [-c create_filename] model_filename\n"
  exit
fi

# Handle a help argument
if [ $1 == "--help" -o $1 == "-h" ]
then
  printf "Usage: $0 [-u ui_filename] [-c create_filename] model_filename\n"
  exit
fi

# Parse arguments
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
  printf ""
else
  printf "$1 either doesn\'t exist or doesn\'t have any models in it.\n"
  exit
fi

modelname=`cat $modelFN | grep define | awk -F"'" '{print$2}'`
properties=`cat $modelFN | grep name | awk -F' ' '{print $2}' | awk -F',' '{print $1}' | tr -d \'`
types=`cat $modelFN | grep name | awk -F' ' '{print $4}' | awk -F',' '{print $1}' | tr -d \'}`

if [ $# -eq 3 ]; then
  handleFlag $1 $2 $modelname "$properties" "$types"
elif [ $# -eq 5 ]; then
  handleFlag $1 $2 $modelname "$properties" "$types"
  handleFlag $3 $4 $modelname "$properties" "$types"
fi

exit

