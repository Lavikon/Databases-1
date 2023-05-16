-- Postitoimipaikka taulu
CREATE TABLE PostiTMP ( 
postino INTEGER NOT NULL, 
kunta VARCHAR(20) NOT NULL, 
PRIMARY KEY (postino) 
); 

-- Osoitetaulu
CREATE TABLE Osoite ( 
osoiteid CHAR(5) NOT NULL, 
katuosoite VARCHAR(50) NOT NULL, 
postino INTEGER NOT NULL, 
PRIMARY KEY (osoiteid), 
FOREIGN KEY (postino) REFERENCES PostiTMP(postino) 
);

-- Yhteyshenkilö taulu
CREATE TABLE Yhteyshenkilo ( 
yhteyshloid CHAR(5) NOT NULL, 
yhteyshlo_etunimi VARCHAR(10) NOT NULL, 
yhteyshlo_sukunimi VARCHAR(20) NOT NULL, 
puhelinnumero INTEGER NOT NULL, 
osoiteid CHAR(5) NOT NULL, 
PRIMARY KEY (yhteyshloid), 
FOREIGN KEY (osoiteid) REFERENCES Osoite(osoiteid) 
);

-- Kapasiteetti taulu
CREATE TABLE Kapasiteetti ( 
kapasiteetti_id CHAR(5) NOT NULL, 
lkm INTEGER NOT NULL, 
PRIMARY KEY (kapasiteetti_id) 
);

-- Varaus-status taulu
CREATE TABLE Varausstatus ( 
statusid CHAR(5) NOT NULL, 
varauksentila VARCHAR(20) NOT NULL, 
PRIMARY KEY (statusid) 
);

-- Esiintyjä taulu
CREATE TABLE Esiintyja ( 
esiintyjaid CHAR(5) NOT NULL, 
yhteyshloid CHAR(5) NOT NULL, 
esiintymisnimi VARCHAR(30) NOT NULL, 
kuvaus VARCHAR(255), 
PRIMARY KEY (esiintyjaid), 
FOREIGN KEY (yhteyshloid) REFERENCES Yhteyshenkilo(yhteyshloid) 
);

-- Tapahtumapaikka taulu
CREATE TABLE Tapahtumapaikka ( 
paikkaid CHAR(5) NOT NULL, 
kapasiteetti_id CHAR(5) NOT NULL, 
yhteyshloid CHAR(5) NOT NULL, 
osoiteid CHAR(5) NOT NULL, 
kuvaus VARCHAR(50), 
nimi VARCHAR(30), 
PRIMARY KEY (paikkaid), 
FOREIGN KEY (kapasiteetti_id) REFERENCES Kapasiteetti(kapasiteetti_id), 
FOREIGN KEY (yhteyshloid) REFERENCES Yhteyshenkilo(yhteyshloid), 
FOREIGN KEY (osoiteid) REFERENCES Osoite(osoiteid) 
);

-- Tapahtuma taulu
CREATE TABLE Tapahtuma ( 
tapahtumaid CHAR(5) NOT NULL, 
nimi VARCHAR(20) NOT NULL, 
tapahtumapvm DATE NOT NULL, 
paikkaid CHAR(5) NOT NULL, 
yhteyshloid CHAR(5) NOT NULL, 
kapasiteetti_id CHAR(5) NOT NULL, 
kuvaus VARCHAR(50), 
hinta DECIMAL(4,2) NOT NULL, 
PRIMARY KEY (tapahtumaid), 
FOREIGN KEY (paikkaid) REFERENCES Tapahtumapaikka(paikkaid), 
FOREIGN KEY (yhteyshloid) REFERENCES Yhteyshenkilo(yhteyshloid), 
FOREIGN KEY (kapasiteetti_id) REFERENCES Kapasiteetti(kapasiteetti_id)
); 

-- Esiintyminen taulu
CREATE TABLE Esiintyminen ( 
tapahtumaid CHAR(5), 
esiintyjaid CHAR(5), 
PRIMARY KEY (tapahtumaid, esiintyjaid), 
FOREIGN KEY (tapahtumaid) REFERENCES Tapahtuma(tapahtumaid), 
FOREIGN KEY (esiintyjaid) REFERENCES Esiintyja(esiintyjaid) 
);

-- Lippuvaraus taulu
CREATE TABLE Lippuvaraus (
varausid CHAR(5) NOT NULL,
statusid CHAR(5),
varauspvm DATE NOT NULL,
tapahtumaid CHAR(5),
lippulkm INTEGER NOT NULL
PRIMARY KEY (varausid),
FOREIGN KEY (statusid) REFERENCES Varausstatus(statusid),
FOREIGN KEY (tapahtumaid) REFERENCES Tapahtuma(tapahtumaid)
);