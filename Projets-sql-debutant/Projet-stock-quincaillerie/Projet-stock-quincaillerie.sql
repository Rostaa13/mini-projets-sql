/*
 MINI-PROJET SUR LA GESTION DE STOCK POUR UNE QUINCAILLERIE
Crée par Taha R.
*/

create table produits2 (
id_produit NUMBER PRIMARY KEY,
nom VARCHAR2(100),
stock NUMBER,
seuil_min NUMBER,
prix NUMBER(6,2)
);

create table fournisseur (
id_fournisseur NUMBER PRIMARY KEY,
nom VARCHAR2(100),
region VARCHAR2(50)
);

create table livraison (
id_livraison NUMBER PRIMARY KEY,
produit_id NUMBER REFERENCES produits2(id_produit),
fournisseur_id NUMBER REFERENCES fournisseur(id_fournisseur),
date_livraison DATE,
quantite NUMBER
);

-- insertion de certaines valeurs dans chaque tableau

-- PRODUITS
INSERT INTO produits2 VALUES (1, 'Perceuse électrique', 25, 10, 79.99);
INSERT INTO produits2 VALUES (2, 'Marteau', 40, 15, 15.49);
INSERT INTO produits2 VALUES (3, 'Tournevis cruciforme', 12, 20, 5.99);
INSERT INTO produits2 VALUES (4, 'Clous 5cm (100 unités)', 100, 50, 3.49);
INSERT INTO produits2 VALUES (5, 'Peinture blanche 5L', 8, 10, 25.00);

-- FOURNISSEURS
INSERT INTO fournisseur VALUES (1, 'Outimat', 'Montréal');
INSERT INTO fournisseur VALUES (2, 'Ferri-Distribution', 'Laval');
INSERT INTO fournisseur VALUES (3, 'Bricotech', 'Québec');

-- LIVRAISONS
INSERT INTO livraison VALUES (1, 3, 1, TO_DATE('2024-06-01', 'YYYY-MM-DD'), 15);
INSERT INTO livraison VALUES (2, 5, 2, TO_DATE('2024-06-05', 'YYYY-MM-DD'), 10);
INSERT INTO livraison VALUES (3, 2, 3, TO_DATE('2024-06-10', 'YYYY-MM-DD'), 20);


-- AFFICHER LES PRODUITS AYANT LE STOCK INFERIEUR AU SEUIL MINIMUM 


SELECT * 
FROM produits2
where stock < seuil_min;

-- total des produits livrés par les fournisseurs

select f.nom AS fournisseur, sum(l.quantite) AS total_livraison
from livraison l
join fournisseur f ON l.fournisseur_id = f.id_fournisseur
group by f.nom;

-- afficher la derniere livraison pour chaque produit
select p.nom, MAX(l.date_livraison) as derniere_livraison
from livraison l
JOIN produits2 p ON l.produit_id = p.id_produit
group by p.nom;

-- creer un view pour les colonnes de stock (reapprovisionnement)

CREATE OR REPLACE VIEW vue_etat_stock AS

SELECT nom, stock, seuil_min,

CASE WHEN stock < seuil_min THEN 'À réapprovisionner'
    ELSE 'OK'
    END AS etat_stock
from produits2;

select * from vue_etat_stock;

-- Mettre a jour le stock manuel (prochainement automatique avec un trigger)

-- Ajout de livraison
INSERT INTO livraison VALUES (4, 1, 1, SYSDATE, 10);

-- Mise à jour manuelle du stock
UPDATE produits2
SET stock = stock + 10
WHERE id_produit = 1;

select * from produits2;
