# Beispiel: Notiz-App (Electron)

Eine per Vibe Coding gebaute Desktop-Notiz-App: links die Notizliste, rechts ein Editor, Notizen
werden lokal gespeichert. Sie gehört zu [Modul 5](../../module/05-electron-app.md).

## Starten

Du brauchst **Node.js** ([nodejs.org](https://nodejs.org/)). Dann im Terminal in diesem Ordner:

```bash
npm install   # lädt einmalig die Abhängigkeiten (Electron) herunter
npm start     # startet die App
```

> Beim ersten Mal dauert `npm install` einen Moment. Der Ordner `node_modules` wird dabei
> erzeugt und ist bewusst **nicht** Teil des Repositories.

## Dateien

| Datei | Aufgabe |
|---|---|
| `package.json` | Projektinfos und Startbefehl (`npm start`) |
| `main.js` | Hauptprozess: erzeugt das Fenster, liest/schreibt Notiz-Dateien |
| `preload.js` | sichere Brücke zwischen Fenster und Hauptprozess |
| `index.html` | Oberfläche (Liste + Editor) |
| `renderer.js` | Verhalten im Fenster (Notizen anlegen, auswählen, speichern, löschen) |
| `styles.css` | Aussehen |

## Übung: Suchfunktion ergänzen

Die App hat noch **keine Suche**. In [Modul 5](../../module/05-electron-app.md) baust du sie per
Vibe Coding ein. Starte dazu opencode in diesem Ordner und beschreibe die gewünschte Funktion.
