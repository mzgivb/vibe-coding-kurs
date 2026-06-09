# Cheat-Sheet – Vibe Coding

Die wichtigsten Punkte des Kurses auf einen Blick. 🏠 [Zurück zur Übersicht](../README.md)

---

## Was ist Vibe Coding?

Du beschreibst in Alltagssprache, was eine Anwendung tun soll. Die KI schreibt den Code.
Du testest das Ergebnis und beschreibst, was geändert werden soll.

> *„I just vibe. I'm not really writing code."* — Andrej Karpathy (2025)

---

## Der 4-Schritte-Zyklus

| Schritt | Was du tust |
|---|---|
| 1. **Beschreiben** | In natürlicher Sprache sagen, was die Anwendung können soll. |
| 2. **Generieren lassen** | Die KI erzeugt eine erste Version. |
| 3. **Testen** | Ausführen/öffnen und prüfen: Tut es, was es soll? |
| 4. **Nachsteuern** | Fehler/Wünsche beschreiben – Verhalten korrigieren, nicht Code debuggen. Zurück zu 2. |

---

## Guter Prompt – das Rezept

```text
Ich möchte per Vibe Coding ein kleines Projekt erstellen.

Ziel:        [Was soll am Ende funktionieren?]
Zielgruppe:  [Wer nutzt es?]
Wichtige Funktionen:
  1. [...]
  2. [...]
Technischer Rahmen: [Webseite / Python-Datei / Electron-App]

Bitte erstelle eine einfache erste Version.
Erkläre kurz, wie ich sie starte.
Halte die Struktur übersichtlich. Baue keine unnötige Komplexität ein.
```

---

## Drei Zieltypen

| Typ | Gut für | Starten mit |
|---|---|---|
| **Webseite (HTML/JS)** | interaktive Inhalte, Prototypen | Datei im Browser öffnen |
| **Python-Skript** | Automatisierung, Datenverarbeitung | `python3 datei.py` |
| **Electron-App** | Desktop-Anwendungen | `npm install && npm start` |

---

## Werkzeug-Wege

| Weg | Was | Internet | Kosten |
|---|---|---|---|
| **0** | Chat-KI im Browser (ChatGPT/Claude/Gemini) | ja | kostenlos |
| **A** | opencode + DeepSeek V4 Flash Free (Cloud) | ja | kostenlos* |
| **B** | opencode + Ollama (lokal) | nein | kostenlos |

\* Free-Kontingent zeitlich begrenzt.

**opencode-Befehle:** `opencode` (starten) · `/connect` (Anbieter) · `/models` (Modell) · `/exit`

---

## Die 5 Reflexionsfragen

1. Was konnte ich beschreiben, ohne Code zu schreiben?
2. Wo musste ich trotzdem testen und beurteilen?
3. Welche Fehler konnte ich durch genauere Sprache beheben?
4. Wo wurde es riskant, weil ich den Code nicht vollständig verstanden habe?
5. Welche Kompetenzen brauchen Lernende, wenn KI Code erzeugen kann?

---

## Sicherheits-Checkliste

- [ ] Keine echten (Schüler-)Daten in KI-Chats.
- [ ] Bei Datei-Operationen (Python) erst mit Kopien testen.
- [ ] Generierten Code kurz überfliegen – tut er, was er soll?
- [ ] Keine Zugangsdaten / API-Keys in Prompts.
- [ ] Bei Unsicherheit: von einer Person mit Programmiererfahrung prüfen lassen.

---

## Vibe Coding vs. AI-Assisted Engineering

| | Vibe Coding | AI-Assisted Engineering |
|---|---|---|
| Wofür? | Prototypen, Experimente, persönliche Tools | Produktive Software, Teamprojekte |
| Verantwortung? | Die KI macht den Code | Mensch behält Kontrolle und Review |
| Risiko? | Versteckte Fehler, Sicherheitslücken | Aufwändiger, braucht mehr Fachwissen |

---

> *Vibe Coding senkt die Einstiegshürde – Testen, Beurteilen und kritisches Denken bleiben
> menschliche Kernkompetenzen.*
