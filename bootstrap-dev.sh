#!/usr/bin/env bash
set -euo pipefail

echo "[*] Updating apt and installing base packages..."
sudo apt update
sudo apt install -y \
  curl git unzip build-essential \
  tmux zsh \
  ca-certificates \
  python3 python3-venv python3-pip \
  ripgrep fd-find

# --------------------------------------------------------------------
# Ensure ~/.local/bin exists and is on PATH
# --------------------------------------------------------------------
mkdir -p "$HOME/.local/bin"

for rc in "$HOME/.bashrc" "$HOME/.zshrc"; do
  if [ -f "$rc" ]; then
    if ! grep -qx 'export PATH="$HOME/.local/bin:$PATH"' "$rc"; then
      echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$rc"
    fi
  else
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$rc"
  fi
done

# fd-find → fd symlink (Ubuntu calls it fdfind)
if command -v fdfind >/dev/null 2>&1; then
  if [ ! -x "$HOME/.local/bin/fd" ]; then
    ln -s "$(command -v fdfind)" "$HOME/.local/bin/fd"
  fi
fi

# --------------------------------------------------------------------
# Neovim nightly via AppImage -> ~/.local/bin/nvim
# --------------------------------------------------------------------
echo "[*] Installing Neovim nightly (AppImage)..."

curl -fsSL -o /tmp/nvim.appimage \
https://github.com/neovim/neovim/releases/download/v0.11.5/nvim-linux-x86_64.appimage

chmod u+x /tmp/nvim.appimage
mv /tmp/nvim.appimage "$HOME/.local/bin/nvim"

# --------------------------------------------------------------------
# oh-my-zsh (unattended) + default shell
# --------------------------------------------------------------------
echo "[*] Installing oh-my-zsh (unattended)..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if command -v zsh >/dev/null 2>&1; then
  CURRENT_SHELL="$(getent passwd "$USER" | cut -d: -f7 || echo "${SHELL:-}")"
  TARGET_SHELL="$(command -v zsh)"
  if [ "$CURRENT_SHELL" != "$TARGET_SHELL" ]; then
    echo "[*] Changing default shell to zsh (you may be prompted for your password)..."
    chsh -s "$TARGET_SHELL"
  fi
fi

# --------------------------------------------------------------------
# chezmoi + init from your GitHub dotfiles
# --------------------------------------------------------------------
echo "[*] Installing chezmoi..."
if ! command -v chezmoi >/dev/null 2>&1; then
  sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin"
fi

CHEZMOI_SRC="$HOME/.local/share/chezmoi"

if [ ! -d "$CHEZMOI_SRC" ] || [ -z "$(ls -A "$CHEZMOI_SRC" 2>/dev/null || echo)" ]; then
  echo "[*] Initializing chezmoi from https://github.com/shnlmn/dotfiles ..."
  "$HOME/.local/bin/chezmoi" init --apply https://github.com/shnlmn/dotfiles.git
else
  echo "[!] ~/.local/share/chezmoi is not empty; skipping chezmoi init."
  echo "    If you want to replace it with shnlmn/dotfiles, clear it and rerun the init manually:"
  echo "      rm -rf ~/.local/share/chezmoi"
  echo "      chezmoi init --apply https://github.com/shnlmn/dotfiles.git"
fi

# --------------------------------------------------------------------
# Ensure local and pip bin dirs are on PATH early
# --------------------------------------------------------------------
mkdir -p "$HOME/.local/bin"
PIP_BIN="$(python3 -m site --user-base)/bin"

for rc in "$HOME/.bashrc" "$HOME/.zshrc"; do
  grep -qx 'export PATH="$HOME/.local/bin:$PATH"' "$rc" 2>/dev/null || \
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$rc"
  grep -qx "export PATH=\"$PIP_BIN:\$PATH\"" "$rc" 2>/dev/null || \
    echo "export PATH=\"$PIP_BIN:\$PATH\"" >> "$rc"
done

export PATH="$HOME/.local/bin:$PIP_BIN:$PATH"

# --------------------------------------------------------------------
# Install PlatformIO
# --------------------------------------------------------------------
echo "[*] Installing PlatformIO..."
curl -fsSL -o get-platformio.py https://raw.githubusercontent.com/platformio/platformio-core-installer/master/get-platformio.py
python3 get-platformio.py

echo
echo "[✓] Done."
echo "    Neovim nightly: $(command -v nvim || echo 'nvim not on PATH in this shell')"
echo "    tmux:           $(command -v tmux || echo 'not found')"
echo "    zsh:            $(command -v zsh || echo 'not found')"
echo "    chezmoi:        $(command -v chezmoi || echo 'not found')"
echo
echo "Open a new terminal (so PATH + default shell apply), or run: exec zsh"
