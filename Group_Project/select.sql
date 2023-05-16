-- 1. Mit‰ urheilutapahtumia on tarjolla kuluvan kuukauden aikana?  
SELECT tapahtumaid, nimi, tapahtumapvm  
FROM Tapahtuma  
WHERE MONTH(tapahtumapvm) = MONTH(getdate())  
AND kuvaus LIKE '%urheilu%'; 

-- 2. Mit‰ tapahtumia on tarjolla loppuvuoden aikana? 
SELECT tapahtumaid, nimi, tapahtumapvm  
FROM Tapahtuma  
WHERE YEAR(tapahtumapvm) = YEAR(getdate()) 
AND tapahtumapvm > getdate(); 
 
-- 3. Mik‰ on Vaaralan kev‰tjuhlissa esiintyv‰n Emma Salokosken puhelinnumero?  
SELECT e.esiintymisnimi, y.yhteyshlo_etunimi, y.yhteyshlo_sukunimi, y.puhelinnumero 
FROM esiintyja e  
JOIN yhteyshenkilo y ON e.yhteyshloid = y.yhteyshloid  
WHERE e.esiintymisnimi LIKE '%Emma%Salokoski%'; 

-- 4. Montako lippua on lunastettu Vaaralan kev‰tjuhlatilaisuuteen 20.5.2023?  
SELECT t.nimi, t.tapahtumapvm, SUM(l.lippulkm) as 'lunastetut liput' 
FROM lippuvaraus l 
JOIN tapahtuma t ON l.tapahtumaid = t.tapahtumaid 
WHERE t.tapahtumaid = 'T0001'
AND l.statusid = 'StatL'
GROUP BY t.nimi, t.tapahtumapvm;

-- 5 ja 6. Onko Salsa-tiiviskurssille 3.6.2023 viel‰ paikkoja? Ja montako paikkaa em. tiiviskurssiin on j‰ljell‰?
SELECT t.nimi, t.tapahtumapvm, (k.lkm - SUM(l.lippulkm)) as 'vapaat liput' 
FROM Lippuvaraus l 
JOIN Tapahtuma t ON l.tapahtumaid = t.tapahtumaid 
JOIN Kapasiteetti k ON t.kapasiteetti_id = k.kapasiteetti_id
WHERE t.nimi  LIKE '%Salsa%' 
AND (l.statusid = 'StatV' OR l.statusid =  'StatL')
AND t.tapahtumapvm = '2023-06-03'
GROUP BY t.nimi, t.tapahtumapvm, k.lkm;

-- 7. Mik‰ on lipputulojen m‰‰r‰ kuluvana vuonna? 
SELECT SUM(l.lippulkm*t.hinta) AS 'lipputulot' 
FROM lippuvaraus l  
JOIN tapahtuma t ON l.tapahtumaid = t.tapahtumaid  
WHERE YEAR(tapahtumapvm) = YEAR(getdate()) 
AND l.statusid = 'StatL'; 