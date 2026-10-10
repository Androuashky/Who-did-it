-- Migration 001 (DOWN) : supprime les 4 tables
-- Ordre inverse de la création : d'abord les tables qui dépendent des autres.
-- Les index sont supprimés avec leurs tables.
-- ATTENTION : toutes les données sont perdues.

DROP TABLE IF EXISTS characters, questions, clues, suspects, cases CASCADE;
