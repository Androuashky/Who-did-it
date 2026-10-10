-- Seed 001 : affaire #001 « Meurtre à la Galerie Vidal »
-- À lancer UNE fois, après la migration. Pour recommencer : d'abord le .down.sql (ou « reset »).
-- Un seul INSERT par table, avec une ligne par entrée.
-- Ordre obligatoire : cases, suspects, clues, questions (à cause des clés étrangères).

-- L'affaire
INSERT INTO cases (id, title, description, difficulty, solution) VALUES
  (1, 'Meurtre à la Galerie Vidal', 'Vendredi soir, sous la pluie, Marcel Vidal, propriétaire de la Galerie Vidal, est retrouvé mort dans son bureau. La vitre est brisée, le coffre est ouvert : tout ressemble à un cambriolage. Quatre personnes gravitent autour de la victime. La police n''a communiqué aucun détail sur les causes du décès. À toi de trouver le coupable.', 'Moyen', 'Maître Karim Aubry, avocat et gestionnaire de patrimoine de Vidal, a tué son client qui avait découvert un détournement de 340 000 €. Il a mis en scène un cambriolage (vitre brisée de l''intérieur, coffre vidé de son carnet de comptes). Son alibi est faux, et il s''est trahi en évoquant un coup à la tête alors que la police n''avait rien communiqué sur la cause du décès.');

-- Les 4 suspects (un seul is_guilty = TRUE)
INSERT INTO suspects (id, case_id, name, role, description, image, is_guilty) VALUES
  (1, 1, 'Maître Karim Aubry', 'Avocat et gestionnaire de patrimoine', 'Ami de Marcel Vidal depuis vingt ans, il gère son argent et ses contrats. Élégant, très sûr de lui, toujours en costume sombre.', '/images/suspects/suspect_1_maitre_aubry.png', TRUE),
  (2, 1, 'Théo Ferrand', 'Livreur de nuit', 'Jeune livreur à casquette et lunettes noires. Il a un casier pour vol à l''étalage et a été vu en train de s''enfuir de la galerie.', '/images/suspects/suspect_2_theo_ferrand.png', FALSE),
  (3, 1, 'Léa Morel', 'Journaliste', 'Journaliste d''investigation. Vidal l''avait contactée la veille de sa mort pour lui parler d''une affaire d''argent.', '/images/suspects/suspect_3_lea_morel.png', FALSE),
  (4, 1, 'Jules Perrin', 'Étudiant, voisin de la galerie', 'Voisin de palier de la galerie. Il y travaillait à temps partiel jusqu''à son licenciement, il y a deux semaines.', '/images/suspects/suspect_4_jules_perrin.png', FALSE);

-- Les 8 indices (is_key_proof = TRUE : les 3 preuves décisives)
INSERT INTO clues (id, case_id, title, description, location, how_to_find, image, is_key_proof) VALUES
  (1, 1, 'Éclats de verre sur le trottoir', 'Les éclats de la vitre du bureau sont sur le trottoir, et aucun à l''intérieur. La vitre a été brisée de l''intérieur : le cambriolage est une mise en scène.', 'Rue devant la galerie', 'Examiner le trottoir', '/images/indices/01_eclats_de_verre.png', FALSE),
  (2, 1, 'Registre de visite', 'Le registre du bureau indique un visiteur le soir du crime : « K.A. 20:45 ».', 'Scène de crime', 'Examiner le bureau', '/images/indices/02_registre_de_visite.png', TRUE),
  (3, 1, 'Statuette en bronze', 'Elle a été essuyée avec soin, mais il reste de minuscules traces rouges à la base. C''est probablement l''arme du crime.', 'Scène de crime', 'Examiner l''étagère', '/images/indices/03_statuette_bronze.png', FALSE),
  (4, 1, 'Rapport du légiste', 'Décès entre 21h15 et 21h45. Un seul coup à la tête, porté de face, sans blessure de défense : la victime connaissait son agresseur.', 'Morgue', 'Parler au Dr Diallo', '/images/indices/04_rapport_legiste.png', FALSE),
  (5, 1, 'Image de la caméra de rue, 21h41', 'La caméra du commerce d''en face montre un homme en costume sombre, cravate rose, une mallette à la main, qui sort de la galerie à 21h41.', 'Rue devant la galerie', 'Demander les images à l''agent Moreau', '/images/indices/05_camera_rue_21h41.png', TRUE),
  (6, 1, 'Message vocal de Marcel Vidal', '« Léa, c''est Marcel. J''ai découvert que mon homme de confiance me vole depuis des mois. Je te donne son nom demain. Ne dis rien à personne. »', 'Café Le Chat Noir', 'Interroger Léa Morel (question 3)', '/images/indices/06_message_vocal_vidal.png', FALSE),
  (7, 1, 'Bon de livraison, 21h52', 'Colis n°4471 pour la galerie, client absent, 21h52. Théo est arrivé après la mort de Vidal.', 'Salle d''interrogatoire', 'Interroger Théo Ferrand (question 1)', '/images/indices/07_bon_de_livraison.png', FALSE),
  (8, 1, 'Addition Chez Paulo', 'Table 4 ouverte à 22h15, addition imprimée à 22h40. Aubry n''a donc pas dîné là-bas dès 20h.', 'Cabinet de l''avocat', 'Interroger Aubry (question 1)', '/images/indices/08_addition_chez_paulo.png', TRUE);

-- Les 12 questions (reveals_clue_id : l'indice débloqué par la réponse)
INSERT INTO questions (id, case_id, suspect_id, question, answer, reveals_clue_id) VALUES
  (1, 1, 1, 'Où étiez-vous vendredi soir ?', 'Au restaurant Chez Paulo, du début de soirée jusqu''à tard. Tenez, voici mon addition.', 8),
  (2, 1, 1, 'Quand avez-vous vu Marcel pour la dernière fois ?', 'Mardi, à mon cabinet. Je n''ai pas mis les pieds à la galerie cette semaine.', NULL),
  (3, 1, 1, 'Que pensez-vous de sa mort ?', 'Un cambriolage qui a mal tourné, évidemment. Un coup sur la tête, et c''est fini... Il n''a pas dû souffrir. Pauvre Marcel.', NULL),
  (4, 1, 2, 'Que faisiez-vous à la galerie vendredi soir ?', 'Je livrais un colis. Voilà mon bon : 21h52. Personne n''a répondu, la porte était ouverte. Je suis entré et il était par terre.', 7),
  (5, 1, 2, 'Pourquoi avoir fui sans prévenir la police ?', 'J''ai un casier pour vol à l''étalage. Personne ne m''aurait cru. J''ai appelé la police depuis une cabine, sans donner mon nom.', NULL),
  (6, 1, 2, 'Qu''avez-vous vu dans le bureau ?', 'Marcel par terre, la fenêtre cassée et le coffre ouvert. Je n''ai rien touché, sauf la poignée de la porte.', NULL),
  (7, 1, 3, 'Que saviez-vous de Marcel Vidal ?', 'Il m''a appelée jeudi : 340 000 € avaient disparu de son compte. Il soupçonnait quelqu''un de très proche et devait me donner son nom samedi.', NULL),
  (8, 1, 3, 'Où étiez-vous vendredi entre 21h et 22h ?', 'En direct sur Radio Nord, de 21h à 22h. L''agent Lopez peut vérifier avec la station.', NULL),
  (9, 1, 3, 'Avez-vous une preuve de cet appel ?', 'Il m''a laissé un message vocal. Écoutez.', 6),
  (10, 1, 4, 'Pourquoi avez-vous quitté la galerie ?', 'Vidal m''a viré il y a deux semaines : il disait que je traînais. J''étais furieux, mais je n''aurais jamais touché à Marcel.', NULL),
  (11, 1, 4, 'Qu''avez-vous entendu vendredi soir ?', 'Vers 21h, une dispute entre deux hommes, puis plus rien. J''étais chez moi, en ligne avec des amis jusqu''à 22h30. L''agent Lopez peut vérifier.', NULL),
  (12, 1, 4, 'Avez-vous vu quelqu''un sortir de la galerie ?', 'Vers 21h40, un homme en costume sombre est sorti vite, une mallette à la main. Il portait une cravate rose, ça m''a marqué sous la pluie. Je n''ai pas vu son visage. Plus tard, un type à casquette courait vers le métro.', NULL);

-- Seed 002 : les 10 personnages de l'affaire #001
-- À lancer après le seed 001 (il faut que les suspects existent).
-- suspect_id : l'id du suspect si le personnage en est un, sinon NULL.

INSERT INTO characters (id, case_id, suspect_id, name, role, description, image) VALUES
  (1, 1, NULL, 'Sam Carrel', 'Détective (le joueur)', 'Détective privé au long manteau, chargé de mener l''enquête. C''est lui que tu incarne.', '/images/personnages/01_detective_sam_carrel.png'),
  (2, 1, NULL, 'Agent Moreau', 'Policier', 'Agent de police sur place. Il garde la scène de crime et détient les images de la caméra de rue.', '/images/personnages/02_policier_agent_moreau.png'),
  (3, 1, NULL, 'Agent Lopez', 'Policière', 'Agent de police qui vérifie les alibis et surveille la salle d''interrogatoire.', '/images/personnages/03_policiere_agent_lopez.png'),
  (4, 1, 4, 'Jules Perrin', 'Étudiant, voisin de la galerie', 'Voisin de palier de la galerie. Il y travaillait à temps partiel jusqu''à son licenciement, il y a deux semaines.', '/images/personnages/04_jules_perrin_voisin.png'),
  (5, 1, 2, 'Théo Ferrand', 'Livreur de nuit', 'Jeune livreur à casquette et lunettes noires. Il a un casier pour vol à l''étalage et a été vu en train de s''enfuir de la galerie.', '/images/personnages/05_theo_ferrand_livreur.png'),
  (6, 1, 3, 'Léa Morel', 'Journaliste', 'Journaliste d''investigation. Vidal l''avait contactée la veille de sa mort pour lui parler d''une affaire d''argent.', '/images/personnages/06_lea_morel_journaliste.png'),
  (7, 1, NULL, 'Dr Diallo', 'Médecin légiste', 'Médecin légiste de la morgue. Il a examiné le corps de Marcel Vidal et rédigé le rapport.', '/images/personnages/07_dr_diallo_legiste.png'),
  (8, 1, 1, 'Maître Karim Aubry', 'Avocat et gestionnaire de patrimoine', 'Ami de Marcel Vidal depuis vingt ans, il gère son argent et ses contrats. Élégant, très sûr de lui, toujours en costume sombre.', '/images/personnages/08_karim_aubry_avocat.png'),
  (9, 1, NULL, 'Commissaire Duval', 'Commissaire de police', 'Chef du commissariat. Il confie l''affaire au détective et attend des preuves solides avant toute arrestation.', '/images/personnages/09_commissaire_duval.png'),
  (10, 1, NULL, 'Marcel Vidal', 'Victime, propriétaire de la galerie', 'Propriétaire de la Galerie Vidal, 62 ans. Retrouvé mort dans son bureau un vendredi soir de pluie.', '/images/personnages/10_marcel_vidal_victime.png');

-- Remet le compteur d'identifiants à jour (les id ont été imposés à la main)
SELECT setval(pg_get_serial_sequence('characters', 'id'), (SELECT MAX(id) FROM characters));


-- Remet les compteurs d'identifiants à jour (nécessaire car on a imposé les id à la main)
SELECT setval(pg_get_serial_sequence('cases', 'id'), (SELECT MAX(id) FROM cases));
SELECT setval(pg_get_serial_sequence('suspects', 'id'), (SELECT MAX(id) FROM suspects));
SELECT setval(pg_get_serial_sequence('clues', 'id'), (SELECT MAX(id) FROM clues));
SELECT setval(pg_get_serial_sequence('questions', 'id'), (SELECT MAX(id) FROM questions));