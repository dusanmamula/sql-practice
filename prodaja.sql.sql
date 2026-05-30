-- Zadatak 1: Proizvodi iz kategorije Elektronika
SELECT proizvod
FROM prodaja
WHERE kategorija = 'Elektronika'

-- Zadatak 2: Sve prodaje iz Beograda
SELECT * 
FROM prodaja
WHERE grad = 'Beograd'

-- Zadatak 3: Proizvodi gde je cena veca od 200
SELECT 
    proizvod,
    cena
FROM prodaja
WHERE cena > 200

-- Zadatak 4: Ukupna zarada po gradu
SELECT
    grad,
    SUM(cena) AS Ukupno
FROM prodaja
GROUP BY grad

-- Zadatak 5: Proizvod koji se najvise puta pojavljuje
SELECT TOP 1
    proizvod,
    COUNT(*) AS broj_pojavljivanja
FROM prodaja
GROUP BY proizvod
ORDER BY COUNT(*) DESC

-- Zadatak 6: Ukupna kolicina prodatih proizvoda po kategoriji
SELECT 
    kategorija,
    SUM(kolicina) AS Ukupno
FROM prodaja
GROUP BY kategorija

-- Zadatak 7: Grad sa najvecim prihodom u februaru
SELECT TOP 1
    grad,
    SUM(cena) AS Prihod
FROM prodaja
WHERE MONTH(datum) = 2
GROUP BY grad
ORDER BY SUM(cena) DESC

-- Zadatak 8: Gradovi gde je ukupna zarada veca od 1000
SELECT 
    grad,
    SUM(cena) AS UkupnaZarada
FROM prodaja
GROUP BY grad
HAVING SUM(cena) > 1000

-- Zadatak 9: Najskuplji proizvod po kategoriji (subquery)
SELECT 
    kategorija,
    proizvod,
    cena
FROM prodaja
WHERE cena IN (
    SELECT MAX(cena)
    FROM prodaja
    GROUP BY kategorija
)