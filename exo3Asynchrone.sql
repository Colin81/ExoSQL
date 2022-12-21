create database esport;
use esport;

-- creation des tables

create table joueur(
id_joueur int primary key auto_increment not null,
nom_joueur varchar(50) not null,
prennom_joueur varchar(50) not null,
age_joueur int not null,
id_poste int not null,
id_equipe int not null
)engine=InnoDB;

create table poste(
id_poste int primary key auto_increment not null,
nom_poste varchar(50) not null
)engine=InnoDB;

create table phaser(
id_phaser int primary key auto_increment not null,
nom_phaser varchar(50) not null
)engine=InnoDB;

create table equipe(
id_equipe int primary key auto_increment not null,
nom_equipe varchar(50) not null
)engine=InnoDB;

create table matchs(
id_matchs int primary key auto_increment not null,
date_matchs datetime not null,
id_competition int not null,
id_stade int(50) not null,
id_phaser int not null
)engine=InnoDB;

create table competition(
id_competition int primary key auto_increment not null,
nom_competition varchar(50) not null,
date_competition date not null
)engine=InnoDB;

create table stade(
id_stade int primary key auto_increment not null,
nom_stade varchar(50) not null,
nom_rue_stade varchar(50) not null,
num_rue_stade int not null,
cp_stade int not null,
ville_stade varchar(50) not null
)engine=InnoDB;

create table participer(
id_equipe1 int not null,
id_matchs int not null,
id_equipe2 int not null,
primary key(id_equipe1, id_matchs, id_equipe2),
score_equipe1 int not null,
score_equipe2 int not null
)engine=InnoDB;

-- ajout foreign key

alter table joueur
add constraint fk_qualifier_poste
foreign key(id_poste)
references poste(id_poste);

alter table joueur
add constraint fk_integrer_equipe
foreign key(id_equipe)
references equipe(id_equipe);

alter table matchs
add constraint fk_completer_phaser
foreign key(id_phaser)
references phaser(id_phaser);

alter table matchs
add constraint fk_localiser_stade
foreign key(id_stade)
references stade(id_stade);

alter table matchs
add constraint fk_contenir_competition
foreign key(id_competition)
references competition(id_competition);

alter table participer
add constraint fk_participer_match_matchs
foreign key(id_matchs)
references matchs(id_matchs);

alter table participer
add constraint fk_participer_equipe_equipe
foreign key(id_equipe1)
references equipe(id_equipe);

alter table participer
add constraint fk_participer_equipe_equipe2
foreign key(id_equipe2)
references equipe(id_equipe);