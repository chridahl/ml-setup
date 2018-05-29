#!/bin/bash

programs=(python pip python3 pip3 jupyter)
python_packages=(scipy math numpy pandas sklearn matplotlib tensorflow keras lightgbm xgboost torch torchvision)
has_python2=false
has_python3=false
python_program="python"
has_pip2=false
has_pip3=false

printf "\n🕵️   Checking for installed programs...\n\n"
for program in "${programs[@]}"
do
    #echo -n "Checking ${program}..."
    if command -v ${program} >/dev/null 2>&1; then
        echo "✔️   ${program}"
        if [ "$program" == "python" ]; then
            has_python2=true
        fi
        if [ "$program" == "python3" ]; then
            has_python3=true
        fi  
        if [ "$program" == "pip" ]; then
            has_pip2=true
        fi
        if [ "$program" == "pip3" ]; then
            has_pip3=true
        fi        
    else 
        echo "⚠️   ${program} not found."
    fi
done

if [ "$has_python3" == true ]; then
    python_program="python3"
fi    

printf "\n🕵️   Checking for installed python modules...\n\n"
for python_package in "${python_packages[@]}"
do
    #echo -n "Checking ${python_package}..."
    if "$python_program" -c "import ${python_package}" >/dev/null 2>&1; then
        echo "✔️   ${python_package}"
    else 
        echo "⚠️   ${python_package} not found."
    fi
done