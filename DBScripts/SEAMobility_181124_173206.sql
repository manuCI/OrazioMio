-- Notizia_Redattore [rel17]
alter table `notizia`  add column  `redattore_oid`  integer;
alter table `notizia`   add index fk_notizia_redattore (`redattore_oid`), add constraint fk_notizia_redattore foreign key (`redattore_oid`) references `redattore` (`user_oid`);


