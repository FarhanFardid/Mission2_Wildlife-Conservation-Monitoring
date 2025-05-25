-- Rangers Table creation
create TABLE rangers (
    ranger_id SERIAL UNIQUE PRIMARY KEY NOT NULL,
    name VARCHAR(50) NOT NULL,
    region VARCHAR(50) NOT NULL
);

-- Species Table creation
create TABLE species (
    species_id SERIAL UNIQUE PRIMARY KEY NOT NULL,
    common_name VARCHAR(50) NOT NULL,
    scientific_name VARCHAR(50) NOT NULL,
    discovery_date DATE NOT NULL,
    conservation_status VARCHAR(50) NOT NULL
);

-- Sightings Table creation
create TABLE sightings (
    sighting_id SERIAL UNIQUE PRIMARY KEY NOT NULL,
    ranger_id INTEGER REFERENCES  rangers(ranger_id),
    species_id INTEGER REFERENCES species(species_id),
    location VARCHAR(50) NOT NULL,
    sighting_time TIMESTAMP NOT NULL,
    notes VARCHAR(50) DEFAULT '(Null)'
);

-- Inserting rangers data
INSERT INTO rangers (name, region) VALUES 
('Alice Green', 'Northern Hills'),
('Bob White', 'River Delta'),
('Carol King', 'Mountain Range');

-- Inserting species data
INSERT INTO species (common_name,scientific_name,discovery_date,conservation_status) VALUES 
('Snow Leopard','Panthera uncia','1775-01-01','Endangered'),
('Bengal Tiger','Panthera tigris tigris','1758-01-01','Endangered'),
('Red Panda','Ailurus fulgens','1825-01-01','Vulnerable'),
('Asiatic Elephant','Elephas maximus indicus','1758-01-01','Endangered');

-- Inserting sightings data
INSERT INTO sightings (ranger_id ,species_id,location,sighting_time,notes ) VALUES 
(1,1,'Peak Ridge','2024-05-10 07:45:00','Camera trap image captured'),
(2,2,'Bankwood Area','2024-05-12 16:20:00','Juvenile seen'),
(3,3,'Bamboo Grove East','2024-05-15 09:10:00','Feeding observed'),
(2,1,'Snowfall Pass','2024-05-18 18:30:00', DEFAULT);



-- problem 1:  Register a new ranger with provided data with name = 'Derek Fox' and region = 'Coastal Plains'

INSERT INTO rangers (name,region) VALUES ('Derek Fox','Coastal Plains');


-- problem 2:  Count unique species ever sighted.

SELECT   COUNT(distinct species_id) as unique_species_count from sightings;

-- problem 3:  Find all sightings where the location includes "Pass".
SELECT * from sightings WHERE location ilike '%Pass%';

-- problem 4:  List each ranger's name and their total number of sightings.
 SELECT name, count(*) as total_sightings from rangers join sightings on rangers.ranger_id = sightings.ranger_id GROUP BY rangers.ranger_id;


SELECT * from rangers;
SELECT * from species;
SELECT * from sightings;

-- drop Table rangers;
-- drop Table sightings;
-- drop Table species;