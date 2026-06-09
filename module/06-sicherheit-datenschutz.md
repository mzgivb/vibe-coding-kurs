# Modul 6 – Sicherheit, Datenschutz & kritische Reflexion

🏠 [Kursübersicht](../README.md) · Modul 6 von 7

---

## 🎯 Lernziele

Nach diesem Modul kannst du …

- die wichtigsten **Datenschutzregeln** beim Einsatz von KI-Werkzeugen nennen,
- eine **Sicherheits-Checkliste** auf eigene Projekte anwenden,
- KI-generierten Code **kritisch beurteilen**, statt ihm blind zu vertrauen.

⏱️ **Zeit:** ca. 30 Minuten · **Voraussetzungen:** [Modul 1](01-was-ist-vibe-coding.md)–[5](05-electron-app.md)

---

## Warum dieses Modul wichtig ist

Vibe Coding ist niedrigschwellig – aber genau das ist auch die Gefahr: Man übernimmt Code, den
man nicht vollständig versteht. Die wichtigste Kompetenz, die dieser Kurs vermitteln will:

> **Nicht blind vertrauen, was die KI ausgibt – sondern prüfen, hinterfragen und verbessern.**

---

## Datenschutz: Diese Regeln gelten immer

1. **Keine personenbezogenen Daten in Prompts.** Niemals echte Namen, Adressen, Noten oder
   andere persönliche Daten in einen KI-Chat schreiben.
2. **Tools datenschutzbewusst wählen.** ChatGPT und Claude sind US-Anbieter. Für die schulische
   Nutzung ist eine **Datenschutz-Folgenabschätzung** nötig; prüfe DSGVO-konforme Alternativen
   (auch europäische Anbieter). Der **Offline-Weg** (Ollama, [Modul 2](02-werkzeug-einrichten.md))
   hält Daten lokal.
3. **Altersgrenzen beachten.** ChatGPT: ab 13 Jahren (mit Elternzustimmung), Claude: ab 18.
   Für jüngere Lernende das KI-Tool **nur über die Lehrkraft** nutzen (Frontal-Demo).
4. **Keine sensiblen Dokumente hochladen.** Keine Klassenarbeiten, Förderpläne, Elternbriefe.
5. **Keine Zugangsdaten oder API-Keys** in Prompts schreiben.

---

## Sicherheits-Checkliste für eigene Projekte

Hake das vor der Nutzung kurz ab:

- [ ] Keine echten (Schüler-)Daten in KI-Chats eingegeben.
- [ ] Bei Datei-Operationen (Python) zuerst mit **Kopien** getestet.
- [ ] Generierten Code **überflogen** – tut er, was er soll? Macht er nichts Unerwartetes?
- [ ] Keine Zugangsdaten / API-Keys im Code oder im Prompt.
- [ ] Bei Unsicherheit: Code von einer Person mit Programmiererfahrung prüfen lassen.

> Generierter Code kann **versteckte externe Abhängigkeiten** oder unsichere Praktiken
> enthalten. Vor dem Einsatz – besonders im Unterricht – immer selbst kurz testen.

---

## Kritische Analyse von KI-Code

KI-Code sieht oft überzeugend aus – das heißt aber nicht, dass er gut ist. Diese **Leitfragen**
helfen dir, ein Ergebnis einzuordnen:

- Ist der Code **korrekt**? Woran erkenne ich das (Test!)?
- Gibt es **Sicherheitslücken**?
- Verstehe ich **jede Zeile**? Falls nicht – ist das ein Problem?
- Würde ich diesen Code in einer **echten Anwendung** einsetzen?
- Welche **ethischen Fragen** wirft KI-generierter Code auf (Urheberschaft, Haftung, Transparenz)?

---

## 🛠️ Praxis: Zwei Lösungen vergleichen

Lass dir dieselbe Aufgabe von **zwei** KI-Werkzeugen (oder zweimal mit anderem Prompt) lösen:

```text
Schreibe ein Python-Skript, das ein sicheres, zufälliges Passwort erzeugt.
Erkläre kurz, wie sicher es ist und warum.
```

Vergleiche die beiden Ergebnisse anhand der Leitfragen:

- Welches ist **sicherer**? Woran machst du das fest?
- Welches ist **besser lesbar**?
- Welches würdest du **wirklich** einsetzen – und warum?

<details>
<summary>💡 Worauf du achten kannst</summary>

Ein sicheres Passwort-Skript nutzt in Python z. B. das Modul `secrets` (kryptografisch sicher),
**nicht** das einfache `random`. Eine gute Antwort erklärt außerdem Länge und Zeichenvorrat.
Wenn eine KI „random" benutzt oder die Sicherheit nicht begründet, ist Skepsis angebracht – ein
gutes Beispiel dafür, dass plausibel aussehender Code nicht automatisch gut ist.

</details>

---

## 💡🎓 Hinweise

> 💡 **Für Schüler:** Frag die KI ruhig: *„Ist dieser Code sicher? Was könnte schiefgehen?"* –
> und prüfe ihre Antwort kritisch. Auch die KI kann sich irren.

> 🎓 **Für Lehrkräfte:** Dieses Modul deckt das Szenario *„Medienkritische Analyse von
> KI-generiertem Code"* ab (Oberstufe) und verbindet sich mit **Ethik/Philosophie** und
> **Politik & Wirtschaft**. Die Leitfragen eignen sich direkt als Diskussions- oder
> Arbeitsauftrag. Datenschutz sollte **von Anfang an** mitgedacht, nicht nachgereicht werden.

---

## ✅ Selbstcheck

**1. Nenne drei Dinge, die niemals in einen KI-Prompt gehören.**

<details>
<summary>Lösung</summary>

Personenbezogene Daten (Namen, Noten, Adressen), sensible Dokumente (Klassenarbeiten,
Förderpläne) und Zugangsdaten/API-Keys.

</details>

**2. KI-Code läuft fehlerfrei. Heißt das, er ist sicher und gut?**

<details>
<summary>Lösung</summary>

Nein. „Läuft ohne Fehler" heißt nur, dass es keinen Absturz gab – nicht, dass der Code korrekt,
sicher und sinnvoll ist. Man muss das Ergebnis inhaltlich prüfen (Leitfragen) und auf
Sicherheitslücken achten.

</details>

**3. Warum ist der Offline-Weg (Ollama) aus Datenschutzsicht interessant?**

<details>
<summary>Lösung</summary>

Weil das Modell lokal auf dem eigenen Gerät läuft – die eingegebenen Daten verlassen den
Rechner nicht und gehen nicht an einen Cloud-Anbieter.

</details>

---

⬅️ [Modul 5](05-electron-app.md) · 🏠 [Übersicht](../README.md) · ➡️ [Modul 7: Reflexion & Unterricht](07-reflexion-bewertung-unterricht.md)
