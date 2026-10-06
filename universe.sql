--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(30) NOT NULL,
    type character varying(30) NOT NULL,
    year_discovered integer,
    has_planets boolean
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
    name character varying(30) NOT NULL,
    radius_km numeric,
    type character varying(30),
    planet_id integer
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
    name character varying(30) NOT NULL,
    type character varying(30),
    has_life boolean,
    description text,
    star_id integer
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
-- Name: planets_moons; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planets_moons (
    planet_name character varying(30) NOT NULL,
    moon_name character varying(30),
    planets_moons_id integer NOT NULL,
    name character varying(20),
    order_by_biggest integer
);


ALTER TABLE public.planets_moons OWNER TO freecodecamp;

--
-- Name: planets_moons_name_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planets_moons_name_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planets_moons_name_seq OWNER TO freecodecamp;

--
-- Name: planets_moons_name_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planets_moons_name_seq OWNED BY public.planets_moons.planets_moons_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(30),
    distance_from_earth_ly numeric(4,1),
    galaxy_id integer
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
-- Name: planets_moons planets_moons_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planets_moons ALTER COLUMN planets_moons_id SET DEFAULT nextval('public.planets_moons_name_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'barred spiral', 1610, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'barred spiral', 1612, true);
INSERT INTO public.galaxy VALUES (3, 'The Guitar', 'galaxy pair', 1827, false);
INSERT INTO public.galaxy VALUES (4, 'Pegasus Dwarf', 'irregular dwarf', 1950, false);
INSERT INTO public.galaxy VALUES (5, 'Keenans System', 'globular', 1935, false);
INSERT INTO public.galaxy VALUES (6, 'Helix', 'seyfert', 1824, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 1740, 'natural', 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 11, 'captured or irregular', 4);
INSERT INTO public.moon VALUES (3, 'Pandora', 40.7, 'shepherd', 6);
INSERT INTO public.moon VALUES (4, 'Prometheus', 45, 'shepherd', 6);
INSERT INTO public.moon VALUES (5, 'Telesto', 12.4, 'trojan', 6);
INSERT INTO public.moon VALUES (6, 'Calypso', 10.7, 'trojan', 6);
INSERT INTO public.moon VALUES (7, 'Triton', 2706.8, 'retrograde', 8);
INSERT INTO public.moon VALUES (8, 'Io', 1822, 'volcanic', 5);
INSERT INTO public.moon VALUES (9, 'Europa', 1561, 'icy', 5);
INSERT INTO public.moon VALUES (10, 'Ganymede', 1635, 'icy', 5);
INSERT INTO public.moon VALUES (11, 'Enceladus', 252, 'icy', 6);
INSERT INTO public.moon VALUES (12, 'Daphnis', 7.8, 'ring', 6);
INSERT INTO public.moon VALUES (13, 'Pan', 14.1, 'ring', 6);
INSERT INTO public.moon VALUES (14, 'Titan', 2575, 'subsurface ocean', 6);
INSERT INTO public.moon VALUES (15, 'Titania', 789, 'natural', 7);
INSERT INTO public.moon VALUES (16, 'Callisto', 2410.5, 'subsurface ocean', 5);
INSERT INTO public.moon VALUES (17, 'Kale', 547, 'natural', 5);
INSERT INTO public.moon VALUES (18, 'Mneme', 489, 'natural', 5);
INSERT INTO public.moon VALUES (19, 'Herse', 54.3, 'natural', 5);
INSERT INTO public.moon VALUES (20, 'Deimos', 32.9, 'natural', 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'terrestrial', false, 'solid surface and smallest planet', 2);
INSERT INTO public.planet VALUES (2, 'Venus', 'terrestrial', false, 'second from sun extreme surface conditions', 2);
INSERT INTO public.planet VALUES (3, 'Earth', 'terrestrial', true, 'we live here', 2);
INSERT INTO public.planet VALUES (4, 'Mars', 'terrestrial', false, 'iron rich soil makes it red', 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'gas giant', false, 'largest planet in solar system', 2);
INSERT INTO public.planet VALUES (6, 'Saturn', 'gas giant', false, 'extensive ring system of ice and rock', 2);
INSERT INTO public.planet VALUES (7, 'Uranus', 'ice giant', false, 'blue green color due to Methane Hydrogen and Helium', 2);
INSERT INTO public.planet VALUES (8, 'Neptune', 'ice giant', false, 'no solid surface layered structure', 2);
INSERT INTO public.planet VALUES (9, 'HD 148797 b', 'gas giant', false, 'discovered this year', 3);
INSERT INTO public.planet VALUES (10, 'KMT-2023-BLG-118L b', 'gas giant', false, 'takes almost 3 of our years to orbit its star', 5);
INSERT INTO public.planet VALUES (11, 'TOI 426 b', 'super earth', false, 'discovered this year less than two day orbital period', 5);
INSERT INTO public.planet VALUES (12, 'MWC 758 c', 'unknown', false, 'orbital period of 817 years', 3);


--
-- Data for Name: planets_moons; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planets_moons VALUES ('Earth', 'The Moon', 1, NULL, NULL);
INSERT INTO public.planets_moons VALUES ('Mars', 'Phobos', 2, NULL, NULL);
INSERT INTO public.planets_moons VALUES ('Saturn', 'Pandora', 3, NULL, NULL);
INSERT INTO public.planets_moons VALUES ('Saturn', 'Prometheus', 4, NULL, NULL);
INSERT INTO public.planets_moons VALUES ('Saturn', 'Telesto', 5, NULL, NULL);
INSERT INTO public.planets_moons VALUES ('Saturn', 'Calypso', 6, NULL, NULL);
INSERT INTO public.planets_moons VALUES ('Neptune', 'Triton', 7, NULL, NULL);
INSERT INTO public.planets_moons VALUES ('Jupiter', 'Io', 8, NULL, NULL);
INSERT INTO public.planets_moons VALUES ('Jupiter', 'Europa', 9, NULL, NULL);
INSERT INTO public.planets_moons VALUES ('Jupiter', 'Ganymede', 10, NULL, NULL);
INSERT INTO public.planets_moons VALUES ('Saturn', 'Enceladus', 11, NULL, NULL);
INSERT INTO public.planets_moons VALUES ('Saturn', 'Daphnis', 12, NULL, NULL);
INSERT INTO public.planets_moons VALUES ('Saturn', 'Pan', 13, NULL, NULL);
INSERT INTO public.planets_moons VALUES ('Saturn', 'Titan', 14, NULL, NULL);
INSERT INTO public.planets_moons VALUES ('Uranus', 'Titania', 15, NULL, NULL);
INSERT INTO public.planets_moons VALUES ('Jupiter', 'Callisto', 16, NULL, NULL);
INSERT INTO public.planets_moons VALUES ('Jupiter', 'Kale', 17, NULL, NULL);
INSERT INTO public.planets_moons VALUES ('Jupiter', 'Mneme', 18, NULL, NULL);
INSERT INTO public.planets_moons VALUES ('Jupiter', 'Herse', 19, NULL, NULL);
INSERT INTO public.planets_moons VALUES ('Mars', 'Deimos', 20, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpheratz', 'primary', 97.0, 2);
INSERT INTO public.star VALUES (2, 'Sun', 'yellow dwarf', NULL, 1);
INSERT INTO public.star VALUES (3, 'PHL 287', 'white dwarf', 650.0, 6);
INSERT INTO public.star VALUES (4, 'Betelguese', 'red supergiant', 400.0, 1);
INSERT INTO public.star VALUES (5, 'Sirius', 'white dwarf', 8.6, 1);
INSERT INTO public.star VALUES (6, 'Arcturus', 'orange giant', 36.7, 1);


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
-- Name: planets_moons_name_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planets_moons_name_seq', 20, true);


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
-- Name: planets_moons planets_moons_order_by_biggest_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planets_moons
    ADD CONSTRAINT planets_moons_order_by_biggest_key UNIQUE (order_by_biggest);


--
-- Name: planets_moons planets_moons_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planets_moons
    ADD CONSTRAINT planets_moons_pkey PRIMARY KEY (planets_moons_id);


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

