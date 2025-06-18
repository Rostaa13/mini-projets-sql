# 📦 Mini-projet SQL – Gestion des commandes

Ce projet est une simulation simple d’un système de gestion de commandes utilisant Oracle SQL.

Il a été conçu pour pratiquer les fondamentaux du langage SQL : création de tables, jointures, filtres, mises à jour, suppression et vues.

---

## 🎯 Objectifs pédagogiques

- Créer et lier des tables avec des clés primaires/étrangères
- Utiliser des requêtes `SELECT` avec filtres, agrégats et jointures
- Appliquer des opérations `INSERT`, `UPDATE`, `DELETE`
- Identifier des données via des sous-requêtes (`NOT IN`, `LEFT JOIN`)
- Créer une **vue** pour simplifier l’analyse des produits en promotion

---

## 🧱 Structure des tables

### `produits`
| Colonne       | Type         | Description                   |
|---------------|--------------|-------------------------------|
| id_produit    | NUMBER       | Clé primaire                  |
| nom           | VARCHAR2(20) | Nom du produit                |
| prix          | NUMBER(6,2)  | Prix du produit               |
| en_promotion  | CHAR(1)      | 'O' = oui, 'N' = non          |

### `clients`
| Colonne       | Type            | Description          |
|---------------|-----------------|----------------------|
| client_id     | NUMBER          | Clé primaire         |
| nom           | VARCHAR2(100)   | Nom du client        |
| ville         | VARCHAR2(100)   | Ville du client      |

### `commandes`
| Colonne       | Type         | Description                            |
|---------------|--------------|----------------------------------------|
| commande_id   | NUMBER       | Clé primaire                           |
| produit_id    | NUMBER       | FK → produits(id_produit)              |
| client_id     | NUMBER       | FK → clients(client_id)                |
| statut        | VARCHAR2(20) | Statut de la commande (ex: 'annulée')  |

---

## 🔍 Requêtes incluses

- Affichage des produits > 250 $
- Nombre de clients par ville (`GROUP BY`)
- Mise à jour des produits en promotion (-20 %)
- Suppression des commandes annulées
- Jointure : client + produit + statut
- Ajout d’un nouveau produit & commande
- Trouver les clients sans commande (`NOT IN`, `LEFT JOIN`)
- Création d’une vue : `vue_produits_promotions`

---

## ▶️ Instructions d’exécution

1. Ouvrir **Oracle SQL Developer** ou [LiveSQL](https://livesql.oracle.com/)
2. Copier et exécuter le contenu du fichier `mini_projet_commandes.sql`
3. Observer les résultats ligne par ligne

---

## 📎 Auteur

- **Taha Rostoume**
- Étudiant en informatique à l'UQAM
- Passionné par le SQL et PL/SQL 
