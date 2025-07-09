# LayerCake Compiler Makefile
# Copyright (c) 2024-2025 Rodrigue Noel (r0d30)
# Licensed under MIT License with Enhanced Attribution
# 
# IMPORTANT: Commercial sale of LayerCake or renamed forks is PROHIBITED.
# See LICENSE file for full terms and restrictions.

AS = nasm
ASFLAGS = -f elf64
LD = ld
CC = gcc

# =============================================================================
# VARIABLES CONFIGURABLES
# =============================================================================

# Nom du programme (sans extension)
PROG_NAME ?= default_name

# Répertoires
SRCDIR = src
BUILDDIR = build
OBJDIR = $(BUILDDIR)/obj

# Fichiers
SOURCES = $(wildcard $(SRCDIR)/*.asm)
OBJECTS = $(patsubst $(SRCDIR)/%.asm,$(OBJDIR)/%.o,$(SOURCES))
TARGET = $(BUILDDIR)/$(PROG_NAME).elf

# =============================================================================
# CIBLES PRINCIPALES
# =============================================================================

.PHONY: all build run run_debug clean help

all: build

# Nettoyer le répertoire build
clean:
	rm -rf $(BUILDDIR)

# Construction de l'ELF
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

# Exécuter avec GDB pour le débogage
run_debug: build
	@echo "-- Débogage de $(TARGET) avec GDB --"
	gdb $(TARGET)

# Afficher l'aide
help:
	@echo "Cibles disponibles:"
	@echo "  build      - Compile le programme"
	@echo "  run        - Compile et exécute le programme"
	@echo "  run_debug  - Compile et lance le programme avec GDB"
	@echo "  clean      - Nettoie les fichiers de compilation"
	@echo "  help       - Affiche cette aide"
	@echo ""
	@echo "Variables:"
	@echo "  PROG_NAME  - Nom du programme (défaut: default_name)"
	@echo ""
	@echo "Exemples:"
	@echo "  make run PROG_NAME=monprog"
	@echo "  make build"
	@echo "  make clean"
