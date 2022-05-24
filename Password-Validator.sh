#!/bin/bash


#global variables

RED='\033[0;31m'
GREEN='\033[0;32m'
ISDIGIT=0
ISUPPER=0
ISLOWER=0
PASSWORD=$@
LENGTH=${#PASSWORD}
MIN=10

echo 'checking password:' $PASSWORD


# requirements for the password


requirements(){ 

for (( i=0; i<${LENGTH}; i++)); do

    CHAR="${PASSWORD:$i:1}"

        if [[ $CHAR =~ [0-9] ]];then

            ISDIGIT=1

        elif [[ $CHAR =~ [A-Z] ]];then

            ISUPPER=1

        elif [[ $CHAR =~ [a-z] ]];then

            ISLOWER=1

        fi       
done


}

# check if the user meet the requirements


password_validation(){

requirements    

if [ "$LENGTH" -lt "$MIN" ];then

    echo -e "${RED}validation failed:minimun password length is 10!"
    
    return 1

elif [[ $ISDIGIT -eq 0 ]];then

     echo -e "${RED}validation failed:must contain numbers"
    
     return 1

elif [[ $ISUPPER -eq 0 ]];then

     echo -e "${RED}validation failed:must contain Upper Case"
    
     return 1

elif [[ $ISLOWER -eq 0 ]];then
    
     echo -e "${RED}validation failed:must contain Lower Case"
    
     return 1

else

    echo -e "${GREEN}validation succes! your password is" $PASSWORD
    
    return 0
fi


}


password_validation

echo "exit code" $?


