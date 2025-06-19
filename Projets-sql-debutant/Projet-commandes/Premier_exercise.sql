CREATE TABLE produits (
  produit_id NUMBER PRIMARY KEY,
  nom VARCHAR2(100),
  prix NUMBER(6,2),
  en_promotion CHAR(1) -- 'O' ou 'N'
);

CREATE TABLE clients (
  client_id NUMBER PRIMARY KEY,
  nom VARCHAR2(100),
  ville VARCHAR2(100)
);

CREATE TABLE commandes (
  commande_id NUMBER PRIMARY KEY,
  produit_id NUMBER REFERENCES produits(produit_id),
  client_id NUMBER REFERENCES clients(client_id),
  statut VARCHAR2(20) -- exemple : 'envoyée', 'annulée', 'en attente'
);

-- Produits
INSERT INTO produits VALUES (1, 'Imprimante Laser', 199.99, 'O');
INSERT INTO produits VALUES (2, 'Écran 27 pouces', 299.99, 'N');
INSERT INTO produits VALUES (3, 'Clé USB 64Go', 19.99, 'O');

-- Clients
INSERT INTO clients VALUES (1, 'Ahmed Lahlou', 'Montréal');
INSERT INTO clients VALUES (2, 'Julie Tremblay', 'Laval');
INSERT INTO clients VALUES (3, 'Marc Renaud', 'Montréal');

-- Commandes
INSERT INTO commandes VALUES (1, 1, 1, 'en attente');
INSERT INTO commandes VALUES (2, 2, 2, 'annulée');
INSERT INTO commandes VALUES (3, 3, 3, 'envoyée');

-- produits plus haut de 100$
SELECT *
FROM produits
WHERE prix > 100;

-- compter le nombre de clients par ville
SELECT ville, COUNT(*) AS nombre_clients
FROM clients
GROUP BY ville;

-- mettre a jour les prix en rabais
UPDATE produits
SET prix = prix * 0.8
WHERE en_promotion = 'O';

-- supprimer les commandes annulees
DELETE FROM commandes
WHERE statut = 'annulée';


