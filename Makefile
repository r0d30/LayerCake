# LayerCake Compiler Makefile
# Copyright (c) 2024-2025 Rodrigue Noel (r0d30)
# Licensed under MIT License with Enhanced Attribution
# 
# IMPORTANT: Commercial sale of LayerCake or renamed forks is PROHIBITED.
# See LICENSE file for full terms and restrictions.

# =============================================================================
# CONFIGURATION
# =============================================================================

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
SOURCES = $(filter-out $(SRCDIR)/main_win.asm $(SRCDIR)/COPYRIGHT_HEADER_TEMPLATE.asm $(SRCDIR)/*_backup.asm,$(wildcard $(SRCDIR)/*.asm))

# Configuration
OBJECTS = $(patsubst $(SRCDIR)/%.asm,$(OBJDIR)/%.o,$(SOURCES))
TARGET = $(BUILDDIR)/$(PROG_NAME)

# =============================================================================
# CIBLES PRINCIPALES
# =============================================================================

.PHONY: all clean help dev test build_elf run

# Cible par défaut
all: $(TARGET).elf

# Aide
help:
	@echo ""
	@echo "LayerCake Compiler Build System"
	@echo "==============================="
	@echo ""
	@echo "Available targets:"
	@echo "  dev         - Compile and run in one step (default program)"
	@echo "  test        - Alias for dev"
	@echo "  build_elf   - Build only the ELF executable"
	@echo "  run         - Run the built executable"
	@echo "  clean       - Remove all build artifacts"
	@echo "  help        - Show this help message"
	@echo ""
	@echo "Environment variables:"
	@echo "  PROG_NAME   - Set program name (default: LayerCake)"
	@echo ""
	@echo "Examples:"
	@echo "  make dev PROG_NAME=hello_world"
	@echo "  make build_elf PROG_NAME=my_program"
	@echo "  make clean"
	@echo ""

# Construction du répertoire de build
$(BUILDDIR):
	@mkdir -p $(BUILDDIR)

# Construction du répertoire d'objets
$(OBJDIR): | $(BUILDDIR)
	@mkdir -p $(OBJDIR)

# Compilation des fichiers source
$(OBJDIR)/%.o: $(SRCDIR)/%.asm | $(OBJDIR)
	@echo "Assembling $< -> $@"
	$(AS) $(ASFLAGS) -o $@ $<

# Edition de liens pour créer l'exécutable ELF
$(TARGET).elf: $(OBJECTS) | $(BUILDDIR)
	@echo "Linking objects -> $@"
	$(LD) -o $@ $(OBJECTS)

# =============================================================================
# CIBLES D'USAGE
# =============================================================================

# Développement rapide : compile et exécute
dev: $(TARGET).elf
	@echo "Running $(TARGET).elf..."
	@$(TARGET).elf

# Test (alias pour dev)
test: dev

# Construction seulement
build_elf: $(TARGET).elf

# Exécution seulement (sans recompilation)
run:
	@if [ -f "$(TARGET).elf" ]; then \
		echo "Running $(TARGET).elf..."; \
		$(TARGET).elf; \
	else \
		echo "Error: $(TARGET).elf not found. Run 'make build_elf' first."; \
		exit 1; \
	fi

# =============================================================================
# NETTOYAGE
# =============================================================================

clean:
	@echo "Cleaning build artifacts..."
	@rm -rf $(BUILDDIR)
	@echo "Clean complete."

# =============================================================================
# DEPENDENCIES
# =============================================================================

# Toutes les sources dépendent du fichier de macros
$(OBJECTS): $(SRCDIR)/lc_syscalls.asm

# Gestion automatique des dépendances
-include $(OBJECTS:.o=.d)
