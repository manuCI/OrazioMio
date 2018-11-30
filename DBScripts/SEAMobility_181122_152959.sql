-- Notizia [ent8]
alter table `notizia`  add column  `inevidenza`  bit;


-- Notizia in Evidenza [ent9]
create view `notizia_in_evidenza_view` as
select distinct AL1.`oid` as `oid`
from  `notizia` AL1 
where AL1.`inevidenza` = '1';


