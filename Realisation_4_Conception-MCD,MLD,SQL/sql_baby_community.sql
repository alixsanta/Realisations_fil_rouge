create database babyCommunity;
use babyCommunity;

create table utilisateurs
(
	id_user int primary key auto_increment not null,
    nom_user varchar(50),
    prenom_user varchar(50),
    mail_user varchar(50),
    id_annonce int
);

create table droits
(
	id_droit int primary key auto_increment not null
)engine=InnoDB;

create table localisation
(
id_adresse int primary key auto_increment not null,
nom_voie varchar(50),
code_postal varchar(10),
ville varchar(10)
)engine=InnoDb;

create table annonces
(
	id_annonce int primary key auto_increment not null
)engine=InnoDB;

create table posseder
(
	id_user int,
    id_droit int,
    primary key (id_droit, id_user)
)engine=InnoDB;

create table se_localiser
(
	id_user int,
    id_adresse int,
    primary key(id_adresse, id_user)
)engine=InnoDB;

alter table utilisateurs
add constraint fk_poster_annonces
foreign key(id_annonce)
references annonces(id_annonce);

alter table se_localiser
add constraint fk_localiser_user
foreign key(id_user)
references utilisateurs(id_user);

alter table se_localiser
add constraint fk_localiser_localisation
foreign key(id_adresse)
references localisation (id_adresse);