#!/bin/sh
cmd1="sudo apt-get install build-essential cmake"
cmd2="sudo apt-get install python-dev python3-dev"
cmd3="sudo apt-get install nodejs*"
cmd4="sudo apt-get install npm"
cmd5="cd ~/.vim/bundle/YouCompleteMe && ./install.py --clang-completer --tern-completer"

echo "******This File Is Used For YouCompleteMe Installation******"
echo " 1. $cmd1"
echo " 2. $cmd2"
echo " 3. $cmd3"
echo " 4. $cmd4"
echo " 5. $cmd5"
echo " ***********************************************************"


index=0;
while [ $index -lt 6 ]
do
    #eval $cmd1
    let index+=1
    case $index in
        1)
            read -p "Step1 : $cmd1 (y/n)" flag
            if [ $flag = "y" ];
            then
                eval $cmd1
            else
                exit
            fi
            ;;
        2)
            read -p "Step2 : $cmd2 (y/n)" flag
            if [ $flag = "y" ];
            then
                eval $cmd2
            else
                exit
            fi
            ;;
        3)
            read -p "Step3 : $cmd3 (y/n)" flag
            if [ $flag = "y" ];
            then
                eval $cmd3
            else
                exit
            fi
            ;;
        4)
            read -p "Step4 : $cmd4 (y/n)" flag
            if [ $flag = "y" ];
            then
                eval $cmd4
            else
                exit
            fi
            ;;
        5)
            read -p "Step5 : $cmd5 (y/n)" flag
            if [ $flag = "y" ];
            then
                eval $cmd5
            else
                exit
            fi
            ;;
        6)
            echo "Congratulations to you (install well done) !!~";
            exit
            ;;
    esac
done

