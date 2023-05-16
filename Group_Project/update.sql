-- 1. Lippuvarauksen peruuttaminen
UPDATE lippuvaraus  
SET statusid = 'StatP'
WHERE varausid = '?input?';

UPDATE lippuvaraus  
SET statusid = 'StatP'
WHERE varausid = 'L0011';


-- 2. Lippuvarauksen lippum‰‰r‰n muuttaminen
UPDATE lippuvaraus
SET lippulkm = ? -- input
WHERE varausid = '?input?'

UPDATE lippuvaraus
SET lippulkm = 8
WHERE varausid = 'L0009';


-- 3. Lunastettujen lippujen kirjaaminen myydyiksi
UPDATE lippuvaraus 
SET statusid = 'StatL'
WHERE varausid = '?input?'

UPDATE lippuvaraus 
SET statusid = 'StatL'
WHERE varausid = 'L0009';

-- 4. Lunastamattomien varausten poistaminen tilaisuuksista, jotka ovat jo toteutuneet
DELETE FROM Lippuvaraus
WHERE statusid = 'StatV'
AND tapahtumaid IN (
SELECT tapahtumaid
FROM Tapahtuma
WHERE tapahtumapvm < GETDATE());

-- 5. Tilaisuuden peruuttaminen (esim. sairastapauksen vuoksi) Huomaa, ett‰ lip-punsa jo lunastaneiden t‰ytyy saada rahansa takaisin.
UPDATE Lippuvaraus
SET statusid = 'StatP'
WHERE tapahtumaid = '?tapahtumaID?'
AND statusid = 'StatL'
OR tapahtumaid = '?tapahtumaID?'
AND statusid = 'StatV';

UPDATE Tapahtuma
SET kapasiteetti_id = 'K0000', kuvaus = 'TAPAHTUMA PERUTTU'
WHERE tapahtumaid = '?tapahtumaID?';

UPDATE Lippuvaraus
SET statusid = 'StatP'
WHERE tapahtumaid = 'T0007'
AND statusid = 'StatL'
OR tapahtumaid = 'T0007'
AND statusid = 'StatV';

UPDATE Tapahtuma
SET kapasiteetti_id = 'K0000', kuvaus = 'TAPAHTUMA PERUTTU'
WHERE tapahtumaid = 'T0007';