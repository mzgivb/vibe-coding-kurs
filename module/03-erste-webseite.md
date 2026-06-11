# Modul 3 – Deine erste Webseite

🏠 [Kursübersicht](../README.md) · Modul 3 von 8

---

## 🎯 Lernziele

Nach diesem Modul kannst du …

- eine **interaktive Webseite** allein durch Beschreiben erzeugen,
- das Ergebnis im Browser **testen** und gezielt **nachsteuern**,
- einen guten Prompt aufbauen (Ziel, Funktionen, Rahmen).

⏱️ **Zeit:** ca. 40 Minuten · **Voraussetzungen:** [Modul 2](02-werkzeug-einrichten.md)
(ein startklares Werkzeug)

---

## Warum mit einer Webseite anfangen?

Webseiten eignen sich perfekt für den Einstieg: **Änderungen werden sofort sichtbar.** Eine
Webseite besteht aus drei Bausteinen, die die KI für dich schreibt:

- **HTML** – die Struktur (Überschriften, Listen, Buttons)
- **CSS** – das Aussehen (Farben, Abstände, Layout)
- **JavaScript** – das Verhalten (was beim Klicken passiert)

Du musst keinen davon beherrschen. Du beschreibst – die KI baut.

---

## 🛠️ Praxis 1: Eine To-do-Liste in 4 Schritten

Wir bauen eine kleine Aufgabenliste. Folge dem 4-Schritte-Zyklus aus [Modul 1](01-was-ist-vibe-coding.md).

### Schritt 1 – Beschreiben

Gib deinem Werkzeug (opencode oder Chat-KI) diesen Prompt:

```text
Erstelle eine einzelne Datei index.html mit einer einfachen To-do-Liste.
Man soll oben eine Aufgabe in ein Textfeld eingeben und mit einem Button
hinzufügen können. Aufgaben werden in einer Liste angezeigt und lassen sich
durch Anklicken abhaken (durchgestrichen). Halte das Design schlicht und
freundlich. Baue keine unnötige Komplexität ein.
```

### Schritt 2 – Generieren lassen

Die KI erzeugt die Datei `index.html`. (Bei Weg 0: Code in eine Datei `index.html` kopieren.)

### Schritt 3 – Testen

Öffne `index.html` per Doppelklick im Browser. Prüfe:

- Kann ich eine Aufgabe eintippen und hinzufügen?
- Erscheint sie in der Liste?
- Wird sie beim Anklicken durchgestrichen?

### Schritt 4 – Nachsteuern

Beschreibe Wünsche oder Fehler **in Alltagssprache** – nicht den Code. Probiere nacheinander:

```text
Füge einen Button hinzu, der alle erledigten Aufgaben ausblendet.
```

```text
Die Karten sind auf dem Smartphone schlecht lesbar. Mach das Layout responsiv,
sodass es auf Handy und Desktop gut aussieht.
```

```text
Mach das Design ruhiger und professioneller. Verwende dezente Farben.
```

Nach jeder Änderung: **Browser neu laden** und erneut testen. Genau das ist der Vibe-Coding-Zyklus.

---

## Das Prompt-Rezept

Gute Prompts folgen einem einfachen Bauplan. Diese Vorlage liegt auch als
[material/prompt-vorlage.md](../material/prompt-vorlage.md) zum Kopieren bereit:

```text
Ich möchte per Vibe Coding ein kleines Projekt erstellen.

Ziel:
[Beschreibe, was am Ende funktionieren soll.]

Zielgruppe:
[Wer nutzt es?]

Wichtige Funktionen:
1. [...]
2. [...]
3. [...]

Technischer Rahmen:
[Webseite mit HTML/CSS/JavaScript]

Bitte erstelle eine einfache erste Version.
Erkläre kurz, wie ich sie starte.
Halte die Struktur übersichtlich.
Baue keine unnötige Komplexität ein.
```

---

## 🛠️ Praxis 2 (optional): Eine kleine Quiz-Seite

Wenn du Lust auf mehr hast, baue eine zweite Seite:

```text
Erstelle eine interaktive Webseite zum Thema "Vibe Coding". Sie soll haben:
eine Startansicht mit Titel, drei Infokarten mit kurzen Texten, und ein kleines
Quiz mit 3 Fragen, das am Ende die Punktzahl anzeigt. Modernes, ruhiges Design.
```

Ein **fertiges Beispiel** genau dieser Art liegt im Kurs unter
[`beispiele/webseite/`](../beispiele/webseite/) – öffne dort `index.html` im Browser und sieh
dir an, was möglich ist. (Es wurde selbst per Vibe Coding gebaut.)

> **Worauf achten?** Sinnvolle Checks für jede Webseite: Wird alles korrekt angezeigt?
> Funktionieren Buttons und Formulare? Sieht es auf dem Handy gut aus? Gibt es Fehler in der
> Browser-Konsole (F12)?

---

## 💡🎓 Hinweise

> 💡 **Für Schüler:** Trau dich, die Seite „kaputtzumachen". Bitte die KI um wilde Ideen –
> z. B. „mach einen Dark-Mode-Schalter" oder „lass es bei jedem Klick kurz wackeln". Du lernst
> am meisten, wenn du ausprobierst.

> 🎓 **Für Lehrkräfte:** Dieses Modul passt zum Einsatzszenario *„Prototypen für Projektarbeit"*
> (ab Klasse 7). Der Lerngewinn liegt im **Beschreiben** und **Testen der Nutzererfahrung** –
> nicht im Code. Eine Doppelstunde reicht für die To-do-Liste samt zwei Nachbesserungen.

---

## ✅ Selbstcheck

**1. In welchem Schritt beschreibst du einen Fehler – und wie formulierst du ihn?**

<details>
<summary>Lösung</summary>

Im Schritt **Nachsteuern**. Du beschreibst das **Verhalten/Problem** („abgehakte Aufgaben
verschwinden nicht"), nicht eine konkrete Codezeile.

</details>

**2. Wozu dienen HTML, CSS und JavaScript – grob?**

<details>
<summary>Lösung</summary>

HTML = Struktur/Inhalt, CSS = Aussehen/Design, JavaScript = Verhalten/Interaktivität.

</details>

**3. Warum ist eine Webseite ein guter Einstieg ins Vibe Coding?**

<details>
<summary>Lösung</summary>

Weil Änderungen **sofort im Browser sichtbar** werden – der Test-Schritt ist schnell und direkt.

</details>

---

## 📋 Aufgaben

> Abhaken speichert direkt in dieser Datei. In **MindGraph Notes** erscheinen diese Aufgaben automatisch im **Tasks**-Widget und am Fälligkeitstag im **Focus**. Übersicht & Kursfahrplan: [Aufgaben.md](../Aufgaben.md).

- [ ] Baue per Prompt eine To-do-Liste und öffne sie im Browser #kurs/modul-3 (@[[2026-06-30]])
- [ ] Steuere zweimal nach: erledigte Aufgaben ausblenden + Layout responsiv machen #kurs/modul-3 (@[[2026-06-30]])
- [ ] (Optional) Baue die Quiz-Seite und vergleiche sie mit `beispiele/webseite/` #kurs/modul-3 (@[[2026-06-30]])

---

⬅️ [Modul 2](02-werkzeug-einrichten.md) · 🏠 [Übersicht](../README.md) · ➡️ [Modul 4: Ein Python-Skript](04-python-skript.md)
