const noteList = document.getElementById('note-list');
const noteTitle = document.getElementById('note-title');
const noteContent = document.getElementById('note-content');
const editorEmpty = document.getElementById('editor-empty');
const editorContent = document.getElementById('editor-content');
const btnNew = document.getElementById('btn-new');
const btnDelete = document.getElementById('btn-delete');

let notes = [];
let activeNote = null;
let saveTimeout = null;

function sanitizeFilename(title) {
  return title.replace(/[^a-z0-9äöüß _-]/gi, '_').trim() || 'Neue Notiz';
}

async function loadNotes() {
  notes = await window.notesAPI.list();
  renderNoteList();
}

function renderNoteList() {
  noteList.innerHTML = '';
  notes.forEach(note => {
    const li = document.createElement('li');
    li.textContent = note.title;
    li.dataset.id = note.id;
    if (activeNote && activeNote.id === note.id) {
      li.classList.add('active');
    }
    li.addEventListener('click', () => selectNote(note));
    noteList.appendChild(li);
  });
}

async function selectNote(note) {
  if (activeNote && activeNote.id === note.id) return;

  if (activeNote) {
    await saveCurrentNote();
  }

  activeNote = note;
  const content = await window.notesAPI.read(note.id);
  noteTitle.value = note.title;
  noteContent.value = content;
  editorEmpty.classList.add('hidden');
  editorContent.classList.remove('hidden');
  renderNoteList();
  noteContent.focus();
}

async function saveCurrentNote() {
  if (!activeNote) return;

  const newTitle = sanitizeFilename(noteTitle.value);
  const newFilename = newTitle + '.txt';
  const content = noteContent.value;

  if (activeNote.id !== newFilename) {
    await window.notesAPI.write(newFilename, content);
    if (activeNote.id !== newFilename) {
      await window.notesAPI.delete(activeNote.id);
    }
    activeNote = { id: newFilename, title: newTitle };
  } else {
    await window.notesAPI.write(activeNote.id, content);
  }

  notes = await window.notesAPI.list();
  activeNote = notes.find(n => n.id === activeNote.id) || null;
  renderNoteList();
}

function scheduleSave() {
  clearTimeout(saveTimeout);
  saveTimeout = setTimeout(saveCurrentNote, 500);
}

async function createNewNote() {
  if (activeNote) {
    await saveCurrentNote();
  }

  const title = 'Neue Notiz';
  let filename = title + '.txt';
  let counter = 1;

  while (notes.some(n => n.id === filename)) {
    filename = `${title} ${counter}.txt`;
    counter++;
  }

  await window.notesAPI.write(filename, '');
  notes = await window.notesAPI.list();
  const newNote = notes.find(n => n.id === filename);
  if (newNote) {
    selectNote(newNote);
  }
}

async function deleteActiveNote() {
  if (!activeNote) return;

  await window.notesAPI.delete(activeNote.id);
  activeNote = null;
  noteTitle.value = '';
  noteContent.value = '';
  editorContent.classList.add('hidden');
  editorEmpty.classList.remove('hidden');
  notes = await window.notesAPI.list();
  renderNoteList();
}

noteTitle.addEventListener('input', scheduleSave);
noteContent.addEventListener('input', scheduleSave);
btnNew.addEventListener('click', createNewNote);
btnDelete.addEventListener('click', deleteActiveNote);

loadNotes();
