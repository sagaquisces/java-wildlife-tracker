--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: animals; Type: TABLE; Schema: public; Owner: michaeldunlap
--

CREATE TABLE animals (
    id integer NOT NULL,
    name character varying,
    health character varying,
    age character varying,
    endangered boolean
);


ALTER TABLE animals OWNER TO michaeldunlap;

--
-- Name: animals_id_seq; Type: SEQUENCE; Schema: public; Owner: michaeldunlap
--

CREATE SEQUENCE animals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE animals_id_seq OWNER TO michaeldunlap;

--
-- Name: animals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: michaeldunlap
--

ALTER SEQUENCE animals_id_seq OWNED BY animals.id;


--
-- Name: sightings; Type: TABLE; Schema: public; Owner: michaeldunlap
--

CREATE TABLE sightings (
    id integer NOT NULL,
    animal_id integer,
    location character varying,
    ranger_name character varying
);


ALTER TABLE sightings OWNER TO michaeldunlap;

--
-- Name: sightings_id_seq; Type: SEQUENCE; Schema: public; Owner: michaeldunlap
--

CREATE SEQUENCE sightings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sightings_id_seq OWNER TO michaeldunlap;

--
-- Name: sightings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: michaeldunlap
--

ALTER SEQUENCE sightings_id_seq OWNED BY sightings.id;


--
-- Name: animals id; Type: DEFAULT; Schema: public; Owner: michaeldunlap
--

ALTER TABLE ONLY animals ALTER COLUMN id SET DEFAULT nextval('animals_id_seq'::regclass);


--
-- Name: sightings id; Type: DEFAULT; Schema: public; Owner: michaeldunlap
--

ALTER TABLE ONLY sightings ALTER COLUMN id SET DEFAULT nextval('sightings_id_seq'::regclass);


--
-- Data for Name: animals; Type: TABLE DATA; Schema: public; Owner: michaeldunlap
--

COPY animals (id, name, health, age, endangered) FROM stdin;
\.


--
-- Name: animals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: michaeldunlap
--

SELECT pg_catalog.setval('animals_id_seq', 8, true);


--
-- Data for Name: sightings; Type: TABLE DATA; Schema: public; Owner: michaeldunlap
--

COPY sightings (id, animal_id, location, ranger_name) FROM stdin;
\.


--
-- Name: sightings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: michaeldunlap
--

SELECT pg_catalog.setval('sightings_id_seq', 8, true);


--
-- Name: animals animals_pkey; Type: CONSTRAINT; Schema: public; Owner: michaeldunlap
--

ALTER TABLE ONLY animals
    ADD CONSTRAINT animals_pkey PRIMARY KEY (id);


--
-- Name: sightings sightings_pkey; Type: CONSTRAINT; Schema: public; Owner: michaeldunlap
--

ALTER TABLE ONLY sightings
    ADD CONSTRAINT sightings_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

