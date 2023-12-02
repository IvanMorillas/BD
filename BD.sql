drop database bd_prac3;
create database bd_prac3;
use bd_prac3;


create table firmes_comercials(
	nom_firma varchar(15),
	constraint pk_firmes_comercials primary key (nom_firma)
)engine=innodb;

insert into firmes_comercials (nom_firma) values ('URVADOB');
insert into firmes_comercials (nom_firma) values ('TIRSADOB');
insert into firmes_comercials (nom_firma) values ('PRISADOB');
insert into firmes_comercials (nom_firma) values ('CIRSADOB');



create table adobs(
	nom_adob varchar(10) not null,
	nom_firma varchar(10),
	tipus_adob varchar(3),
	constraint pk_adobs primary key (nom_adob),
	constraint fk_adobs_firmes_comercials foreign key (nom_firma) references firmes_comercials(nom_firma)
)engine=innodb;

insert into adobs (nom_adob, nom_firma, tipus_adob) values ('Plantavit','URVADOB','LLD');
insert into adobs (nom_adob, nom_firma, tipus_adob) values ('Vitaplant','TIRSADOB','AI');
insert into adobs (nom_adob, nom_firma, tipus_adob) values ('Nutreplant','CIRSADOB','LLD');
insert into adobs (nom_adob, nom_firma, tipus_adob) values ('Creixplant','PRISADOB','AI');
insert into adobs (nom_adob, nom_firma, tipus_adob) values ('Casadob','TIRSADOB','AI');
insert into adobs (nom_adob, nom_firma, tipus_adob) values ('Plantadob','PRISADOB','LLD');
insert into adobs (nom_adob, nom_firma, tipus_adob) values ('Superplant','CIRSADOB','AI');
insert into adobs (nom_adob, nom_firma, tipus_adob) values ('Sanexplant','URVADOB','LLD');


create table plantes(
	nom_popular varchar(10),
	nom_llati varchar(20) not null unique,
	tipus varchar(1),
	constraint pk_plantes primary key (nom_popular)
)engine=innodb;

insert into plantes (nom_popular, nom_llati, tipus) values ('Gerani', 'Pelargonium', 'P');
insert into plantes (nom_popular, nom_llati, tipus) values ('Begonia', 'Begonia rex', 'P');
insert into plantes (nom_popular, nom_llati, tipus) values ('Camelia', 'Camellia', 'P');
insert into plantes (nom_popular, nom_llati, tipus) values ('Ciclamen', 'Cyclamen', 'P');
insert into plantes (nom_popular, nom_llati, tipus) values ('Roser', 'Rosa', 'P');
insert into plantes (nom_popular, nom_llati, tipus) values ('Falguera', 'Polystichum', 'P');
insert into plantes (nom_popular, nom_llati, tipus) values ('Tulipa', 'Tulipa', 'T');
insert into plantes (nom_popular, nom_llati, tipus) values ('Crisantem', 'Chrysanthemum',NULL);
insert into plantes (nom_popular, nom_llati, tipus) values ('Potus', 'Philodendron', 'P');
insert into plantes (nom_popular, nom_llati, tipus) values ('Cintes','Chlorophytum', 'P');
insert into plantes (nom_popular, nom_llati, tipus) values ('Poinsetia', 'Euphorbia', 'T');
insert into plantes (nom_popular, nom_llati, tipus) values ('Heura', 'Hedera', 'P');
insert into plantes (nom_popular, nom_llati, tipus) values ('Ficus Benjamina', 'Ficus', 'P');
insert into plantes (nom_popular, nom_llati, tipus) values ('Croton', 'Codiaeum','P');


create table estacions(
	nom_estacio varchar(10),
	constraint pk_estacions primary key (nom_estacio)
)engine=innodb;

insert into estacions (nom_estacio) values ('Hivern');
insert into estacions (nom_estacio) values ('Primavera');
insert into estacions (nom_estacio) values ('Estiu');
insert into estacions (nom_estacio) values ('Tardor');


create table floracio(
	nom_popular varchar(10),
	estacio varchar(10),
	constraint fk_floracio_plantes foreign key (nom_popular) references plantes(nom_popular),
	constraint fk_floracio_estacions foreign key (estacio) references estacions(nom_estacio),
	constraint pk_floracio primary key (nom_popular, estacio)	
)engine=innodb;

insert into floracio (nom_popular, estacio) values ('Gerani', 'Primavera');
insert into floracio (nom_popular, estacio) values ('Begonia', 'Estiu');
insert into floracio (nom_popular, estacio) values ('Camelia', 'Primavera');
insert into floracio (nom_popular, estacio) values ('Ciclamen', 'Hivern');
insert into floracio (nom_popular, estacio) values ('Roser', 'Primavera');
insert into floracio (nom_popular, estacio) values ('Tulipa', 'Primavera');
insert into floracio (nom_popular, estacio) values ('Crisantem', 'Estiu');
insert into floracio (nom_popular, estacio) values ('Poinsetia', 'Hivern');


create table metodes_reproduccio (
	nom_metode varchar(30),
	constraint pk_metodes_reproduccio primary key (nom_metode)
)engine=innodb;

insert into metodes_reproduccio (nom_metode) values ('Llavors');
insert into metodes_reproduccio (nom_metode) values ('Esqueix');
insert into metodes_reproduccio (nom_metode) values ('Bulbs');
insert into metodes_reproduccio (nom_metode) values ('Capficats');
insert into metodes_reproduccio (nom_metode) values ('Estolons');
insert into metodes_reproduccio (nom_metode) values ('Estaques');

create table plantes_interior(
	nom_planta varchar(10),
	ubicacio varchar(30),
	temperatura int,
	constraint pk_plantes_interior primary key (nom_planta),
	constraint fk_plantes_interior_plantes foreign key (nom_planta) references plantes(nom_popular)
)engine=innodb;

insert into plantes_interior (nom_planta, ubicacio, temperatura) values ('Potus', 'Llum directa', 15);
insert into plantes_interior (nom_planta, ubicacio, temperatura) values ('Poinsetia', 'Llum indirecta', 18);
insert into plantes_interior (nom_planta, ubicacio, temperatura) values ('Ficus Benjamina', 'Llum indirecta', 19);
insert into plantes_interior (nom_planta, ubicacio, temperatura) values ('Croton', 'No corrents', 17);



create table plantes_exterior (
	nom_planta varchar(10),
	tipus_planta varchar(1),
	constraint pk_plantes_exterior primary key (nom_planta),
	constraint fk_plantes_exterior_palntes foreign key (nom_planta) references plantes(nom_popular)
)engine=innodb;

insert into plantes_exterior (nom_planta, tipus_planta) values ('Gerani','P');
insert into plantes_exterior (nom_planta, tipus_planta) values ('Begonia','P');
insert into plantes_exterior (nom_planta, tipus_planta) values ('Camelia','P');
insert into plantes_exterior (nom_planta, tipus_planta) values ('Ciclamen', 'P');
insert into plantes_exterior (nom_planta, tipus_planta) values ('Roser', 'P');
insert into plantes_exterior (nom_planta, tipus_planta) values ('Falguera', 'P');
insert into plantes_exterior (nom_planta, tipus_planta) values ('Tulipa', 'T');
insert into plantes_exterior (nom_planta, tipus_planta) values ('Crisantem',NULL);
insert into plantes_exterior (nom_planta, tipus_planta) values ('Cintes', 'P');
insert into plantes_exterior (nom_planta, tipus_planta) values ('Heura', 'P');


create table paisos(
	nom_pais varchar(15),
	constraint pk_paisos primary key (nom_pais)
)engine=innodb;



create table exemplars_plantes(
	nom_planta varchar(10),
	num_exemplar int,
	tipus varchar(1),
	constraint pk_exemplars_plantes primary key (nom_planta, num_exemplar),
	constraint fk_exemplars_plantes_plantes foreign key (nom_planta) references plantes(nom_popular)
)engine=innodb;

insert into exemplars_plantes (nom_planta, num_exemplar, tipus) values ('Gerani',1,'P');
insert into exemplars_plantes (nom_planta, num_exemplar, tipus) values ('Gerani',2,'P');
insert into exemplars_plantes (nom_planta, num_exemplar, tipus) values ('Gerani',3,'P');
insert into exemplars_plantes (nom_planta, num_exemplar, tipus) values ('Gerani',4,'P');
insert into exemplars_plantes (nom_planta, num_exemplar, tipus) values ('Gerani',5,'P');
insert into exemplars_plantes (nom_planta, num_exemplar, tipus) values ('Gerani',6,'P');
insert into exemplars_plantes (nom_planta, num_exemplar, tipus) values ('Begonia',1,'P');
insert into exemplars_plantes (nom_planta, num_exemplar, tipus) values ('Begonia',2,'P');
insert into exemplars_plantes (nom_planta, num_exemplar, tipus) values ('Begonia',3,'P');
insert into exemplars_plantes (nom_planta, num_exemplar, tipus) values ('Begonia',4,'P');
insert into exemplars_plantes (nom_planta, num_exemplar, tipus) values ('Roser',1,'P');
insert into exemplars_plantes (nom_planta, num_exemplar, tipus) values ('Roser',2,'P');
insert into exemplars_plantes (nom_planta, num_exemplar, tipus) values ('Roser',3,'P');
insert into exemplars_plantes (nom_planta, num_exemplar, tipus) values ('Roser',4,'P');
insert into exemplars_plantes (nom_planta, num_exemplar, tipus) values ('Heura',1,'P');
insert into exemplars_plantes (nom_planta, num_exemplar, tipus) values ('Heura',2,'P');
insert into exemplars_plantes (nom_planta, num_exemplar, tipus) values ('Heura',3,'P');
insert into exemplars_plantes (nom_planta, num_exemplar, tipus) values ('Heura',4,'P');
insert into exemplars_plantes (nom_planta, num_exemplar, tipus) values ('Ficus Benjamina',1,'P');
insert into exemplars_plantes (nom_planta, num_exemplar, tipus) values ('Ficus Benjamina',2,'P');
insert into exemplars_plantes (nom_planta, num_exemplar, tipus) values ('Croton',1,'P');
insert into exemplars_plantes (nom_planta, num_exemplar, tipus) values ('Croton',2,'P');
insert into exemplars_plantes (nom_planta, num_exemplar, tipus) values ('Croton',3,'P');
insert into exemplars_plantes (nom_planta, num_exemplar, tipus) values ('Poinsetia',1,'T');
insert into exemplars_plantes (nom_planta, num_exemplar, tipus) values ('Poinsetia',2,'T');
insert into exemplars_plantes (nom_planta, num_exemplar, tipus) values ('Ciclamen',1,'P');


create table botigues(
	codi_botiga int,
	nom_botiga varchar(10),
	telefon int(9),
	constraint pk_botigues primary key (codi_botiga)
)engine=innodb;

create table exemplars_comprats(
	nom_planta varchar(10),
	num_exemplar int,
	preu int, 
	data_compra date,
	botiga int not null,
	constraint pk_exemplars_comprats primary key (nom_planta, num_exemplar),
	constraint fk_exemplars_comprats_explantes foreign key (nom_planta, num_exemplar) references exemplars_plantes(nom_planta, num_exemplar),
	constraint fk_exemplars_comprats_botiga foreign key (botiga) references botigues(codi_botiga)
)engine=innodb;


create table exemplars_reproduits(
	nom_planta varchar(10),
	num_exemplar int,
	constraint pk_exemplars_reproduits primary key (nom_planta, num_exemplar),
	constraint fk_exemplars_reproduits foreign key (nom_planta, num_exemplar) references exemplars_plantes(nom_planta,  num_exemplar)
)engine=innodb;


create table reproduccio_esqueix(
	nom_planta varchar(10),
	num_exemplar int,
	nom_pare varchar(10) not null,
	num_exemplar_pare int not null,
	constraint pk_reproduccio_esqueix primary key (nom_planta, num_exemplar),
	constraint fk_reproduccio_esqueix foreign key (nom_planta, num_exemplar) references exemplars_reproduits(nom_planta, num_exemplar),
	constraint fk_reproduccio_esqueix2 foreign key (nom_pare, num_exemplar_pare) references exemplars_plantes(nom_planta, num_exemplar)
)engine=innodb;


create table altres_exemplars_reproduits(
	nom_planta varchar(10),
	num_exemplar int,
	constraint pk_altres_exemplars_reproduits primary key (nom_planta, num_exemplar),
	constraint fk_altres_exemplars_reproduits foreign key (nom_planta,  num_exemplar) references exemplars_reproduits(nom_planta, num_exemplar)
)engine=innodb;
 

create table agents(
	nom_agent varchar(30),
	constraint pk_agents primary key (nom_agent)
)engine=innodb;


create table malalties(
	nom_malaltia varchar(10),
	descripcio varchar(30),
	agent varchar(30) not null,
	constraint pk_malalties primary key	(nom_malaltia),
	constraint fk_malalties foreign key	(agent) references agents(nom_agent)
)engine=innodb;


create table amics(
	nom_amic varchar(10),
	adreça varchar(30),
	telefon_amic int(9),
	constraint pk_amics primary key (nom_amic)
)engine=innodb;


create table dates(
	data_temps date,
	constraint pk_dates primary key (data_temps)
)engine=innodb;


create table dosi_adobs(
	nom_planta varchar(10),
	nom_estacio varchar(10),
	nom_adob varchar (10),
	qtat_adob int,
	constraint pk_dosi_adobs primary key (nom_planta, nom_estacio, nom_adob),
	constraint fk_dosi_adobs_plantes foreign key (nom_planta) references plantes(nom_popular),
	constraint fk_dosi_adobs_estacions foreign key (nom_estacio) references estacions(nom_estacio),
	constraint fk_dosi_adobs_adobs foreign key (nom_adob) references adobs(nom_adob),
	constraint control_adobs check (qtat_adob >= 20),
	constraint control_adobs_seg check (qtat_adob <= 100)
)engine=innodb;

insert into dosi_adobs (nom_planta, nom_estacio, nom_adob, qtat_adob) values ('Gerani','Primavera','Casadob',30);
insert into dosi_adobs (nom_planta, nom_estacio, nom_adob, qtat_adob) values ('Gerani','Hivern','Vitaplant',20);
insert into dosi_adobs (nom_planta, nom_estacio, nom_adob, qtat_adob) values ('Begonia','Estiu','Casadob',25);
insert into dosi_adobs (nom_planta, nom_estacio, nom_adob, qtat_adob) values ('Camelia','Hivern','Plantavit',50);
insert into dosi_adobs (nom_planta, nom_estacio, nom_adob, qtat_adob) values ('Camelia','Primavera','Casadob',75);
insert into dosi_adobs (nom_planta, nom_estacio, nom_adob, qtat_adob) values ('Ciclamen','Tardor','Casadob',30);
insert into dosi_adobs (nom_planta, nom_estacio, nom_adob, qtat_adob) values ('Crisantem','Primavera','Casadob',45);
insert into dosi_adobs (nom_planta, nom_estacio, nom_adob, qtat_adob) values ('Begonia','Primavera','Nutreplant',50);
insert into dosi_adobs (nom_planta, nom_estacio, nom_adob, qtat_adob) values ('Roser','Primavera','Casadob',50);
insert into dosi_adobs (nom_planta, nom_estacio, nom_adob, qtat_adob) values ('Roser','Primavera','Creixplant',30);
insert into dosi_adobs (nom_planta, nom_estacio, nom_adob, qtat_adob) values ('Falguera','Primavera','Casadob',40);
insert into dosi_adobs (nom_planta, nom_estacio, nom_adob, qtat_adob) values ('Falguera','Tardor','Plantadob',20);
insert into dosi_adobs (nom_planta, nom_estacio, nom_adob, qtat_adob) values ('Tulipa','Hivern','Casadob',40);
insert into dosi_adobs (nom_planta, nom_estacio, nom_adob, qtat_adob) values ('Potus','Primavera','Casadob',30);
insert into dosi_adobs (nom_planta, nom_estacio, nom_adob, qtat_adob) values ('Cintes','Tardor','Casadob',30);
insert into dosi_adobs (nom_planta, nom_estacio, nom_adob, qtat_adob) values ('Cintes','Hivern','Superplant',40);
insert into dosi_adobs (nom_planta, nom_estacio, nom_adob, qtat_adob) values ('Poinsetia','Hivern','Casadob',50);
insert into dosi_adobs (nom_planta, nom_estacio, nom_adob, qtat_adob) values ('Poinsetia','Hivern','Sanexplant',45);
insert into dosi_adobs (nom_planta, nom_estacio, nom_adob, qtat_adob) values ('Heura','Primavera','Casadob',50);
insert into dosi_adobs (nom_planta, nom_estacio, nom_adob, qtat_adob) values ('Croton','Primavera','Casadob',40);
insert into dosi_adobs (nom_planta, nom_estacio, nom_adob, qtat_adob) values ('Croton','Estiu','Casadob',60);
insert into dosi_adobs (nom_planta, nom_estacio, nom_adob, qtat_adob) values ('Gerani','Estiu','Sanexplant',40);
insert into dosi_adobs (nom_planta, nom_estacio, nom_adob, qtat_adob) values ('Ficus Benjamina','Primavera','Casadob',50);


create table rec_plantes(
	nom_planta varchar(10),
	nom_estacio varchar(10),
	qtat_aigua int,
	constraint pk_rec_plantes primary key (nom_planta, nom_estacio),
	constraint fk_rec_plantes foreign key (nom_planta) references plantes(nom_popular),
	constraint fk_rec_plantes1 foreign key (nom_estacio) references estacions(nom_estacio)
)engine=innodb;


create table origen_plantes(
	nom_planta varchar(10),
	nom_pais varchar(10),
	constraint pk_origen_plantes primary key (nom_planta, nom_pais),
	constraint fk_origen_plantes foreign key (nom_planta) references plantes_interior(nom_planta),
	constraint fk_origen_plantes2 foreign key (nom_pais) references paisos(nom_pais)
)engine=innodb;


create table reproduccions(
	nom_planta varchar(10),
	nom_metode varchar(10),
	grau_exit varchar(5),
	constraint pk_reproduccions primary key (nom_planta, nom_metode),
	constraint fk_reproduccions foreign key (nom_planta) references plantes(nom_popular),
	constraint fk_reproduccions2 foreign key (nom_metode) references metodes_reproduccio(nom_metode)
)engine=innodb;

insert into reproduccions (nom_planta, nom_metode, grau_exit) values ('Gerani','Esqueix','Alt');
insert into reproduccions (nom_planta, nom_metode, grau_exit) values ('Begonia','Esqueix','Alt');
insert into reproduccions (nom_planta, nom_metode, grau_exit) values ('Begonia','Capficats','Alt');
insert into reproduccions (nom_planta, nom_metode, grau_exit) values ('Begonia','Llavors','Baix');
insert into reproduccions (nom_planta, nom_metode, grau_exit) values ('Roser','Estaques','Mitja');
insert into reproduccions (nom_planta, nom_metode, grau_exit) values ('Cintes','Estolons','Alt');
insert into reproduccions (nom_planta, nom_metode, grau_exit) values ('Ciclamen','Esqueix','Alt');
insert into reproduccions (nom_planta, nom_metode, grau_exit) values ('Ciclamen','Capficats','Alt');
insert into reproduccions (nom_planta, nom_metode, grau_exit) values ('Potus','Capficats','Mitja');
insert into reproduccions (nom_planta, nom_metode, grau_exit) values ('Potus','Esqueix','Alt');
insert into reproduccions (nom_planta, nom_metode, grau_exit) values ('Tulipa','Bulbs','Alt');
insert into reproduccions (nom_planta, nom_metode, grau_exit) values ('Ficus Benjamina','Estaques','Baix');
insert into reproduccions (nom_planta, nom_metode, grau_exit) values ('Ficus Benjamina','Capficats','Baix');
insert into reproduccions (nom_planta, nom_metode, grau_exit) values ('Croton','Esqueix','Baix');
insert into reproduccions (nom_planta, nom_metode, grau_exit) values ('Croton','Capficats','Baix');
insert into reproduccions (nom_planta, nom_metode, grau_exit) values ('Falguera','Esqueix','Mitja');
insert into reproduccions (nom_planta, nom_metode, grau_exit) values ('Heura','Esqueix','Alt');
insert into reproduccions (nom_planta, nom_metode, grau_exit) values ('Crisantem','Bulbs','Alt');
insert into reproduccions (nom_planta, nom_metode, grau_exit) values ('Camelia','Estaques','Alt');
insert into reproduccions (nom_planta, nom_metode, grau_exit) values ('Heura','Capficats','Alt');
insert into reproduccions (nom_planta, nom_metode, grau_exit) values ('Poinsetia','Llavors','Baix');
insert into reproduccions (nom_planta, nom_metode, grau_exit) values ('Poinsetia','Esqueix','Baix');


create table prestecs(
	data_inici date,
	nom_planta varchar(10),
	num_exemplar int,
	amic varchar(10) not null,
	data_devolucio date,
	constraint pk_prestecs primary key (data_inici, nom_planta, num_exemplar),
	constraint fk_prestecs foreign key (data_inici) references dates(data_temps),
	constraint fk_prestecs2 foreign key (nom_planta, num_exemplar) references exemplars_plantes(nom_planta, num_exemplar),
	constraint fk_prestecs3 foreign key (amic) references amics(nom_amic)
)engine=innodb;


create table historial_malalties(
	data_inici date,
	malaltia varchar(10),
	nom_planta varchar(10),
	num_exemplar int,
	remei varchar(10),
	data_recuperacio date,
	constraint pk_historial_malalties primary key (data_inici, malaltia, nom_planta, num_exemplar),
	constraint fk_historial_malalties foreign key (data_inici) references dates(data_temps),
	constraint fk_historial_malalties1 foreign key (malaltia) references malalties(nom_malaltia),
	constraint fk_historial_malalties2 foreign key (nom_planta, num_exemplar) references exemplars_plantes(nom_planta, num_exemplar)
)engine=innodb;