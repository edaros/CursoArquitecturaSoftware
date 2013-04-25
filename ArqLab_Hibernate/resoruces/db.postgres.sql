--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.9
-- Dumped by pg_dump version 9.1.9
-- Started on 2013-04-25 17:21:12 COT

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 163 (class 3079 OID 11721)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 1944 (class 0 OID 0)
-- Dependencies: 163
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 162 (class 1259 OID 34851)
-- Dependencies: 5
-- Name: ciudad; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ciudad (
    c_id character varying(2) NOT NULL,
    c_nombre character varying(25),
    p_id character varying(3),
    c_habitantes integer
);


ALTER TABLE public.ciudad OWNER TO postgres;

--
-- TOC entry 161 (class 1259 OID 34846)
-- Dependencies: 5
-- Name: pais; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pais (
    p_id character varying(3) NOT NULL,
    p_nombre character varying(25)
);


ALTER TABLE public.pais OWNER TO postgres;

--
-- TOC entry 1936 (class 0 OID 34851)
-- Dependencies: 162 1937
-- Data for Name: ciudad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ciudad (c_id, c_nombre, p_id, c_habitantes) FROM stdin;
01	Concepcion	001	222232
02	La serena	001	234445
03	Valparaiso	001	123434
04	Maracaibo	002	89212
05	Caracas	002	233456
06	Nueva York	003	445212
07	Washington	003	235211
08	Paris	004	232452
09	San Huano	003	445212
\.


--
-- TOC entry 1935 (class 0 OID 34846)
-- Dependencies: 161 1937
-- Data for Name: pais; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pais (p_id, p_nombre) FROM stdin;
001	Chile
002	Venezuela
003	EEUU
004	Francia
\.


--
-- TOC entry 1933 (class 2606 OID 34855)
-- Dependencies: 162 162 1938
-- Name: ciudad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ciudad
    ADD CONSTRAINT ciudad_pkey PRIMARY KEY (c_id);


--
-- TOC entry 1931 (class 2606 OID 34850)
-- Dependencies: 161 161 1938
-- Name: pais_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pais
    ADD CONSTRAINT pais_pkey PRIMARY KEY (p_id);


--
-- TOC entry 1934 (class 2606 OID 34856)
-- Dependencies: 161 162 1930 1938
-- Name: ciudad_p_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ciudad
    ADD CONSTRAINT ciudad_p_id_fkey FOREIGN KEY (p_id) REFERENCES pais(p_id);


--
-- TOC entry 1943 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2013-04-25 17:21:12 COT

--
-- PostgreSQL database dump complete
--

