-- Création database

create database commercial;
use commercial;

-- Création table

create table utilisateur(
id_utilisateur int primary key auto_increment not null,
login_util varchar(50) not null,
mot_pass_ult varchar(100) not null,
id_droit int not null
)engine=InnoDB;

create table droit(
id_droit int primary key auto_increment not null,
nom_droit varchar(50) not null
)engine=InnoDB;

create table fabriquer(
id_matprem int(11) not null,
id_pf int(11) not null
)engine=InnoDB;

create table matprem(
id_matprem int primary key auto_increment not null,
nom_mat varchar(50) not null,
prix_achat float not null,
qte_stk float not null
)engine=InnoDB;

create table acheter(
id_fourn int(11) not null,
id_matprem int(11) not null
)engine=InnoDB;

create table fournisseur(
id_fourn int primary key auto_increment not null,
nom_fourn varchar(50) not null,
tel_fourn varchar(50) not null,
adr_num_fourn int not null,
adr_rue_fourn varchar(50) not null,
adr_cp_fourn varchar(50) not null,
adr_ville_fourn varchar(50) not null,
adr_pays_fourn varchar(50) not null
)engine=InnoDB;

create table vendre(
id_client int(11) not null,
id_pf int(11) not null
)engine=InnoDB;

create table client(
id_client int primary key auto_increment not null,
nom_cli varchar(50) not null,
tel_cli varchar(50) not null,
adr_num_cli varchar(50) not null,
adr_rue_cli int not null,
adr_ville_cli varchar(50) not null,
adr_cp_cli varchar(50) not null,
adr_pays_cli varchar(50) not null
)engine=InnoDB;

create table fideliser(
id_client int(11) not null,
id_com int(11) not null,
chiffre_affaire float not null
)engine=InnoDB;

create table commerciaux(
id_com int primary key auto_increment not null,
nom_com varchar(50) not null,
prenom_com varchar(50) not null,
tel_com varchar(50) not null
)engine=InnoDB;

create table promouvoir(
id_pf int(11) not null,
id_com int(11) not null
)engine=InnoDB;

create table produitfinis(
id_pf int primary key auto_increment not null,
nom_pf varchar(50) not null,
prix_vente_pf float not null,
qte_stk float not null,
id_type_pf int(11) not null
)engine=InnoDB;

create table typepf(
id_type_pf int primary key auto_increment not null,
nom_type_pf varchar(50) not null
)engine=InnoDB;

-- Contraintes des tables


ALTER TABLE utilisateur
ADD CONSTRAINT fk_attribuer_droit
FOREIGN KEY(id_droit)
REFERENCES droit(id_droit);

ALTER TABLE fabriquer
ADD CONSTRAINT fk_fabriquer_matprem_matprem
FOREIGN KEY(id_matprem)
REFERENCES matprem(id_matprem);

ALTER TABLE fabriquer
ADD CONSTRAINT fk_fabriquer_profuidtfinis_produitfinis
FOREIGN KEY(id_pf)
REFERENCES produitfinis(id_pf);

alter table acheter
add constraint fk_acheter_matprem_matprem
foreign key(id_matprem)
references matprem(id_matprem);

alter table acheter
add constraint fk_acheter_fournisseur_fournisseur
foreign key(id_fourn)
references fournisseur(id_fourn);

alter table produitfinis
add constraint fk_posseder_type_pf
foreign key(id_type_pf)
references typepf(id_type_pf);

alter table vendre
add constraint fk_vendre_produitfinis_produitfinis
foreign key(id_pf)
references produitfinis(id_pf);

alter table vendre
add constraint fk_vendre_client_client
foreign key(id_client)
references client(id_client);

alter table fideliser
add constraint fk_fideliser_client_client
foreign key(id_client)
references client(id_client);

alter table fideliser
add constraint fk_fideliser_commerciaux_commerciaux
foreign key(id_com)
references commerciaux(id_com);

alter table promouvoir
add constraint fk_promouvoir_commerciaux_commerciaux
foreign key(id_com)
references commerciaux(id_com);

alter table promouvoir
add constraint fk_promouvoir_produitfinis_produitfinis
foreign key(id_pf)
references produitfinis(id_pf);