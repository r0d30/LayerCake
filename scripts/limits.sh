#!/bin/bash

<<<<<<< HEAD
# limits.sh - Script to define resource limits

# Colors
=======
# limits.sh - Script pour définir les limites de ressources

# Couleurs
>>>>>>> 3f3b36a (Add initial project structure with Makefile, scripts, and configuration files)
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

<<<<<<< HEAD
echo -e "${GREEN}Configuring security limits${NC}"

# Define limits
set_limits() {
    echo "Setting resource limits..."
    
    # Virtual memory: 10MB
    ulimit -v 10240
    echo "✓ Virtual memory limited to 10MB"
    
    # Number of processes: 10
    ulimit -u 10
    echo "✓ Number of processes limited to 10"
    
    # CPU time: 5 seconds
    ulimit -t 5
    echo "✓ CPU time limited to 5 seconds"
    
    # File size: 1MB
    #ulimit -f 1024
    #echo "✓ File size limited to 1MB"
    
    # Stack size: 1MB
    ulimit -s 1024
    echo "✓ Stack size limited to 1MB"
    
    # Number of open files: 10
    ulimit -n 10
    echo "✓ Number of open files limited to 10"
}

# Display current limits
show_limits() {
    echo -e "\n${YELLOW}Current limits:${NC}"
    echo "Virtual memory: $(ulimit -v) KB"
    echo "Processes: $(ulimit -u)"
    echo "CPU time: $(ulimit -t) seconds"
    echo "File size: $(ulimit -f) blocks"
    echo "Stack size: $(ulimit -s) KB"
    echo "Open files: $(ulimit -n)"
}

# Test a program with limits
test_with_limits() {
    local program=$1
    echo -e "\n${GREEN}Testing $program with limits${NC}"
    
    # Execute with timeout and monitoring
=======
echo -e "${GREEN}Configuration des limites de sécurité${NC}"

# Définir les limites
set_limits() {
    echo "Définition des limites de ressources..."
    
    # Mémoire virtuelle : 10MB
    ulimit -v 10240
    echo "✓ Mémoire virtuelle limitée à 10MB"
    
    # Nombre de processus : 10
    ulimit -u 10
    echo "✓ Nombre de processus limité à 10"
    
    # Temps CPU : 5 secondes
    ulimit -t 5
    echo "✓ Temps CPU limité à 5 secondes"
    
    # Taille des fichiers : 1MB
    #ulimit -f 1024
    #echo "✓ Taille des fichiers limitée à 1MB"
    
    # Taille de la pile : 1MB
    ulimit -s 1024
    echo "✓ Taille de la pile limitée à 1MB"
    
    # Nombre de fichiers ouverts : 10
    ulimit -n 10
    echo "✓ Nombre de fichiers ouverts limité à 10"
}

# Afficher les limites actuelles
show_limits() {
    echo -e "\n${YELLOW}Limites actuelles :${NC}"
    echo "Mémoire virtuelle : $(ulimit -v) KB"
    echo "Processus : $(ulimit -u)"
    echo "Temps CPU : $(ulimit -t) secondes"
    echo "Taille fichiers : $(ulimit -f) blocs"
    echo "Taille pile : $(ulimit -s) KB"
    echo "Fichiers ouverts : $(ulimit -n)"
}

# Tester un programme avec limites
test_with_limits() {
    local program=$1
    echo -e "\n${GREEN}Test de $program avec limites${NC}"
    
    # Exécuter avec timeout et monitoring
>>>>>>> 3f3b36a (Add initial project structure with Makefile, scripts, and configuration files)
    timeout 10s /usr/bin/time -v $program 2>&1 | {
        while read line; do
            case $line in
                *"Maximum resident set size"*)
<<<<<<< HEAD
                    echo "Max RAM used: $line"
                    ;;
                *"User time"*)
                    echo "User time: $line"
                    ;;
                *"System time"*)
                    echo "System time: $line"
                    ;;
                *"Percent of CPU"*)
                    echo "CPU usage: $line"
=======
                    echo "RAM max utilisée : $line"
                    ;;
                *"User time"*)
                    echo "Temps utilisateur : $line"
                    ;;
                *"System time"*)
                    echo "Temps système : $line"
                    ;;
                *"Percent of CPU"*)
                    echo "Utilisation CPU : $line"
>>>>>>> 3f3b36a (Add initial project structure with Makefile, scripts, and configuration files)
                    ;;
            esac
        done
    }
}

<<<<<<< HEAD
# Main script
=======
# Script principal
>>>>>>> 3f3b36a (Add initial project structure with Makefile, scripts, and configuration files)
case $1 in
    "set")
        set_limits
        show_limits
        ;;
    "show")
        show_limits
        ;;
    "test")
        if [ -z "$2" ]; then
<<<<<<< HEAD
            echo "Usage: $0 test <program>"
=======
            echo "Usage: $0 test <programme>"
>>>>>>> 3f3b36a (Add initial project structure with Makefile, scripts, and configuration files)
            exit 1
        fi
        set_limits
        test_with_limits $2
        ;;
    *)
<<<<<<< HEAD
        echo "Usage: $0 {set|show|test <program>}"
        echo "  set   - Set limits"
        echo "  show  - Display limits"
        echo "  test  - Test a program with limits"
=======
        echo "Usage: $0 {set|show|test <programme>}"
        echo "  set   - Définir les limites"
        echo "  show  - Afficher les limites"
        echo "  test  - Tester un programme avec limites"
>>>>>>> 3f3b36a (Add initial project structure with Makefile, scripts, and configuration files)
        exit 1
        ;;
esac
