-- adresy na ktorych nebyva ziaden zamestnanec
select * from adresa a where not exists (
    select 1 from zamestnanec z where a.id_adresa = z.id_adresa
);


select * from adresa
except
select a.* from adresa a join zamestnanec z on a.id_adresa = z.id_adresa;


select * from adresa where adresa.id_adresa not in (select z.id_adresa from zamestnanec z);


-- DOTAZ C
-- hacky, ktore sa predali iba v obchode s id 1
select distinct h.* from hracka h join produkt_tranzakcie pt using(id_hracka) join tranzakcia t using (id_tranzakcia) 
join hrackarstvo hr using(id_obchod)
where id_obchod = 1
except
select h.* from hracka h join produkt_tranzakcie pt using(id_hracka) join tranzakcia t using (id_tranzakcia) join 
hrackarstvo hr using(id_obchod)
where id_obchod != 1;


-- {{
--   {
--     {
--       {
--         {
--           hrackarstvo(id_obchod=1) * tranzakcia
--         }[id_tranzakcia] * produkt_tranzakcie
--       }[id_hracka]
--     } * hracka
--   }[id_hracka]
-- }
-- \
-- {
--   {
--     {
--       {
--         {
--           hrackarstvo(id_obchod!=1) * tranzakcia
--         }[id_tranzakcia] * produkt_tranzakcie
--       }[id_hracka]
--     } * hracka
--   }[id_hracka]
-- }} * hracka


-- DOTAZ D
-- atrakcie, ktore su vo vsetkych arkadach
select at.* from atrakcia at where not exists (
    select * from arkada ar where not exists (
        select * from atrakcia_arkada aa where ar.id_obchod = aa.id_obchod and at.id_atrakcia = aa.id_atrakcia
    )
);

-- {atrakcia_arkada[id_atrakcia, id_obchod]÷arkada[id_obchod]}*atrakcia


-- agregacne

SELECT h.id_hracka, nazov as nazov_hracky, sum(pocet_kusov) as pocet_predanych_kusov
FROM hracka h
join produkt_tranzakcie using(id_hracka)
GROUP BY h.id_hracka, h.nazov
HAVING sum(pocet_kusov) > 10
ORDER BY pocet_predanych_kusov DESC;


-- try to add a shop without being arcade or toys


SELECT atr.* FROM atrakcia atr
JOIN (
-- vrati vsetky atrakcia id, ktore su z pouzitie_atrakcie, musime este joinnut aby sme vypisali atrakciu
SELECT DISTINCT aa.id_atrakcia, count(aa.id_atrakcia_arkada) FROM atrakcia a JOIN atrakcia_arkada aa using(id_atrakcia) 
JOIN pouzitie_atrakcie pa using(id_atrakcia_arkada)
GROUP BY aa.id_atrakcia_arkada
HAVING count(aa.id_atrakcia_arkada) > 15
) R1
ON atr.id_atrakcia = R1.id_atrakcia

