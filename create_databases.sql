-- remove all tables

CREATE or replace FUNCTION clean_tables() RETURNS void AS $$
declare
  l_stmt text;
begin
  select 'truncate ' || string_agg(format('%I.%I', schemaname, tablename) , ',')
    into l_stmt
  from pg_tables
  where schemaname in ('public');

  execute l_stmt || ' cascade';
end;
$$ LANGUAGE plpgsql;
select clean_tables();

-- reset sequences

CREATE or replace FUNCTION restart_sequences() RETURNS void AS $$
DECLARE
i TEXT;
BEGIN
 FOR i IN (SELECT column_default FROM information_schema.columns WHERE column_default SIMILAR TO 'nextval%')
  LOOP
         EXECUTE 'ALTER SEQUENCE'||' ' || substring(substring(i from '''[a-z_]*')from '[a-z_]+') || ' '||' RESTART 1;';
  END LOOP;
END $$ LANGUAGE plpgsql;
select restart_sequences();
-- end of the removal

-- INSERTS
-- addresa
insert into adresa (id_adresa, stat, mesto, ulica, popisne_cislo, psc) values (1, 'Česko', 'Pacov', 'Truhlářská', 757, 
'39501');
insert into adresa (id_adresa, stat, mesto, ulica, popisne_cislo, psc) values (2, 'Česko', 'Pobežovice', 'Americká', 
1186, '34522');
insert into adresa (id_adresa, stat, mesto, ulica, popisne_cislo, psc) values (3, 'Česko', 'Králíky', 'Lesní', 1601, 
'56169');
insert into adresa (id_adresa, stat, mesto, ulica, popisne_cislo, psc) values (4, 'Česko', 'Dolní Bousov', 'Fügnerova', 
1250, '29404');
insert into adresa (id_adresa, stat, mesto, ulica, popisne_cislo, psc) values (5, 'Česko', 'Vežnice U Havlíckova 
Brodu', 'Alšova', 980, '58252');
insert into adresa (id_adresa, stat, mesto, ulica, popisne_cislo, psc) values (6, 'Česko', 'Pacov', 'Dělnická', 757, 
'39501');
insert into adresa (id_adresa, stat, mesto, ulica, popisne_cislo, psc) values (7, 'Česko', 'Horní Lidec', 'Truhlářská', 
974, '75612');
insert into adresa (id_adresa, stat, mesto, ulica, popisne_cislo, psc) values (8, 'Česko', 'Praha', 'Na Příkopě', 854, 
'11000');
insert into adresa (id_adresa, stat, mesto, ulica, popisne_cislo, psc) values (9, 'Česko', 'Praha', 'Petrská', 1170, 
'11000');
insert into adresa (id_adresa, stat, mesto, ulica, popisne_cislo, psc) values (10, 'Slovensko', 'Levice', 'Červenej 
armády', 315, '93401');
insert into adresa (id_adresa, stat, mesto, ulica, popisne_cislo, psc) values (11, 'Slovensko', 'Trenčín', 'Mierové 
námestie', 27, '91101');
insert into adresa (id_adresa, stat, mesto, ulica, popisne_cislo, psc) values (12, 'Slovensko', 'Komárno', 'Ulica na 
Priehon', 329, '94501');
insert into adresa (id_adresa, stat, mesto, ulica, popisne_cislo, psc) values (13, 'Slovensko', 'Bratislava', 
'Pestovateľská', 63, '82104');
insert into adresa (id_adresa, stat, mesto, ulica, popisne_cislo, psc) values (14, 'Nemecko', 'Markt Bibart', 
'Luebeckertordamm', 63, NULL);
insert into adresa (id_adresa, stat, mesto, ulica, popisne_cislo, psc) values (15, 'Česko', 'Nýrsko', 'Tyršova', 1443, 
'34022');
insert into adresa (id_adresa, stat, mesto, ulica, popisne_cislo, psc) values (16, 'Česko', 'Suchdol U Kutné Hory', 
'Bedřicha Smetany', 1631, '28502');
insert into adresa (id_adresa, stat, mesto, ulica, popisne_cislo, psc) values (17, 'Česko', 'Provodov-Šonov', 'Bratří 
Čapků', 872, '54908');
insert into adresa (id_adresa, stat, mesto, ulica, popisne_cislo, psc) values (18, 'Česko', 'Zásmuky', 'Ke hřišti', 
947, '28144');
insert into adresa (id_adresa, stat, mesto, ulica, popisne_cislo, psc) values (19, 'Česko', 'Horní Lidec', 
'Truhlářská', 974, '75612');
insert into adresa (id_adresa, stat, mesto, ulica, popisne_cislo, psc) values (20, 'Česko', 'Kovářská', 'Telnice', 709, 
'40338');
insert into adresa (id_adresa, stat, mesto, ulica, popisne_cislo, psc) values (21, 'Česko', 'Lidická', 'Doksy', 1580, 
'47201');
insert into adresa (id_adresa, stat, mesto, ulica, popisne_cislo, psc) values (22, 'Česko', 'Františkovy Lázne', 'V 
Aleji', 1865, '35101');
insert into adresa (id_adresa, stat, mesto, ulica, popisne_cislo, psc) values (23, 'Slovensko', 'Prešov', 'Tkáčska', 3, 
'08001');

-- obchod
insert into obchod (id_obchod, nazov_obchod, id_adresa) values (1, 'Bambule', 1);
insert into obchod (id_obchod, nazov_obchod, id_adresa) values (2, 'Kouzelné hračkářství', 5);
insert into obchod (id_obchod, nazov_obchod, id_adresa) values (3, 'Hračky pro všechny', 8);
insert into obchod (id_obchod, nazov_obchod, id_adresa) values (4, 'Bláznovstvo', 8);
insert into obchod (id_obchod, nazov_obchod, id_adresa) values (5, 'Dance revolution hub', 12);
insert into obchod (id_obchod, nazov_obchod, id_adresa) values (6, 'Križník', 13);
insert into obchod (id_obchod, nazov_obchod, id_adresa) values (7, 'Mágie a kúzla', 2);

-- hrackarstvo
insert into hrackarstvo (id_obchod) values (1);
insert into hrackarstvo (id_obchod) values (2);
insert into hrackarstvo (id_obchod) values (3);

-- arkada
insert into arkada (id_obchod) values (4);
insert into arkada (id_obchod) values (5);
insert into arkada (id_obchod) values (6);

-- zamestnanec
insert into zamestnanec (id_zamestnanec, meno, funkcia, plat, osobne_cislo, id_adresa, id_obchod) values (1, 'Augustýn 
Mašek', 'predávač', 1500, '8906293286', 2, 1);
insert into zamestnanec (id_zamestnanec, meno, funkcia, plat, osobne_cislo, id_adresa, id_obchod) values (2, 'Bořivoj 
Podlezl', 'predávač', 1500, '0208284329', 3, 1);
insert into zamestnanec (id_zamestnanec, meno, funkcia, plat, osobne_cislo, id_adresa, id_obchod) values (3, 'Bohuslav 
Kubíček', 'manažér', 2200, '6511250284', 4, 1);
insert into zamestnanec (id_zamestnanec, meno, funkcia, plat, osobne_cislo, id_adresa, id_obchod) values (4, 'Zbyšek 
Doležal', 'predávač', 1500, '8506303267', 6, 2);
insert into zamestnanec (id_zamestnanec, meno, funkcia, plat, osobne_cislo, id_adresa, id_obchod) values (5, 'Ctibor 
Novák', 'predávač', 1500, '7101141531', 7, 2);
insert into zamestnanec (id_zamestnanec, meno, funkcia, plat, osobne_cislo, id_adresa, id_obchod) values (6, 'Servác 
Čech', 'podpora', 1300, '8006195758', 9, 2);
insert into zamestnanec (id_zamestnanec, meno, funkcia, plat, osobne_cislo, id_adresa, id_obchod) values (7, 'Bedřich 
Slavík', 'predávač', 1800, '8808087508', 15, 3);
insert into zamestnanec (id_zamestnanec, meno, funkcia, plat, osobne_cislo, id_adresa, id_obchod) values (8, 'Lukáš 
Hladík', 'predávač', 1800, '8812019337', 16, 3);
insert into zamestnanec (id_zamestnanec, meno, funkcia, plat, osobne_cislo, id_adresa, id_obchod) values (9, 'Jarmil 
Švec', 'predávač', 1800, '6201030792', 17, 3);
insert into zamestnanec (id_zamestnanec, meno, funkcia, plat, osobne_cislo, id_adresa, id_obchod) values (10, 
'Dobroslav Čech', 'predávač', 1800, '7204047609', 18, 4);
insert into zamestnanec (id_zamestnanec, meno, funkcia, plat, osobne_cislo, id_adresa, id_obchod) values (11, 
'Miroslava Bednářová', 'technik', 2200, '7253049056', 19, 4);
insert into zamestnanec (id_zamestnanec, meno, funkcia, plat, osobne_cislo, id_adresa, id_obchod) values (12, 'Jana 
Bartíková', 'manažér', 2400, '7951021606', 20, 4);
insert into zamestnanec (id_zamestnanec, meno, funkcia, plat, osobne_cislo, id_adresa, id_obchod) values (13, 'Leona 
Marková', 'podpora', 1500, '8754029955', 21, 4);
insert into zamestnanec (id_zamestnanec, meno, funkcia, plat, osobne_cislo, id_adresa, id_obchod) values (14, 'Ondrej 
Malina', 'technik', 2000, '8601229549', 10, 5);
insert into zamestnanec (id_zamestnanec, meno, funkcia, plat, osobne_cislo, id_adresa, id_obchod) values (15, 'Vojtech 
Bača', 'predávač', 1500, '9309152116', 11, 5);
insert into zamestnanec (id_zamestnanec, meno, funkcia, plat, osobne_cislo, id_adresa, id_obchod) values (16, 'Blažej 
Slaný', 'predávač', 1500, '0212076205', 23, 6);
insert into zamestnanec (id_zamestnanec, meno, funkcia, plat, osobne_cislo, id_adresa, id_obchod) values (17, 'Tederich 
Eichel', 'technik', 2000, '8703300782', 14, 6);
insert into zamestnanec (id_zamestnanec, meno, funkcia, plat, osobne_cislo, id_adresa, id_obchod) values (18, 'Teodor 
Martinov', 'technik', 2200, '9309117620', 14, NULL);

-- atrakcia
insert into atrakcia (id_atrakcia, nazov, cena_nakupu, cena_hry) values (1, 'Pac-Man', 3000, 0.5);
insert into atrakcia (id_atrakcia, nazov, cena_nakupu, cena_hry) values (2, 'Donkey Kong', 4000, 0.5);
insert into atrakcia (id_atrakcia, nazov, cena_nakupu, cena_hry) values (3, 'Space Invaders', 2000, 0.5);
insert into atrakcia (id_atrakcia, nazov, cena_nakupu, cena_hry) values (4, 'Street Fighter II', 2000, 0.5);
insert into atrakcia (id_atrakcia, nazov, cena_nakupu, cena_hry) values (5, 'Asteroidy', 3000, 0.5);
insert into atrakcia (id_atrakcia, nazov, cena_nakupu, cena_hry) values (6, 'Galaga', 2000, 0.5);
insert into atrakcia (id_atrakcia, nazov, cena_nakupu, cena_hry) values (7, 'Tetris', 3000, 0.5);
insert into atrakcia (id_atrakcia, nazov, cena_nakupu, cena_hry) values (8, 'Dance Dance Revolution', 6000, 1);
insert into atrakcia (id_atrakcia, nazov, cena_nakupu, cena_hry) values (9, 'Super Mario Bros', 4000, 0.75);
insert into atrakcia (id_atrakcia, nazov, cena_nakupu, cena_hry) values (10, 'Mario Kart', 3000, 0.75);
insert into atrakcia (id_atrakcia, nazov, cena_nakupu, cena_hry) values (11, 'Mortal Kombat', 4000, 0.75);
insert into atrakcia (id_atrakcia, nazov, cena_nakupu, cena_hry) values (12, 'Kytarový hrdina', 3000, 0.5);
insert into atrakcia (id_atrakcia, nazov, cena_nakupu, cena_hry) values (13, 'Arkádová hra Simpsonovi', 2000, 0.5);
insert into atrakcia (id_atrakcia, nazov, cena_nakupu, cena_hry) values (14, 'NBA Jam', 3000, 0.5);
insert into atrakcia (id_atrakcia, nazov, cena_nakupu, cena_hry) values (15, 'Time Crisis', 5000, 0.75);

-- atrakcia v arkade
insert into atrakcia_arkada (id_atrakcia_arkada, id_obchod, id_atrakcia) values (1, 4, 1);
insert into atrakcia_arkada (id_atrakcia_arkada, id_obchod, id_atrakcia) values (2, 4, 2);
insert into atrakcia_arkada (id_atrakcia_arkada, id_obchod, id_atrakcia) values (3, 4, 3);
insert into atrakcia_arkada (id_atrakcia_arkada, id_obchod, id_atrakcia) values (4, 4, 4);
insert into atrakcia_arkada (id_atrakcia_arkada, id_obchod, id_atrakcia) values (5, 4, 5);
insert into atrakcia_arkada (id_atrakcia_arkada, id_obchod, id_atrakcia) values (6, 4, 8);
insert into atrakcia_arkada (id_atrakcia_arkada, id_obchod, id_atrakcia) values (7, 4, 10);
insert into atrakcia_arkada (id_atrakcia_arkada, id_obchod, id_atrakcia) values (8, 4, 13);
insert into atrakcia_arkada (id_atrakcia_arkada, id_obchod, id_atrakcia) values (9, 4, 14);
insert into atrakcia_arkada (id_atrakcia_arkada, id_obchod, id_atrakcia) values (10, 4, 15);
insert into atrakcia_arkada (id_atrakcia_arkada, id_obchod, id_atrakcia) values (11, 5, 6);
insert into atrakcia_arkada (id_atrakcia_arkada, id_obchod, id_atrakcia) values (12, 5, 7);
insert into atrakcia_arkada (id_atrakcia_arkada, id_obchod, id_atrakcia) values (13, 5, 8);
insert into atrakcia_arkada (id_atrakcia_arkada, id_obchod, id_atrakcia) values (14, 5, 9);
insert into atrakcia_arkada (id_atrakcia_arkada, id_obchod, id_atrakcia) values (15, 5, 10);
insert into atrakcia_arkada (id_atrakcia_arkada, id_obchod, id_atrakcia) values (16, 5, 11);
insert into atrakcia_arkada (id_atrakcia_arkada, id_obchod, id_atrakcia) values (17, 5, 13);
insert into atrakcia_arkada (id_atrakcia_arkada, id_obchod, id_atrakcia) values (18, 5, 14);
insert into atrakcia_arkada (id_atrakcia_arkada, id_obchod, id_atrakcia) values (19, 6, 7);
insert into atrakcia_arkada (id_atrakcia_arkada, id_obchod, id_atrakcia) values (20, 6, 8);
insert into atrakcia_arkada (id_atrakcia_arkada, id_obchod, id_atrakcia) values (21, 6, 9);
insert into atrakcia_arkada (id_atrakcia_arkada, id_obchod, id_atrakcia) values (22, 6, 10);
insert into atrakcia_arkada (id_atrakcia_arkada, id_obchod, id_atrakcia) values (23 ,6, 12);
insert into atrakcia_arkada (id_atrakcia_arkada, id_obchod, id_atrakcia) values (24, 6, 13);
-- uplne nove atrakcie pre arkadu, este nemaju hry
insert into atrakcia_arkada (id_atrakcia_arkada, id_obchod, id_atrakcia) values (25, 4, 6);
insert into atrakcia_arkada (id_atrakcia_arkada, id_obchod, id_atrakcia) values (26, 4, 7);
insert into atrakcia_arkada (id_atrakcia_arkada, id_obchod, id_atrakcia) values (27, 4, 9);
insert into atrakcia_arkada (id_atrakcia_arkada, id_obchod, id_atrakcia) values (28, 4, 11);
insert into atrakcia_arkada (id_atrakcia_arkada, id_obchod, id_atrakcia) values (29, 4, 12);



-- hracka
insert into hracka (id_hracka, nazov, cena, popis) values (1, 'Létající talíř Rogz RFO', 12.99, NULL);
insert into hracka (id_hracka, nazov, cena, popis) values (2, 'Plyšová červená srdíčka', 6.99, NULL);
insert into hracka (id_hracka, nazov, cena, popis) values (3, 'Plyšová hračka Flossy Grinz', 7.99, NULL);
insert into hracka (id_hracka, nazov, cena, popis) values (4, 'Plyšová myš Rogz', 9.99, NULL);
insert into hracka (id_hracka, nazov, cena, popis) values (5, 'Plyšový motýl', 9.99, NULL);
insert into hracka (id_hracka, nazov, cena, popis) values (6, 'Plyšový ptáček', 9.99, NULL);
insert into hracka (id_hracka, nazov, cena, popis) values (7, 'Škádlítko Flossy Grinz se střapci', 6.99, NULL);
insert into hracka (id_hracka, nazov, cena, popis) values (8, 'Dřevěná stavebnice Fojtství', 15.99, NULL);
insert into hracka (id_hracka, nazov, cena, popis) values (9, 'Bigjigs Toys Dřevěný provazový žebřík', 19.99, NULL);
insert into hracka (id_hracka, nazov, cena, popis) values (10, 'Small Foot Kormidlo Jumbo', 11.99, NULL);
insert into hracka (id_hracka, nazov, cena, popis) values (11, 'Small Foot Venkovní hračky houpačka', 9.99, NULL);
insert into hracka (id_hracka, nazov, cena, popis) values (12, 'Small Foot Houpací síť čapí hnízdo', 22.99, 'Hnedá 
síť');
insert into hracka (id_hracka, nazov, cena, popis) values (13, 'Small Foot Houpací síť čapí hnízdo zelené', 22.99, 
NULL);
insert into hracka (id_hracka, nazov, cena, popis) values (14, 'Small Foot Prolézačka', 26.99, NULL);
insert into hracka (id_hracka, nazov, cena, popis) values (15, 'Bino První skládanka Krtek 2', 6.99, NULL);
insert into hracka (id_hracka, nazov, cena, popis) values (16, 'Bino Dřevěná šatní skříň velká - klaun', 39.99, NULL);
insert into hracka (id_hracka, nazov, cena, popis) values (17, 'Bino Dřevěné vkládací puzzle doprava', 12.99, NULL);
insert into hracka (id_hracka, nazov, cena, popis) values (18, 'Bigjigs Baby Dřevěné vkládací puzzle', 9.99, NULL);
insert into hracka (id_hracka, nazov, cena, popis) values (19, 'Bigjigs Baby Vkládací puzzle tvary', 9.99, NULL);
insert into hracka (id_hracka, nazov, cena, popis) values (20, 'Bigjigs Toys Magnetické oblékací puzzle sportovní 
aktivity', 15.99, NULL);
insert into hracka (id_hracka, nazov, cena, popis) values (21, 'Petit Collage Dárkový set pro miminka slon', 12.99, 
NULL);
insert into hracka (id_hracka, nazov, cena, popis) values (22, 'Doudou Dárková - plyšový usínáček medvídek', 11.99, 
NULL);
insert into hracka (id_hracka, nazov, cena, popis) values (23, 'RoboTime - Stavebnice RC Jeep na dálkové ovládání', 
24.99, NULL);
insert into hracka (id_hracka, nazov, cena, popis) values (24, 'Detoa Malý Architekt', 24.99, NULL);
insert into hracka (id_hracka, nazov, cena, popis) values (25, 'Bigjigs Toys Hrací desky západ slunce', 10.99, NULL);
insert into hracka (id_hracka, nazov, cena, popis) values (26, 'Vilac Stavebnice Batibloc classic 200', 15.99, NULL);
insert into hracka (id_hracka, nazov, cena, popis) values (27, 'Minecraft - Spoločenská hra', 49.99, NULL);
insert into hracka (id_hracka, nazov, cena, popis) values (28, 'Kolobežka Flexi Max', 69.99, NULL);
insert into hracka (id_hracka, nazov, cena, popis) values (29, 'Odrážadlo Chicco Red Bullet', 44.99, NULL);
insert into hracka (id_hracka, nazov, cena, popis) values (30, 'Dickie- Hasičské vysielačky', 24.99, NULL);
insert into hracka (id_hracka, nazov, cena, popis) values (31, 'Detská pračka', 39.99, NULL);
insert into hracka (id_hracka, nazov, cena, popis) values (32, 'Miele - Vysávač', 39.99, NULL);
insert into hracka (id_hracka, nazov, cena, popis) values (33, 'Bábika Fantasy', 14.99, NULL);
insert into hracka (id_hracka, nazov, cena, popis) values (34, 'Baby born – Sestra', 24.99, NULL);
insert into hracka (id_hracka, nazov, cena, popis) values (35, 'Baby Born – Dievčatko s čarovným cumlíkom', 24.99, 
NULL);
insert into hracka (id_hracka, nazov, cena, popis) values (36, 'Fidget Cube', 15.99, NULL);
insert into hracka (id_hracka, nazov, cena, popis) values (37, 'Disko guľa', 15.99, NULL);
insert into hracka (id_hracka, nazov, cena, popis) values (38, 'Hracia skrinka', 24.99, NULL);
insert into hracka (id_hracka, nazov, cena, popis) values (39, 'Šperkovnica Little Princess', 9.99, NULL);
insert into hracka (id_hracka, nazov, cena, popis) values (40, 'Fur Fluffs - Šteniatko', 29.99, NULL);
insert into hracka (id_hracka, nazov, cena, popis) values (41, 'Bang! kocková hra', 19.99, NULL);
insert into hracka (id_hracka, nazov, cena, popis) values (42, 'Harry Potter – Chyť zlatú strelu', 29.99, NULL);
insert into hracka (id_hracka, nazov, cena, popis) values (43, 'Bottle Shooter – Vodná pištoľ', 12.99, NULL);
insert into hracka (id_hracka, nazov, cena, popis) values (44, 'Zuru XShot – Tornado Tide', 18.99, NULL);
insert into hracka (id_hracka, nazov, cena, popis) values (45, 'Zuru- Micro Fast Fill', 19.99, NULL);

-- tranzakcia
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (1, '2023-06-05', 286.8, null, 
3);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (2, '2023-06-26', 225.89, null, 
1);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (3, '2023-06-04', 12.99, null, 
3);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (4, '2023-06-15', 94.95, null, 
2);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (5, '2023-06-21', 389.78, null, 
2);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (6, '2023-06-10', 71.94, null, 
3);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (7, '2023-06-18', 223.83, null, 
2);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (8, '2023-06-12', 251.81, null, 
2);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (9, '2023-06-07', 163.86, null, 
3);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (10, '2023-06-04', 77.97, null, 
3);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (11, '2023-06-18', 74.97, null, 
2);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (12, '2023-06-24', 151.93, null, 
3);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (13, '2023-06-13', 98.94, null, 
1);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (14, '2023-06-30', 362.82, null, 
1);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (15, '2023-06-25', 249.86, null, 
3);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (16, '2023-06-17', 224.91, null, 
1);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (17, '2023-06-12', 91.92, null, 
2);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (18, '2023-06-16', 291.84, null, 
3);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (19, '2023-06-08', 74.95, null, 
3);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (20, '2023-06-09', 197.83, null, 
3);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (21, '2023-06-01', 266.88, null, 
1);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (22, '2023-06-06', 429.9, null, 
1);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (23, '2023-06-19', 438.81, null, 
3);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (24, '2023-06-09', 206.85, null, 
3);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (25, '2023-06-26', 29.97, null, 
2);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (26, '2023-06-07', 45.98, null, 
2);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (27, '2023-06-24', 179.94, null, 
1);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (28, '2023-06-13', 89.97, null, 
2);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (29, '2023-06-17', 215.93, null, 
1);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (30, '2023-06-05', 214.95, null, 
1);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (31, '2023-06-29', 38.97, null, 
1);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (32, '2023-06-13', 131.87, null, 
3);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (33, '2023-06-17', 257.86, null, 
2);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (34, '2023-06-07', 174.86, null, 
1);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (35, '2023-06-07', 23.98, null, 
2);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (36, '2023-06-13', 134.94, null, 
2);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (37, '2023-06-13', 328.82, null, 
1);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (38, '2023-06-24', 565.78, null, 
3);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (39, '2023-06-26', 309.87, null, 
1);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (40, '2023-06-06', 366.83, null, 
2);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (41, '2023-06-13', 403.84, null, 
1);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (42, '2023-06-15', 270.86, null, 
3);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (43, '2023-06-05', 373.83, null, 
2);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (44, '2023-06-13', 52.95, null, 
1);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (45, '2023-06-16', 213.87, null, 
2);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (46, '2023-06-20', 145.92, null, 
3);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (47, '2023-06-23', 59.94, null, 
3);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (48, '2023-06-11', 39.98, null, 
1);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (49, '2023-06-13', 333.81, null, 
2);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (50, '2023-06-01', 87.93, null, 
1);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (51, '2023-06-01', 320.89, null, 
1);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (52, '2023-06-27', 450.84, null, 
3);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (53, '2023-06-17', 69.99, null, 
3);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (54, '2023-06-16', 318.79, null, 
3);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (55, '2023-06-27', 114.93, null, 
1);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (56, '2023-06-18', 185.88, null, 
2);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (57, '2023-06-24', 47.94, null, 
3);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (58, '2023-06-26', 99.93, null, 
3);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (59, '2023-06-04', 44.99, null, 
3);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (60, '2023-06-17', 27.96, null, 
2);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (61, '2023-06-03', 258.85, null, 
3);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (62, '2023-06-18', 250.91, null, 
3);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (63, '2023-06-06', 169.95, null, 
1);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (64, '2023-06-30', 174.93, null, 
3);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (65, '2023-06-24', 237.9, null, 
3);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (66, '2023-06-17', 217.89, null, 
3);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (67, '2023-06-28', 119.9, null, 
2);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (68, '2023-06-19', 19.99, null, 
1);
insert into tranzakcia (id_tranzakcia, datum, cena_spolu, poznamka, id_obchod) values (69, '2023-06-15', 15.99, null, 
1);

-- produkt tranzakcie
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (1, 1, 4, 51.96);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (31, 1, 2, 79.98);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (21, 1, 5, 64.95);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (37, 1, 3, 47.97);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (2, 1, 6, 41.94);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (37, 2, 3, 47.97);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (41, 2, 2, 39.98);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (12, 2, 6, 137.94);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (43, 3, 1, 12.99);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (44, 4, 5, 94.95);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (4, 5, 2, 19.98);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (44, 5, 5, 94.95);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (30, 5, 5, 124.95);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (9, 5, 5, 99.95);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (18, 5, 5, 49.95);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (22, 6, 6, 71.94);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (11, 7, 1, 9.99);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (15, 7, 6, 41.94);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (30, 7, 4, 99.96);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (10, 7, 6, 71.94);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (26, 8, 6, 95.94);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (6, 8, 5, 49.95);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (13, 8, 2, 45.98);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (11, 8, 6, 59.94);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (5, 9, 6, 59.94);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (1, 9, 6, 77.94);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (17, 9, 2, 25.98);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (31, 10, 1, 39.99);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (44, 10, 2, 37.98);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (35, 11, 3, 74.97);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (34, 12, 1, 24.99);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (15, 12, 1, 6.99);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (35, 12, 4, 99.96);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (41, 12, 1, 19.99);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (9, 13, 3, 59.97);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (21, 13, 3, 38.97);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (19, 14, 3, 29.97);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (31, 14, 6, 239.94);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (2, 14, 3, 20.97);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (36, 14, 2, 31.98);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (11, 14, 4, 39.96);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (33, 15, 4, 59.96);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (1, 15, 5, 64.95);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (30, 15, 5, 124.95);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (24, 16, 4, 99.96);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (23, 16, 5, 124.95);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (18, 17, 3, 29.97);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (19, 17, 3, 29.97);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (26, 17, 2, 31.98);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (15, 18, 6, 41.94);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (35, 18, 5, 124.95);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (23, 18, 5, 124.95);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (33, 19, 5, 74.95);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (10, 20, 6, 71.94);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (3, 20, 5, 39.95);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (36, 20, 2, 31.98);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (2, 20, 2, 13.98);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (41, 20, 2, 39.98);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (44, 21, 5, 94.95);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (2, 21, 1, 6.99);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (42, 21, 3, 89.97);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (34, 21, 3, 74.97);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (36, 22, 5, 79.95);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (28, 22, 5, 349.95);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (3, 23, 3, 23.97);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (41, 23, 6, 119.94);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (4, 23, 2, 19.98);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (34, 23, 3, 74.97);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (31, 23, 5, 199.95);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (25, 24, 3, 32.97);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (26, 24, 6, 95.94);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (1, 24, 6, 77.94);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (4, 25, 3, 29.97);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (12, 26, 2, 45.98);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (40, 27, 6, 179.94);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (42, 28, 3, 89.97);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (19, 29, 2, 19.98);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (36, 29, 1, 15.99);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (29, 29, 4, 179.96);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (32, 30, 2, 79.98);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (29, 30, 3, 134.97);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (21, 31, 3, 38.97);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (37, 32, 2, 31.98);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (3, 32, 5, 39.95);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (19, 32, 2, 19.98);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (5, 32, 4, 39.96);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (6, 33, 6, 59.94);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (30, 33, 2, 49.98);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (35, 33, 5, 124.95);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (13, 33, 1, 22.99);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (7, 34, 2, 13.98);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (45, 34, 4, 79.96);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (13, 34, 1, 22.99);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (15, 34, 4, 27.96);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (4, 34, 3, 29.97);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (10, 35, 2, 23.98);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (6, 36, 1, 9.99);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (34, 36, 4, 99.96);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (35, 36, 1, 24.99);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (18, 37, 3, 29.97);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (43, 37, 6, 77.94);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (36, 37, 2, 31.98);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (40, 37, 4, 119.96);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (12, 37, 3, 68.97);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (31, 38, 6, 239.94);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (34, 38, 6, 149.94);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (9, 38, 5, 99.95);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (12, 38, 2, 45.98);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (4, 38, 3, 29.97);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (24, 39, 2, 49.98);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (9, 39, 5, 99.95);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (39, 39, 1, 9.99);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (40, 39, 5, 149.95);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (6, 40, 6, 59.94);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (39, 40, 4, 39.96);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (31, 40, 6, 239.94);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (14, 40, 1, 26.99);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (42, 41, 2, 59.98);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (32, 41, 4, 159.96);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (43, 41, 3, 38.97);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (38, 41, 4, 99.96);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (33, 41, 3, 44.97);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (15, 42, 2, 13.98);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (44, 42, 5, 94.95);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (24, 42, 5, 124.95);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (18, 42, 1, 9.99);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (14, 42, 1, 26.99);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (35, 43, 3, 74.97);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (17, 43, 3, 38.97);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (5, 43, 6, 59.94);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (16, 43, 5, 199.95);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (43, 44, 1, 12.99);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (6, 44, 4, 39.96);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (6, 45, 3, 29.97);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (34, 45, 3, 74.97);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (26, 45, 6, 95.94);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (17, 45, 1, 12.99);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (23, 46, 1, 24.99);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (7, 46, 1, 6.99);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (8, 46, 4, 63.96);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (35, 46, 2, 49.98);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (5, 47, 3, 29.97);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (4, 47, 3, 29.97);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (9, 48, 2, 39.98);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (44, 49, 6, 113.94);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (5, 49, 4, 39.96);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (23, 49, 6, 149.94);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (4, 49, 3, 29.97);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (43, 50, 6, 77.94);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (11, 50, 1, 9.99);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (29, 51, 5, 224.95);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (20, 51, 6, 95.94);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (36, 52, 1, 15.99);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (2, 52, 5, 34.95);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (19, 52, 5, 49.95);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (28, 52, 5, 349.95);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (28, 53, 1, 69.99);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (5, 54, 5, 49.95);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (36, 54, 5, 79.95);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (12, 54, 4, 91.96);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (44, 54, 3, 56.97);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (19, 54, 4, 39.96);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (35, 55, 3, 74.97);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (6, 55, 4, 39.96);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (19, 56, 1, 9.99);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (37, 56, 6, 95.94);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (24, 56, 1, 24.99);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (36, 56, 1, 15.99);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (21, 56, 3, 38.97);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (43, 57, 1, 12.99);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (15, 57, 5, 34.95);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (36, 58, 3, 47.97);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (17, 58, 4, 51.96);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (29, 59, 1, 44.99);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (2, 60, 4, 27.96);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (3, 61, 4, 31.96);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (19, 61, 3, 29.97);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (45, 61, 2, 39.98);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (40, 61, 5, 149.95);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (7, 61, 1, 6.99);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (40, 62, 2, 59.98);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (42, 62, 5, 149.95);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (26, 62, 1, 15.99);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (23, 62, 1, 24.99);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (24, 63, 2, 49.98);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (16, 63, 3, 119.97);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (14, 64, 5, 134.95);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (45, 64, 2, 39.98);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (37, 65, 3, 47.97);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (42, 65, 6, 179.94);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (18, 65, 1, 9.99);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (4, 66, 2, 19.98);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (22, 66, 4, 47.96);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (42, 66, 5, 149.95);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (18, 67, 3, 29.97);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (5, 67, 6, 59.94);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (42, 67, 1, 29.99);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (45, 68, 1, 19.99);
insert into produkt_tranzakcie (id_hracka, id_tranzakcia, pocet_kusov, cena) values (8, 69, 1, 15.99);


-- pouzitie atrakcie
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (1, 
'2023-06-11', 0.5, 659, 1);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (2, 
'2023-06-17', 0.5, 778, 1);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (3, 
'2023-06-19', 0.5, 504, 1);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (4, 
'2023-06-29', 0.5, 14, 1);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (5, 
'2023-06-05', 0.5, 650, 1);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (6, 
'2023-06-25', 0.5, 932, 1);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (7, 
'2023-06-11', 0.5, 297, 1);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (8, 
'2023-06-22', 0.5, 555, 1);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (9, 
'2023-06-30', 0.5, 785, 1);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (10, 
'2023-06-17', 0.5, 938, 1);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (11, 
'2023-06-02', 0.5, 629, 1);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (12, 
'2023-06-02', 0.5, 39, 1);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (13, 
'2023-06-06', 0.5, 736, 3);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (14, 
'2023-06-07', 0.5, 68, 3);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (15, 
'2023-06-02', 0.5, 554, 3);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (16, 
'2023-06-29', 0.5, 869, 3);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (17, 
'2023-06-03', 0.5, 765, 3);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (18, 
'2023-06-16', 0.5, 572, 3);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (19, 
'2023-06-10', 0.5, 57, 3);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (20, 
'2023-06-17', 0.5, 409, 3);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (21, 
'2023-06-04', 0.5, 615, 3);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (22, 
'2023-06-12', 0.5, 20, 3);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (23, 
'2023-06-18', 0.5, 139, 4);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (24, 
'2023-06-14', 0.5, 52, 4);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (25, 
'2023-06-09', 0.5, 533, 4);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (26, 
'2023-06-17', 0.5, 966, 4);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (27, 
'2023-06-17', 0.5, 383, 4);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (28, 
'2023-06-10', 0.5, 295, 4);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (29, 
'2023-06-17', 0.5, 371, 4);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (30, 
'2023-06-12', 0.5, 583, 4);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (31, 
'2023-06-14', 0.5, 659, 4);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (32, 
'2023-06-29', 0.5, 972, 4);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (33, 
'2023-06-03', 0.5, 801, 4);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (34, 
'2023-06-12', 0.5, 87, 4);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (35, 
'2023-06-14', 0.5, 547, 5);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (36, 
'2023-06-23', 0.5, 490, 5);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (37, 
'2023-06-08', 0.5, 763, 5);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (38, 
'2023-06-05', 0.5, 556, 5);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (39, 
'2023-06-24', 0.5, 447, 5);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (40, 
'2023-06-18', 0.5, 190, 5);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (41, 
'2023-06-26', 0.5, 803, 5);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (42, 
'2023-06-04', 0.5, 849, 5);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (43, 
'2023-06-28', 0.5, 63, 5);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (44, 
'2023-06-23', 0.5, 175, 5);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (45, 
'2023-06-04', 0.5, 498, 5);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (46, 
'2023-06-20', 0.5, 812, 5);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (47, 
'2023-06-11', 0.5, 987, 5);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (48, 
'2023-06-23', 0.5, 231, 5);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (49, 
'2023-06-08', 0.5, 162, 5);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (50, 
'2023-06-16', 0.5, 828, 5);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (51, 
'2023-06-25', 0.5, 445, 5);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (52, 
'2023-06-27', 0.5, 696, 5);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (53, 
'2023-06-02', 1, 559, 6);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (54, 
'2023-06-10', 1, 471, 6);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (55, 
'2023-06-18', 1, 162, 6);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (56, 
'2023-06-20', 1, 668, 6);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (57, 
'2023-06-30', 1, 153, 6);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (58, 
'2023-06-23', 1, 281, 6);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (59, 
'2023-06-29', 1, 892, 6);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (60, 
'2023-06-01', 1, 390, 6);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (61, 
'2023-06-30', 1, 527, 6);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (62, 
'2023-06-07', 1, 606, 6);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (63, 
'2023-06-12', 1, 355, 6);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (64, 
'2023-06-13', 1, 75, 6);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (65, 
'2023-06-20', 1, 731, 6);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (66, 
'2023-06-29', 1, 154, 6);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (67, 
'2023-06-18', 1, 975, 6);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (68, 
'2023-06-15', 1, 612, 6);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (69, 
'2023-06-21', 1, 117, 6);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (70, 
'2023-06-22', 1, 377, 6);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (71, 
'2023-06-02', 1, 20, 6);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (72, 
'2023-06-28', 1, 175, 6);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (73, 
'2023-06-27', 1, 205, 6);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (74, 
'2023-06-04', 1, 63, 6);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (75, 
'2023-06-11', 1, 612, 6);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (76, 
'2023-06-25', 1, 906, 6);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (77, 
'2023-06-22', 1, 913, 6);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (78, 
'2023-06-05', 1, 266, 6);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (79, 
'2023-06-21', 1, 462, 6);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (80, 
'2023-06-12', 0.75, 600, 7);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (81, 
'2023-06-25', 0.75, 255, 7);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (82, 
'2023-06-01', 0.75, 720, 7);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (83, 
'2023-06-24', 0.75, 680, 7);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (84, 
'2023-06-01', 0.75, 743, 7);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (85, 
'2023-06-06', 0.75, 361, 7);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (86, 
'2023-06-21', 0.75, 257, 7);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (87, 
'2023-06-23', 0.75, 593, 7);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (88, 
'2023-06-08', 0.75, 987, 7);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (89, 
'2023-06-29', 0.75, 480, 7);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (90, 
'2023-06-19', 0.75, 346, 7);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (91, 
'2023-06-08', 0.75, 553, 7);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (92, 
'2023-06-24', 0.75, 384, 7);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (93, 
'2023-06-01', 0.75, 601, 7);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (94, 
'2023-06-28', 0.75, 52, 7);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (95, 
'2023-06-06', 0.75, 276, 7);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (96, 
'2023-06-02', 0.75, 875, 7);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (97, 
'2023-06-23', 0.75, 953, 7);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (98, 
'2023-06-03', 0.75, 162, 7);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values (99, 
'2023-06-04', 0.75, 43, 7);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(100, '2023-06-10', 0.75, 616, 7);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(101, '2023-06-24', 0.75, 911, 7);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(102, '2023-06-11', 0.75, 303, 7);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(103, '2023-06-02', 0.75, 76, 7);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(104, '2023-06-10', 0.75, 460, 7);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(105, '2023-06-14', 0.5, 803, 8);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(106, '2023-06-17', 0.5, 767, 8);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(107, '2023-06-11', 0.5, 308, 8);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(108, '2023-06-11', 0.5, 873, 8);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(109, '2023-06-13', 0.5, 795, 8);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(110, '2023-06-17', 0.5, 967, 8);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(111, '2023-06-20', 0.5, 685, 8);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(112, '2023-06-18', 0.5, 933, 8);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(113, '2023-06-11', 0.5, 757, 8);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(114, '2023-06-20', 0.5, 656, 8);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(115, '2023-06-17', 0.5, 770, 8);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(116, '2023-06-20', 0.5, 812, 8);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(117, '2023-06-29', 0.5, 274, 8);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(118, '2023-06-29', 0.5, 84, 8);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(119, '2023-06-10', 0.5, 796, 8);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(120, '2023-06-19', 0.5, 941, 8);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(121, '2023-06-07', 0.5, 832, 8);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(122, '2023-06-26', 0.5, 726, 8);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(123, '2023-06-08', 0.5, 497, 8);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(124, '2023-06-03', 0.5, 879, 8);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(125, '2023-06-26', 0.5, 246, 8);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(126, '2023-06-22', 0.5, 316, 8);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(127, '2023-06-01', 0.5, 290, 8);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(128, '2023-06-01', 0.5, 293, 8);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(129, '2023-06-29', 0.5, 409, 9);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(130, '2023-06-08', 0.5, 389, 9);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(131, '2023-06-25', 0.5, 271, 9);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(132, '2023-06-12', 0.5, 700, 9);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(133, '2023-06-26', 0.5, 876, 9);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(134, '2023-06-03', 0.5, 875, 9);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(135, '2023-06-08', 0.5, 424, 9);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(136, '2023-06-11', 0.5, 765, 9);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(137, '2023-06-13', 0.5, 116, 9);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(138, '2023-06-04', 0.5, 357, 9);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(139, '2023-06-12', 0.5, 327, 9);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(140, '2023-06-18', 0.5, 326, 9);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(141, '2023-06-16', 0.5, 734, 9);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(142, '2023-06-19', 0.5, 641, 9);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(143, '2023-06-01', 0.5, 73, 9);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(144, '2023-06-18', 0.5, 320, 9);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(145, '2023-06-16', 0.75, 469, 10);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(146, '2023-06-20', 0.75, 860, 10);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(147, '2023-06-15', 0.75, 526, 10);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(148, '2023-06-03', 0.75, 925, 10);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(149, '2023-06-15', 0.75, 457, 10);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(150, '2023-06-08', 0.75, 230, 10);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(151, '2023-06-16', 0.75, 941, 10);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(152, '2023-06-04', 0.5, 325, 11);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(153, '2023-06-13', 0.5, 721, 11);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(154, '2023-06-12', 0.5, 59, 11);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(155, '2023-06-10', 0.5, 955, 11);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(156, '2023-06-15', 0.5, 296, 11);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(157, '2023-06-24', 0.5, 47, 11);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(158, '2023-06-21', 0.5, 394, 11);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(159, '2023-06-28', 0.5, 416, 11);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(160, '2023-06-12', 0.5, 237, 11);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(161, '2023-06-15', 0.5, 244, 11);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(162, '2023-06-14', 0.5, 589, 11);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(163, '2023-06-02', 0.5, 99, 11);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(164, '2023-06-17', 0.5, 311, 11);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(165, '2023-06-18', 0.5, 809, 11);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(166, '2023-06-22', 0.5, 149, 11);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(167, '2023-06-09', 0.5, 915, 11);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(168, '2023-06-02', 0.5, 907, 11);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(169, '2023-06-21', 0.5, 137, 11);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(170, '2023-06-19', 0.5, 242, 11);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(171, '2023-06-10', 0.5, 395, 11);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(172, '2023-06-22', 0.5, 844, 11);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(173, '2023-06-05', 0.5, 960, 11);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(174, '2023-06-13', 0.5, 80, 11);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(175, '2023-06-27', 0.5, 56, 11);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(176, '2023-06-18', 0.5, 276, 11);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(177, '2023-06-28', 0.5, 987, 12);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(178, '2023-06-25', 0.5, 503, 12);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(179, '2023-06-06', 0.5, 637, 12);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(180, '2023-06-29', 0.5, 80, 12);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(181, '2023-06-25', 0.5, 847, 12);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(182, '2023-06-09', 0.5, 597, 12);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(183, '2023-06-13', 0.5, 692, 12);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(184, '2023-06-08', 0.5, 192, 12);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(185, '2023-06-02', 0.5, 900, 12);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(186, '2023-06-23', 0.5, 448, 12);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(187, '2023-06-05', 0.5, 175, 12);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(188, '2023-06-13', 0.5, 938, 12);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(189, '2023-06-18', 0.5, 699, 12);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(190, '2023-06-04', 0.5, 52, 12);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(191, '2023-06-12', 0.5, 392, 12);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(192, '2023-06-25', 0.5, 861, 12);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(193, '2023-06-06', 0.5, 931, 12);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(194, '2023-06-12', 0.5, 100, 12);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(195, '2023-06-01', 1, 769, 13);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(196, '2023-06-14', 1, 309, 13);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(197, '2023-06-01', 1, 449, 13);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(198, '2023-06-11', 1, 193, 13);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(199, '2023-06-20', 1, 996, 13);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(200, '2023-06-06', 1, 473, 13);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(201, '2023-06-29', 1, 318, 13);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(202, '2023-06-13', 1, 142, 13);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(203, '2023-06-07', 1, 258, 13);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(204, '2023-06-04', 1, 193, 13);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(205, '2023-06-20', 1, 777, 13);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(206, '2023-06-29', 1, 598, 13);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(207, '2023-06-26', 1, 75, 13);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(208, '2023-06-12', 1, 897, 13);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(209, '2023-06-04', 0.75, 417, 14);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(210, '2023-06-28', 0.75, 468, 14);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(211, '2023-06-18', 0.75, 891, 14);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(212, '2023-06-02', 0.75, 941, 14);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(213, '2023-06-02', 0.75, 10, 14);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(214, '2023-06-29', 0.75, 205, 14);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(215, '2023-06-02', 0.75, 530, 14);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(216, '2023-06-23', 0.75, 278, 14);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(217, '2023-06-29', 0.75, 713, 14);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(218, '2023-06-27', 0.75, 616, 14);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(219, '2023-06-11', 0.75, 313, 14);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(220, '2023-06-08', 0.75, 531, 14);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(221, '2023-06-09', 0.75, 665, 14);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(222, '2023-06-22', 0.75, 912, 14);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(223, '2023-06-07', 0.75, 136, 14);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(224, '2023-06-09', 0.75, 20, 14);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(225, '2023-06-25', 0.75, 799, 14);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(226, '2023-06-27', 0.75, 240, 15);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(227, '2023-06-08', 0.75, 595, 15);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(228, '2023-06-08', 0.75, 587, 15);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(229, '2023-06-19', 0.75, 449, 15);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(230, '2023-06-08', 0.75, 291, 15);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(231, '2023-06-09', 0.75, 281, 15);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(232, '2023-06-14', 0.75, 115, 15);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(233, '2023-06-14', 0.75, 647, 15);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(234, '2023-06-01', 0.75, 101, 15);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(235, '2023-06-21', 0.75, 13, 15);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(236, '2023-06-13', 0.75, 218, 15);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(237, '2023-06-15', 0.75, 539, 16);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(238, '2023-06-21', 0.75, 752, 16);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(239, '2023-06-17', 0.75, 353, 16);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(240, '2023-06-15', 0.75, 431, 16);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(241, '2023-06-10', 0.75, 589, 16);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(242, '2023-06-10', 0.75, 625, 16);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(243, '2023-06-08', 0.75, 708, 16);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(244, '2023-06-16', 0.75, 371, 16);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(245, '2023-06-15', 0.75, 237, 16);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(246, '2023-06-24', 0.75, 454, 16);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(247, '2023-06-05', 0.75, 308, 16);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(248, '2023-06-04', 0.5, 484, 17);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(249, '2023-06-28', 0.5, 921, 17);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(250, '2023-06-08', 0.5, 261, 17);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(251, '2023-06-09', 0.5, 432, 17);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(252, '2023-06-19', 0.5, 927, 17);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(253, '2023-06-05', 0.5, 745, 17);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(254, '2023-06-01', 0.5, 76, 17);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(255, '2023-06-28', 0.5, 965, 17);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(256, '2023-06-16', 0.5, 230, 17);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(257, '2023-06-27', 0.5, 520, 17);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(258, '2023-06-17', 0.5, 104, 17);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(259, '2023-06-24', 0.5, 461, 17);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(260, '2023-06-04', 0.5, 283, 17);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(261, '2023-06-18', 0.5, 385, 17);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(262, '2023-06-27', 0.5, 667, 17);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(263, '2023-06-12', 0.5, 856, 17);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(264, '2023-06-28', 0.5, 671, 17);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(265, '2023-06-19', 0.5, 556, 17);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(266, '2023-06-04', 0.5, 735, 18);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(267, '2023-06-21', 0.5, 851, 18);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(268, '2023-06-26', 0.5, 66, 18);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(269, '2023-06-02', 0.5, 766, 19);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(270, '2023-06-22', 0.5, 185, 19);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(271, '2023-06-17', 0.5, 17, 19);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(272, '2023-06-11', 0.5, 634, 19);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(273, '2023-06-14', 0.5, 803, 19);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(274, '2023-06-13', 0.5, 614, 19);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(275, '2023-06-02', 0.5, 46, 19);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(276, '2023-06-02', 1, 324, 20);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(277, '2023-06-19', 1, 705, 20);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(278, '2023-06-03', 1, 347, 20);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(279, '2023-06-16', 1, 696, 20);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(280, '2023-06-05', 1, 313, 20);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(281, '2023-06-03', 1, 640, 20);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(282, '2023-06-25', 1, 498, 20);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(283, '2023-06-21', 1, 890, 20);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(284, '2023-06-07', 1, 96, 20);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(285, '2023-06-12', 0.75, 837, 21);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(286, '2023-06-12', 0.75, 884, 21);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(287, '2023-06-14', 0.75, 580, 21);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(288, '2023-06-03', 0.75, 940, 21);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(289, '2023-06-27', 0.75, 799, 21);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(290, '2023-06-09', 0.75, 229, 21);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(291, '2023-06-13', 0.75, 31, 21);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(292, '2023-06-10', 0.75, 926, 21);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(293, '2023-06-17', 0.75, 393, 21);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(294, '2023-06-26', 0.75, 269, 22);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(295, '2023-06-08', 0.75, 560, 22);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(296, '2023-06-22', 0.75, 331, 22);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(297, '2023-06-11', 0.75, 755, 22);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(298, '2023-06-25', 0.75, 487, 22);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(299, '2023-06-17', 0.5, 415, 23);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(300, '2023-06-19', 0.5, 382, 23);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(301, '2023-06-01', 0.5, 382, 23);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(302, '2023-06-15', 0.5, 382, 23);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(303, '2023-06-18', 0.5, 382, 24);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(304, '2023-06-24', 0.5, 382, 24);
insert into pouzitie_atrakcie (id_pouzitie_atrakcie, datum, cena_pouzitia, pocet_bodov, id_atrakcia_arkada) values 
(305, '2023-06-21', 0.5, 382, 24);

