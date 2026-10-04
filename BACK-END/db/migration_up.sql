-- Active: 1791144781415@@127.0.0.1@5435@whodidit_db
-- Migration 001 (UP) : crée les 4 tables de WhoDunnit V1
-- cases (1) -> suspects (4) -> questions (12)
--   \-> clues (8) <- questions.reveals_clue_id

CREATE TABLE cases (
  id          SERIAL PRIMARY KEY,
  title       TEXT NOT NULL,
  description TEXT NOT NULL,
  difficulty  TEXT NOT NULL CHECK (difficulty IN ('Facile', 'Moyen', 'Difficile')),
  solution    TEXT NOT NULL                    -- SECRET : ne jamais l'envoyer avant la fin
);

CREATE TABLE suspects (
  id          SERIAL PRIMARY KEY,
  case_id     INT  NOT NULL REFERENCES cases(id) ON DELETE CASCADE,
  name        TEXT NOT NULL,
  role        TEXT NOT NULL,
  description TEXT NOT NULL,
  image       TEXT,                            -- ex : /images/suspects/suspect_1_maitre_aubry.png
  is_guilty   BOOLEAN NOT NULL DEFAULT FALSE   -- SECRET : vérifié côté serveur uniquement
);

CREATE TABLE clues (
  id           SERIAL PRIMARY KEY,
  case_id      INT  NOT NULL REFERENCES cases(id) ON DELETE CASCADE,
  title        TEXT NOT NULL,
  description  TEXT NOT NULL,
  location     TEXT,                           -- le lieu où on le trouve
  how_to_find  TEXT,                           -- l'action du joueur (ex : « Examiner le trottoir »)
  image        TEXT,                           -- ex : /images/indices/02_registre_de_visite.png
  is_key_proof BOOLEAN NOT NULL DEFAULT FALSE  -- preuve décisive contre le coupable
);

CREATE TABLE questions (
  id              SERIAL PRIMARY KEY,
  suspect_id      INT  NOT NULL REFERENCES suspects(id) ON DELETE CASCADE,
  question        TEXT NOT NULL,
  answer          TEXT NOT NULL,
  reveals_clue_id INT REFERENCES clues(id) ON DELETE SET NULL   -- indice débloqué par la réponse
);

-- Index sur les clés étrangères
CREATE INDEX idx_suspects_case  ON suspects(case_id);
CREATE INDEX idx_clues_case     ON clues(case_id);
CREATE INDEX idx_questions_susp ON questions(suspect_id);

-- Un seul coupable par affaire
CREATE UNIQUE INDEX one_guilty_per_case ON suspects(case_id) WHERE is_guilty;