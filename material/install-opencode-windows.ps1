#Requires -Version 5.1
<#
================================================================
 Installations-Skript: opencode fuer Windows 11
 Vibe Coding Kurs - Medienzentrum Giessen-Vogelsberg
================================================================

 Was dieses Skript tut:
   1. Prueft, ob das Terminal als Administrator laeuft (Pflicht!)
   2. Installiert Node.js LTS (per winget), falls noch nicht vorhanden
   3. Installiert opencode (per npm)
   4. Prueft die Installation
   5. Optional (-Offline): legt die Ollama-Konfiguration fuer den
      Offline-Weg an

 So startest du das Skript:
   1. Terminal ALS ADMINISTRATOR oeffnen
      (Start -> "Terminal" tippen -> Rechtsklick -> "Als Administrator ausfuehren")
   2. In den Kurs-Ordner wechseln, z. B.:
        cd "$env:USERPROFILE\OneDrive - Mauszentrum Gießen\Desktop\vibe-coding-kurs"
   3. Skript ausfuehren:
        powershell -ExecutionPolicy Bypass -File .\material\install-opencode-windows.ps1

   Fuer den Offline-Weg (Ollama) zusaetzlich " -Offline" anhaengen:
        powershell -ExecutionPolicy Bypass -File .\material\install-opencode-windows.ps1 -Offline
================================================================
#>

param(
    [switch]$Offline
)

# ----- Ausgabe-Helfer -------------------------------------------------------
function Write-Step($m) { Write-Host "`n==> $m" -ForegroundColor Cyan }
function Write-Info($m) { Write-Host "    :: $m" -ForegroundColor Yellow }
function Write-Ok($m)   { Write-Host "    [OK] $m" -ForegroundColor Green }
function Write-Fail($m) { Write-Host "    [X]  $m" -ForegroundColor Red }

# PATH der laufenden Sitzung aus Maschinen- + Benutzer-PATH neu aufbauen.
# Noetig, weil frisch installierte Programme (Node, npm) sonst erst nach
# einem Terminal-Neustart gefunden werden.
function Update-SessionPath {
    $machine = [System.Environment]::GetEnvironmentVariable('Path', 'Machine')
    $user    = [System.Environment]::GetEnvironmentVariable('Path', 'User')
    $env:Path = ($machine, $user | Where-Object { $_ }) -join ';'
}

$ErrorActionPreference = 'Stop'

Write-Host ""
Write-Host "============================================================"
Write-Host "  opencode-Installation fuer Windows 11"
Write-Host "  Vibe Coding Kurs"
Write-Host "============================================================"

# ----- 1. Admin-Rechte pruefen ----------------------------------------------
Write-Step "Pruefe Administrator-Rechte"
$isAdmin = ([Security.Principal.WindowsPrincipal] `
    [Security.Principal.WindowsIdentity]::GetCurrent() `
).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if (-not $isAdmin) {
    Write-Fail "Dieses Terminal laeuft NICHT als Administrator."
    Write-Info "Globale npm-Installationen scheitern dann mit 'EPERM'."
    Write-Info "Bitte das Terminal schliessen und so neu oeffnen:"
    Write-Info "  Start -> 'Terminal' tippen -> Rechtsklick -> 'Als Administrator ausfuehren'"
    Write-Info "Danach das Skript erneut starten."
    exit 1
}
Write-Ok "Administrator-Rechte vorhanden"

# ----- 2. Node.js installieren ----------------------------------------------
Write-Step "Node.js LTS pruefen / installieren"
if (Get-Command node -ErrorAction SilentlyContinue) {
    Write-Ok "Node.js bereits installiert ($(node --version))"
}
else {
    if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
        Write-Fail "winget ist nicht verfuegbar."
        Write-Info "Bitte 'App Installer' im Microsoft Store aktualisieren,"
        Write-Info "oder Node.js LTS manuell installieren: https://nodejs.org/"
        exit 1
    }
    Write-Info "Installiere Node.js LTS per winget (kann ein paar Minuten dauern)..."
    winget install OpenJS.NodeJS.LTS `
        --accept-source-agreements --accept-package-agreements --silent
    Update-SessionPath
    if (Get-Command node -ErrorAction SilentlyContinue) {
        Write-Ok "Node.js installiert ($(node --version))"
    }
    else {
        Write-Fail "Node.js wurde installiert, aber noch nicht im PATH gefunden."
        Write-Info "Bitte das Terminal als Administrator NEU oeffnen und das Skript erneut starten."
        exit 1
    }
}

# ----- 3. opencode installieren ---------------------------------------------
Write-Step "opencode installieren"
if (Get-Command opencode -ErrorAction SilentlyContinue) {
    Write-Ok "opencode bereits installiert ($(opencode --version))"
}
else {
    Write-Info "Installiere opencode per npm..."
    npm install -g opencode-ai
    Update-SessionPath
    Write-Ok "opencode installiert"
}

# ----- 4. Installation pruefen ----------------------------------------------
Write-Step "Installation pruefen"
if (Get-Command opencode -ErrorAction SilentlyContinue) {
    Write-Ok "opencode gefunden: Version $(opencode --version)"
}
else {
    Write-Fail "opencode wurde installiert, ist in dieser Sitzung aber noch nicht im PATH."
    Write-Info "Das ist normal: einfach das Terminal NEU oeffnen, dann ist 'opencode' verfuegbar."
}

# ----- 5. Optional: Offline-Konfiguration (Ollama) --------------------------
if ($Offline) {
    Write-Step "Offline-Weg vorbereiten (Ollama-Konfiguration)"

    if (-not (Get-Command ollama -ErrorAction SilentlyContinue)) {
        Write-Info "Ollama ist nicht installiert."
        Write-Info "Fuer den Offline-Weg zuerst Ollama installieren: https://ollama.com/download"
        Write-Info "Danach dieses Skript erneut mit -Offline ausfuehren."
    }
    else {
        Write-Info "Lade lokales Modell qwen2.5-coder:1.5b (ca. 1,1 GB - bitte Geduld)..."
        ollama pull qwen2.5-coder:1.5b
        # 16k-Variante: noetig, damit opencode ganze Dateien bearbeiten kann
        ollama cp qwen2.5-coder:1.5b qwen2.5-coder:1.5b-16k 2>$null
        Write-Ok "Modell inkl. 16k-Variante bereit"

        $configDir  = Join-Path $HOME ".config\opencode"
        $configFile = Join-Path $configDir "opencode.json"
        if (-not (Test-Path $configDir)) {
            New-Item -ItemType Directory -Force -Path $configDir | Out-Null
        }
        if (-not (Test-Path $configFile)) {
            $config = @'
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
'@
            Set-Content -Path $configFile -Value $config -Encoding UTF8
            Write-Ok "opencode-Konfiguration angelegt: $configFile"
        }
        else {
            Write-Info "opencode-Konfiguration existiert bereits - uebersprungen"
        }
    }
}

# ----- Demo-Verzeichnis -----------------------------------------------------
$demoDir = Join-Path $HOME "vibe-coding-demo"
if (-not (Test-Path $demoDir)) {
    New-Item -ItemType Directory -Force -Path $demoDir | Out-Null
}
Write-Ok "Demo-Verzeichnis bereit: $demoDir"

# ----- Abschluss ------------------------------------------------------------
Write-Host ""
Write-Host "============================================================"
Write-Host "  Installation abgeschlossen!" -ForegroundColor Green
Write-Host "============================================================"
Write-Host ""
Write-Host "So geht es weiter:" -ForegroundColor Yellow
Write-Host ""
Write-Host "  1. Terminal NEU oeffnen (damit 'opencode' sicher gefunden wird)"
Write-Host ""
Write-Host "  2. Ins Demo-Verzeichnis wechseln:"
Write-Host "       cd `"$demoDir`""
Write-Host ""
Write-Host "  3. opencode starten:"
Write-Host "       opencode"
Write-Host ""
Write-Host "DeepSeek V4 Flash Free (empfohlen - Cloud, kein lokales Modell noetig):" -ForegroundColor Yellow
Write-Host "    In opencode:  /connect  ->  OpenCode Zen auswaehlen"
Write-Host "    Browser oeffnet opencode.ai/auth -> registrieren -> API-Key kopieren"
Write-Host "    API-Key in opencode einfuegen  ->  /models  ->  DeepSeek V4 Flash Free"
Write-Host ""
if ($Offline) {
    Write-Host "Offline-Weg (ohne Internet):" -ForegroundColor Yellow
    Write-Host "    In opencode:  /models  ->  qwen2.5-coder:1.5b-16k"
    Write-Host ""
}
Write-Host "============================================================"
