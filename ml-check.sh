#!/bin/bash

programs=(python python3 pip3 pytorch jupyter)
python_packages=(scipy math numpy pandas matplotlib keras lightgbm xgboost sklearn)

echo "Checking for installed programs..."
for program in "${programs[@]}"
do
    echo -n "Checking ${program}..."
    if command -v ${program} >/dev/null 2>&1; then
        echo "${program} found. 👌"
    else 
        echo "${program} not found. 🛑"
    fi
done

echo "Checking for installed python modules..."
for python_package in "${python_packages[@]}"
do
    echo -n "Checking ${python_package}..."
    if python -c "import ${python_package}" >/dev/null 2>&1; then
        echo "${python_package} found. 👌"
    else 
        echo "${python_package} not found. 🛑"
    fi
done