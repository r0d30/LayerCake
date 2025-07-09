#!/usr/bin/env bash
<<<<<<< HEAD
# gen_link_order.sh - Generates object linking order based on assembly dependencies
=======
# gen_link_order.sh - Génère l'ordre de liaison des objets selon dépendances d'assembleur
>>>>>>> 3f3b36a (Add initial project structure with Makefile, scripts, and configuration files)
# Usage: bash gen_link_order.sh <srcdir> <builddir> <objdir>

srcdir=$1
builddir=$2
objdir=$3

tmp=$(mktemp)

<<<<<<< HEAD
# Map defined symbols -> file
=======
# Mapper symboles définis -> fichier
>>>>>>> 3f3b36a (Add initial project structure with Makefile, scripts, and configuration files)
declare -A def
for f in "$srcdir"/*.asm; do
  base=$(basename "$f" .asm)
  grep -P '^\s*global\s+' "$f" | sed -E 's/^\s*global\s+//' | while read sym; do
    def[$sym]=$base
  done
done

<<<<<<< HEAD
# Generate pairs for tsort
for f in "$srcdir"/*.asm; do
  base=$(basename "$f" .asm)
  # analyze calls
=======
# Générer paires pour tsort
for f in "$srcdir"/*.asm; do
  base=$(basename "$f" .asm)
  # analyser les appels
>>>>>>> 3f3b36a (Add initial project structure with Makefile, scripts, and configuration files)
  grep -oP 'call\s+\K\w+' "$f" | while read sym; do
    dep=${def[$sym]}
    if [[ -n "$dep" ]]; then
      echo "$base $dep" >> "$tmp"
    fi
  done
done

<<<<<<< HEAD
# ensure all modules are listed
=======
# assurer que tous les modules sont listés
>>>>>>> 3f3b36a (Add initial project structure with Makefile, scripts, and configuration files)
for f in "$srcdir"/*.asm; do
  echo "$(basename "$f" .asm)" >> "$tmp"
done

# topological sort
order=$(tsort "$tmp")
rm -f "$tmp"

<<<<<<< HEAD
# print object list with path
=======
# imprimer la liste d'objets avec chemin
>>>>>>> 3f3b36a (Add initial project structure with Makefile, scripts, and configuration files)
while read mod; do
  echo "$objdir/$mod.o"
done <<< "$order"
