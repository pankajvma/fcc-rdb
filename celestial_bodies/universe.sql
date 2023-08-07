--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    age_in_years numeric,
    description text,
    is_dwarf boolean,
    galaxy_type character varying(50) NOT NULL,
    distance_from_earth_in_ly integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    age_in_years numeric,
    description text,
    is_dwarf boolean,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    age_in_years numeric,
    description text,
    is_dwarf boolean,
    planet_type character varying(50) NOT NULL,
    star_id integer NOT NULL,
    diameter_in_kms integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    country character varying(20),
    planet_id integer NOT NULL
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    age_in_years numeric,
    description text,
    is_dwarf boolean,
    star_type character varying(50) NOT NULL,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellite_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600000000, 'Includes Solar System. Its name describes the galaxy''s appearance from Earth', false, 'Spiral', 950000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10100000000, 'Nearest major galaxy to the Milky way', false, 'Barred Spiral', 2537000);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 11010000000, 'Satellite galaxy of the Milky Way, also the second or third closest galxy to the Milky Way', true, 'Magellanic Spiral', 158200);
INSERT INTO public.galaxy VALUES (4, 'Small Magellanic Cloud', 13000000000, 'Also known as Nubecula Minorm is a dwarf galaxy near Milky Way', true, 'Dwarf irregular', 199000);
INSERT INTO public.galaxy VALUES (5, 'Backward', NULL, 'It appears to  rotate backwards as the tips of thespiral arms point in the direction of rotation', false, 'Spiral', 200000000);
INSERT INTO public.galaxy VALUES (6, 'Black Eye', NULL, 'It has a spectacular dark band of absorbing dust in front of the galaxy''s bright nucleus', false, 'Spiral', 24100000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 4500000000, 'Earth''s natural satellite, rocky with lunar maria.', false, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 4300000000, 'Small, irregularly shaped.', false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 4300000000, 'Small, irregaulary shaped.', false, 4);
INSERT INTO public.moon VALUES (4, 'Io', 4500000000, 'Volcanically active moon with colorful suraface.', false, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 4500000000, 'Ice-covered moon with subsurface ocean.', false, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 4500000000, 'Largest moon in the solar system, has its own magnetic field.', false, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 4500000000, 'Heavily cratered moon with an ancient surface.', false, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 4500000000, 'Largest moon of Saturn, with a thick nitrogen atmosphere.', false, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 4500000000, 'Active moon with ice-geysers and subsurface ocean.', false, 6);
INSERT INTO public.moon VALUES (10, 'Miranda', 4500000000, 'Moon with complex geological features.', false, 7);
INSERT INTO public.moon VALUES (11, 'Ariel', 4500000000, 'Moon with relatively young and smooth surface.', false, 7);
INSERT INTO public.moon VALUES (12, 'Umbriel', 4500000000, 'Dark and heavily cratered moon.', false, 7);
INSERT INTO public.moon VALUES (13, 'Titania', 4500000000, 'Moon with a diverse surface and ice canyons.', false, 7);
INSERT INTO public.moon VALUES (14, 'Oberon', 4500000000, 'Largest and most distant moon of Uranus.', false, 7);
INSERT INTO public.moon VALUES (15, 'Triton', 4500000000, 'Cold moon with geysers and an retrograde orbit.', false, 8);
INSERT INTO public.moon VALUES (16, 'Charon', 4500000000, 'Largest moon of Pluto, orbits in a synchronous rotation with Pluto.', false, 9);
INSERT INTO public.moon VALUES (17, 'Nix', 4500000000, 'Small moon of Pluto, part of Pluto system.', false, 9);
INSERT INTO public.moon VALUES (18, 'Hydra', 4500000000, 'Irragularly shaped moon of Pluto.', false, 9);
INSERT INTO public.moon VALUES (19, 'Hi''iaka', 4500000000, 'Large moon with reddish surface.', false, 11);
INSERT INTO public.moon VALUES (20, 'Namaka', 4500000000, 'Samll and fast rotating moon.', false, 11);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4600000000, 'Smallest and innermost planet in the Solar system, characterized by extreme temperatures and a lack of atmosphere.', false, 'Terrestrial', 1, NULL);
INSERT INTO public.planet VALUES (2, 'Venus', 4600000000, 'Hottest planet, often called Earth''s sister due to similar size and composition.', false, 'Terrestrial', 1, NULL);
INSERT INTO public.planet VALUES (3, 'Earth', 4600000000, 'Third planet from the Sun, teeming with life and the only known celestial body to support diverse ecosystems', false, 'Terrestrial', 1, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', 4600000000, 'Red planet with thin atmosphere', false, 'Terrestrial', 1, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4600000000, 'Largest planet in the Solar system, known for its colorful bands, the Great Red spot and numerous moons.', false, 'Gas giant', 1, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', 4600000000, 'Recognizable by its iconic ring system and numerous moons, the second largest planet in the solar system', false, 'Gas giant', 1, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', 4600000000, 'An  ice giant with a tilted axis, unique among the planets, and known for its pale blue-green color.', false, 'Ice giant', 1, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', 4600000000, 'The farthest planet from the Sun, known for its deep blue color and strong winds, and the presence of the Great Dark Spot', false, 'Ice giant', 1, NULL);
INSERT INTO public.planet VALUES (9, 'Pluto', 4600000000, 'Dwarf planet located in the outer Solar System, formerly considered the ninth planet.', true, 'Dwarf', 1, NULL);
INSERT INTO public.planet VALUES (10, 'Ceres', 4600000000, 'The largest object in the asteroid belt between Mars and Jupiter, considered a Dwarf planet.', true, 'Dwarf', 1, NULL);
INSERT INTO public.planet VALUES (11, 'Haumea', 4600000000, 'A small, elongated dwarf planet located in the Kuiper belt.', true, 'Dwarf', 1, NULL);
INSERT INTO public.planet VALUES (12, 'Makemake', 4600000000, 'Dwarf planet, known for its reddish-brown color.', true, 'Dwarf', 1, NULL);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (1, 'Hubble Space Telescope', 'Space-based telescope for astronomical observations.', 'US', 3);
INSERT INTO public.satellite VALUES (2, 'Sentinel-1A', 'Radar imaging satellite for Earth observation.', 'EU', 3);
INSERT INTO public.satellite VALUES (3, 'Mars Reconnaissance Orbiter', 'High-resolution imaging and data relay for Mars missions.', 'US', 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4603000000, 'Star at the center of the Solar system', true, 'Yellow Swarf', 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 85000000, 'Red supergiant, one of the brightest stars in the sky.', false, 'Red Supergiant', 1);
INSERT INTO public.star VALUES (3, 'Almach (Gamma Andromedae)', 2000000000, 'Multiple star system with a golden-yellow primary star.', false, 'Multiple Star', 2);
INSERT INTO public.star VALUES (4, 'R136a1', 2000000, 'Extremely massive and luminous blue hypegiant star.', false, 'Blue Hypergiant', 3);
INSERT INTO public.star VALUES (5, 'WOH G64', 1000000, 'One of the largest know red supergiant  star.', false, 'Red Supergiant', 4);
INSERT INTO public.star VALUES (6, 'Zeta-2 Reticuli', 2000000000, 'Binary star system, components of Zeta reticuli are Sun like stars.', false, 'Binary Star', 5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: satellite satellite_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_name_key UNIQUE (name);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: satellite fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

