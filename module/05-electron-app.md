# Modul 5 – Eine Desktop-App

🏠 [Kursübersicht](../README.md) · Modul 5 von 8

---

## 🎯 Lernziele

Nach diesem Modul kannst du …

- eine **echte Desktop-App** starten (eine Notiz-App mit Electron),
- mit dem **Verstehens-Check** nachvollziehen, wie mehrere Dateien zusammenspielen,
- eine bestehende App per Vibe Coding um eine **neue Funktion** erweitern,
- erkennen, warum Desktop-Apps **mehr Sorgfalt** bei Struktur und Sicherheit brauchen.

⏱️ **Zeit:** ca. 50 Minuten · **Voraussetzungen:** [Modul 2](02-werkzeug-einrichten.md),
Node.js (`node --version`). Für die Erweiterung ist **opencode** (Weg A/B) empfohlen, weil hier
mehrere Dateien zusammenarbeiten.

---

## Was ist Electron?

Mit **Electron** baut man Desktop-Apps mit denselben Bausteinen wie Webseiten (HTML, CSS,
JavaScript) – aber das Ergebnis ist ein **richtiges Programm mit eigenem Fenster**, das lokal
auf deinem Rechner läuft. Das ist motivierend, weil sofort eine „echte" App entsteht.

Eine Electron-App besteht typischerweise aus diesen Dateien:

| Datei | Aufgabe |
|---|---|
| `package.json` | Projektinfos & Startbefehl |
| `main.js` | Hauptprozess – erzeugt das Fenster, greift auf Dateien zu |
| `preload.js` | sichere Brücke zwischen Fenster und Hauptprozess |
| `index.html` | die Oberfläche |
| `renderer.js` | das Verhalten im Fenster |
| `styles.css` | das Aussehen |

---

## 🛠️ Praxis 1: Die Notiz-App starten

Im Kurs liegt eine fertige, per Vibe Coding gebaute Notiz-App unter
[`beispiele/notizen-app/`](../beispiele/notizen-app/). Links eine Notizliste, rechts ein Editor,
Notizen werden lokal gespeichert.

So startest du sie:

```bash
cd beispiele/notizen-app
npm install     # lädt einmalig die Abhängigkeiten (Electron)
npm start       # startet die App
```

Beim ersten Mal dauert `npm install` einen Moment. Danach öffnet `npm start` das App-Fenster.

**Testen:** Lege eine neue Notiz an, tippe etwas, wähle eine andere Notiz, lösche eine. Funktioniert alles?

> **Hinweis:** `node_modules` (die heruntergeladenen Abhängigkeiten) gehören **nicht** ins
> Projekt-Repository – sie werden mit `npm install` lokal erzeugt. Deshalb fehlen sie hier
> bewusst.

---

## 🛠️ Praxis 2: Eine Suchfunktion ergänzen

Die App hat noch **keine Suche**. Das bauen wir per Vibe Coding ein. Starte opencode **im
Ordner der App**:

```bash
cd beispiele/notizen-app
opencode
```

> 🧠 **Verstehens-Check vorab:** Die App besteht aus sechs Dateien (Tabelle oben). Rate zuerst
> selbst: *In welchen Dateien muss sich für eine Suchfunktion etwas ändern – und warum?*
> Frage dann:
>
> ```text
> Ich möchte eine Suchfunktion über der Notizliste ergänzen. Erkläre mir zuerst
> nur, welche Dateien du dafür ändern müsstest und warum. Ändere noch nichts.
> ```
>
> Vergleiche die Antwort mit deiner Vermutung – dann erst loslegen. Bei einer App aus
> mehreren Dateien zeigt dir dieser Schritt, **wie die Teile zusammenspielen**.

### Schritt 1 – Beschreiben

```text
Füge dieser Notiz-App eine Suchfunktion hinzu. Über der Notizliste soll ein
Suchfeld erscheinen. Während ich tippe, soll die Liste nur noch die Notizen
zeigen, deren Titel zum Suchbegriff passt.
```

### Schritt 2 – Testen

App neu starten (`npm start`) und ausprobieren: Wird die Liste beim Tippen gefiltert?

### Schritt 3 – Nachsteuern (ein typischer Fehler)

Oft unterscheidet die erste Version Groß- und Kleinschreibung. Beschreibe das Problem:

```text
Die Suche unterscheidet Groß- und Kleinschreibung. Mach sie unabhängig davon,
sodass "notiz" auch "Notiz" findet.
```

Erneut starten, erneut testen. **Geschafft – du hast eine echte App erweitert.** 🎉

---

## Aufräumen & Absichern

Für eine ernsthaftere App lohnt es sich, die KI nach diesen Punkten zu fragen:

- saubere **Trennung von Hauptprozess (`main.js`) und Oberfläche (`renderer.js`)**,
- sichere Nutzung von `preload.js`,
- keine unnötigen Rechte im Fenster (kein direkter Datei-/Systemzugriff aus dem Browserteil),
- nachvollziehbare lokale Speicherung,
- eine kleine **manuelle Testliste**: Was muss nach jeder Änderung noch funktionieren?

> **Merksatz:** Electron ist besonders motivierend, weil sehr schnell eine echte App sichtbar
> wird. Genau deshalb braucht man hier **mehr Sorgfalt** bei Sicherheit und Projektstruktur als
> bei einer einfachen Webseite.

---

## 💡🎓 Hinweise

> 💡 **Für Schüler:** Überlege dir eine eigene kleine Erweiterung und beschreibe sie der KI –
> z. B. „zeige die Anzahl der Notizen an" oder „füge einen Dunkelmodus-Schalter hinzu". Teste
> nach jeder Änderung.

> 🎓 **Für Lehrkräfte:** Dieses Modul passt zum Szenario *„KI-gestütztes Programmieren lernen"*
> nach dem Dreischritt **Generieren → Erklären lassen → Selbst verändern**. Bitte die Lernenden,
> sich eine generierte Funktion von der KI **erklären** zu lassen, bevor sie sie ändern – so
> wird aus Nutzung Verstehen.

---

## ✅ Selbstcheck

**1. Wozu dient `npm install`, und warum liegt `node_modules` nicht im Repository?**

<details>
<summary>Lösung</summary>

`npm install` lädt die benötigten Abhängigkeiten (hier Electron) herunter. Diese sind groß und
reproduzierbar, deshalb werden sie lokal erzeugt und **nicht** eingecheckt.

</details>

**2. Die Suche findet „Notiz" nicht, wenn du „notiz" tippst. Wie beschreibst du den Fehler?**

<details>
<summary>Lösung</summary>

Als Verhalten, nicht als Code: „Die Suche unterscheidet Groß- und Kleinschreibung – mach sie
unabhängig davon (case-insensitive)."

</details>

**3. Warum braucht eine Electron-App mehr Sorgfalt als eine einfache Webseite?**

<details>
<summary>Lösung</summary>

Weil sie als echtes Programm auf dem Rechner läuft, auf Dateien zugreifen kann und aus mehreren
zusammenarbeitenden Teilen besteht – das erhöht die Anforderungen an Sicherheit und Struktur.

</details>

---

## 📋 Aufgaben

> Abhaken speichert direkt in dieser Datei. In **MindGraph Notes** erscheinen diese Aufgaben automatisch im **Tasks**-Widget und am Fälligkeitstag im **Focus**. Übersicht & Kursfahrplan: [Aufgaben.md](../Aufgaben.md).

- [ ] Starte die Notiz-App (`npm install && npm start`) #kurs/modul-5 (@[[2026-07-06]])
- [ ] Verstehens-Check: Rate, welche Dateien sich für die Suche ändern müssen, und lass es dir erklären #kurs/modul-5 (@[[2026-07-06]])
- [ ] Ergänze per Vibe Coding eine Suchfunktion über der Notizliste #kurs/modul-5 (@[[2026-07-06]])
- [ ] Mach die Suche case-insensitive und teste sie erneut #kurs/modul-5 (@[[2026-07-06]])

---

⬅️ [Modul 4](04-python-skript.md) · 🏠 [Übersicht](../README.md) · ➡️ [Modul 6: Sicherheit & Datenschutz](06-sicherheit-datenschutz.md)
