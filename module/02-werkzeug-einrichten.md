# Modul 2 – Werkzeug einrichten

🏠 [Kursübersicht](../README.md) · Modul 2 von 7

---

## 🎯 Lernziele

Nach diesem Modul kannst du …

- entscheiden, **welcher Weg** (Browser, online oder offline) zu dir passt,
- dein KI-Werkzeug **installieren und starten**,
- prüfen, ob alles funktioniert.

⏱️ **Zeit:** ca. 30 Minuten · **Voraussetzungen:** [Modul 1](01-was-ist-vibe-coding.md), ein
Laptop/PC mit Internet

---

## Drei Wege – du brauchst nur einen

Es gibt nicht *das eine* Vibe-Coding-Werkzeug. Wähle den Weg, der zu dir passt:

| Weg | Was? | Installation? | Internet? | Gut für |
|---|---|---|---|---|
| **Weg 0** | Chat-KI im Browser | keine | ja | sofort starten, jüngere Lernende |
| **Weg A** | opencode + DeepSeek V4 (Cloud) | etwas | ja | der empfohlene Hauptweg |
| **Weg B** | opencode + Ollama (lokal) | mehr | **nein** | Offline, Datenschutz |

> 💡 **Tipp:** Wenn du unsicher bist, starte mit **Weg 0**. Du kannst jederzeit später auf
> Weg A umsteigen, wenn du „richtige" Projektdateien bearbeiten willst.

---

## Weg 0 – Ohne Installation (Chat-KI im Browser)

Der niedrigschwelligste Einstieg. Du brauchst nur einen Browser und einen kostenlosen Zugang zu
einer Chat-KI:

- **ChatGPT** – <https://chat.openai.com> (ab 13 Jahren, mit Elternzustimmung)
- **Claude** – <https://claude.ai> (ab 18 Jahren)
- **Gemini** – <https://gemini.google.com>

**So gehst du vor:**

1. Im Chat beschreibst du dein Projekt (siehe die [Prompt-Vorlage](../material/prompt-vorlage.md)).
2. Die KI gibt dir den Code – meist eine oder mehrere Dateien.
3. Du **kopierst** den Code in eine Datei auf deinem Rechner (z. B. `index.html`) und öffnest
   sie. Für Webseiten kannst du den Code auch direkt in <https://codepen.io> oder
   <https://playcode.io> einfügen und sofort sehen.
4. Klappt etwas nicht? Beschreibe das Problem im Chat – die KI schickt dir eine neue Version.

> 🎓 **Für Lehrkräfte:** Weg 0 ist ideal für jüngere Klassen und für eine Frontal-Demo. Beachtet
> die **Altersgrenzen** der Anbieter und gebt **keine personenbezogenen Daten** ein. Details in
> [Modul 6](06-sicherheit-datenschutz.md).

Der Rest dieses Moduls richtet **opencode** ein – ein KI-Werkzeug direkt im Terminal, das deine
Dateien selbst anlegt und ändert. Das ist mächtiger, aber optional. **Weg 0 reicht für die
Module 3 und 4 vollkommen aus.**

---

## Was ist „opencode"?

**opencode** ist ein kostenloser KI-Coding-Agent, der im **Terminal** läuft. Du tippst, was
entstehen soll – opencode legt die Dateien an und ändert sie selbstständig. Du wählst, welches
**KI-Modell** dahinter rechnet: in der Cloud (Weg A) oder lokal auf deinem Gerät (Weg B).

> **Was ist ein Terminal?** Ein Fenster, in das man Befehle tippt.
> - **macOS:** Programme → Dienstprogramme → *Terminal*
> - **Windows:** *PowerShell* (oder besser WSL, siehe unten)
> - **Linux:** `Strg + Alt + T`

### opencode installieren

**macOS / Linux** – ein Befehl, kopieren und ins Terminal einfügen:

```bash
curl -fsSL https://opencode.ai/install | bash
```

Danach das **Terminal neu starten** (schließen und neu öffnen).

> ⚠️ **Wichtig (macOS): Falls danach `opencode` nicht gefunden wird** („command not found:
> opencode"), kennt das Terminal den Installationsort noch nicht. Dann diese zwei Zeilen ins
> Terminal kopieren und mit Enter bestätigen:
>
> ```bash
> echo 'export PATH="$HOME/.opencode/bin:$PATH"' >> ~/.zshrc
> source ~/.zshrc
> ```
>
> Hintergrund: opencode wird in den Ordner `~/.opencode/bin` installiert. Damit das Terminal
> den Befehl findet, muss dieser Ordner im sogenannten PATH stehen. Das Installationsskript
> versucht das automatisch einzutragen – auf manchen Macs (z. B. wenn die Datei `~/.zshrc`
> noch nicht existiert) klappt das aber nicht. Die zwei Zeilen tragen den Pfad dauerhaft nach.

**Windows – Variante 1 (empfohlen): WSL**

1. PowerShell **als Administrator** öffnen (Rechtsklick → „Als Administrator ausführen").
2. `wsl --install` ausführen, PC neu starten (Ubuntu wird automatisch eingerichtet).
3. Im WSL-Terminal dann den macOS/Linux-Befehl von oben ausführen.

**Windows – Variante 2: direkt mit npm**

1. [Node.js installieren](https://nodejs.org/).
2. In PowerShell: `npm install -g opencode-ai`

### Installation prüfen

```bash
opencode --version
```

Erscheint eine Versionsnummer, hat es geklappt. ✅

---

## Weg A – opencode + DeepSeek V4 Flash Free (empfohlen)

DeepSeek V4 Flash Free ist aktuell **kostenlos** über opencode nutzbar – ohne Zahlungsdaten.

1. opencode starten:
   ```bash
   opencode
   ```
2. Im Programm `/connect` eingeben, Enter drücken.
3. Mit den Pfeiltasten **OpenCode Zen** auswählen, Enter. Es öffnet sich der Browser mit
   [opencode.ai/auth](https://opencode.ai/auth).
4. **Konto erstellen** oder anmelden (E-Mail + Passwort genügen).
5. **API-Key kopieren** (Button „Create API Key").
6. Den API-Key in opencode einfügen (`Strg+V` / `Cmd+V`).
7. `/models` eingeben, Enter → **DeepSeek V4 Flash Free** auswählen.

**Fertig!** Wechsle in einen Projektordner und leg los:

```bash
mkdir ~/vibe-coding && cd ~/vibe-coding
opencode
```

> ⚠️ **Hinweis:** Das kostenlose Kontingent ist zeitlich begrenzt. Falls DeepSeek einmal nicht
> verfügbar ist, nutze Weg B (Ollama) oder Weg 0 (Browser).

---

## Weg B – opencode + Ollama (offline)

Nur nötig, wenn du **ohne Internet** arbeiten willst oder Daten lokal halten musst.

**Ollama installieren:**

```bash
# macOS
brew install ollama
# Linux
curl -fsSL https://ollama.com/install.sh | sh
# Windows → in WSL den Linux-Befehl ausführen
```

**Modell herunterladen** (kleines Modell, läuft auch auf älteren Laptops):

```bash
ollama pull qwen2.5-coder:1.5b
```

**Wichtig – 16k-Variante anlegen** (sonst bearbeitet opencode keine Dateien):

```bash
ollama cp qwen2.5-coder:1.5b qwen2.5-coder:1.5b-16k
```

**opencode mit Ollama verbinden** – lege im Projektordner eine Datei `opencode.json` an:

```json
{
  "$schema": "https://opencode.ai/config.json",
  "provider": {
    "ollama": {
      "npm": "@ai-sdk/openai-compatible",
      "name": "Ollama (local)",
      "options": { "baseURL": "http://localhost:11434/v1" },
      "models": {
        "qwen2.5-coder:1.5b-16k": { "name": "Qwen 2.5 Coder 1.5b (16k)" }
      }
    }
  },
  "model": "ollama/qwen2.5-coder:1.5b-16k"
}
```

Starte dann `opencode` – es nutzt jetzt das lokale Modell.

> Wer einen Laptop mit **≥ 8 GB RAM** hat, kann das stärkere `qwen2.5-coder:7b` (bzw.
> `...:7b-16k`) verwenden – bessere Ergebnisse, höherer Speicherbedarf.

---

## Mini-Befehlsreferenz für opencode

```text
opencode        # Programm im Terminal starten
/connect        # Modell-Anbieter verbinden (z. B. OpenCode Zen → DeepSeek V4)
/models         # Modell auswählen
/exit           # opencode beenden
```

Danach einfach lostippen, was entstehen soll. Für die Praxis-Module brauchst du außerdem oft
**Node.js** und **Python** – prüfe mit `node --version` und `python3 --version`, ob sie da sind
(beide gibt es kostenlos auf [nodejs.org](https://nodejs.org/) bzw. [python.org](https://www.python.org/)).

---

## 🛠️ Praxis: Erster Kontakt

Egal welcher Weg – stelle deinem Werkzeug **eine erste Aufgabe**, um zu sehen, dass es reagiert:

> Schreibe eine einzelne HTML-Datei `hallo.html`, die in großer Schrift „Hallo Vibe Coding!"
> anzeigt und den Hintergrund in einem sanften Blauton einfärbt.

- **Weg 0:** Code aus dem Chat in eine Datei `hallo.html` kopieren und im Browser öffnen.
- **Weg A/B:** In opencode den Prompt eintippen; opencode legt `hallo.html` an. Datei im Browser
  öffnen.

Wenn du „Hallo Vibe Coding!" auf blauem Grund siehst: **Dein Werkzeug läuft.** 🎉

---

## ✅ Selbstcheck (Kurzcheck vor Modul 3)

- Ich habe einen Weg gewählt (0, A oder B).
- Mein Werkzeug reagiert auf einen Prompt.
- (Weg A/B) `opencode --version` zeigt eine Version.
- Ich konnte die Datei `hallo.html` im Browser öffnen.

**Frage: Warum braucht der Ollama-Weg die „16k"-Modellvariante?**

<details>
<summary>Lösung</summary>

Weil das Modell ein ausreichend großes **Kontextfenster** braucht, um ganze Dateien zu lesen und
zu bearbeiten. Mit zu kleinem Kontext „bearbeitet opencode keine Dateien".

</details>

> **Keine Panik bei Problemen.** Wenn etwas klemmt: Frag die KI selbst nach Hilfe, probiere
> Weg 0 als Ausweichlösung, oder schreib eine Mail an [jochen.leeder@mzgivb.de](mailto:jochen.leeder@mzgivb.de).
> Eine ausführliche Linux-Installationshilfe liegt unter [material/install-opencode-linux-mint.sh](../material/install-opencode-linux-mint.sh).

---

## 📋 Aufgaben

> Abhaken speichert direkt in dieser Datei. In **MindGraph Notes** erscheinen diese Aufgaben automatisch im **Tasks**-Widget und am Fälligkeitstag im **Focus**. Übersicht & Kursfahrplan: [Aufgaben.md](../Aufgaben.md).

- [ ] Wähle deinen Werkzeug-Weg (0, A oder B) und richte ihn ein #kurs/modul-2 (@[[2026-06-26]])
- [ ] Stelle die erste Aufgabe und erzeuge `hallo.html`, öffne sie im Browser #kurs/modul-2 (@[[2026-06-26]])

---

⬅️ [Modul 1](01-was-ist-vibe-coding.md) · 🏠 [Übersicht](../README.md) · ➡️ [Modul 3: Deine erste Webseite](03-erste-webseite.md)
