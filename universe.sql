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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    is_periodic boolean NOT NULL,
    orbit_period_in_years double precision,
    discovery_year integer,
    star_id integer NOT NULL
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    type character varying(30),
    distance_from_earth numeric(10,3)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: glaxy_glaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.glaxy_glaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.glaxy_glaxy_id_seq OWNER TO freecodecamp;

--
-- Name: glaxy_glaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.glaxy_glaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(20,3),
    type character varying(30),
    planet_id integer,
    has_life boolean DEFAULT false NOT NULL
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
    description text,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    type character varying(30),
    distance_from_earth numeric(10,3),
    star_id integer,
    has_life boolean DEFAULT false NOT NULL
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
    name character varying(30) NOT NULL,
    description text,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    type character varying(30),
    distance_from_earth numeric(10,3),
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.glaxy_glaxy_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy that contains our solar system', false, 13000, 'Spiral', 0.000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'A nearby spiral galaxy', true, 22000, 'Spiral', 2.500);
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 'A giant elliptical galaxy in the Virgo cluster', true, 65000, 'Elliptical', 53.500)
;
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'A distinctive galaxy with a prominent dust lane', true, 12000, 'Lenticular', 28.600);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 'A small spiral galaxy in the Local Group', false, 5000, 'Spiral', 3.100);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'A nearby galaxy with a prominent dust lane', true, 12000, 'Elliptical', 13.700);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (20, 'Moon', 'The Moon is a rocky, airless world with a surface pockmarked by craters and strewn with ro
cks and dust.', true, 4520, 384400.000, 'Terrestrial', 3, false);
INSERT INTO public.moon VALUES (21, 'Phobos', 'A small, irregularly shaped moon of Mars', false, 4560, 9376.000, 'Irregular', 4, false)
;
INSERT INTO public.moon VALUES (22, 'Deimos', 'A small, irregularly shaped moon of Mars', false, 4560, 23460.000, 'Irregular', 4, false
);
INSERT INTO public.moon VALUES (23, 'Ganymede', 'The largest moon in the solar system and a satellite of Jupiter', true, 4560, 1070400.
000, 'Galilean', 5, false);
INSERT INTO public.moon VALUES (24, 'Callisto', 'A large, heavily cratered moon of Jupiter', true, 4560, 1882700.000, 'Galilean', 5, fa
lse);
INSERT INTO public.moon VALUES (25, 'Io', 'A volcanic moon of Jupiter', true, 4560, 421600.000, 'Galilean', 5, false);
INSERT INTO public.moon VALUES (26, 'Europa', 'A moon of Jupiter with a frozen surface and possible subsurface ocean', true, 4560, 6711
00.000, 'Galilean', 5, false);
INSERT INTO public.moon VALUES (27, 'Mimas', 'A small, heavily cratered moon of Saturn', true, 4560, 185520.000, 'Regular', 6, false);
INSERT INTO public.moon VALUES (28, 'Enceladus', 'A small, icy moon of Saturn with geysers of water vapor and ice', true, 4560, 237948.
000, 'Regular', 6, false);
INSERT INTO public.moon VALUES (29, 'Tethys', 'A heavily cratered moon of Saturn', true, 4560, 294619.000, 'Regular', 6, false);
INSERT INTO public.moon VALUES (30, 'Dione', 'A moon of Saturn with a heavily cratered surface and possible subsurface ocean', true, 45
60, 377415.000, 'Regular', 6, false);
INSERT INTO public.moon VALUES (31, 'Rhea', 'A moon of Saturn with a heavily cratered surface and a possible subsurface ocean', true, 4
560, 527108.000, 'Regular', 6, false);
INSERT INTO public.moon VALUES (32, 'Titan', 'The largest moon of Saturn and the only moon in the solar system with a thick atmosphere'
, true, 4560, 1221870.000, 'Regular', 6, false);
INSERT INTO public.moon VALUES (33, 'Hyperion', 'An irregularly shaped moon of Saturn', false, 4560, 1481100.000, 'Irregular', 6, false
);
INSERT INTO public.moon VALUES (34, 'Miranda', 'A small, heavily cratered moon of Uranus', true, 4560, 129390.000, 'Regular', 7, false)
;
INSERT INTO public.moon VALUES (35, 'Ariel', 'A moon of Uranus with a heavily cratered surface and possible subsurface ocean', true, 45
60, 191020.000, 'Regular', 7, false);
INSERT INTO public.moon VALUES (36, 'Umbriel', 'A heavily cratered moon of Uranus', true, 4560, 266300.000, 'Regular', 7, false);
INSERT INTO public.moon VALUES (37, 'Titania', 'The largest moon of Uranus with a heavily cratered surface and a possible subsurface oc
ean', true, 4560, 435910.000, 'Regular', 7, false);
INSERT INTO public.moon VALUES (38, 'Oberon', 'A heavily cratered moon of Uranus', true, 4560, 583520.000, 'Regular', 7, false);
INSERT INTO public.moon VALUES (39, 'Triton', 'The largest moon of Neptune and the only large moon in the solar system that orbits in t
he opposite direction of its planet', true, 4560, 354759.000, 'Irregular', 8, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'The smallest planet in our solar system', true, 4500, 'Terrestrial', 77.300, 1, false)
;
INSERT INTO public.planet VALUES (2, 'Venus', 'The second planet from the sun and the hottest planet in our solar system', true, 4600, 
'Terrestrial', 38.200, 1, false);
INSERT INTO public.planet VALUES (4, 'Mars', 'The fourth planet from the sun and also known as the "Red Planet"', true, 4500, 'Terrestr
ial', 78.300, 1, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'The largest planet in our solar system', false, 4600, 'Gas Giant', 628.700, 2, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 'The sixth planet from the sun and known for its rings', false, 4600, 'Gas Giant', 1278.
300, 2, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 'The seventh planet from the sun and known for its tilted axis of rotation', false, 4600
, 'Ice Giant', 2723.600, 2, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 'The eighth planet from the sun and known for its blue color', false, 4600, 'Ice Giant'
, 4353.900, 2, false);
INSERT INTO public.planet VALUES (9, 'Kepler-186f', 'An Earth-sized planet in the habitable zone of its star', true, 5000, 'Terrestrial
', 500.000, 6, false);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 'A gas giant planet that orbits very close to its star', false, 4600, 'Gas Giant',
 156.300, 5, false);
INSERT INTO public.planet VALUES (12, 'Gliese 436 b', 'A Neptune-sized planet that has a very low density and may have a water-rich atm
osphere', false, 5000, 'Ice Giant', 33.400, 4, false);
INSERT INTO public.planet VALUES (10, 'Trappist-1e', 'A rocky planet in the habitable zone of its star in the Trappist-1 system', true,
 5000, 'Terrestrial', 40.000, 7, false);
INSERT INTO public.planet VALUES (3, 'Earth', 'Our home planet and the only known planet with life', true, 4500, 'Terrestrial', 0.000, 
1, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of our solar system', true, 4600, 'Main Sequence', 0.000, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 'The brightest star in the Alpha Centauri system', true, 6000, 'Main Sequence', 
4.370, 2);
INSERT INTO public.star VALUES (3, 'Alpha Centauri B', 'The second-brightest star in the Alpha Centauri system', true, 6000, 'Main Sequ
ence', 4.370, 2);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 'A red dwarf star that is the closest known star to our solar system', true, 400
0, 'Red Dwarf', 4.240, 2);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 'A red supergiant star in the constellation Orion', false, 8000, 'Red Supergiant', 642
.500, 3);
INSERT INTO public.star VALUES (6, 'Rigel', 'A blue supergiant star in the constellation Orion', false, 10000, 'Blue Supergiant', 860.2
00, 3);
INSERT INTO public.star VALUES (7, 'Trappist-1', 'An ultra-cool dwarf star with seven known planets', true, 7500, 'Red Dwarf', 39.500, 
1);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 1, false);


--
-- Name: glaxy_glaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.glaxy_glaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 39, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 36, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy glaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT glaxy_pkey PRIMARY KEY (galaxy_id);


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
-- Name: comet comet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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