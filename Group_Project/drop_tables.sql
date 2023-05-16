ALTER TABLE Osoite
DROP CONSTRAINT postino; 

ALTER TABLE Yhteyshenkilo 
DROP CONSTRAINT osoiteid; 

ALTER TABLE Esiintyja
DROP CONSTRAINT yhteyshloid; 

ALTER TABLE Tapahtumapaikka
DROP CONSTRAINT kapasiteetti_id, yhteyshloid, osoiteid;

ALTER TABLE Tapahtuma
DROP CONSTRAINT paikkaid, yhteyshloid, kapasiteetti_id; 

ALTER TABLE Esiintyminen
DROP CONSTRAINT tapahtumaid, esiintyjaid; 

ALTER TABLE Lippuvaraus
DROP CONSTRAINT varaustunnus, statusid, tapahtumaid;

--Lippuvaraus
DROP TABLE IF EXISTS Lippuvaraus;
--Varaustatus
DROP TABLE IF EXISTS Varausstatus;
--Esiintyminen
DROP TABLE IF EXISTS Esiintyminen;
--Esiintyj�
DROP TABLE IF EXISTS Esiintyja;
--Tapahtuma
DROP TABLE IF EXISTS Tapahtuma;
--Tapahtumapaikka
DROP TABLE IF EXISTS Tapahtumapaikka;
--Yhteyshenkil�t
DROP TABLE IF EXISTS Yhteyshenkilo;
--Kapasiteetti
DROP TABLE IF EXISTS Kapasiteetti;
--Osoite
DROP TABLE IF EXISTS Osoite;
--Postinumerot ja toimipaikat
DROP TABLE IF EXISTS PostiTMP;