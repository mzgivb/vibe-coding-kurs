# Modul 8 – Abläufe automatisieren mit Skills

🏠 [Kursübersicht](../README.md) · Modul 8 von 8

---

## 🎯 Lernziele

Nach diesem Modul kannst du …

- erklären, was ein **Skill** ist und wie er sich von einem **Befehl (Command)** unterscheidet,
- einen eigenen Skill als `SKILL.md` **anlegen** und in opencode nutzen,
- einen **Korrektur-Helfer** bauen, der Texte nach festen Kriterien strukturiert rückmeldet,
- einschätzen, **was du dabei automatisieren darfst – und was nicht** (Datenschutz).

⏱️ **Zeit:** ca. 35 Minuten · **Voraussetzungen:** [Modul 2](02-werkzeug-einrichten.md)
(opencode, Weg A oder B) sowie [Modul 6](06-sicherheit-datenschutz.md) (Datenschutz)

> Dieses Bonus-Modul richtet sich besonders an **Lehrkräfte**. Es zeigt, wie du
> **wiederkehrende Abläufe** – Korrektur, Unterrichtsvorbereitung, Formulierungen – einmal
> beschreibst und danach immer wieder abrufst, statt jedes Mal denselben langen Prompt zu tippen.

---

## Das Problem: immer wieder derselbe Prompt

Beim Vibe Coding hast du gemerkt: Ein guter Prompt ist oft lang. Du erklärst die Aufgabe, den
Rahmen, die Kriterien. Für ein einmaliges Projekt ist das okay. Aber als Lehrkraft machst du
**dieselbe Art Aufgabe immer wieder**:

- Schülertexte nach **denselben Kriterien** rückmelden,
- aus einem Thema einen **strukturierten Stundenentwurf** erzeugen,
- Aufgabenstellungen in **einfache Sprache** umschreiben.

Jedes Mal denselben Prompt neu zu tippen ist mühsam. Die Lösung: Du beschreibst den Ablauf
**einmal** und gibst ihm einen Namen. Genau dafür gibt es **Skills** und **Befehle**.

---

## Skill oder Befehl? Der Unterschied

opencode kennt zwei Wege, einen Ablauf wiederverwendbar zu machen:

| | **Befehl** (Command) | **Skill** |
|---|---|---|
| Aufruf | **Du** tippst `/name` | Die **KI lädt ihn selbst**, wenn die Aufgabe passt |
| Gut für | klar abgegrenzte, von dir gestartete Schritte | Wissen/Regeln, die je nach Situation greifen |
| Datei | `commands/name.md` | `skills/name/SKILL.md` |
| Erkennung | sofort | über die `description` im Frontmatter |

**Faustregel:** Willst du einen Ablauf **bewusst per Kommando starten**, nimm einen Befehl.
Willst du der KI **eine dauerhafte Fähigkeit beibringen**, die sie bei passenden Aufgaben von
selbst nutzt, nimm einen Skill. In diesem Modul bauen wir einen **Skill** – er lässt sich
zusätzlich auch wie ein Befehl manuell aufrufen (er taucht im Menü mit `:skill` auf).

> 💡 **Merksatz:** Ein **Befehl** ist ein gespeicherter Prompt, den *du* abschickst. Ein **Skill**
> ist Wissen, das die *KI* heranzieht, wenn es zur Aufgabe passt.

---

## Wie ein Skill aufgebaut ist

Ein Skill ist nichts weiter als **ein Ordner mit einer Datei `SKILL.md`** darin. Der Ordnername
ist der Name des Skills. Die Datei beginnt mit einem kleinen **Frontmatter** (Angaben zwischen
zwei `---`-Zeilen), danach folgt die eigentliche Anleitung in normaler Sprache.

```text
korrektur-helfer/
└── SKILL.md
```

```markdown
---
name: korrektur-helfer
description: Gibt strukturiertes Feedback zu Schülertexten nach festen Kriterien. Nutzen, wenn ein Text rückgemeldet werden soll – ohne Note.
---

## Was ich tue
- Ich gebe Feedback zu einem Text entlang fester Kriterien.
- Ich vergebe **keine Note**, sondern beschreibe Stärken und konkrete nächste Schritte.
```

Wichtig sind nur zwei Frontmatter-Felder:

- **`name`** – muss dem Ordnernamen entsprechen (nur Kleinbuchstaben, Ziffern, Bindestriche).
- **`description`** – woran die KI erkennt, **wann** sie den Skill laden soll. Je klarer hier
  steht „wann nutzen", desto zuverlässiger greift der Skill.

**Wohin kommt der Ordner?** opencode sucht u. a. an diesen Orten (der erste reicht für uns):

| Ort | Gilt für |
|---|---|
| `~/.config/opencode/skills/<name>/SKILL.md` | **alle** deine Projekte (global) |
| `.opencode/skills/<name>/SKILL.md` | nur das aktuelle Projekt |
| `.claude/skills/<name>/SKILL.md` | auch, falls du Claude Code nutzt (kompatibel) |

Für Korrektur und Vorbereitung willst du den Skill **überall** verfügbar haben – wir legen ihn
deshalb **global** an (`~/.config/opencode/...`).

---

## 🛠️ Praxis: Der Korrektur-Helfer

Wir bauen einen Skill, der einen Schülertext nach festen Kriterien rückmeldet – **konstruktiv,
ohne Note, ohne echte personenbezogene Daten.**

### Schritt 0 – Den sicheren Spielplatz vorbereiten

> 🎓 **Zuerst Datenschutz (Pflicht).** Gib **niemals echte, zuordenbare Schülertexte oder Namen**
> in die KI ein – erst recht nicht in der Cloud (Weg A). Arbeite mit **anonymisierten** oder
> **erfundenen** Beispieltexten. Wenn du auf echte Texte willst, brauchst du den **Offline-Weg B
> (Ollama)** und musst die Vorgaben deiner Schule beachten. Hintergrund: [Modul 6](06-sicherheit-datenschutz.md).

Lege einen Übungsordner an und darin einen **erfundenen** Beispieltext:

```bash
mkdir ~/korrektur-uebung && cd ~/korrektur-uebung
```

Erstelle in diesem Ordner eine Datei `beispiel-text.txt` mit einem ausgedachten Schüleraufsatz
(z. B. 8–12 Sätze). Du kannst opencode auch bitten, dir einen typischen Beispieltext mit ein
paar bewusst eingebauten Schwächen zu erzeugen.

### Schritt 1 – Den Skill anlegen (per Vibe Coding)

Du musst die Datei nicht von Hand schreiben – lass sie dir von opencode anlegen. Starte opencode
und gib diesen Prompt:

> Lege die Datei `~/.config/opencode/skills/korrektur-helfer/SKILL.md` an (Ordner bei Bedarf
> erstellen). Sie soll ein Frontmatter mit `name: korrektur-helfer` und einer `description`
> enthalten, die beschreibt: „Gibt strukturiertes Feedback zu Schülertexten nach festen
> Kriterien – ohne Note. Nutzen, wenn ein Text rückgemeldet werden soll." Danach folgt eine
> Anleitung für dich selbst als KI mit genau diesen Regeln:
>
> 1. Gib Feedback entlang von vier Kriterien: **Inhalt & Idee**, **Aufbau & roter Faden**,
>    **Sprache & Stil**, **Rechtschreibung & Grammatik**.
> 2. Nenne pro Kriterium zuerst **eine konkrete Stärke**, dann **einen konkreten nächsten Schritt**.
> 3. Belege Hinweise mit **kurzen Zitaten** aus dem Text.
> 4. Vergib **keine Note** und keine Punkte.
> 5. Schreibe in **wertschätzender Du-Anrede**, die ein Kind der Sekundarstufe I versteht.
> 6. Schließe mit **einer einzigen** wichtigsten Empfehlung ab.

opencode legt nun den Ordner und die `SKILL.md` an. Schau dir die Datei an – du kannst die
Kriterien jederzeit selbst anpassen.

### Schritt 2 – opencode neu starten

Damit ein **neuer** Skill erkannt wird, beende opencode (`/exit`) und starte es neu. Neue oder
geänderte Skills werden erst nach einem Neustart geladen.

### Schritt 3 – Den Skill anwenden

Wechsle in deinen Übungsordner, starte opencode und gib:

> Gib mir Feedback zu @beispiel-text.txt

Weil deine Aufgabe zur `description` des Skills passt, **lädt opencode den Korrektur-Helfer von
selbst** und gibt das Feedback nach deinen Kriterien zurück. (Falls das Modell den Skill nicht
automatisch zieht, kannst du ihn im `/`-Menü auch direkt als `korrektur-helfer` aufrufen.)

> 💡 Das `@` vor dem Dateinamen sagt opencode: „Nimm den Inhalt dieser Datei in den Prompt auf."

### Schritt 4 – Nachsteuern (wie immer beim Vibe Coding)

Passt die Rückmeldung nicht? Du änderst **nicht** das Ergebnis, sondern den **Skill**:

- „Das Feedback ist zu lang – fasse jedes Kriterium in höchstens zwei Sätzen."
- „Ergänze ein Kriterium **Fachsprache** für meinen Biologie-Unterricht."
- „Formuliere noch ermutigender."

Öffne die `SKILL.md`, lass opencode die Regeln anpassen, **neu starten**, erneut testen. Genau
der 4-Schritte-Zyklus aus [Modul 1](01-was-ist-vibe-coding.md) – nur auf deinen Arbeitsablauf
angewandt.

---

## 💡🎓 Hinweise

> 🎓 **Für Lehrkräfte – verlässlich, aber nicht blind.** Ein Skill macht das Feedback
> **gleichmäßiger** (alle Texte nach denselben Kriterien) und **schneller**. Aber: Die KI kann
> Inhalte missverstehen oder Lob/Kritik danebenlegen. Die **fachliche Letztverantwortung und die
> Note bleiben bei dir.** Nutze den Korrektur-Helfer als *ersten Entwurf*, den du prüfst und
> anpasst – nie als automatische Bewertung.

> 🎓 **Modell-Hinweis.** Skills funktionieren am zuverlässigsten mit **leistungsfähigen Modellen**
> (Weg A: DeepSeek V4 Flash Free). Sehr kleine lokale Modelle (Weg B, z. B. das 3b-Modell)
> ziehen Skills nicht immer von selbst – dann den Skill manuell aufrufen oder ein größeres Modell
> verwenden.

> 💡 **Für Schüler:** Auch für dich nützlich! Bau dir einen Skill, der deine eigenen Texte vor der
> Abgabe gegencheckt – oder einen, der dir Mathe-Lösungswege **erklärt statt verrät**. Beschreibe
> die Regeln in der `SKILL.md` so, dass die KI dir hilft zu lernen, nicht nur abzuschreiben.

> 💡 **Weiterspinnen.** Nach demselben Muster baust du weitere Helfer: einen **Stunden-Planer**
> (Thema + Klasse → Stundenentwurf), einen **Einfache-Sprache-Helfer** (Text → barrierearme
> Fassung) oder einen **Elternbrief-Helfer**. Ein Ordner, eine `SKILL.md`, eine klare
> `description` – fertig.

---

## ✅ Selbstcheck

**1. Was ist der Kernunterschied zwischen einem Befehl und einem Skill?**

<details>
<summary>Lösung</summary>

Einen **Befehl** startest **du** bewusst mit `/name`. Einen **Skill** lädt die **KI selbst**,
wenn die Aufgabe zur `description` des Skills passt.

</details>

**2. Wo legst du einen Skill ab, der in *allen* Projekten verfügbar sein soll – und wie heißt die Datei?**

<details>
<summary>Lösung</summary>

Global unter `~/.config/opencode/skills/<name>/SKILL.md`. Der Ordnername ist der Skill-Name,
die Datei heißt immer **`SKILL.md`**.

</details>

**3. Du hast die `SKILL.md` geändert, aber opencode verhält sich unverändert. Was fehlt?**

<details>
<summary>Lösung</summary>

Der **Neustart**: Neue oder geänderte Skills werden erst geladen, wenn du opencode beendest
(`/exit`) und neu startest.

</details>

**4. Warum dürfen keine echten Schülertexte in die Cloud-KI (Weg A)?**

<details>
<summary>Lösung</summary>

Es sind **personenbezogene Daten**. In der Cloud verlassen sie deinen Rechner. Nutze
anonymisierte/erfundene Texte – für echte Texte nur den **Offline-Weg B** und nach den Vorgaben
deiner Schule (siehe [Modul 6](06-sicherheit-datenschutz.md)).

</details>

---

## 🎉 Geschafft – der ganze Kurs!

Das war das letzte Modul. Du hast nicht nur gelernt, **mit** KI zu bauen, sondern auch, **dir
selbst Werkzeuge zu bauen**, die dir Arbeit abnehmen. Die drei Kernbotschaften zum Mitnehmen:

1. **Vibe Coding senkt die Einstiegshürde** – jeder kann mit KI etwas bauen.
2. **Testen, Beurteilen und kritisches Denken** bleiben menschliche Kernkompetenzen –
   besonders bei der Korrektur.
3. Mit **Skills** wird aus dem einmaligen Prompt ein **dauerhafter Helfer** für deinen Alltag.

**Wie weiter?**
- Stöbere im [Cheat-Sheet](../material/cheat-sheet.md) und in den [Beispielprojekten](../beispiele/).
- Baue dir einen zweiten Skill für deinen häufigsten Arbeitsablauf.
- **Lehrkräfte:** Ein Vertiefungsworkshop ist auf Anfrage möglich.

---

## Kontakt

**Medienzentrum Gießen-Vogelsberg** · [medienzentrum-giessen-vogelsberg.de](https://medienzentrum-giessen-vogelsberg.de/)
· [jochen.leeder@mzgivb.de](mailto:jochen.leeder@mzgivb.de)

---

## 📋 Aufgaben

> Abhaken speichert direkt in dieser Datei. In **MindGraph Notes** erscheinen diese Aufgaben automatisch im **Tasks**-Widget und am Fälligkeitstag im **Focus**. Übersicht & Kursfahrplan: [Aufgaben.md](../Aufgaben.md).

- [ ] Lege den Skill `korrektur-helfer` als `SKILL.md` an und starte opencode neu #kurs/modul-8 (@[[2026-07-13]])
- [ ] 🎓 Teste den Skill mit einem **anonymisierten/erfundenen** Beispieltext #kurs/modul-8 (@[[2026-07-13]])
- [ ] 🎓 Passe die Kriterien in der `SKILL.md` an dein Fach an und teste erneut #kurs/modul-8 (@[[2026-07-13]])

---

⬅️ [Modul 7](07-reflexion-bewertung-unterricht.md) · 🏠 [Übersicht](../README.md)
