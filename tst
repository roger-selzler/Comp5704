#!/bin/bash
clear

printf "\nInstalling tensorflow assuming there is a gpu installed...\n"
for arg in "$@"
do
        case $arg in
                -G)
                        tensorVal=GPU
                        ;;
                -C)
                        tensorVal=CPU
                        ;;
        esac
done

printf "\nValues of tensorVal is %s\n\n" ${tensorVal:="GPU"}

case $tensorVal in
	GPU)
		echo "value was GPU"
		;;
	CPU)	
		echo "value was CPU"
		;;
esac

#sudo pip install tensorflow-gpu

