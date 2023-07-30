-- SQL queries - queries to get data from the toystore and arcades

-- 1 = select all transactions that have a toy named "Plyšová červená srdíčka"
SELECT DISTINCT tranzakcia.* FROM tranzakcia
join produkt_tranzakcie on tranzakcia.id_tranzakcia=produkt_tranzakcie.id_tranzakcia
join hracka on hracka.id_hracka=produkt_tranzakcie.id_hracka WHERE nazov = 'Plyšová červená srdíčka';


-- 2 = What toys were sold at 13.06.2023
SELECT DISTINCT nazov FROM tranzakcia
join produkt_tranzakcie using(id_tranzakcia)
join hracka using(id_hracka) WHERE datum = '2023.06.13';


-- 3 = Display all products from all transactions that were above 500 EUR (in 3 different ways)
SELECT pt.* FROM tranzakcia t join produkt_tranzakcie pt using(id_tranzakcia) WHERE cena_spolu > 500;

SELECT pt.* FROM tranzakcia t join produkt_tranzakcie pt using(id_tranzakcia)
except
SELECT pt.* FROM tranzakcia t join produkt_tranzakcie pt using(id_tranzakcia) WHERE cena_spolu <= 500;

SELECT pt.* FROM tranzakcia t join produkt_tranzakcie pt using(id_tranzakcia) WHERE id_tranzakcia not in (
    SELECT pt.id_tranzakcia FROM tranzakcia t join produkt_tranzakcie pt using(id_tranzakcia) WHERE cena_spolu <= 500
);


-- 4 = Display all arcades, that have every attraction
SELECT a.* FROM obchod a WHERE not exists(
    SELECT * FROM atrakcia at WHERE not exists(
        SELECT * FROM atrakcia_arkada aa WHERE aa.id_obchod=a.id_obchod AND aa.id_atrakcia=at.id_atrakcia
    )
);


-- 5 = Verify if query num 4 is correct (it should return 0 results in the end)
select * from atrakcia

except

SELECT atrakcia.* FROM atrakcia join atrakcia_arkada using(id_atrakcia) join obchod using(id_obchod)
WHERE id_obchod=(
    SELECT a.id_obchod FROM obchod a WHERE not exists(
        SELECT * FROM atrakcia at WHERE not exists(
            SELECT * FROM atrakcia_arkada aa WHERE aa.id_obchod=a.id_obchod AND aa.id_atrakcia=at.id_atrakcia
        )
    )
);


-- 6 = Attractions, that are in the arcade with a name 'Bláznovstvo' and nowhere else
SELECT DISTINCT a.* FROM atrakcia a join atrakcia_arkada using(id_atrakcia) join obchod o using(id_obchod)
WHERE o.nazov_obchod='Bláznovstvo'
except
SELECT DISTINCT a.* FROM atrakcia a join atrakcia_arkada using(id_atrakcia) join obchod o using(id_obchod)
WHERE o.nazov_obchod!='Bláznovstvo';


-- 7 = Toys that were never sold
SELECT DISTINCT h.* FROM hracka h WHERE not exists (
    SELECT 1 FROM produkt_tranzakcie pt WHERE h.id_hracka=pt.id_hracka
);


-- 8 = All transactions with a price of at least 300 eur, which were made in the toy shop named 'Bambule'
SELECT t.* FROM tranzakcia t join obchod o using(id_obchod) WHERE t.cena_spolu >= 300 AND o.nazov_obchod='Bambule';


-- 9 = Employees from a shop named 'Kouzelné hračkářství', that have a function: 'predávač'
SELECT z.* FROM zamestnanec z join obchod o using(id_obchod) WHERE z.funkcia='predávač' AND o.nazov_obchod='Kouzelné 
hračkářství';


-- 10 = get number of sold toys with a name 'Plyšový ptáček'
SELECT nazov as nazov_hracky, sum(pocet_kusov) as pocet_predanych_kusov
FROM hracka h
join produkt_tranzakcie using(id_hracka)
WHERE h.nazov='Plyšový ptáček'
GROUP BY h.id_hracka, h.nazov;


-- 11 = get every attraction, that has in any arcade more than 15 uses
SELECT atr.* FROM atrakcia atr
JOIN (
-- vrati vsetky atrakcia id, ktore su z pouzitie_atrakcie, musime este joinnut aby sme vypisali atrakciu
SELECT DISTINCT aa.id_atrakcia FROM atrakcia a JOIN atrakcia_arkada aa using(id_atrakcia) JOIN pouzitie_atrakcie pa 
using(id_atrakcia_arkada)
GROUP BY aa.id_atrakcia_arkada
HAVING count(aa.id_atrakcia_arkada) > 15
) R1
ON atr.id_atrakcia = R1.id_atrakcia;


-- 12 = Attractions, that are in an arcade named: 'Dance revolution hub' and in an arcade named: 'Križník'
SELECT a.* FROM atrakcia a JOIN atrakcia_arkada using(id_atrakcia) JOIN obchod o using(id_obchod) WHERE 
o.nazov_obchod='Dance revolution hub'
intersect
SELECT a.* FROM atrakcia a JOIN atrakcia_arkada using(id_atrakcia) JOIN obchod o using(id_obchod) WHERE 
o.nazov_obchod='Križník';


-- 13 = Attractions, that are in an arcade named: 'Dance revolution hub' or in an arcade: 'Križník' but not in both of 
them
(
SELECT a.* FROM atrakcia a JOIN atrakcia_arkada using(id_atrakcia) JOIN obchod o using(id_obchod) WHERE 
o.nazov_obchod='Dance revolution hub' OR o.nazov_obchod='Križník'
)
except (
SELECT a.* FROM atrakcia a JOIN atrakcia_arkada using(id_atrakcia) JOIN obchod o using(id_obchod) WHERE 
o.nazov_obchod='Dance revolution hub'
intersect
SELECT a.* FROM atrakcia a JOIN atrakcia_arkada using(id_atrakcia) JOIN obchod o using(id_obchod) WHERE 
o.nazov_obchod='Križník'
);


-- 14 = Show all toys and for how much they've sold. Order the result from the toy that was sold the most to the least
SELECT h.nazov as nazov_hracky, sum(pt.cena) as predane_spolu
FROM hracka h
left join produkt_tranzakcie pt using(id_hracka)
GROUP BY h.nazov, h.id_hracka
ORDER by predane_spolu DESC NULLS LAST;


-- 15 = Show all names of toys, their price and how many pieces were sold. Show only toys, that were above 20 EUR and 
were
--      at least in 5 different transactions. Order result from the most sold to the least
SELECT h.nazov as nazov_hracky, h.cena as cena_hracky, sum(pt.pocet_kusov) as pocet_predanych_kusov_spolu
FROM hracka h
JOIN produkt_tranzakcie pt using(id_hracka)
WHERE h.cena > 20
GROUP BY h.nazov, h.cena, h.id_hracka
HAVING count(DISTINCT pt.id_tranzakcia) >= 5
ORDER by pocet_predanych_kusov_spolu DESC;


-- 16 = create view of employees with a salary of over 2000 eur
create or replace view bohaty_zamestnanec as
SELECT z.* FROM zamestnanec z WHERE plat >= 2000;

SELECT * FROM bohaty_zamestnanec;


-- 17 = Show all employees from the previous view that have function 'manažér'
SELECT bz.* FROM bohaty_zamestnanec bz WHERE bz.funkcia='manažér';


-- 18 = Show all possible combinations of all shops and employees
SELECT o.*, z.* from obchod o
CROSS JOIN zamestnanec z;


-- 19 = Pick all employees who are from a country 'Slovensko' or have function 'technik'
SELECT DISTINCT *
FROM (
    SELECT DISTINCT z.* FROM zamestnanec z join adresa a on z.id_adresa=a.id_adresa WHERE a.stat = 'Slovensko'
) R1
UNION
SELECT DISTINCT * FROM zamestnanec WHERE funkcia = 'technik';


-- 20 = Show adresses, employees and shops. Show address even if there's nothing there. Order result by id_adresa
SELECT * FROM adresa a
left join obchod o on a.id_adresa=o.id_adresa
left join zamestnanec z on a.id_adresa=z.id_adresa
ORDER BY a.id_adresa ASC;


-- 21 = Show all employees and shops, where they're working. Show them even when shop have no employees or employees
--      are not assigned to any shop
SELECT * FROM zamestnanec z
FULL JOIN obchod o on z.id_obchod=o.id_obchod;


-- 22 = Get name of an attraction and in how many arcades it is
SELECT a.nazov, (
SELECT count(*) FROM atrakcia_arkada aa WHERE aa.id_atrakcia=a.id_atrakcia
) as pocet_obchodov
FROM atrakcia a


-- 23 = Delete all shops that have a country 'Slovensko'
begin;

SELECT * FROM obchod;

DELETE FROM obchod where id_adresa in (
    SELECT id_adresa FROM adresa WHERE stat='Slovensko'
);

SELECT * FROM obchod;

rollback;


-- 24 = Add a new employee based on the last added, but his name will be 'Adam Hlinka' and his personal number will be 
'9104198004'
SELECT * FROM zamestnanec ORDER BY id_zamestnanec DESC;

INSERT INTO zamestnanec (id_zamestnanec, meno, funkcia, plat, osobne_cislo, id_adresa, id_obchod)
SELECT id_zamestnanec+1, 'Adam Hlinka', funkcia, plat, '9104198004', id_adresa, id_obchod
FROM zamestnanec
order by id_zamestnanec desc limit 1;

SELECT * FROM zamestnanec ORDER BY id_zamestnanec DESC;

rollback;


-- 25 = Increase prices of all toys by 15% if their price is less than 30 EUR
begin;

SELECT * FROM hracka ORDER BY cena, id_hracka;

UPDATE hracka SET cena=cena*1.15
WHERE id_hracka in (
    SELECT id_hracka FROM hracka WHERE cena < 30
);

SELECT * FROM hracka ORDER BY cena, id_hracka;

rollback;

