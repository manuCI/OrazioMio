-- Group [Group]
create table `group` (
   `oid`  integer  not null,
   `groupname`  varchar(255),
  primary key (`oid`)
);


-- Module [Module]
create table `module` (
   `oid`  integer  not null,
   `moduleid`  varchar(255),
   `modulename`  varchar(255),
  primary key (`oid`)
);


-- User [User]
create table `user` (
   `oid`  integer  not null,
   `username`  varchar(255),
   `password`  varchar(255),
   `email`  varchar(255),
   `nome`  varchar(255),
   `cognome`  varchar(255),
  primary key (`oid`)
);


-- Cliente [ent1]
create table `cliente` (
   `user_oid`  integer  not null,
   `cf`  varchar(255),
   `clientespeciale`  varchar(255),
  primary key (`user_oid`)
);


-- ZTL [ent10]
create table `ztl` (
   `servizio_di_mobilita_oid`  integer  not null,
  primary key (`servizio_di_mobilita_oid`)
);


-- Parcheggio [ent11]
create table `parcheggio` (
   `servizio_di_mobilita_oid`  integer  not null,
   `postitotali`  integer,
   `postidisponibili`  integer,
  primary key (`servizio_di_mobilita_oid`)
);


-- Stazione Biciclette [ent12]
create table `stazione_biciclette` (
   `servizio_di_mobilita_oid`  integer  not null,
   `biciclettetotali`  integer,
   `biciclettedisponibili`  integer,
  primary key (`servizio_di_mobilita_oid`)
);


-- Intervallo Orario ZTL [ent14]
create table `intervallo_orario_ztl` (
   `oid`  integer  not null,
   `inizio`  varchar(255),
   `fine`  varchar(255),
  primary key (`oid`)
);


-- Tipologia di Titolo [ent15]
create table `tipologia_di_titolo` (
   `oid`  integer  not null,
   `tipo`  varchar(255),
  primary key (`oid`)
);


-- Mezzo [ent16]
create table `mezzo` (
   `oid`  integer  not null,
   `nome`  varchar(255),
  primary key (`oid`)
);


-- Linea [ent17]
create table `linea` (
   `oid`  integer  not null,
   `nome`  varchar(255),
   `destinazione`  varchar(255),
  primary key (`oid`)
);


-- Fermata [ent18]
create table `fermata` (
   `oid`  integer  not null,
   `nome`  varchar(255),
   `indirizzo`  varchar(255),
  primary key (`oid`)
);


-- Orario [ent19]
create table `orario` (
   `oid`  integer  not null,
   `stagione`  varchar(255),
   `festivita`  bit,
   `orario`  varchar(255),
  primary key (`oid`)
);


-- Coordinate di pagamento [ent2]
create table `coordinate_di_pagamento` (
   `oid`  integer  not null,
   `numerocarta`  varchar(255),
   `cvv`  varchar(255),
  primary key (`oid`)
);


-- Scadenza [ent21]
create table `scadenza` (
   `oid`  integer  not null,
   `mese`  integer,
   `anno`  integer,
  primary key (`oid`)
);


-- Redattore [ent23]
create table `redattore` (
   `user_oid`  integer  not null,
  primary key (`user_oid`)
);


-- Intervallo Orario Parcheggio [ent25]
create table `intervallo_orario_parcheggio` (
   `oid`  integer  not null,
   `inizio`  varchar(255),
   `fine`  varchar(255),
   `tariffaoraria`  double precision,
   `festivo`  bit,
  primary key (`oid`)
);


-- Località [ent27]
create table `localita` (
   `oid`  integer  not null,
   `nome`  varchar(255),
  primary key (`oid`)
);


-- Zona [ent28]
create table `zona` (
   `oid`  integer  not null,
   `nome`  varchar(255),
  primary key (`oid`)
);


-- Titolo di Viaggio [ent29]
create table `titolo_di_viaggio` (
   `oid`  integer  not null,
   `nome`  varchar(255),
   `tariffabase`  double precision,
  primary key (`oid`)
);


-- Carnet [ent3]
create table `carnet` (
   `titolo_acquistato_oid`  integer  not null,
   `corserimanenti`  integer,
  primary key (`titolo_acquistato_oid`)
);


-- Famiglia [ent4]
create table `famiglia` (
   `cliente_oid`  integer  not null,
   `oid`  integer  not null,
   `numerocomponenti`  integer,
  primary key (`cliente_oid`)
);


-- Servizio di Mobilità [ent5]
create table `servizio_di_mobilita` (
   `oid`  integer  not null,
   `indirizzo`  varchar(255),
   `nome`  varchar(255),
  primary key (`oid`)
);


-- Titolo Acquistato [ent6]
create table `titolo_acquistato` (
   `oid`  integer  not null,
   `iniziovalidita`  datetime,
   `finevalidita`  datetime,
   `tariffa`  double precision,
  primary key (`oid`)
);


-- Promozione [ent7]
create table `promozione` (
   `notizia_oid`  integer  not null,
   `datainizio`  datetime,
   `datafine`  datetime,
   `attivo`  bit,
   `sconto`  double precision,
  primary key (`notizia_oid`)
);


-- Notizia [ent8]
create table `notizia` (
   `oid`  integer  not null,
   `titolo`  varchar(255),
   `contenuto`  varchar(255),
   `datapubblicazione`  date,
   `inevidenza`  bit,
  primary key (`oid`)
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table `group`  add column  `module_oid`  integer;
alter table `group`   add index fk_group_module (`module_oid`), add constraint fk_group_module foreign key (`module_oid`) references `module` (`oid`);


-- Group_Module [Group2Module_Module2Group]
create table `group_module` (
   `group_oid`  integer not null,
   `module_oid`  integer not null,
  primary key (`group_oid`, `module_oid`)
);
alter table `group_module`   add index fk_group_module_group (`group_oid`), add constraint fk_group_module_group foreign key (`group_oid`) references `group` (`oid`);
alter table `group_module`   add index fk_group_module_module (`module_oid`), add constraint fk_group_module_module foreign key (`module_oid`) references `module` (`oid`);


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table `user`  add column  `group_oid`  integer;
alter table `user`   add index fk_user_group (`group_oid`), add constraint fk_user_group foreign key (`group_oid`) references `group` (`oid`);


-- User_Group [User2Group_Group2User]
create table `user_group` (
   `user_oid`  integer not null,
   `group_oid`  integer not null,
  primary key (`user_oid`, `group_oid`)
);
alter table `user_group`   add index fk_user_group_user (`user_oid`), add constraint fk_user_group_user foreign key (`user_oid`) references `user` (`oid`);
alter table `user_group`   add index fk_user_group_group (`group_oid`), add constraint fk_user_group_group foreign key (`group_oid`) references `group` (`oid`);


-- Cliente_Coordinate di pagamento [rel1]
alter table `coordinate_di_pagamento`  add column  `cliente_oid`  integer;
alter table `coordinate_di_pagamento`   add index fk_coordinate_di_pagamento_cli (`cliente_oid`), add constraint fk_coordinate_di_pagamento_cli foreign key (`cliente_oid`) references `cliente` (`user_oid`);


-- Mezzo_Linea [rel10]
alter table `linea`  add column  `mezzo_oid`  integer;
alter table `linea`   add index fk_linea_mezzo (`mezzo_oid`), add constraint fk_linea_mezzo foreign key (`mezzo_oid`) references `mezzo` (`oid`);


-- Linea_Orario [rel11]
alter table `fermata`  add column  `linea_oid`  integer;
alter table `fermata`   add index fk_fermata_linea (`linea_oid`), add constraint fk_fermata_linea foreign key (`linea_oid`) references `linea` (`oid`);


-- Orario_Fermata [rel13]
alter table `orario`  add column  `fermata_oid`  integer;
alter table `orario`   add index fk_orario_fermata (`fermata_oid`), add constraint fk_orario_fermata foreign key (`fermata_oid`) references `fermata` (`oid`);


-- Coordinate di pagamento_Scadenza [rel14]
alter table `scadenza`  add column  `coordinate_di_pagamento_oid`  integer;
alter table `scadenza`   add index fk_scadenza_coordinate_di_paga (`coordinate_di_pagamento_oid`), add constraint fk_scadenza_coordinate_di_paga foreign key (`coordinate_di_pagamento_oid`) references `coordinate_di_pagamento` (`oid`);


-- Cliente_Titolo Acquistato [rel15]
alter table `titolo_acquistato`  add column  `cliente_oid`  integer;
alter table `titolo_acquistato`   add index fk_titolo_acquistato_cliente (`cliente_oid`), add constraint fk_titolo_acquistato_cliente foreign key (`cliente_oid`) references `cliente` (`user_oid`);


-- Notizia_Redattore [rel17]
create table `notizia_redattore` (
   `notizia_oid`  integer not null,
   `redattore_oid`  integer not null,
  primary key (`notizia_oid`, `redattore_oid`)
);
alter table `notizia_redattore`   add index fk_notizia_redattore_notizia (`notizia_oid`), add constraint fk_notizia_redattore_notizia foreign key (`notizia_oid`) references `notizia` (`oid`);
alter table `notizia_redattore`   add index fk_notizia_redattore_redattore (`redattore_oid`), add constraint fk_notizia_redattore_redattore foreign key (`redattore_oid`) references `redattore` (`user_oid`);


-- Titolo Acquistato_Titolo di Viaggio [rel2]
alter table `titolo_acquistato`  add column  `titolo_di_viaggio_oid`  integer;
alter table `titolo_acquistato`   add index fk_titolo_acquistato_titolo_di (`titolo_di_viaggio_oid`), add constraint fk_titolo_acquistato_titolo_di foreign key (`titolo_di_viaggio_oid`) references `titolo_di_viaggio` (`oid`);


-- Fermata_Zona [rel24]
alter table `fermata`  add column  `zona_oid`  integer;
alter table `fermata`   add index fk_fermata_zona (`zona_oid`), add constraint fk_fermata_zona foreign key (`zona_oid`) references `zona` (`oid`);


-- Parcheggio_Intervallo Orario Parcheggio [rel25]
alter table `intervallo_orario_parcheggio`  add column  `parcheggio_oid`  integer;
alter table `intervallo_orario_parcheggio`   add index fk_intervallo_orario_parcheggi (`parcheggio_oid`), add constraint fk_intervallo_orario_parcheggi foreign key (`parcheggio_oid`) references `parcheggio` (`servizio_di_mobilita_oid`);


-- Promozione_Titolo di Viaggio [rel4]
alter table `titolo_di_viaggio`  add column  `promozione_oid`  integer;
alter table `titolo_di_viaggio`   add index fk_titolo_di_viaggio_promozion (`promozione_oid`), add constraint fk_titolo_di_viaggio_promozion foreign key (`promozione_oid`) references `promozione` (`notizia_oid`);


-- Titolo di Viaggio_Tipologia di Titolo [rel5]
alter table `titolo_di_viaggio`  add column  `tipologia_di_titolo_oid`  integer;
alter table `titolo_di_viaggio`   add index fk_titolo_di_viaggio_tipologia (`tipologia_di_titolo_oid`), add constraint fk_titolo_di_viaggio_tipologia foreign key (`tipologia_di_titolo_oid`) references `tipologia_di_titolo` (`oid`);


-- Tipologia di Titolo_Zona [rel6]
alter table `tipologia_di_titolo`  add column  `zona_oid`  integer;
alter table `tipologia_di_titolo`   add index fk_tipologia_di_titolo_zona (`zona_oid`), add constraint fk_tipologia_di_titolo_zona foreign key (`zona_oid`) references `zona` (`oid`);


-- ZTL_Intervallo Orario ZTL [rel7]
alter table `intervallo_orario_ztl`  add column  `ztl_oid`  integer;
alter table `intervallo_orario_ztl`   add index fk_intervallo_orario_ztl_ztl (`ztl_oid`), add constraint fk_intervallo_orario_ztl_ztl foreign key (`ztl_oid`) references `ztl` (`servizio_di_mobilita_oid`);


-- Località_Servizio di Mobilità [rel8]
alter table `servizio_di_mobilita`  add column  `localita_oid`  integer;
alter table `servizio_di_mobilita`   add index fk_servizio_di_mobilita_locali (`localita_oid`), add constraint fk_servizio_di_mobilita_locali foreign key (`localita_oid`) references `localita` (`oid`);


-- GEN FK: ZTL --> Servizio di Mobilità
alter table `ztl`   add index fk_ztl_servizio_di_mobilita (`servizio_di_mobilita_oid`), add constraint fk_ztl_servizio_di_mobilita foreign key (`servizio_di_mobilita_oid`) references `servizio_di_mobilita` (`oid`);


-- GEN FK: Parcheggio --> Servizio di Mobilità
alter table `parcheggio`   add index fk_parcheggio_servizio_di_mobi (`servizio_di_mobilita_oid`), add constraint fk_parcheggio_servizio_di_mobi foreign key (`servizio_di_mobilita_oid`) references `servizio_di_mobilita` (`oid`);


-- GEN FK: Stazione Biciclette --> Servizio di Mobilità
alter table `stazione_biciclette`   add index fk_stazione_biciclette_servizi (`servizio_di_mobilita_oid`), add constraint fk_stazione_biciclette_servizi foreign key (`servizio_di_mobilita_oid`) references `servizio_di_mobilita` (`oid`);


-- GEN FK: Cliente --> User
alter table `cliente`   add index fk_cliente_user (`user_oid`), add constraint fk_cliente_user foreign key (`user_oid`) references `user` (`oid`);


-- GEN FK: Redattore --> User
alter table `redattore`   add index fk_redattore_user (`user_oid`), add constraint fk_redattore_user foreign key (`user_oid`) references `user` (`oid`);


-- GEN FK: Carnet --> Titolo Acquistato
alter table `carnet`   add index fk_carnet_titolo_acquistato (`titolo_acquistato_oid`), add constraint fk_carnet_titolo_acquistato foreign key (`titolo_acquistato_oid`) references `titolo_acquistato` (`oid`);


-- GEN FK: Famiglia --> Cliente
alter table `famiglia`   add index fk_famiglia_cliente (`cliente_oid`), add constraint fk_famiglia_cliente foreign key (`cliente_oid`) references `cliente` (`user_oid`);


-- GEN FK: Promozione --> Notizia
alter table `promozione`   add index fk_promozione_notizia (`notizia_oid`), add constraint fk_promozione_notizia foreign key (`notizia_oid`) references `notizia` (`oid`);


-- Studente [ent24]
create view `studente_view` as
select distinct AL1.`user_oid` as `user_oid`
from  `cliente` AL1 
where AL1.`clientespeciale` = 'Studente';


-- Notizia in Evidenza [ent9]
create view `notizia_in_evidenza_view` as
select distinct AL1.`oid` as `oid`
from  `notizia` AL1 
where AL1.`inevidenza` = '1';


