--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(50) NOT NULL,
    description text NOT NULL,
    age integer,
    diameter integer,
    mass numeric,
    habitable boolean,
    spiral boolean
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
    name character varying(50) NOT NULL,
    description text NOT NULL,
    distance_from_planet integer,
    diameter integer,
    mass numeric,
    volcanic_activity boolean,
    icy_surface boolean,
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
    name character varying(50) NOT NULL,
    description text NOT NULL,
    distance_from_star integer,
    radius integer,
    mass numeric,
    habitable boolean,
    has_moons boolean,
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    age integer,
    temperature integer,
    luminosity numeric,
    binary_system boolean,
    has_planets boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_planet (
    star_planet_id integer NOT NULL,
    star_id integer,
    planet_id integer,
    orbitable_period integer,
    gravitational_influence numeric,
    description text,
    name character varying(50) NOT NULL
);


ALTER TABLE public.star_planet OWNER TO freecodecamp;

--
-- Name: star_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_planet_id_seq OWNER TO freecodecamp;

--
-- Name: star_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_planet_id_seq OWNED BY public.star_planet.star_planet_id;


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star_planet star_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet ALTER COLUMN star_planet_id SET DEFAULT nextval('public.star_planet_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy, a barred spiral galaxy.', 13, 105700, 1500.0, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The nearest major galaxy to the Milky Way.', 10, 220000, 1250.0, false, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A smaller galaxy near Andromeda.', 12, 60000, 500.0, false, true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'A spiral galaxy with prominent arms.', 8, 76000, 900.0, false, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'A galaxy with a prominent bulge and halo.', 11, 49000, 800.0, false, false);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 'A ring galaxy formed by a collision.', 9, 150000, 650.0, false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth''s natural satellite.', 384400, 3474, 0.0123, false, false, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'One of Mars'' moons.', 9376, 22, 0.000000018, false, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Smaller moon of Mars.', 23458, 12, 0.00000001, false, false, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'Most volcanically active body in the Solar System.', 421700, 3642, 0.015, true, false, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'Icy moon with possible subsurface ocean.', 670900, 3121, 0.008, false, true, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Largest moon in the Solar System.', 1070400, 5268, 0.025, false, false, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Heavily cratered, ancient surface.', 1882700, 4820, 0.018, false, false, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 'Saturn''s largest moon, with thick atmosphere.', 1221870, 5150, 0.0225, false, true, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Icy moon with plumes of water vapor.', 237378, 504, 0.000018, false, true, 6);
INSERT INTO public.moon VALUES (10, 'Mimas', 'Saturn''s smallest, heavily cratered moon.', 185520, 396, 0.000003, false, false, 6);
INSERT INTO public.moon VALUES (11, 'Tethys', 'Known for its massive impact crater.', 294619, 1060, 0.00006, false, false, 6);
INSERT INTO public.moon VALUES (12, 'Dione', 'Heavily cratered, with evidence of tectonic activity.', 377396, 1123, 0.00008, false, false, 6);
INSERT INTO public.moon VALUES (13, 'Miranda', 'An ice giant moon with unusual features.', 129870, 471, 0.000065, false, true, 7);
INSERT INTO public.moon VALUES (14, 'Ariel', 'Has valleys and canyons on its surface.', 190900, 1158, 0.00011, false, true, 7);
INSERT INTO public.moon VALUES (15, 'Umbriel', 'Darkest moon of Uranus.', 266000, 1169, 0.00011, false, true, 7);
INSERT INTO public.moon VALUES (16, 'Titania', 'Uranus''s largest moon.', 436300, 1578, 0.00023, false, true, 7);
INSERT INTO public.moon VALUES (17, 'Triton', 'Largest moon of Neptune, has geysers.', 354800, 1353, 0.002, true, true, 8);
INSERT INTO public.moon VALUES (18, 'Nereid', 'Neptune''s irregular, distant moon.', 5514000, 340, 0.00002, false, false, 8);
INSERT INTO public.moon VALUES (19, 'Proteus', 'One of Neptune''s outer moons.', 117600, 418, 0.00003, false, false, 8);
INSERT INTO public.moon VALUES (20, 'Larissa', 'Has a rugged, heavily cratered surface.', 73500, 194, 0.000008, false, false, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Closest planet to the Sun.', 57, 2439, 0.055, false, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Second planet from the Sun.', 108, 6051, 0.815, false, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'The third planet from the Sun.', 150, 6371, 1.0, true, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'The fourth planet from the Sun.', 228, 3389, 0.107, false, true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'The largest planet in the Solar System.', 778, 69911, 317.8, false, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Famous for its ring system.', 1430, 58232, 95.2, false, true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'An ice giant with a tilted axis.', 2871, 25362, 14.5, false, true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'The farthest planet from the Sun.', 4495, 24622, 17.1, false, true, 1);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 'Exoplanet orbiting Proxima Centauri.', 7, 6800, 1.17, false, false, 2);
INSERT INTO public.planet VALUES (10, 'Alpha Centauri Bb', 'Exoplanet in Alpha Centauri system.', 2, 7100, 1.3, true, false, 5);
INSERT INTO public.planet VALUES (11, 'Rigel-1', 'Hypothetical planet around Rigel.', 500, 15000, 3.0, false, false, 4);
INSERT INTO public.planet VALUES (12, 'Rigel-2', 'Another hypothetical planet around Rigel.', 1000, 20000, 4.2, false, false, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of the Solar System.', 4600, 5778, 1.0, false, true, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Closest star to the Sun.', 4500, 3042, 0.0017, true, true, 2);
INSERT INTO public.star VALUES (3, 'Sirius', 'Brightest star in Earth''s night sky.', 242, 9940, 25.4, true, true, 1);
INSERT INTO public.star VALUES (4, 'Rigel', 'Blue supergiant in Orion.', 800, 11000, 120000.0, false, false, 4);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 'One part of Alpha Centauri binary.', 5000, 5790, 1.52, true, true, 5);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 'Red supergiant in Orion.', 900, 3500, 126000.0, false, false, 3);


--
-- Data for Name: star_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_planet VALUES (7, 1, 3, 365, 1.0, 'Earth orbits the Sun.', 'Earth-Sun Orbit');
INSERT INTO public.star_planet VALUES (8, 1, 4, 687, 0.5, 'Mars orbits the Sun.', 'Mars-Sun Orbit');
INSERT INTO public.star_planet VALUES (9, 5, 10, 250, 0.7, 'Alpha Centauri Bb orbits Alpha Centauri A.', 'Alpha Centauri Bb - Alpha Centauri A Orbit');
INSERT INTO public.star_planet VALUES (10, 2, 10, 295, 0.3, 'Alpha Centauri Bb also orbits Proxima Centauri.', 'Alpha Centauri Bb - Proxima Centauri Orbit');
INSERT INTO public.star_planet VALUES (11, 6, 11, 500, 0.8, 'Rigel-1 orbits Rigel in a hypothetical multi-star system.', 'Rigel-1 - Rigel Orbit');
INSERT INTO public.star_planet VALUES (12, 6, 12, 700, 0.6, 'Rigel-2 orbits Rigel in a binary-star setup.', 'Rigel-2 - Rigel Orbit');


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
-- Name: star_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star_planet star_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet
    ADD CONSTRAINT star_planet_pkey PRIMARY KEY (star_planet_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: star_planet unique_star_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet
    ADD CONSTRAINT unique_star_planet_name UNIQUE (name);


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
-- Name: star_planet star_planet_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet
    ADD CONSTRAINT star_planet_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star_planet star_planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet
    ADD CONSTRAINT star_planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

