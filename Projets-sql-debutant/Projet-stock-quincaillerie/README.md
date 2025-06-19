# 🧱 Projet SQL – Gestion de stock pour une quincaillerie

Ce projet propose une base de données pour suivre les produits, livraisons et fournisseurs d'une quincaillerie.

---

## 🧱 Structure

### Tables :
- `produits` (id, nom, stock, seuil_min, prix)
- `fournisseurs` (id, nom, région)
- `livraisons` (id, produit_id, fournisseur_id, date, quantité)

---

## 🔍 Requêtes réalisées

- Produits dont le stock est < au seuil minimum (alerte)
- Quantité totale livrée par fournisseur
- Dernière livraison reçue par produit
- Vue `etat_stock` avec statut "OK" ou "À réapprovisionner"
- Ajout de livraison + mise à jour manuelle du stock

---

## 🧠 Objectifs

- Pratiquer les concepts de seuils et alertes
- Créer des vues utiles pour le suivi de stock
- Travailler avec des dates et des agrégats
