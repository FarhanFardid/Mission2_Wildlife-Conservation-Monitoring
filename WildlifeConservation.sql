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
    sighting_time TIMESTAMP NOT NULL,
    location VARCHAR(50) NOT NULL,
    notes VARCHAR(50) DEFAULT 'Null'
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


SELECT * from rangers;
SELECT * from species;
SELECT * from sightings;