SELECT * FROM regions;
SELECT * FROM species;
SELECT * FROM climate;
SELECT * FROM observations;


-- MISSION 1 ¿Cuáles son las primeras 10 observaciones registradas?
-- Your query here;
SELECT * FROM observations LIMIT 10;

-- MISSION 2 ¿Qué identificadores de región (region_id) aparecen en los datos?
-- Your query here;
SELECT id FROM regions;

-- MISSION 3 ¿Cuántas especies distintas (species_id) se han observado?
-- Your query here;
SELECT DISTINCT scientific_name AS species FROM species;

-- MISSION 4 ¿Cuántas observaciones hay para la región con region_id = 2?
-- Your query here;
SELECT COUNT(*) FROM observations WHERE region_id;


-- MISSION 5 ¿Cuántas observaciones se registraron el día 1998-08-08?
-- Your query here;
SELECT COUNT(*) FROM observations WHERE observation_date = "1998-08-08";


-- MISSION 6 ¿Cuál es el region_id con más observaciones?;
-- Your query here;
SELECT COUNT(*) FROM observations
GROUP BY region_id;


-- MISSION 7 ¿Cuáles son los 5 species_id más frecuentes?;
-- Your query here;
SELECT species_id, COUNT(*) AS contador FROM observations
GROUP BY species_id ORDER BY contador DESC LIMIT 5;


-- MISSION 8 ¿Qué especies (species_id) tienen menos de 5 registros?;
-- Your query here;
SELECT species_id, COUNT(*) AS contador FROM observations
GROUP BY species_id HAVING contador<5;

-- MISSION 9 ¿Qué observadores (observer) registraron más observaciones?;
-- Your query here;
SELECT observer, COUNT(*) AS contador FROM observations
GROUP BY observer ORDER BY contador DESC LIMIT 10;


-- MISSION 10 Muestra el nombre de la región (regions.name) para cada observación?;
-- Your query here;
SELECT observations.id, regions.name FROM observations
JOIN regions ON observations.region_id = regions.id;


-- MISSION 11 Muestra el nombre científico de cada especie registrada (species.scientific_name);
-- Your query here;
SELECT DISTINCT scientific_name FROM species
JOIN observations ON observations.species_id= species.id;

-- MISSION 12 ¿Cuál es la especie más observada por cada región?;
-- Your query here;

SELECT regions.name AS region, species.scientific_name AS species, observations.count AS total_observations 
FROM observations
JOIN species ON observations.species_id = species.id
JOIN regions ON observations.region_id = regions.id
WHERE observations.count = (
    SELECT MAX(observations2.count)
    FROM observations AS observations2
    WHERE observations2.region_id = observations.region_id
)
ORDER BY regions.name;


