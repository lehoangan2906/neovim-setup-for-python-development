# Neovim Setup for Python Development

## Introduction
This guide walks you through setting up Neovim for Python development, including LSP configuration, auto-completion, and additional settings like tab width and comment behavior.

---

## 1. Install Neovim and Dependencies
Ensure you have Neovim installed. If not, install it using:

```bash
brew install neovim     # macOS
sudo apt install neovim # Ubuntu/Debian
```

### Install Python Language Server
Neovim requires an LSP (Language Server Protocol) for Python. Install `pyright` using npm:

```bash
npm install -g pyright
```
Alternatively, install `python-lsp-server` using pip:
```bash
pip3 install python-lsp-server
```

---
