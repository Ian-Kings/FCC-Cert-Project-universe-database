CREATE DATABASE universe;

\c universe

-- ---------- TABLES ----------

CREATE TABLE galaxy (
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(50) UNIQUE NOT NULL,
  galaxy_type VARCHAR(30) NOT NULL,
  age_in_millions_of_years INT,
  distance_from_earth NUMERIC(12,2),
  has_black_hole BOOLEAN,
  description TEXT
);

CREATE TABLE star (
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(50) UNIQUE NOT NULL,
  galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id),
  age_in_millions_of_years INT,
  mass NUMERIC(10,3),
  is_visible_to_naked_eye BOOLEAN,
  description TEXT
);

CREATE TABLE planet (
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(50) UNIQUE NOT NULL,
  star_id INT NOT NULL REFERENCES star(star_id),
  diameter_km INT,
  distance_from_star_au NUMERIC(10,3),
  has_life BOOLEAN,
  is_spherical BOOLEAN,
  description TEXT
);

CREATE TABLE moon (
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(50) UNIQUE NOT NULL,
  planet_id INT NOT NULL REFERENCES planet(planet_id),
  diameter_km INT,
  orbital_period_days NUMERIC(8,3),
  is_spherical BOOLEAN,
  description TEXT
);

CREATE TABLE constellation (
  constellation_id SERIAL PRIMARY KEY,
  name VARCHAR(50) UNIQUE NOT NULL,
  abbreviation VARCHAR(3) UNIQUE NOT NULL,
  number_of_stars INT,
  is_zodiac BOOLEAN,
  description TEXT
);

-- ---------- DATA ----------

INSERT INTO galaxy (name, galaxy_type, age_in_millions_of_years, distance_from_earth, has_black_hole, description) VALUES
('Milky Way', 'Barred Spiral', 13600, 0, TRUE, 'The galaxy containing our Solar System'),
('Andromeda', 'Spiral', 10000, 2537000, TRUE, 'Nearest large galaxy to the Milky Way'),
('Triangulum', 'Spiral', 10000, 2730000, FALSE, 'Third largest galaxy in the Local Group'),
('Large Magellanic Cloud', 'Irregular', 13000, 160000, TRUE, 'Satellite galaxy of the Milky Way'),
('Whirlpool', 'Spiral', 400, 23000000, TRUE, 'Interacting grand-design spiral galaxy'),
('Sombrero', 'Unbarred Spiral', 9000, 29000000, TRUE, 'Galaxy with a bright nucleus and large central bulge');

INSERT INTO star (name, galaxy_id, age_in_millions_of_years, mass, is_visible_to_naked_eye, description) VALUES
('Sun', 1, 4600, 1.000, TRUE, 'The star at the center of our Solar System'),
('Sirius', 1, 242, 2.063, TRUE, 'Brightest star in the night sky'),
('Proxima Centauri', 1, 4850, 0.122, FALSE, 'Closest known star to the Sun'),
('Betelgeuse', 1, 10, 16.500, TRUE, 'Red supergiant in Orion'),
('Alpheratz', 2, 60, 3.800, TRUE, 'Brightest star in the constellation Andromeda'),
('Mirach', 2, 200, 3.000, TRUE, 'Red giant in the constellation Andromeda');

INSERT INTO planet (name, star_id, diameter_km, distance_from_star_au, has_life, is_spherical, description) VALUES
('Mercury', 1, 4879, 0.387, FALSE, TRUE, 'Smallest planet and closest to the Sun'),
('Venus', 1, 12104, 0.723, FALSE, TRUE, 'Hottest planet with a thick atmosphere'),
('Earth', 1, 12742, 1.000, TRUE, TRUE, 'The only known planet with life'),
('Mars', 1, 6779, 1.524, FALSE, TRUE, 'The red planet'),
('Jupiter', 1, 139820, 5.203, FALSE, TRUE, 'Largest planet in the Solar System'),
('Saturn', 1, 116460, 9.537, FALSE, TRUE, 'Gas giant famous for its rings'),
('Uranus', 1, 50724, 19.191, FALSE, TRUE, 'Ice giant that rotates on its side'),
('Neptune', 1, 49244, 30.069, FALSE, TRUE, 'Farthest known major planet from the Sun'),
('Proxima b', 3, 14000, 0.049, FALSE, TRUE, 'Rocky exoplanet in the habitable zone'),
('Proxima d', 3, 7000, 0.029, FALSE, TRUE, 'Candidate sub-Earth exoplanet'),
('Alpheratz b', 5, 90000, 1.200, FALSE, TRUE, 'Hypothetical gas giant'),
('Mirach b', 6, 30000, 0.800, FALSE, TRUE, 'Hypothetical super-Earth');

INSERT INTO moon (name, planet_id, diameter_km, orbital_period_days, is_spherical, description) VALUES
('Moon', 3, 3474, 27.322, TRUE, 'Earth''s only natural satellite'),
('Phobos', 4, 22, 0.319, FALSE, 'Larger and closer moon of Mars'),
('Deimos', 4, 12, 1.263, FALSE, 'Smaller and outer moon of Mars'),
('Io', 5, 3643, 1.769, TRUE, 'Most volcanically active body in the Solar System'),
('Europa', 5, 3122, 3.551, TRUE, 'Icy moon with a subsurface ocean'),
('Ganymede', 5, 5268, 7.155, TRUE, 'Largest moon in the Solar System'),
('Callisto', 5, 4821, 16.689, TRUE, 'Heavily cratered moon of Jupiter'),
('Amalthea', 5, 167, 0.498, FALSE, 'Irregularly shaped inner moon of Jupiter'),
('Titan', 6, 5150, 15.945, TRUE, 'Only moon with a dense atmosphere'),
('Enceladus', 6, 504, 1.370, TRUE, 'Icy moon with water geysers'),
('Mimas', 6, 396, 0.942, TRUE, 'Moon with a giant impact crater'),
('Rhea', 6, 1527, 4.518, TRUE, 'Second largest moon of Saturn'),
('Iapetus', 6, 1469, 79.322, TRUE, 'Moon with a two-toned surface'),
('Dione', 6, 1123, 2.737, TRUE, 'Icy moon of Saturn'),
('Titania', 7, 1578, 8.706, TRUE, 'Largest moon of Uranus'),
('Oberon', 7, 1523, 13.463, TRUE, 'Second largest moon of Uranus'),
('Miranda', 7, 472, 1.413, TRUE, 'Moon with extreme surface features'),
('Ariel', 7, 1158, 2.520, TRUE, 'Bright moon of Uranus'),
('Triton', 8, 2707, 5.877, TRUE, 'Large moon of Neptune with retrograde orbit'),
('Nereid', 8, 340, 360.130, FALSE, 'Moon of Neptune with an eccentric orbit'),
('Proteus', 8, 420, 1.122, FALSE, 'Second largest moon of Neptune');

INSERT INTO constellation (name, abbreviation, number_of_stars, is_zodiac, description) VALUES
('Orion', 'Ori', 81, FALSE, 'The Hunter, home of Betelgeuse'),
('Andromeda', 'And', 152, FALSE, 'The Chained Maiden, contains the Andromeda Galaxy'),
('Canis Major', 'CMa', 150, FALSE, 'The Greater Dog, contains Sirius'),
('Scorpius', 'Sco', 125, TRUE, 'The Scorpion, a zodiac constellation'),
('Leo', 'Leo', 92, TRUE, 'The Lion, a zodiac constellation');
