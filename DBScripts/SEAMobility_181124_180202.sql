-- Redattore_Notizia [rel3]
alter table `notizia`  add column  `redattore_oid_2`  integer;
alter table `notizia`   add index fk_notizia_redattore_2 (`redattore_oid_2`), add constraint fk_notizia_redattore_2 foreign key (`redattore_oid_2`) references `redattore` (`user_oid`);


