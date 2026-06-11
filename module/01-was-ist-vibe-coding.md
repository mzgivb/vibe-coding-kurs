# Modul 1 – Was ist Vibe Coding?

🏠 [Kursübersicht](../README.md) · Modul 1 von 8

---

## 🎯 Lernziele

Nach diesem Modul kannst du …

- in eigenen Worten erklären, was „Vibe Coding" bedeutet,
- den **4-Schritte-Zyklus** beschreiben, nach dem Vibe Coding funktioniert,
- erklären, warum sich beim Programmieren mit KI die wichtigen Fähigkeiten **verschieben**,
- Vibe Coding von „AI-Assisted Engineering" unterscheiden.

⏱️ **Zeit:** ca. 20 Minuten · **Voraussetzungen:** keine

---

## Die Grundidee

Beim klassischen Programmieren schreibt ein Mensch jede Codezeile selbst. Beim **Vibe Coding**
drehst du das um:

> Du **beschreibst in Alltagssprache**, was eine Anwendung tun soll – die **KI schreibt den Code**.
> Du **testest** das Ergebnis und sagst der KI, was sich ändern soll.

Der Begriff stammt von **Andrej Karpathy** (Anfang 2025). Er beschrieb es so, dass man „die
Existenz von Code fast vergisst" und sich nur noch auf das **Ergebnis** konzentriert:

> *„I just vibe. I'm not really writing code."*

Du gehst also bewusst „mit dem Vibe": Du nimmst Vorschläge der KI an, lässt Fehler von ihr
beheben – ohne jede einzelne Zeile selbst zu verstehen.

---

## Der 4-Schritte-Zyklus

Vibe Coding läuft fast immer nach demselben Muster ab. Diesen Zyklus wirst du in allen
Praxis-Modulen wiedererkennen:

| Schritt | Was du tust |
|---|---|
| **1. Beschreiben** | Formuliere in natürlicher Sprache, was die Anwendung können soll. |
| **2. Generieren lassen** | Die KI erzeugt eine erste Version des Codes. |
| **3. Testen** | Ergebnis ausführen/öffnen und prüfen: *Tut es, was es soll?* |
| **4. Nachsteuern** | Fehler oder Wünsche beschreiben – nicht den Code debuggen, sondern das **Verhalten** korrigieren. Dann zurück zu Schritt 2. |

```
   ┌─────────────────────────────────────────────┐
   │                                             ▼
1. Beschreiben → 2. Generieren → 3. Testen → 4. Nachsteuern
```

Das Entscheidende: In Schritt 4 beschreibst du **das Problem**, nicht die Lösung. Statt
„ändere Zeile 12" sagst du: *„Die Suche findet keine Treffer, wenn ich groß schreibe –
mach das bitte egal."*

---

## Eine Verschiebung, kein Verlust

Wenn die KI den Code schreibt, ändert sich die wichtigste Frage:

> Nicht mehr: *„Kannst du eine Schleife programmieren?"*
> Sondern: *„Kannst du beschreiben, was die Anwendung tun soll, das Ergebnis kritisch prüfen
> und Schritt für Schritt verbessern?"*

Das ist **keine** Entwertung des Programmierens, sondern eine **Kompetenzverschiebung**:

- **Weg von:** Syntax auswendig kennen, Algorithmen aus dem Kopf schreiben.
- **Hin zu:** ein Problem klar beschreiben, testen, kritisch beurteilen, in Schritten verbessern.

---

## Vibe Coding ist nicht für alles geeignet

Vibe Coding ist großartig für **Prototypen, persönliche Werkzeuge und schnelles Ausprobieren**.
Kritisch wird es bei „echter" Software, die andere Menschen produktiv nutzen: Ohne sorgfältige
Prüfung entstehen schnell versteckte Fehler und Sicherheitslücken. Deshalb unterscheidet man:

| | **Vibe Coding** | **AI-Assisted Engineering** |
|---|---|---|
| **Wofür?** | Prototypen, Experimente, persönliche Tools | Produktive Software, Teamprojekte |
| **Verantwortung?** | Die KI macht den Code | Der Mensch behält Kontrolle und prüft (Review) |
| **Risiko?** | Versteckte Fehler, Sicherheitslücken | Aufwändiger, braucht mehr Fachwissen |

In diesem Kurs bleiben wir bewusst im Bereich **Vibe Coding** – kleine, sichtbare Projekte zum
Lernen. Worauf man bei der Sicherheit achten muss, klärt [Modul 6](06-sicherheit-datenschutz.md).

---

## 🎬 Video zum Einstieg

Ein gut erklärtes Video zum Thema (öffnet auf YouTube):

[![Video: Vibe Coding erklärt](https://img.youtube.com/vi/NgDibn4zL_4/hqdefault.jpg)](https://www.youtube.com/watch?v=NgDibn4zL_4)

---

## 🛠️ Praxis: Kein Code – nur Beobachten

Du brauchst noch kein Werkzeug. Lies diesen kurzen Dialog und ordne jede Zeile einem der vier
Schritte zu:

> **Mensch:** „Bau mir eine Webseite mit einer To-do-Liste, bei der ich Aufgaben abhaken kann."
> **KI:** *(erzeugt die Datei `index.html`)*
> **Mensch:** *(öffnet die Datei im Browser und klickt herum)* „Hmm, abgehakte Aufgaben bleiben
> sichtbar."
> **Mensch:** „Lass abgehakte Aufgaben durchgestrichen und etwas blasser erscheinen."
> **KI:** *(ändert den Code)*

**Aufgabe:** Welche Zeile ist *Beschreiben*, welche *Generieren*, welche *Testen*, welche
*Nachsteuern*?

<details>
<summary>✅ Lösung anzeigen</summary>

1. „Bau mir eine Webseite …" → **Beschreiben**
2. „(erzeugt `index.html`)" → **Generieren lassen**
3. „(öffnet im Browser, klickt herum) Hmm, abgehakte Aufgaben bleiben sichtbar." → **Testen**
4. „Lass abgehakte Aufgaben durchgestrichen … erscheinen." → **Nachsteuern** (Verhalten
   beschrieben, nicht Code) → danach wieder **Generieren**.

</details>

---

## 💡🎓 Hinweise

> 💡 **Für Schüler:** Du musst nicht „gut in Mathe" oder „ein Computer-Nerd" sein, um mit
> Vibe Coding etwas zu bauen. Wichtig ist, dass du **genau beschreiben** kannst, was du willst –
> und neugierig genug bist, Dinge auszuprobieren.

> 🎓 **Für Lehrkräfte:** Die Kompetenzverschiebung ist der didaktische Kern. Bewertet werden
> sollte später **nicht die Code-Qualität**, sondern der Prozess: Problembeschreibung, Testen,
> Iteration, kritische Reflexion. Mehr dazu in [Modul 7](07-reflexion-bewertung-unterricht.md).

---

## ✅ Selbstcheck

**1. Was ist der Kern von Vibe Coding in einem Satz?**

<details>
<summary>Lösung</summary>

Man beschreibt in natürlicher Sprache, was eine Anwendung tun soll; die KI schreibt den Code,
den man dann testet und durch weiteres Beschreiben verbessert.

</details>

**2. Nenne die vier Schritte des Zyklus in der richtigen Reihenfolge.**

<details>
<summary>Lösung</summary>

1. Beschreiben → 2. Generieren lassen → 3. Testen → 4. Nachsteuern (und zurück zu 2).

</details>

**3. Warum ist Vibe Coding eher für Prototypen als für Produktionssoftware geeignet?**

<details>
<summary>Lösung</summary>

Weil ohne sorgfältige Prüfung (Review) leicht versteckte Fehler und Sicherheitslücken entstehen.
Für produktive Software braucht es „AI-Assisted Engineering", bei dem der Mensch die volle
Verantwortung für Architektur und Qualität behält.

</details>

---

## 📋 Aufgaben

> Abhaken speichert direkt in dieser Datei. In **MindGraph Notes** erscheinen diese Aufgaben automatisch im **Tasks**-Widget und am Fälligkeitstag im **Focus**. Übersicht & Kursfahrplan: [Aufgaben.md](../Aufgaben.md).

- [ ] Formuliere für dich in zwei Sätzen, was Vibe Coding ist #kurs/modul-1 (@[[2026-06-24]])
- [ ] Ordne den Beispiel-Dialog (oben) den vier Schritten zu #kurs/modul-1 (@[[2026-06-24]])
- [ ] Schau das Einstiegsvideo zum Thema #kurs/modul-1 (@[[2026-06-24]])

---

⬅️ [Zurück zur Übersicht](../README.md) · 🏠 [Übersicht](../README.md) · ➡️ [Modul 2: Werkzeug einrichten](02-werkzeug-einrichten.md)
