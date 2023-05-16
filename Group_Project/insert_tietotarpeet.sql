-- Postinumerot ja toimipaikat
INSERT INTO PostiTMP (postino, kunta)
VALUES 
(00100, 'Helsinki'),
(92500, 'Rantsila'),
(40201, 'Jyväskylä'),
(70150, 'Kuopio'),
(74100, 'Iisalmi'), 
(93600, 'Kuusamo'),
(96100, 'Rovaniemi'), 
(12345, 'Vaarala');

-- Osoitteet
INSERT INTO Osoite (osoiteid, katuosoite, postino)
VALUES 
('O0001', 'Rantsilanraitti 7', 92500), -- Rantsila
('O0002', 'Asuntokatu 1', 12345),
('O0003', 'Veitikantie 13', 96100), -- Rovaniemi 
('O0004', 'Mäkikatu 2', 12345),
('O0005', 'Malminkatu 4', 00100), -- Hki
('O0006', 'Satamakatu 8', 74100), -- Iisalmi
('O0007', 'Koulukatu 3', 12345), 
('O0008', 'Koskenharjuntie 1', 40201), -- Jyväskylä
('O0009', 'Auditorionkatu 1', 12345),
('O0010', 'Liikuntatie 2', 12345),
('O0011', 'Kabinetinpolku 5', 12345), 
('O0012', 'Rantakatu 7', 12345),
('O0013', 'Hanskikatu 4', 12345),
('O0014', 'Vesurikuja 6', 70150), -- Kuopio
('O0015', 'Joukamontie 20', 93600); -- Kuusamo

-- Yhteyshenkilöt
INSERT INTO Yhteyshenkilo (yhteyshloid, yhteyshlo_etunimi, yhteyshlo_sukunimi, puhelinnumero, osoiteid)
VALUES 
('Y0001', 'Benjamin', 'Bigband', 0509876543, 'O0001'), -- Big band
('Y0002', 'Elias', 'Ailee', 0508765432, 'O0002'), -- Biologi
('Y0003', 'Emma', 'Salokoski', 0507654321, 'O0003'), -- Vieras
('Y0004', 'Enrico', 'Mäkinen', 0451555456, 'O0004'), -- Tanssiopettaja
('Y0005', 'Joni', 'Raappana', 0441231222, 'O0005'), -- Hki / Pikku T
('Y0006', 'Sirpa', 'Yli-Ojala', 0441231112, 'O0008'), -- Järjestäjä / Vaaralan kulttuuri YH
('Y0007', 'Hanna', 'Hannila', 0507654321, 'O0013'), -- Järjestäjä / Vaaralan koulujen YH
('Y0008', 'Marko', 'Hagelberg', 0441223345, 'O0014'), -- Iisalmen / kuopion tanssiopettaja
('Y0009', 'Jaana', 'Kuoppanen', 0441231234, 'O0015'); -- Jyväskylän kesäteatteri

-- Kapasiteetti vaihtoehdot
INSERT INTO Kapasiteetti (kapasiteetti_id, lkm)
VALUES
('K0000', 0),
('K0030', 30),
('K0090', 90),
('K0150', 150), -- not used
('K0200', 200),
('K0250', 250),
('K0300', 300), -- not used
('K0400', 400),
('K0500', 500),
('K0800', 800);

-- Varausstatukset
INSERT INTO Varausstatus (statusid, varauksentila)
VALUES 
('StatV', 'Varattu'),
('StatL', 'Lunastettu'),
('StatP', 'Peruttu');

INSERT INTO Esiintyja (esiintyjaid, yhteyshloid, esiintymisnimi, kuvaus)
VALUES 
('E0001', 'Y0001', 'Vaarala Big Band', 'Vaaralan paras bändi'),
('E0002', 'Y0002', 'Elias Ailee', 'Vaaralan paras biologi'), 
('E0003', 'Y0002', 'Maisa Aro', 'Vaaralan parempi biologi'),
('E0004', 'Y0003', 'Emma Salokoski', 'Vaaralan coolein erikoisvieras'), 
('E0005', 'Y0004', 'Enrico Mäkinen', 'Vaaralan tanssittavin ukko'),
('E0006', 'Y0005', 'Pikku T', 'Stadin kovimmat lyriikat');

-- Tapahtumapaikat
INSERT INTO Tapahtumapaikka (paikkaid, kapasiteetti_id, yhteyshloid, osoiteid, kuvaus, nimi)
VALUES 
('P0001', 'K0500', 'Y0008', 'O0006', 'Suuri tanssisali', 'Iisalmen tanssikoulu'),
('P0002', 'K0250', 'Y0007', 'O0007', 'Koulun jumppasali', 'Aleksanterin koulu'),
('P0003', 'K0200', 'Y0009', 'O0008', 'Ulkolava ja katettu katsomo', 'Jyväskylän kesäteatteri'),
('P0004', 'K0400', 'Y0006', 'O0009', 'Vaaralan kulttuurikeskuksen auditorio', 'Vaaralan kulttuurikeskus'),
('P0005', 'K0090', 'Y0007', 'O0010', 'Koulun liikuntasali', 'Vaaralan ala-aste'),
('P0006', 'K0030', 'Y0006', 'O0011', 'Vaaralan pankin kabinettitilat', 'Vaaralan pankki'),
('P0007', 'K0800', 'Y0006', 'O0012', 'Vaaralan merenranta', 'Vaaralan merenranta');

INSERT INTO Tapahtuma (tapahtumaid, nimi, tapahtumapvm, paikkaid, yhteyshloid, kapasiteetti_id, kuvaus, hinta) 
VALUES  
('T0001', 'Vaaralan kevätjuhla', '2023-05-20', 'P0004', 'Y0006', 'K0400', 'Kevätjuhla', 10.00), 
('T0002', 'Salsa kurssi', '2023-06-03', 'P0005', 'Y0007', 'K0090', 'Urheilu, Salsa-tunti Enrico Mäkisen johdolla!', 5.00), 
('T0003', 'Salsa kurssi', '2023-06-04', 'P0005', 'Y0007', 'K0090', 'Urheilu, Salsa-tunti Enrico Mäkisen johdolla!', 5.00), 
('T0004', 'Muuttolinnut-retki', '2023-05-23', 'P0007', 'Y0002', 'K0500', 'Muuttolintujen bongailu meren rannassa', 5.00), 
('T0005', 'Tunnista villiyrtit', '2023-05-25', 'P0005', 'Y0002', 'K0090', 'Opi tunnistamaan Suomen villiyrtit', 3.00), 
('T0006', 'Hiihtokisa', '2023-02-25', 'P0007', 'Y0006', 'K0500', 'Urheilu, Hiihto', 1.00), 
('T0007', 'Pikku T', '2023-05-25', 'P0001', 'Y0007', 'K0500', 'Konsertti', 10.00), 
('T0008', 'Rantapallo peli', '2023-05-25', 'P0007', 'Y0006', 'K0090', 'Urheilu, Rantapallo', 1.00); 

-- Esiintyymiset
INSERT INTO Esiintyminen (tapahtumaid, esiintyjaid)
VALUES 
-- Kevätjuhlan esiintyjät: 
('T0001', 'E0001'),
('T0001', 'E0004'),
-- Muuttolinnut-retki: 
('T0004', 'E0002'),
('T0004', 'E0003'),
-- Salsakurssit: 
('T0002', 'E0005'),
('T0003', 'E0005'),
-- Villiyrtti-kurssi:
('T0005', 'E0002');

-- Lippuvaraukset
INSERT INTO Lippuvaraus (varausid, statusid, varauspvm, tapahtumaid, lippulkm)
VALUES 
('L0001', 'StatL', '2023-01-02', 'T0001', 2),
('L0002', 'StatV', '2023-01-03', 'T0002', 18),
('L0003', 'StatL', '2023-01-05', 'T0003', 7),
('L0004', 'StatV', '2023-01-08', 'T0004', 1),
('L0005', 'StatV', '2023-01-15', 'T0007', 2),
('L0006', 'StatV', '2023-03-20', 'T0004', 1),
('L0007', 'StatL', GETDATE(), 'T0005', 5),
('L0008', 'StatL', GETDATE(), 'T0006', 10),
('L0009', 'StatV', GETDATE(), 'T0007', 6),
('L0010', 'StatL', GETDATE(), 'T0001', 3),
('L0011', 'StatL', GETDATE(), 'T0005', 2),
('L0012', 'StatV', GETDATE(), 'T0006', 2);