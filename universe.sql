CREATE TABLE galaxy(
    galaxy_id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    star_number INTEGER NOT NULL,
    sun_number INTEGER DEFAULT 10,
    description TEXT NOT NULL
);
CREATE TABLE star(
    star_id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    galaxy_id INTEGER NOT NULL REFERENCES galaxy(galaxy_id),
    is_spherical BOOLEAN NOT NULL,
    has_life BOOLEAN NOT NULL DEFAULT FALSE
);
CREATE TABLE planet(
    planet_id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    star_id INTEGER NOT NULL REFERENCES star(star_id),
    surface NUMERIC NOT NULL,
    rank INTEGER NOT NULL,
    has_life BOOLEAN NOT NULL
);
CREATE TABLE moon(
    moon_id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    galaxy_id INTEGER NOT NULL REFERENCES galaxy(galaxy_id),
    color VARCHAR(50) NOT NULL DEFAULT 'white',
    surface NUMERIC NOT NULL DEFAULT 100000
);
CREATE TABLE sun(
    sun_id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    galaxy_id INTEGER NOT NULL REFERENCES galaxy(galaxy_id)
);

INSERT INTO galaxy (name, star_number, description)
VALUES
    ('Milky Way', 200, 'The galaxy containing our solar system'),
    ('Andromeda', 400, 'A spiral galaxy neighboring the Milky Way'),
    ('Sombrero', 100, 'A galaxy with a prominent dust lane'),
    ('Whirlpool', 150, 'A grand-design spiral galaxy'),
    ('Pinwheel', 120, 'A face-on spiral galaxy'),
    ('Black Eye', 80, 'A galaxy with a distinctive dark band');

INSERT INTO star (name, galaxy_id, is_spherical)
VALUES
    ('Sun', 1, true),
    ('Alpha Centauri', 1, false),
    ('Betelgeuse', 2, false),
    ('Sirius', 2, true),
    ('Polaris', 1, true),
    ('Antares', 3, false);

INSERT INTO planet (name, star_id, surface, rank, has_life)
VALUES
    ('Mercury', 1, 0.056, 1, false),
    ('Venus', 1, 0.857, 2, false),
    ('Earth', 1, 1, 3, true),
    ('Mars', 1, 0.151, 4, false),
    ('Jupiter', 2, 1321, 5, false),
    ('Saturn', 2, 764, 6, false),
    ('Uranus', 2, 63.1, 7, false),
    ('Neptune', 2, 57.7, 8, false),
    ('Pluto', 2, 0.0032, 9, false),
    ('Kepler-452b', 3, 1.5, 10, true),
    ('HD 189733 b', 3, 1.138, 11, false),
    ('GJ 1214 b', 3, 0.17, 12, true);

INSERT INTO moon (name, galaxy_id)
VALUES
    ('Luna', 1),
    ('Phobos', 1),
    ('Deimos', 1),
    ('Ganymede', 2),
    ('Callisto', 2),
    ('Europa', 2),
    ('Titan', 3),
    ('Enceladus', 3),
    ('Triton', 3),
    ('Charon', 4),
    ('Pluto 1', 4),
    ('Pluto 2', 4),
    ('Moon 1', 5),
    ('Moon 2', 5),
    ('Moon 3', 5),
    ('Moon 4', 5),
    ('Moon 5', 5),
    ('Moon 6', 5),
    ('Moon 7', 5),
    ('Moon 8', 5);

INSERT INTO sun (name, galaxy_id)
VALUES
    ('Sol', 1),
    ('Alpha Centauri A', 1),
    ('Alpha Centauri B', 1);
