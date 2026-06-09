const { contextBridge, ipcRenderer } = require('electron');

contextBridge.exposeInMainWorld('notesAPI', {
  list: () => ipcRenderer.invoke('notes:list'),
  read: (filename) => ipcRenderer.invoke('notes:read', filename),
  write: (filename, content) => ipcRenderer.invoke('notes:write', filename, content),
  delete: (filename) => ipcRenderer.invoke('notes:delete', filename)
});
