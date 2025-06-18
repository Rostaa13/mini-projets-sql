create table Produits (
id_produit number primary key not null,
nom varchar2 (20),
prix number (6,2),
en_promotion char(1)
);

create table clients (
client_id number primary key,
nom varchar2(100),
ville varchar2(100)
);

create table commandes (
commande_id number primary key,
produit_id number references produits(id_produit),
client_id number references clients(client_id),
statut varchar2(20)
);

-- isertion valeur produits
insert into Produits (id_produit, nom, prix, en_promotion) 
values (1,'telephone', 500, 'N');
insert into Produits (id_produit, nom, prix, en_promotion) 
values (2,'television', 700, 'O');
insert into Produits (id_produit, nom, prix, en_promotion) 
values (3,'congelateur', 300, 'N');
insert into Produits (id_produit, nom, prix, en_promotion) 
values (4,'horloge', 15, 'N');
insert into Produits (id_produit, nom, prix, en_promotion) 
values (5,'pile', 5, 'O');

-- insertion valeur clients
insert into clients (client_id, nom, ville) 
values (1,'rostoume' , 'Laval');
insert into clients (client_id, nom, ville) 
values (2,'Otmanie' , 'Casablanca');
insert into clients (client_id, nom, ville) 
values (3,'Tremblay' , 'Montreal');
insert into clients (client_id, nom, ville) 
values (4,'Nguyen' , 'Sherbrooke');
insert into clients (client_id, nom, ville) 
values (5,'Oracle' , 'Montreal');

-- insertion valeur commandes

insert into commandes (commande_id, produit_id, client_id, statut) 
values (1,1,1, 'envoye');
insert into commandes (commande_id, produit_id, client_id, statut) 
values (2,2,2, 'annuler');
insert into commandes (commande_id, produit_id, client_id, statut) 
values (3,3,3, 'en attente');

-- afficher produit avec un prix superieur a 250$

select * from produits
where prix > 250;

select * from produits;

-- compter le nombre de clients par ville

select ville, count(*) nombre_clients
from clients
group by ville;

select * from clients;

-- mise a jout des prix par produits en promotion (exemple -20%)

update produits
set prix = prix * 0.8
where en_promotion = 'O';

select * from produits;

-- suppression des commandes annuler

delete from commandes
where statut = 'annuler';

select * from commandes;
