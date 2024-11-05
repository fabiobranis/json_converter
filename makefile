# Makefile para compilar o projeto Rust para diferentes sistemas operacionais usando cross

# Nome do projeto
PROJECT_NAME = json_merger

# Diretório de destino
TARGET_DIR = target

# Targets suportados
LINUX_TARGET = x86_64-unknown-linux-gnu
WINDOWS_TARGET = x86_64-pc-windows-gnu

# Caminho para o executável compilado
LINUX_BINARY = $(TARGET_DIR)/$(LINUX_TARGET)/release/$(PROJECT_NAME)
WINDOWS_BINARY = $(TARGET_DIR)/$(WINDOWS_TARGET)/release/$(PROJECT_NAME).exe

# Variável para o cross (caso não esteja no PATH, altere o caminho)
CROSS = cross

.PHONY: all linux windows clean

all: linux windows

# Compila para Linux
linux:
	$(CROSS) build --target $(LINUX_TARGET) --release
	@echo "Binary for Linux available at $(LINUX_BINARY)"

# Compila para Windows
windows:
	$(CROSS) build --target $(WINDOWS_TARGET) --release
	@echo "Binary for Windows available at $(WINDOWS_BINARY)"

# Limpa os arquivos de build
clean:
	cargo clean
	@echo "Build files cleaned"

# Instalação do cross
install-cross:
	cargo install cross
	@echo "Cross installed successfully"
