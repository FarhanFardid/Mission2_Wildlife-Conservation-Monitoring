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


SELECT * from rangers;
SELECT * from species;
SELECT * from sightings;