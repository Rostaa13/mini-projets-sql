# 📦 Premier_exercise – Gestion de commandes

Ce projet simule un petit système de gestion de commandes pour pratiquer les bases de SQL Oracle.

---

## 🧱 Structure

### Tables :
- `produits` (id, nom, prix, en_promotion)
- `clients` (id, nom, ville)
- `commandes` (id, produit_id, client_id, statut)

---

## 🔍 Requêtes réalisées

- Produits > 250 $
- Nombre de clients par ville
- Mise à jour des produits en promotion (-20 %)
- Suppression des commandes annulées
- Jointure : client + produit + statut
- Clients sans commande (`NOT IN` / `LEFT JOIN`)
- Création de vue : produits avec étiquette "en promo"

---

## 🧠 Objectifs

- S'entraîner à modéliser un mini-système de commande
- Maîtriser `JOIN`, `GROUP BY`, `UPDATE`, `DELETE`
- Apprendre à créer et utiliser des vues SQL
