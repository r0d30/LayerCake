<<<<<<< Updated upstream
=======
<<<<<<< HEAD
# Makefile pour projet assembleur Linux
=======
>>>>>>> Stashed changes
# LayerCake Compiler Makefile
# Copyright (c) 2024-2025 Rodrigue Noel (r0d30)
# Licensed under MIT License with Enhanced Attribution
# 
# IMPORTANT: Commercial sale of LayerCake or renamed forks is PROHIBITED.
# See LICENSE file for full terms and restrictions.

<<<<<<< HEAD
<<<<<<< Updated upstream
=======
>>>>>>> 2f0128e49b2c8c2f721ea60c92cd6db9e3d670f9
# =============================================================================
# CONFIGURATION
# =============================================================================

<<<<<<< HEAD
=======
>>>>>>> f12161a (feat: LayerCake v1.0.1 - Complete license enforcement)
>>>>>>> Stashed changes
=======
>>>>>>> 2f0128e49b2c8c2f721ea60c92cd6db9e3d670f9
AS = nasm
ASFLAGS = -f elf64
LD = ld
CC = gcc

# =============================================================================
# VARIABLES CONFIGURABLES
# =============================================================================

# Nom du programme (sans extension)
PROG_NAME ?= LayerCake

# Répertoires
SRCDIR = src
BUILDDIR = build
OBJDIR = $(BUILDDIR)/obj

# Fichiers sources
SOURCES = $(filter-out $(SRCDIR)/main_win.asm,$(wildcard $(SRCDIR)/*.asm))

# Configuration
OBJECTS = $(patsubst $(SRCDIR)/%.asm,$(OBJDIR)/%.o,$(SOURCES))
TARGET = $(BUILDDIR)/$(PROG_NAME)

# =============================================================================
# CIBLES DE COMPILATION
# =============================================================================

.PHONY: build run debug

# Construction du programme
build: $(TARGET)

$(TARGET): $(OBJECTS)
	@mkdir -p $(BUILDDIR)
	@echo "-- Édition de liens --"
	$(CC) -no-pie -nostartfiles $(OBJECTS) -o $(TARGET)
	@echo "-- Programme créé: $(TARGET) --"

# Compiler les fichiers .asm en .o
$(OBJDIR)/%.o: $(SRCDIR)/%.asm
	@mkdir -p $(OBJDIR)
	@echo "Assemblage: $< -> $@"
	$(AS) $(ASFLAGS) $< -o $@

# Exécuter le programme
run: build
	@echo "-- Exécution de $(TARGET) --"
	$(TARGET)

# Déboguer avec GDB
debug: build
	@echo "-- Débogage de $(TARGET) avec GDB --"
	gdb $(TARGET)

# =============================================================================
# CIBLES GÉNÉRALES
# =============================================================================

.PHONY: all clean help dev test

# Cible par défaut
all: build

# Raccourci développement : compile et exécute
dev: build run

# Raccourci test rapide : nettoie, compile et exécute
test: clean build run

# Nettoyer le répertoire build
clean:
	rm -rf $(BUILDDIR)

# Afficher l'aide
help:
	@echo "=== LayerCake Compiler - Aide ==="
	@echo ""
	@echo "Cibles principales:"
	@echo "  dev          - Compile et exécute rapidement"
	@echo "  test         - Clean + compile + exécute"
	@echo "  build        - Compile le programme"
	@echo "  run          - Compile et exécute"
	@echo "  debug        - Compile et lance GDB"
	@echo "  clean        - Nettoie les fichiers de compilation"
	@echo ""
	@echo "Variables:"
	@echo "  PROG_NAME  - Nom du programme (défaut: LayerCake)"
	@echo ""
	@echo "Exemples d'utilisation:"
	@echo "  wsl make dev                          # Développement rapide"
	@echo "  wsl make test                         # Test complet"
	@echo "  wsl make build run                    # Compile puis exécute"
	@echo "  wsl make dev PROG_NAME=monprog        # Avec nom custom"
	@echo "  wsl make clean                        # Nettoie tout"
	@echo ""
	@echo "Fichiers générés:"
	@echo "  build/PROG_NAME - Exécutable Linux"
