# Modul 4 – Ein Python-Skript

🏠 [Kursübersicht](../README.md) · Modul 4 von 8

---

## 🎯 Lernziele

Nach diesem Modul kannst du …

- eine wiederkehrende Aufgabe als **Python-Skript** automatisieren lassen,
- dir ein Skript **erklären lassen, bevor** du es ausführst (Verstehens-Check als Sicherheitsprüfung),
- ein Skript ausführen und seine **Ausgabe** prüfen,
- die besonderen **Sicherheitsregeln** bei Dateioperationen anwenden.

⏱️ **Zeit:** ca. 45 Minuten · **Voraussetzungen:** [Modul 2](02-werkzeug-einrichten.md), Python
installiert (`python3 --version`)

---

## Wofür Python?

Webseiten sind sichtbar – Python ist **nützlich im Hintergrund**. Mit kleinen Skripten lassen
sich lästige, wiederkehrende Aufgaben automatisieren:

- Dateien umbenennen oder sortieren
- Texte zählen oder zusammenfassen
- Daten aus einer Tabelle auswerten
- Messwerte verarbeiten

Beim Vibe Coding beschreibst du die Aufgabe – die KI schreibt das Skript.

> ⚠️ **Achtung, neue Gefahr:** Python kann **Dateien auf deinem Rechner verändern oder löschen**.
> Eine Webseite kann das nicht. Deshalb gilt hier eine goldene Regel:
> **Teste jedes Skript, das Dateien anfasst, zuerst mit Kopien – nie mit deinen echten Daten.**

---

## 🛠️ Praxis: Dateien automatisch umbenennen

### Vorbereitung – ein sicherer Spielplatz

Lege zuerst einen **Test-Ordner** mit ein paar harmlosen Dateien an, damit nichts Wichtiges
passieren kann:

```bash
mkdir ~/python-test && cd ~/python-test
echo "Notiz 1" > notiz1.txt
echo "Notiz 2" > notiz2.txt
echo "Notiz 3" > notiz3.txt
```

### Schritt 1 – Beschreiben

Gib deinem Werkzeug diesen Prompt:

```text
Schreibe ein Python-Skript namens umbenennen.py, das alle .txt-Dateien im
aktuellen Ordner in .md-Dateien umbenennt. Wichtig: Lösche oder überschreibe
keine vorhandenen .md-Dateien. Gib für jede Datei aus, was du tust, und frage
vor dem Umbenennen einmal nach, ob ich fortfahren möchte.
```

### Schritt 2 – Generieren lassen

Die KI erzeugt `umbenennen.py`. (Weg 0: Code in eine Datei `umbenennen.py` kopieren.)

> 🧠 **Verstehens-Check – hier sogar Pflicht:** Bevor du das Skript startest, sage zuerst
> selbst, was es deiner Erwartung nach gleich tun wird. Frage dann:
>
> ```text
> Erkläre mir Schritt für Schritt, was umbenennen.py mit den Dateien in meinem
> Ordner macht. Was würde passieren, wenn dort schon eine .md-Datei liegt?
> ```
>
> Bei einer Webseite ist der Verstehens-Check eine Lernhilfe – bei einem Skript, das
> **Dateien verändert**, ist er zusätzlich deine **Sicherheitsprüfung**
> ([Modul 6](06-sicherheit-datenschutz.md)). Erst wenn die Erklärung zu deiner Erwartung
> passt, geht es weiter.

### Schritt 3 – Ausführen

```bash
python3 umbenennen.py
```

### Schritt 4 – Ausgabe prüfen

- Läuft das Skript **ohne Fehler**?
- Heißen die Dateien jetzt `notiz1.md`, `notiz2.md`, …?
- Wurde **nichts Unerwartetes** verändert?

Klappt etwas nicht, beschreibe es:

```text
Das Skript findet keine Dateien, obwohl .txt-Dateien im Ordner liegen.
Bitte prüfe den Pfad und mach ihn robuster.
```

### Schritt 5 – Bedienung verbessern (optional)

```text
Ergänze eine Möglichkeit, den Zielordner beim Start anzugeben,
statt immer den aktuellen Ordner zu nehmen.
```

---

## Sicherheit & Nachvollziehbarkeit

Bei Skripten, die Dateien anfassen, lohnt sich ein kurzer Blick auf diese Punkte – frag die KI
ruhig danach:

- **Nichts ungefragt löschen oder überschreiben.**
- **Klare Fehlermeldungen** statt stiller Abstürze.
- **Erst mit Kopien testen**, dann auf echte Daten loslassen.
- Bei Unsicherheit: *„Erkläre mir Zeile für Zeile, was dieses Skript mit meinen Dateien macht."*

> Vibe Coding heißt nicht „blind vertrauen". Gerade bei Python prüfst du **vorher**, ob ein
> Skript etwas Unumkehrbares tut.

---

## 🎓 Varianten für dein Fach (und dein Lehrerzimmer)

Dasselbe Vorgehen, andere lästige Aufgabe – fertige Prompts zum Austauschen:

```text
Schreibe ein Python-Skript notenschluessel.py: Ich gebe die maximale Punktzahl
ein, und es gibt mir als Tabelle aus, welche Punktzahl welcher Note entspricht.
Die Prozentgrenzen sollen oben im Skript stehen, damit ich sie anpassen kann.
```

```text
Schreibe ein Python-Skript sortiere_material.py, das in einem Ordner alle
Dateien nach Typ in Unterordner sortiert (PDF, Bilder, Word). Zeige erst an,
was verschoben würde, und frage dann nach. Lösche und überschreibe nichts.
```

```text
Schreibe ein Python-Skript auswertung.py, das eine CSV-Datei mit erfundenen
Testergebnissen einliest (Spalten: Name, Punkte) und Durchschnitt, beste und
schlechteste Punktzahl sowie eine einfache Notenverteilung ausgibt.
```

> ⚠️ Wie immer: mit **Kopien und erfundenen Daten** testen – keine echten Schülerdaten in
> Cloud-KIs ([Modul 6](06-sicherheit-datenschutz.md)).

---

## 💡🎓 Hinweise

> 💡 **Für Schüler:** Überlege, welche Aufgabe sich in deinem (Schul-)Alltag ständig wiederholt –
> z. B. Dateien sortieren, Wörter zählen, eine Vokabelliste mischen. Lass dir genau dafür ein
> Skript bauen. Nützliche Werkzeuge zu bauen macht am meisten Spaß.

> 🎓 **Für Lehrkräfte:** Dieses Modul passt zum Szenario *„Automatisierung von Alltagsaufgaben"*
> (ab Klasse 7) und lässt sich gut mit **Mathematik** (Datenauswertung) oder
> **Naturwissenschaften** (Messdaten) verbinden. Die Sicherheitsregel zu Dateioperationen ist
> ein wichtiger Lernanlass für **verantwortungsvollen Umgang**.

---

## ✅ Selbstcheck

**1. Was ist die wichtigste Sicherheitsregel bei Python-Skripten, die Dateien verändern?**

<details>
<summary>Lösung</summary>

Zuerst mit **Kopien** testen, nie direkt mit den echten Daten. Das Skript darf nichts ungefragt
löschen oder überschreiben.

</details>

**2. Wie führst du ein Skript namens `umbenennen.py` aus?**

<details>
<summary>Lösung</summary>

Im Terminal im richtigen Ordner: `python3 umbenennen.py`

</details>

**3. Du bist unsicher, ob ein Skript gefährlich ist. Was tust du?**

<details>
<summary>Lösung</summary>

Es **nicht** auf echte Daten loslassen, sondern die KI bitten, Zeile für Zeile zu erklären, was
es mit den Dateien macht – und zuerst in einem Test-Ordner ausprobieren.

</details>

---

## 📋 Aufgaben

> Abhaken speichert direkt in dieser Datei. In **MindGraph Notes** erscheinen diese Aufgaben automatisch im **Tasks**-Widget und am Fälligkeitstag im **Focus**. Übersicht & Kursfahrplan: [Aufgaben.md](../Aufgaben.md).

- [ ] Lege einen Test-Ordner mit ein paar `.txt`-Dateien an (sicherer Spielplatz) #kurs/modul-4 (@[[2026-07-02]])
- [ ] Lass dir `umbenennen.py` schreiben und **erklären**, bevor du es startest (Verstehens-Check) #kurs/modul-4 (@[[2026-07-02]])
- [ ] Führe das Skript im Test-Ordner aus und prüfe das Ergebnis #kurs/modul-4 (@[[2026-07-02]])
- [ ] Verbessere das Skript: Zielordner beim Start angeben können #kurs/modul-4 (@[[2026-07-02]])

---

⬅️ [Modul 3](03-erste-webseite.md) · 🏠 [Übersicht](../README.md) · ➡️ [Modul 5: Eine Desktop-App](05-electron-app.md)
