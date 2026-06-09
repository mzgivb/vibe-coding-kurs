/* ===== Quiz Data ===== */
const questions = [
  {
    question: 'Was bedeutet "Vibe Coding"?',
    options: [
      'Programmieren mit Musik im Hintergrund',
      'KI-gestützte Code-Erstellung durch natürliche Sprachbefehle',
      'Eine neue Programmiersprache',
      'Code-Optimierung durch Stimmungsanalyse',
    ],
    correct: 1,
    explanation:
      'Vibe Coding bezeichnet den Prozess, Software über natürliche Sprachdialoge mit KI-Assistenten zu erstellen – der Mensch formuliert die Absicht, die KI generiert den Code.',
  },
  {
    question: 'Welches Tool gehört NICHT zu den typischen Vibe-Coding-Werkzeugen?',
    options: ['Claude Code', 'Cursor', 'Microsoft Word', 'GitHub Copilot'],
    correct: 2,
    explanation:
      'Microsoft Word ist ein Textverarbeitungsprogramm, kein KI-Coding-Assistent. Claude Code, Cursor und GitHub Copilot sind speziell für Code-Generierung entwickelt.',
  },
  {
    question: 'Was ist eine wichtige Best Practice beim Vibe Coding?',
    options: [
      'Generierten Code niemals überprüfen – der KI vertrauen',
      'Generierten Code immer reviewen und verstehen',
      'Möglichst viele Prompts gleichzeitig senden',
      'Nur auf Englisch prompTEN',
    ],
    correct: 1,
    explanation:
      'KI-generierter Code kann Fehler, Sicherheitslücken oder unsinnige Logik enthalten. Gründliches Review und Verständnis sind essenziell.',
  },
  {
    question: 'Was ist eine typische Grenze von KI-Code-Generierung?',
    options: [
      'Sie kann grundsätzlich keine Tests schreiben',
      'Sie funktioniert ausschließlich mit Python',
      'Halluzinationen von APIs oder Bibliotheken',
      'Sie benötigt zwingend Internet',
    ],
    correct: 2,
    explanation:
      'KI-Modelle halluzinieren häufig nicht-existierende Funktionen, APIs oder Bibliotheken. Das Erkennen solcher Halluzinationen ist eine Kernkompetenz beim Vibe Coding.',
  },
  {
    question: 'Was versteht man unter Prompt Engineering?',
    options: [
      'Die Kunst, effektive Anweisungen für KI zu formulieren',
      'Das Schreiben von technischen Dokumentationen',
      'Das Design von Benutzeroberflächen',
      'Die Optimierung von Datenbankabfragen',
    ],
    correct: 0,
    explanation:
      'Prompt Engineering ist die gezielte Formulierung von Eingabeaufforderungen, um optimale Ergebnisse von KI-Modellen zu erhalten – eine der wichtigsten Fähigkeiten im Vibe Coding.',
  },
];

const letters = ['A', 'B', 'C', 'D'];

/* ===== State ===== */
let currentQuestion = 0;
let score = 0;
let answered = false;

/* ===== DOM refs ===== */
const body = document.getElementById('quizBody');
const counter = document.getElementById('quizCounter');
const scoreDisplay = document.getElementById('quizScore');
const progressBar = document.getElementById('progressBar');
const nextBtn = document.getElementById('nextBtn');
const footer = document.getElementById('quizFooter');

/* ===== Render ===== */
function renderQuestion() {
  const q = questions[currentQuestion];
  const isLast = currentQuestion === questions.length - 1;
  let html = `<div class="quiz-question">${q.question}</div><div class="quiz-options">`;
  q.options.forEach((opt, i) => {
    html += `<button class="quiz-option" data-index="${i}">
      <span class="letter">${letters[i]}</span>
      ${opt}
    </button>`;
  });
  html += '</div><div class="quiz-feedback" id="feedback"></div>';
  body.innerHTML = html;

  counter.textContent = `Frage ${currentQuestion + 1} von ${questions.length}`;
  scoreDisplay.textContent = `✓ ${score}`;
  progressBar.style.width = `${(currentQuestion / questions.length) * 100}%`;
  nextBtn.disabled = true;
  nextBtn.textContent = isLast ? 'Ergebnis anzeigen →' : 'Weiter →';
  answered = false;

  /* Event listeners */
  document.querySelectorAll('.quiz-option').forEach((btn) => {
    btn.addEventListener('click', () => handleAnswer(btn));
  });
}

/* ===== Handle Answer ===== */
function handleAnswer(btn) {
  if (answered) return;
  answered = true;

  const selected = parseInt(btn.dataset.index);
  const q = questions[currentQuestion];
  const isCorrect = selected === q.correct;
  if (isCorrect) score += 1;

  /* Mark buttons */
  document.querySelectorAll('.quiz-option').forEach((opt, i) => {
    opt.classList.add('disabled');
    if (i === q.correct) opt.classList.add('correct');
    if (i === selected && !isCorrect) opt.classList.add('wrong');
  });

  /* Show feedback */
  const feedback = document.getElementById('feedback');
  feedback.className = `quiz-feedback show ${isCorrect ? 'correct' : 'wrong'}`;
  feedback.textContent = isCorrect ? '✓ Richtig! ' + q.explanation : '✗ Leider falsch. ' + q.explanation;

  scoreDisplay.textContent = `✓ ${score}`;
  nextBtn.disabled = false;
}

/* ===== Next / Finish ===== */
function goToNext() {
  currentQuestion += 1;
  if (currentQuestion < questions.length) {
    renderQuestion();
  } else {
    showResult();
  }
}

nextBtn.addEventListener('click', goToNext);

/* ===== Result ===== */
function showResult() {
  const total = questions.length;
  const pct = Math.round((score / total) * 100);
  let emoji, title;
  if (pct === 100) { emoji = '🏆'; title = 'Perfekt!'; }
  else if (pct >= 80) { emoji = '🌟'; title = 'Sehr gut!'; }
  else if (pct >= 60) { emoji = '👍'; title = 'Gut gemacht!'; }
  else if (pct >= 40) { emoji = '📖'; title = 'Nicht schlecht!'; }
  else { emoji = '🔄'; title = 'Weiter üben!'; }

  progressBar.style.width = '100%';
  counter.textContent = 'Fertig!';

  body.innerHTML = `
    <div class="quiz-result">
      <span class="quiz-result-emoji">${emoji}</span>
      <h3 class="quiz-result-title">${title}</h3>
      <p class="quiz-result-score">${score} von ${total} richtig (${pct}%)</p>
      <button class="btn btn-primary" onclick="resetQuiz()">Quiz wiederholen</button>
    </div>
  `;
  footer.innerHTML = '';
}

/* ===== Reset ===== */
function resetQuiz() {
  currentQuestion = 0;
  score = 0;
  answered = false;
  footer.innerHTML = '<button class="btn btn-secondary" id="nextBtn" disabled>Weiter →</button>';
  document.getElementById('nextBtn').addEventListener('click', goToNext);
  renderQuestion();
  window.scrollTo({ top: document.getElementById('quiz').offsetTop - 100, behavior: 'smooth' });
}

/* ===== Navigation Active State ===== */
const sections = document.querySelectorAll('section[id]');
const navLinks = document.querySelectorAll('.nav-link');

function updateNav() {
  let current = '';
  sections.forEach((sec) => {
    const top = window.scrollY + 120;
    const offset = sec.offsetTop;
    const height = sec.offsetHeight;
    if (top >= offset && top < offset + height) {
      current = sec.id;
    }
  });
  navLinks.forEach((link) => {
    link.classList.toggle('active', link.getAttribute('href') === '#' + current);
  });
}

window.addEventListener('scroll', updateNav);

/* ===== Fade-in on scroll ===== */
const observer = new IntersectionObserver(
  (entries) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        entry.target.classList.add('visible');
      }
    });
  },
  { threshold: 0.15 }
);

document.querySelectorAll('.card, .quiz-container, .section-header').forEach((el) => {
  el.classList.add('fade-in');
  observer.observe(el);
});

/* ===== Init ===== */
renderQuestion();
