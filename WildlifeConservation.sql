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
SELECT * from rangers;
SELECT * from species;