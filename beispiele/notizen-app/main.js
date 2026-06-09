const { app, BrowserWindow, ipcMain } = require('electron');
const path = require('path');
const fs = require('fs');

const notesDir = path.join(app.getPath('userData'), 'notes');

function ensureNotesDir() {
  if (!fs.existsSync(notesDir)) {
    fs.mkdirSync(notesDir, { recursive: true });
  }
}

function listNotes() {
  ensureNotesDir();
  return fs.readdirSync(notesDir)
    .filter(f => f.endsWith('.txt'))
    .map(f => ({ id: f, title: f.replace('.txt', '') }))
    .sort((a, b) => a.title.localeCompare(b.title, 'de'));
}

function readNote(filename) {
  const filePath = path.join(notesDir, filename);
  if (!fs.existsSync(filePath)) return '';
  return fs.readFileSync(filePath, 'utf-8');
}

function writeNote(filename, content) {
  ensureNotesDir();
  const filePath = path.join(notesDir, filename);
  fs.writeFileSync(filePath, content, 'utf-8');
}

function deleteNote(filename) {
  const filePath = path.join(notesDir, filename);
  if (fs.existsSync(filePath)) {
    fs.unlinkSync(filePath);
  }
}

function createWindow() {
  const win = new BrowserWindow({
    width: 1000,
    height: 700,
    webPreferences: {
      preload: path.join(__dirname, 'preload.js'),
      contextIsolation: true,
      nodeIntegration: false
    }
  });

  win.loadFile('index.html');
}

ipcMain.handle('notes:list', () => listNotes());
ipcMain.handle('notes:read', (_event, filename) => readNote(filename));
ipcMain.handle('notes:write', (_event, filename, content) => {
  writeNote(filename, content);
  return true;
});
ipcMain.handle('notes:delete', (_event, filename) => {
  deleteNote(filename);
  return true;
});

app.whenReady().then(createWindow);

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') app.quit();
});

app.on('activate', () => {
  if (BrowserWindow.getAllWindows().length === 0) createWindow();
});
