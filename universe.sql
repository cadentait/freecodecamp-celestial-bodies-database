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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(50) NOT NULL,
    mass integer NOT NULL,
    radius integer NOT NULL,
    description text,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    shape character varying NOT NULL,
    distance double precision NOT NULL,
    number_stars numeric,
    local_group boolean NOT NULL,
    local_supercluster boolean,
    discovery_year integer,
    description character varying
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxies_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxies_id_seq OWNER TO freecodecamp;

--
-- Name: galaxies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxies_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet character varying(255) NOT NULL,
    discovered integer NOT NULL,
    discoverer character varying,
    distance integer NOT NULL,
    diameter integer,
    orbital_period integer,
    visible character varying,
    habitable character varying,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moons_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moons_id_seq OWNER TO freecodecamp;

--
-- Name: moons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moons_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_location character varying,
    size numeric NOT NULL,
    bigger_than_earth character varying NOT NULL,
    composition character varying,
    has_moons character varying NOT NULL,
    num_of_moons integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planets_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planets_id_seq OWNER TO freecodecamp;

--
-- Name: planets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planets_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_location character varying,
    size double precision,
    color character varying,
    temperature integer NOT NULL,
    has_planets character varying NOT NULL,
    num_planets integer,
    is_seeable character varying NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: stars_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.stars_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stars_id_seq OWNER TO freecodecamp;

--
-- Name: stars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.stars_id_seq OWNED BY public.star.star_id;


--
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxies_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moons_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planets_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.stars_id_seq'::regclass);


--
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 'V Puppis', 14, 1, 'Probabletrinarysystem', 1);
INSERT INTO public.black_hole VALUES (2, 'Gaia BH1', 10, 1, 'Binary system', 1);
INSERT INTO public.black_hole VALUES (3, 'AD620-00', 12, 1, 'Binary star system', 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Spiral', 2.5, 1000000000000, true, true, 1885, 'The closest galaxy to our own Milky Way and one of the brightest objects in the night sky.');
INSERT INTO public.galaxy VALUES (2, 'Sombrero', 'Spiral', 29, 400000000000, false, true, 1887, 'A galaxy with a distinctive central bulge that gives it the appearance of a sombrero.');
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', 'Spiral', 23, 100000000000, false, true, 1773, 'A grand design spiral galaxy with a well-defined spiral pattern.');
INSERT INTO public.galaxy VALUES (4, 'M87', 'Elliptical', 55, 3000000000000, false, true, 1781, 'A giant elliptical galaxy that is home to a supermassive black hole.');
INSERT INTO public.galaxy VALUES (5, 'Milky Way', 'Spiral', 0, 300000000000, false, true, 1610, 'The Milky Way[ is the galaxy that includes the Solar System, with the name describing the galaxy''s appearance from Earth: a hazy band of light seen in the night sky formed from stars that cannot be individually distinguished by the naked eye.');
INSERT INTO public.galaxy VALUES (6, 'Swagger', 'Amazing', 6181990, 10000000, false, false, 2023, 'A galaxy discovered while doing this project.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Earth', 0, 'Humankind', 384400, 3, 475, 'TRUE', 'TRUE', NULL);
INSERT INTO public.moon VALUES (2, 'Deimos', 'Mars', 1877, 'Asaph Hall', 23460, 12, 1, 'TRUE', 'TRUE', NULL);
INSERT INTO public.moon VALUES (3, 'Phobos', 'Mars', 1877, 'Asaph Hall', 9270, 22, 0, 'TRUE', 'TRUE', NULL);
INSERT INTO public.moon VALUES (4, 'Adrastea', 'Jupiter', 1979, 'Jewitt & Danielson', 128980, 26, 0, 'TRUE', 'FALSE', NULL);
INSERT INTO public.moon VALUES (5, 'Aitne', 'Jupiter', 2001, 'S. Sheppard, D. Jewitt, & J. Kleyna', 23547000, 3, 736, 'TRUE', 'FALSE', NULL);
INSERT INTO public.moon VALUES (6, 'Amalthea', 'Jupiter', 1892, 'E. Barnard', 181300, 262, 0, 'TRUE', 'FALSE', NULL);
INSERT INTO public.moon VALUES (7, 'Ananke', 'Jupiter', 1951, 'S. Nicholson', 21200000, 20, 631, 'TRUE', 'FALSE', NULL);
INSERT INTO public.moon VALUES (8, 'Aoede', 'Jupiter', 2003, 'S. Sheppard, D. Jewitt, & J. Kleyna', 23807655, 4, 749, 'TRUE', 'FALSE', NULL);
INSERT INTO public.moon VALUES (9, 'Arche', 'Jupiter', 2002, 'S. Sheppard', 23064000, 3, 716, 'TRUE', 'FALSE', NULL);
INSERT INTO public.moon VALUES (10, 'Autonoe', 'Jupiter', 2001, 'S. Sheppard, D. Jewitt, & J. Kleyna', 24122000, 4, 753, 'TRUE', 'FALSE', NULL);
INSERT INTO public.moon VALUES (11, 'Callisto', 'Jupiter', 1610, 'Galileo', 1883000, 4800, 17, 'TRUE', 'FALSE', NULL);
INSERT INTO public.moon VALUES (12, 'Carme', 'Jupiter', 1938, 'S. Nicholson', 22600000, 30, 692, 'TRUE', 'FALSE', NULL);
INSERT INTO public.moon VALUES (13, 'Callirrhoe', 'Jupiter', 2000, 'Spacewatch Project
Minor Planet Center', 24200000, 10, 774, 'TRUE', 'FALSE', NULL);
INSERT INTO public.moon VALUES (14, 'Carpo', 'Jupiter', 2003, 'S. Sheppard, D. Jewitt, & J. Kleyna', 17100000, 3, 457, 'TRUE', 'FALSE', NULL);
INSERT INTO public.moon VALUES (15, 'Chaldene', 'Jupiter', 2000, 'S. Sheppard, D. Jewitt, Y. Fernandez, & G. Magnier', 23179000, 4, 741, 'TRUE', 'FALSE', NULL);
INSERT INTO public.moon VALUES (16, 'Cyllene', 'Jupiter', 2003, 'S. Sheppard, D. Jewitt, & J. Kleyna', 24000000, 2, 738, 'TRUE', 'FALSE', NULL);
INSERT INTO public.moon VALUES (17, 'Elara', 'Jupiter', 1905, 'C. Perrine', 11737000, 80, 260, 'TRUE', 'FALSE', NULL);
INSERT INTO public.moon VALUES (18, 'Erinome', 'Jupiter', 2000, 'S. Sheppard, D. Jewitt, Y. Fernandez, & G. Magnier', 23279000, 3, 672, 'TRUE', 'FALSE', NULL);
INSERT INTO public.moon VALUES (19, 'Euanthe', 'Jupiter', 2001, 'S. Sheppard, D. Jewitt, & J. Kleyna', 21017000, 3, 622, 'TRUE', 'FALSE', NULL);
INSERT INTO public.moon VALUES (20, 'Eukelade', 'Jupiter', 2003, 'S. Sheppard, D. Jewitt, & J. Kleyna', 24557295, 4, 746, 'TRUE', 'FALSE', NULL);
INSERT INTO public.moon VALUES (21, 'Euporie', 'Jupiter', 2001, 'S. Sheppard, D. Jewitt, & J. Kleyna', 19394000, 2, 534, 'TRUE', 'FALSE', NULL);
INSERT INTO public.moon VALUES (22, 'Europa', 'Jupiter', 1610, 'Galileo', 670900, 3126, 4, 'TRUE', 'TRUE', NULL);
INSERT INTO public.moon VALUES (23, 'Eurydome', 'Jupiter', 2001, 'S. Sheppard, D. Jewitt, & J. Kleyna', 23219000, 3, 713, 'TRUE', 'FALSE', NULL);
INSERT INTO public.moon VALUES (24, 'Ganymede', 'Jupiter', 1610, 'Galileo', 1070000, 5276, 7, 'TRUE', 'TRUE', NULL);
INSERT INTO public.moon VALUES (25, 'Harpalyke', 'Jupiter', 2000, 'S. Sheppard, D. Jewitt, Y. Fernandez, & G. Magnier', 21105000, 4, 595, 'TRUE', 'FALSE', NULL);
INSERT INTO public.moon VALUES (26, 'Hegemone', 'Jupiter', 2003, 'S. Sheppard, D. Jewitt, & J. Kleyna', 24514095, 3, 782, 'TRUE', 'FALSE', NULL);
INSERT INTO public.moon VALUES (27, 'Helike', 'Jupiter', 2003, 'S. Sheppard, D. Jewitt, & J. Kleyna', 10972830, 4, 234, 'TRUE', 'FALSE', NULL);
INSERT INTO public.moon VALUES (28, 'Hermippe', 'Jupiter', 2001, 'S. Sheppard, D. Jewitt, & J. Kleyna', 21252000, 4, 630, 'TRUE', 'FALSE', NULL);
INSERT INTO public.moon VALUES (29, 'Himalia', 'Jupiter', 1904, 'C. Perrine', 11480000, 170, 251, 'TRUE', 'TRUE', NULL);
INSERT INTO public.moon VALUES (30, 'Io', 'Jupiter', 1610, 'Galileo', 421600, 2629, 2, 'TRUE', 'FALSE', NULL);
INSERT INTO public.moon VALUES (31, 'Iocaste', 'Jupiter', 2000, 'S. Sheppard, D. Jewitt, Y. Fernandez, & G. Magnier', 21269000, 5, 657, 'TRUE', 'FALSE', NULL);
INSERT INTO public.moon VALUES (32, 'Isonone', 'Jupiter', 2000, 'S. Sheppard, D. Jewitt, Y. Fernandez, & G. Magnier', 23217000, 4, 712, 'TRUE', 'FALSE', NULL);
INSERT INTO public.moon VALUES (33, 'Kale', 'Jupiter', 2001, 'S. Sheppard, D. Jewitt, & J. Kleyna', 23124000, 2, 609, 'TRUE', 'FALSE', NULL);
INSERT INTO public.moon VALUES (34, 'Kallichore', 'Jupiter', 2003, 'S. Sheppard, D. Jewitt, & J. Kleyna', 22395390, 2, 683, 'TRUE', 'FALSE', NULL);
INSERT INTO public.moon VALUES (35, 'Kalyke', 'Jupiter', 2000, 'S. Sheppard, D. Jewitt, Y. Fernandez, & G. Magnier', 23583000, 5, 760, 'TRUE', 'FALSE', NULL);
INSERT INTO public.moon VALUES (36, 'Kore', 'Jupiter', 2003, 'S. Sheppard, D. Jewitt, & J. Kleyna', 24543000, 2, 779, 'TRUE', 'FALSE', NULL);
INSERT INTO public.moon VALUES (37, 'Leda', 'Jupiter', 1974, 'C. Kowal', 11094000, 10, 239, 'TRUE', 'FALSE', NULL);
INSERT INTO public.moon VALUES (38, 'Lysithea', 'Jupiter', 1938, 'S. Nicholson', 11720000, 24, 259, 'TRUE', 'FALSE', NULL);
INSERT INTO public.moon VALUES (39, 'Magaclite', 'Jupiter', 2000, 'S. Sheppard, D. Jewitt, Y. Fernandez, & G. Magnier', 23806000, 5, 771, 'TRUE', 'FALSE', NULL);
INSERT INTO public.moon VALUES (40, 'Metis', 'Jupiter', 1979, 'S. Sunnott', 127960, 40, 0, 'TRUE', 'FALSE', NULL);
INSERT INTO public.moon VALUES (41, 'Mneme', 'Jupiter', 2003, 'Scott S. Sheppard & B. Gladman', 21069000, 2, 620, 'TRUE', 'FALSE', NULL);
INSERT INTO public.moon VALUES (42, 'Orthosie', 'Jupiter', 2001, 'S. Sheppard, D. Jewitt, & J. Kleyna', 21168000, 2, 617, 'TRUE', 'FALSE', NULL);
INSERT INTO public.moon VALUES (43, 'Pasiphae', 'Jupiter', 1908, 'P. Melotte', 23500000, 36, 735, 'TRUE', 'FALSE', NULL);
INSERT INTO public.moon VALUES (44, 'Pasithee', 'Jupiter', 2001, 'S. Sheppard, D. Jewitt, & J. Kleyna', 23029000, 2, 715, 'TRUE', 'FALSE', NULL);
INSERT INTO public.moon VALUES (45, 'Praxidike', 'Jupiter', 2000, 'S. Sheppard, D. Jewitt, Y. Fernandez, & G. Magnier', 21147000, 7, 632, 'TRUE', 'FALSE', NULL);
INSERT INTO public.moon VALUES (46, 'Sinope', 'Jupiter', 1914, 'S. Nicholson', 23700700, 28, 758, 'TRUE', 'FALSE', NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Sol', 1.330, 'FALSE', 'Rock', 'FALSE', 0, NULL);
INSERT INTO public.planet VALUES (2, 'Venus', 'Sol', 4.87, 'FALSE', 'Rock', 'FALSE', 0, NULL);
INSERT INTO public.planet VALUES (3, 'Earth', 'Sol', 5.97, 'FALSE', 'Rock', 'TRUE', 1, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', 'Sol', 1.642, 'FALSE', 'Rock', 'TRUE', 2, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Sol', 1898, 'TRUE', 'Gas', 'TRUE', 67, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Sol', 568, 'TRUE', 'Gas', 'TRUE', 62, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Sol', 86.8, 'TRUE', 'Ice', 'TRUE', 27, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Sol', 102, 'TRUE', 'Ice', 'TRUE', 14, NULL);
INSERT INTO public.planet VALUES (9, 'Proxima b', 'Proxima Centauri', 6.39, 'TRUE', 'Rock', 'FALSE', 0, NULL);
INSERT INTO public.planet VALUES (10, 'Proxima d', 'Proxima Centauri', 1.5, 'FALSE', 'Rock', 'FALSE', 0, NULL);
INSERT INTO public.planet VALUES (11, '14 Andromedae b', 'Alpha Andromedae', 9110, 'TRUE', 'Unknown', 'FALSE', 0, NULL);
INSERT INTO public.planet VALUES (12, 'Kappa Andromedae b ', 'Alpha Andromedae', 24674, 'TRUE', 'Unknown', 'FALSE', 0, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 'Milky Way', 1.7, 'White', 9940, 'TRUE', 1, 'TRUE', NULL);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 'Milky Way', 1.1, 'Yellow', 5790, 'TRUE', 4, 'TRUE', NULL);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 'Milky Way', 0.12, 'Red', 3050, 'TRUE', 1, 'TRUE', NULL);
INSERT INTO public.star VALUES (4, 'Alpheratz', 'Andromeda', 3.6, 'Blue', 13800, 'FALSE', 0, 'FALSE', NULL);
INSERT INTO public.star VALUES (5, 'Mirach', 'Andromeda', 3.5, 'Red', 3400, 'FALSE', 0, 'FALSE', NULL);
INSERT INTO public.star VALUES (6, 'Upsilon Andromedae A', 'Andromeda', 1.3, 'Red', 6210, 'TRUE', 4, 'FALSE', NULL);
INSERT INTO public.star VALUES (7, 'Swag Star', 'Swagger', 100, 'NegativeRainbow', 6181990, 't', 1990, 'f', 5);


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 3, true);


--
-- Name: galaxies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxies_id_seq', 6, true);


--
-- Name: moons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moons_id_seq', 46, true);


--
-- Name: planets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planets_id_seq', 12, true);


--
-- Name: stars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.stars_id_seq', 7, true);


--
-- Name: black_hole black_hole_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_description_key UNIQUE (description);


--
-- Name: black_hole black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_name_key UNIQUE (name);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


--
-- Name: galaxy galaxies_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxies_description_key UNIQUE (description);


--
-- Name: galaxy galaxies_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxies_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moons_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moons_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planets_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planets_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star stars_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT stars_name_key UNIQUE (name);


--
-- Name: black_hole black_hole_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


