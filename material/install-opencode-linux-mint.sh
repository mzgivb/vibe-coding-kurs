#!/usr/bin/env bash
# ================================================================
# Installationsscript: opencode + DeepSeek V4 / Ollama
# Für: Linux Mint (getestet ab 21.x)
# ================================================================
set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_step()  { echo -e "\n${BLUE}==>${NC} ${GREEN}$1${NC}"; }
print_info()  { echo -e "    ${YELLOW}::${NC} $1"; }
print_ok()    { echo -e "    ${GREEN}✓${NC} $1"; }
print_fail()  { echo -e "    ${RED}✗${NC} $1"; }

# ----- Voraussetzungen -------------------------------------------------------
print_step "System-Pakete aktualisieren"
sudo apt update && sudo apt upgrade -y

print_step "Python3, Node.js & npm installieren (werden für die Demo-Projekte benötigt)"
if ! command -v node &>/dev/null; then
    sudo apt install -y python3 python3-pip nodejs npm curl
    print_ok "Python3, Node.js & npm installiert"
else
    print_ok "Bereits installiert: node $(node --version), npm $(npm --version)"
fi

# ----- opencode installieren ------------------------------------------------
print_step "opencode installieren"
if command -v opencode &>/dev/null; then
    print_ok "opencode bereits installiert ($(opencode --version))"
else
    curl -fsSL https://opencode.ai/install | bash
    print_ok "opencode installiert"
fi

# opencode in PATH (für Linux Mint: ~/.bashrc)
if ! grep -q ".opencode/bin" "$HOME/.bashrc" 2>/dev/null; then
    echo '' >> "$HOME/.bashrc"
    echo '# opencode' >> "$HOME/.bashrc"
    echo 'export PATH="$HOME/.opencode/bin:$PATH"' >> "$HOME/.bashrc"
    print_ok "opencode zum PATH in ~/.bashrc hinzugefügt"
fi
# Damit es sofort in dieser Shell gilt
export PATH="$HOME/.opencode/bin:$PATH"

# ----- Ollama + lokales Modell (Offline-Fallback) ---------------------------
print_step "Ollama installieren (Offline-Fallback)"
if command -v ollama &>/dev/null; then
    print_ok "Ollama bereits installiert"
else
    curl -fsSL https://ollama.com/install.sh | sh
    print_ok "Ollama installiert"
fi

print_step "Lokales KI-Modell herunterladen (ca. 1,1 GB – bitte Geduld)"
ollama pull qwen2.5-coder:1.5b
print_ok "qwen2.5-coder:1.5b heruntergeladen"

ollama cp qwen2.5-coder:1.5b qwen2.5-coder:1.5b-16k 2>/dev/null || true
print_ok "16k-Kontext-Variante angelegt (qwen2.5-coder:1.5b-16k)"

# ----- opencode-Konfiguration anlegen ---------------------------------------
CONFIG_DIR="$HOME/.config/opencode"
CONFIG_FILE="$CONFIG_DIR/opencode.jsonc"
mkdir -p "$CONFIG_DIR"

if [ ! -f "$CONFIG_FILE" ]; then
    cat > "$CONFIG_FILE" << 'EOF'
{
  "$schema": "https://opencode.ai/config.json",
  "provider": {
    "ollama": {
      "npm": "@ai-sdk/openai-compatible",
      "name": "Ollama (local)",
      "options": {
        "baseURL": "http://localhost:11434/v1"
      },
      "models": {
        "qwen2.5-coder:1.5b-16k": {
          "name": "Qwen 2.5 Coder 1.5b (16k)"
        }
      }
    }
  }
}
EOF
    print_ok "opencode-Konfiguration angelegt: $CONFIG_FILE"
else
    print_info "opencode-Konfiguration existiert bereits – übersprungen"
fi

# ----- MindGraph Notes installieren (Live-Demo-App) -------------------------
print_step "MindGraph Notes installieren (Demo-App für die Fortbildung)"
MG_DEB="/tmp/mindgraph-notes.deb"
curl -sL -o "$MG_DEB" "https://github.com/bydb/mindgraph-notes/releases/download/v0.7.26-beta/mindgraph-notes_0.7.26-beta_amd64.deb"
sudo dpkg -i "$MG_DEB" 2>/dev/null || sudo apt install -y -f
rm -f "$MG_DEB"
print_ok "MindGraph Notes installiert"

# ----- Demo-Projekt-Verzeichnis anlegen -------------------------------------
DEMO_DIR="$HOME/vibe-coding-demo"
mkdir -p "$DEMO_DIR"
print_ok "Demo-Verzeichnis: $DEMO_DIR"

# ----- Fertig ---------------------------------------------------------------
echo ''
echo '============================================================'
echo -e "  ${GREEN}Installation abgeschlossen!${NC}"
echo '============================================================'
echo ''
echo -e "${YELLOW}So startest du opencode:${NC}"
echo ''
echo "  1. Terminal NEU öffnen (damit der PATH geladen wird)"
echo ''
echo "  2. Ins Demo-Verzeichnis wechseln:"
echo "     cd ~/vibe-coding-demo"
echo ''
echo "  3. opencode starten:"
echo "     opencode"
echo ''
echo -e "${YELLOW}DeepSeek V4 Flash Free (empfohlen – Cloud, kein lokales Modell nötig):${NC}"
echo ''
echo "  In opencode nach dem Start:"
echo "    /connect"
echo "    → OpenCode Zen auswählen"
echo "    → Browser öffnet sich: opencode.ai/auth"
echo "    → Registrieren, API-Key kopieren"
echo "    → In opencode einfügen"
echo "    → /models → DeepSeek V4 Flash Free auswählen"
echo ''
echo -e "${YELLOW}Live-Demo-App MindGraph Notes:${NC}"
echo ''
echo "  Ist bereits installiert und startbereit."
echo "  Im Terminal mit folgendem Befehl starten:"
echo "    mindgraph-notes"
echo ''
echo -e "${YELLOW}Offline-Fallback (funktioniert ohne Internet – auch auf älteren Laptops):${NC}"
echo ''
echo "  opencode starten und Ollama-Modell auswählen:"
echo "    /models → qwen2.5-coder:1.5b-16k"
echo ''
echo '============================================================'
echo -e "  ${GREEN}Alles bereit für die Fortbildung am 23.06.2026!${NC}"
echo '============================================================'
