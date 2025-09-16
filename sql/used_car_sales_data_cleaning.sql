-- INITIAL DATA EXAMINATION

-- ensure no duplicates
SELECT COUNT(DISTINCT(ID)) FROM sales_copy; -- 122144 matches row numbers, no duplicates

-- check for NULL values
SELECT * FROM sales
	WHERE ID IS NULL
	OR pricesold IS NULL
	OR yearsold IS NULL
	OR zipcode IS NULL
	OR Mileage IS NULL
	OR Make IS NULL
	OR Model IS NULL
	OR Year IS NULL
	OR Trim IS NULL
	OR Engine IS NULL
	OR BodyType IS NULL
	OR NumCylinders IS NULL
	OR DriveType IS NULL;
    

-- standartisize car makers
ALTER TABLE sales_copy
  ADD COLUMN make_clean VARCHAR(255);
  
ALTER TABLE sales_copy
	ADD COLUMN make_norm VARCHAR(255);
    
UPDATE sales_copy
SET make_norm = TRIM(REGEXP_REPLACE(UPPER(make COLLATE utf8mb4_0900_ai_ci),'[^A-Z0-9]+',' '));

CREATE TABLE make_map (
  pattern VARCHAR(255) NOT NULL,
  canonical VARCHAR(64) NOT NULL
);

INSERT INTO make_map (pattern, canonical) VALUES
('^FORD( |$)|^FORD .*|^FORD$','Ford'),
('^CHEV(Y|ROLET|EROLET)|^CHEVROLET .*|^GMC AKA CHEVY EXPRESS$','Chevrolet'),
('^GMC( |$)|^GMC .*','GMC'),
('^MERCEDES( |$)|^MERCEDES BENZ|^MERCEDES BENZ$|^MERCEDES B$|^GL550$','Mercedes-Benz'),
('^BMW( |$)|^BMW .*','BMW'),
('^VOLKSWAGEN|^VW( |$)|^VW OTHER$','Volkswagen'),
('^AUDI( |$)|^AUDI .*','Audi'),
('^TOYOTA( |$)|^TOYOTA .*','Toyota'),
('^LEXUS( |$)|^LEXUS .*','Lexus'),
('^HONDA( |$)|^HONDA .*','Honda'),
('^ACURA( |$)','Acura'),
('^NISSAN( |$)|^NISSAN DATSUN$','Nissan'),
('^INFINITI( |$)|^INFINITY$','Infiniti'),
('^DODGE( |$)|^DODGE .*|^RAM( |$)|^RAM .*','Dodge'),
('^CHRYSLER|^CRHYSLER|^CHRYLSER|^CHRYLSER$','Chrysler'),
('^JEEP( |$)|^JEEP .*','Jeep'),
('^CADILLAC( |$)|^CADILLAC .*','Cadillac'),
('^BUICK( |$)|^BUICK .*','Buick'),
('^PONTIAC|^PONTLAC|^PONITAC|^PONTIAC .*','Pontiac'),
('^OLDSMOBILE|^OLDSMOBILE .*','Oldsmobile'),
('^PLYMOUTH( |$)','Plymouth'),
('^TESLA( |$)','Tesla'),
('^SUBARU( |$)|^SUBARU .*','Subaru'),
('^MAZDA( |$)|^MAZDA .*','Mazda'),
('^MITSUBISHI( |$)|^MITSUBISHI FUSO$','Mitsubishi'),
('^HYUNDAI( |$)','Hyundai'),
('^KIA( |$)','Kia'),
('^VOLVO( |$)|^VOLVO .*','Volvo'),
('^SAAB( |$)|^SAAB .*','Saab'),
('^JAGUAR( |$)|^JAGUAR .*','Jaguar'),
('^LAND ROVER|^ROVER RANGE ROVER$|^ROVER$','Land Rover'),
('^MINI( |$)|^MINI .*|^MINI COOPER CLUBMAN$','Mini'),
('^ALFA ROMEO( |$)','Alfa Romeo'),
('^FIAT( |$)','Fiat'),
('^LANCIA( |$)','Lancia'),
('^FERRARI( |$)','Ferrari'),
('^MASERATI( |$)','Maserati'),
('^LAMBORGHINI( |$)','Lamborghini'),
('^ASTON MARTIN( |$)','Aston Martin'),
('^BENTLEY( |$)','Bentley'),
('^ROLLS ROYCE|^ROLLS ROYCE$|^ROLLS ROYCE$','Rolls-Royce'),
('^CITROEN|^CITROEN DS19$','Citroën'),
('^PEUGEOT( |$)','Peugeot'),
('^RENAULT( |$)','Renault'),
('^OPEL( |$)|^OPEL MANTA$','Opel'),
('^VAUXHALL( |$)|^2101$','Vauxhall'),
('^LADA( |$)|^2101$','Lada'),
('^SKODA( |$)','Škoda'),
('^SEAT( |$)','SEAT'),
('^SMART( |$)','Smart'),
('^MCLAREN( |$)','McLaren'),
('^PORSCHE( |$)','Porsche'),
('^BMW( |$)','BMW'),
('^MERCURY( |$)','Mercury'),
('^LINCOLN( |$)|^LINCOLN .*','Lincoln'),
('^HUMMER( |$)|^HUMMER H 1|^H1$','Hummer'),
('^ISUZU( |$)','Isuzu'),
('^SUZUKI( |$)','Suzuki'),
('^GEO( |$)|^GEO .*','Geo'),
('^SCION( |$)','Scion'),
('^SATURN( |$)|^SATURN VUE HYBRID$','Saturn'),
('^DAEWOO( |$)','Daewoo'),
('^DAIHATSU( |$)|^DAIHATSU TRIMOBILE$','Daihatsu'),
('^YUGO( |$)','Yugo'),
('^INTERNATIONAL HARVESTER|^INTERNATIONAL( |$)|^INTERNATONAL$','International Harvester'),
('^AM GENERAL( |$)','AM General'),
('^AMC( |$)|^AMC / RAMBLER$|^AMERICAN MOTORS$','AMC'),
('^RAMBLER( |$)','Rambler'),
('^AUSTIN( |$)|^AUSTIN HEALEY|^AUSTIN HEALEY$|^AUSTIN HEALEY$','Austin'),
('^AUSTIN HEALEY|^AUSTIN HEALEY$|^AUSTIN HEALEY$','Austin-Healey'),
('^TRIUMPH( |$)|^TRIUMPH TR6$','Triumph'),
('^MG( |$)|^JENSEN HEALEY|^JENSEN HEALEY$|^ARNOLT MG$','MG'),
('^JENSEN( |$)|^JENSEN CARS$','Jensen'),
('^JENSEN HEALEY$|^JENSEN HEALEY$','Jensen-Healey'),
('^LOTUS( |$)','Lotus'),
('^MORGAN( |$)','Morgan'),
('^RILEY( |$)','Riley'),
('^AUSTIN PRINCESS$','Austin'),
('^DAIMLER( |$)','Daimler'),
('^BENTLEY( |$)','Bentley'),
('^BUGATTI( |$)','Bugatti'),
('^TVR( |$)','TVR'),
('^ROLLS ROYCE$|^ROLLS ROYCE$','Rolls-Royce'),
('^PACKARD( |$)','Packard'),
('^NASH( |$)','Nash'),
('^HUDSON( |$)','Hudson'),
('^STUDEBAKER|^STUDABAKER$','Studebaker'),
('^EDSEL( |$)','Edsel'),
('^CORD( |$)','Cord'),
('^AUBURN( |$)','Auburn'),
('^PIERCE ARROW|^PIERCE ARROW$','Pierce-Arrow'),
('^OLIVER( |$)','Oliver'),
('^CROSLEY( |$)','Crosley'),
('^MAXWELL( |$)','Maxwell'),
('^MAYBACH( |$)','Maybach'),
('^MERCEDES B$','Mercedes-Benz'),
('^LAFORZA( |$)','Laforza'),
('^UNIMOG( |$)','Mercedes-Benz'),
('^PEUGEOT( |$)','Peugeot'),
('^TATA( |$)','Tata'),
('^OTHER MAKES$','Other'),
('^REPLICA KIT MAKES$','Replica/Kit'),
('^ELECTRIC$|^WHEEGO|^THINK$|^GEM$|^CODA$','Electric'),
('^SHELBY( |$)|^SUPERFORMANCE$','Shelby');

UPDATE sales_copy sc
JOIN make_map m ON sc.make_norm REGEXP m.pattern
SET sc.make_clean = m.canonical
WHERE sc.id BETWEEN 1 AND 10000;

UPDATE sales_copy sc
JOIN make_map m ON sc.make_norm REGEXP m.pattern
SET sc.make_clean = m.canonical
WHERE sc.id BETWEEN 10001 AND 20000;

UPDATE sales_copy sc
JOIN make_map m ON sc.make_norm REGEXP m.pattern
SET sc.make_clean = m.canonical
WHERE sc.id BETWEEN 20001 AND 30000;

UPDATE sales_copy sc
JOIN make_map m ON sc.make_norm REGEXP m.pattern
SET sc.make_clean = m.canonical
WHERE sc.id BETWEEN 30001 AND 40000;

UPDATE sales_copy sc
JOIN make_map m ON sc.make_norm REGEXP m.pattern
SET sc.make_clean = m.canonical
WHERE sc.id BETWEEN 40001 AND 50000;

UPDATE sales_copy sc
JOIN make_map m ON sc.make_norm REGEXP m.pattern
SET sc.make_clean = m.canonical
WHERE sc.id BETWEEN 50001 AND 60000;

UPDATE sales_copy sc
JOIN make_map m ON sc.make_norm REGEXP m.pattern
SET sc.make_clean = m.canonical
WHERE sc.id BETWEEN 60001 AND 70000;

UPDATE sales_copy sc
JOIN make_map m ON sc.make_norm REGEXP m.pattern
SET sc.make_clean = m.canonical
WHERE sc.id BETWEEN 70001 AND 80000;

UPDATE sales_copy sc
JOIN make_map m ON sc.make_norm REGEXP m.pattern
SET sc.make_clean = m.canonical
WHERE sc.id BETWEEN 80001 AND 90000;

UPDATE sales_copy sc
JOIN make_map m ON sc.make_norm REGEXP m.pattern
SET sc.make_clean = m.canonical
WHERE sc.id BETWEEN 90001 AND 100000;

UPDATE sales_copy sc
JOIN make_map m ON sc.make_norm REGEXP m.pattern
SET sc.make_clean = m.canonical
WHERE sc.id BETWEEN 100001 AND 110000;

UPDATE sales_copy sc
JOIN make_map m ON sc.make_norm REGEXP m.pattern
SET sc.make_clean = m.canonical
WHERE sc.id BETWEEN 110001 AND 120000;

UPDATE sales_copy sc
JOIN make_map m ON sc.make_norm REGEXP m.pattern
SET sc.make_clean = m.canonical
WHERE sc.id BETWEEN 120001 AND 130000;

UPDATE sales_copy sc
JOIN make_map m ON sc.make_norm REGEXP m.pattern
SET sc.make_clean = m.canonical
WHERE sc.id BETWEEN 130001 AND 140000;

UPDATE sales_copy sc
JOIN make_map m ON sc.make_norm REGEXP m.pattern
SET sc.make_clean = m.canonical
WHERE sc.id BETWEEN 140001 AND 150000;

DELETE FROM sales_copy
WHERE make_clean IS NULL;
-- car makes are now standardised

-- substitute empty zipcodes with NULL, keep 3 left digits only, remove Canadian zipcode
UPDATE sales_copy
SET zipcode = NULL WHERE zipcode = '';
UPDATE sales_copy
SET zipcode = LEFT(zipcode, 3);
UPDATE sales_copy
SET zipcode = NULL
WHERE zipcode REGEXP '[A-Za-z]';


-- clean year of production
UPDATE sales_copy
SET Year = CASE
	WHEN Year = 0 THEN NULL
    WHEN Year BETWEEN 20 AND 99 THEN year + 1900
    WHEN Year < 1920 THEN NULL
    ELSE Year
END;

-- clean very low selling price
UPDATE sales_copy
SET pricesold = NULL WHERE pricesold < 1000;

-- clean abnormal mileage
UPDATE sales_copy
SET Mileage = CASE
	WHEN Mileage < 500 AND (yearsold - year) <= 3 THEN Mileage
    WHEN Mileage < 500  AND (yearsold - year) > 3 THEN NULL
    WHEN Mileage > 500000 THEN NULL 
    ELSE Mileage
END;

-- export table in csv format
SELECT * FROM sales_copy
INTO OUTFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/used_cars_sales_cleaned.csv"
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY "\n"
