--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

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

ALTER TABLE IF EXISTS ONLY public.lectors_departments DROP CONSTRAINT IF EXISTS lectors_departments_lectors_lector_id_fk;
ALTER TABLE IF EXISTS ONLY public.lectors_departments DROP CONSTRAINT IF EXISTS lectors_departments_departments_department_id_fk;
ALTER TABLE IF EXISTS ONLY public.lectors DROP CONSTRAINT IF EXISTS lectors_degrees_degree_id_fk;
ALTER TABLE IF EXISTS ONLY public.departments DROP CONSTRAINT IF EXISTS departments_lectors_lector_id_fk;
ALTER TABLE IF EXISTS ONLY public.lectors DROP CONSTRAINT IF EXISTS lectors_pkey;
ALTER TABLE IF EXISTS ONLY public.lectors DROP CONSTRAINT IF EXISTS lectors_name_key;
ALTER TABLE IF EXISTS ONLY public.lectors_departments DROP CONSTRAINT IF EXISTS lectors_departments_pk;
ALTER TABLE IF EXISTS ONLY public.departments DROP CONSTRAINT IF EXISTS departments_pkey;
ALTER TABLE IF EXISTS ONLY public.departments DROP CONSTRAINT IF EXISTS departments_name_key;
ALTER TABLE IF EXISTS ONLY public.degrees DROP CONSTRAINT IF EXISTS degrees_plural_name_key;
ALTER TABLE IF EXISTS ONLY public.degrees DROP CONSTRAINT IF EXISTS degrees_pkey;
ALTER TABLE IF EXISTS ONLY public.degrees DROP CONSTRAINT IF EXISTS degrees_name_key;
ALTER TABLE IF EXISTS public.lectors ALTER COLUMN lector_id DROP DEFAULT;
ALTER TABLE IF EXISTS public.departments ALTER COLUMN department_id DROP DEFAULT;
ALTER TABLE IF EXISTS public.degrees ALTER COLUMN degree_id DROP DEFAULT;
DROP SEQUENCE IF EXISTS public.lectors_lector_id_seq;
DROP TABLE IF EXISTS public.lectors_departments;
DROP TABLE IF EXISTS public.lectors;
DROP SEQUENCE IF EXISTS public.departments_department_id_seq;
DROP TABLE IF EXISTS public.departments;
DROP SEQUENCE IF EXISTS public.degrees_degree_id_seq;
DROP TABLE IF EXISTS public.degrees;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: degrees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.degrees (
                                degree_id integer NOT NULL,
                                name text NOT NULL,
                                plural_name text NOT NULL
);


ALTER TABLE public.degrees OWNER TO postgres;

--
-- Name: degrees_degree_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.degrees_degree_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.degrees_degree_id_seq OWNER TO postgres;

--
-- Name: degrees_degree_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.degrees_degree_id_seq OWNED BY public.degrees.degree_id;


--
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
                                    department_id integer NOT NULL,
                                    name text NOT NULL,
                                    head_id integer
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- Name: departments_department_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.departments_department_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departments_department_id_seq OWNER TO postgres;

--
-- Name: departments_department_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.departments_department_id_seq OWNED BY public.departments.department_id;


--
-- Name: lectors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lectors (
                                lector_id integer NOT NULL,
                                name text NOT NULL,
                                degree_id integer,
                                salary numeric NOT NULL
);


ALTER TABLE public.lectors OWNER TO postgres;

--
-- Name: lectors_departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lectors_departments (
                                            lector_id integer NOT NULL,
                                            department_id integer NOT NULL
);


ALTER TABLE public.lectors_departments OWNER TO postgres;

--
-- Name: lectors_lector_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lectors_lector_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lectors_lector_id_seq OWNER TO postgres;

--
-- Name: lectors_lector_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lectors_lector_id_seq OWNED BY public.lectors.lector_id;


--
-- Name: degrees degree_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.degrees ALTER COLUMN degree_id SET DEFAULT nextval('public.degrees_degree_id_seq'::regclass);


--
-- Name: departments department_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments ALTER COLUMN department_id SET DEFAULT nextval('public.departments_department_id_seq'::regclass);


--
-- Name: lectors lector_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lectors ALTER COLUMN lector_id SET DEFAULT nextval('public.lectors_lector_id_seq'::regclass);


--
-- Data for Name: degrees; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.degrees (degree_id, name, plural_name) VALUES (1, 'assistant', 'assistants');
INSERT INTO public.degrees (degree_id, name, plural_name) VALUES (2, 'associate professor', 'associate professors');
INSERT INTO public.degrees (degree_id, name, plural_name) VALUES (3, 'professor', 'professors');


--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.departments (department_id, name, head_id) VALUES (1, 'Chemistry', 5);
INSERT INTO public.departments (department_id, name, head_id) VALUES (2, 'Architecture', 16);
INSERT INTO public.departments (department_id, name, head_id) VALUES (3, 'Finance', 11);
INSERT INTO public.departments (department_id, name, head_id) VALUES (4, 'Economics', 17);
INSERT INTO public.departments (department_id, name, head_id) VALUES (5, 'Computer Science', 10);
INSERT INTO public.departments (department_id, name, head_id) VALUES (6, 'Mathematics', 7);
INSERT INTO public.departments (department_id, name, head_id) VALUES (7, 'Philosophy', 20);
INSERT INTO public.departments (department_id, name, head_id) VALUES (8, 'Psychology', 18);
INSERT INTO public.departments (department_id, name, head_id) VALUES (9, 'Sociology and Anthropology', 15);
INSERT INTO public.departments (department_id, name, head_id) VALUES (10, 'History', 12);
INSERT INTO public.departments (department_id, name, head_id) VALUES (11, 'Management and Marketing', 8);
INSERT INTO public.departments (department_id, name, head_id) VALUES (12, 'Geology', 4);


--
-- Data for Name: lectors; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.lectors (lector_id, name, degree_id, salary) VALUES (1, 'Euan Perez', 2, 2720);
INSERT INTO public.lectors (lector_id, name, degree_id, salary) VALUES (2, 'Johnnie Doyle', 1, 1650);
INSERT INTO public.lectors (lector_id, name, degree_id, salary) VALUES (3, 'Siena Elliott', 2, 1985);
INSERT INTO public.lectors (lector_id, name, degree_id, salary) VALUES (4, 'Chase Salgado', 2, 2100);
INSERT INTO public.lectors (lector_id, name, degree_id, salary) VALUES (5, 'Catrin Monaghan', 3, 3560);
INSERT INTO public.lectors (lector_id, name, degree_id, salary) VALUES (6, 'Evie-Rose Ballard', 1, 1556);
INSERT INTO public.lectors (lector_id, name, degree_id, salary) VALUES (7, 'Beverly Mackie', 3, 3020);
INSERT INTO public.lectors (lector_id, name, degree_id, salary) VALUES (8, 'Ella-May Ponce', 2, 2405);
INSERT INTO public.lectors (lector_id, name, degree_id, salary) VALUES (9, 'Audrey Glover', 1, 1679);
INSERT INTO public.lectors (lector_id, name, degree_id, salary) VALUES (10, 'Addison Taylor', 3, 3025);
INSERT INTO public.lectors (lector_id, name, degree_id, salary) VALUES (11, 'Evangeline Shepard', 3, 4015);
INSERT INTO public.lectors (lector_id, name, degree_id, salary) VALUES (12, 'Chanice Cullen', 2, 2044);
INSERT INTO public.lectors (lector_id, name, degree_id, salary) VALUES (13, 'Usama Long', 1, 1655);
INSERT INTO public.lectors (lector_id, name, degree_id, salary) VALUES (14, 'Mercy Whitaker', 1, 1398);
INSERT INTO public.lectors (lector_id, name, degree_id, salary) VALUES (15, 'Yasin Anderson', 2, 2618);
INSERT INTO public.lectors (lector_id, name, degree_id, salary) VALUES (16, 'Shakeel Mcdowell', 3, 3497);
INSERT INTO public.lectors (lector_id, name, degree_id, salary) VALUES (17, 'Brendon Nunez', 3, 3089);
INSERT INTO public.lectors (lector_id, name, degree_id, salary) VALUES (18, 'Lucille Bartlett', 2, 2346);
INSERT INTO public.lectors (lector_id, name, degree_id, salary) VALUES (19, 'Jamaal Kay', 1, 1943);
INSERT INTO public.lectors (lector_id, name, degree_id, salary) VALUES (20, 'Sanah Colon', 2, 2000);


--
-- Data for Name: lectors_departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (5, 1);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (16, 2);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (11, 3);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (17, 4);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (10, 5);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (7, 6);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (20, 7);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (18, 8);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (15, 9);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (12, 10);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (8, 11);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (4, 12);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (1, 1);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (2, 1);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (3, 1);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (4, 1);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (20, 1);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (6, 1);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (7, 1);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (8, 2);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (9, 2);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (10, 2);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (11, 2);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (12, 2);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (13, 2);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (14, 3);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (15, 3);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (16, 3);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (17, 3);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (18, 3);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (19, 4);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (20, 4);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (2, 4);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (4, 4);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (6, 4);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (8, 4);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (12, 5);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (14, 5);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (16, 5);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (18, 5);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (20, 5);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (1, 6);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (3, 6);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (5, 6);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (9, 6);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (7, 7);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (9, 7);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (11, 7);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (13, 7);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (15, 7);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (17, 7);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (19, 7);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (1, 8);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (2, 8);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (3, 8);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (4, 8);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (5, 8);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (6, 9);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (7, 9);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (8, 9);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (9, 9);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (10, 9);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (11, 10);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (6, 10);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (13, 10);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (14, 10);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (15, 10);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (16, 11);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (17, 11);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (18, 11);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (19, 11);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (20, 11);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (1, 11);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (3, 12);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (5, 12);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (7, 12);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (9, 12);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (11, 12);
INSERT INTO public.lectors_departments (lector_id, department_id) VALUES (13, 12);


--
-- Name: degrees_degree_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.degrees_degree_id_seq', 3, true);


--
-- Name: departments_department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departments_department_id_seq', 12, true);


--
-- Name: lectors_lector_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lectors_lector_id_seq', 20, true);


--
-- Name: degrees degrees_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.degrees
    ADD CONSTRAINT degrees_name_key UNIQUE (name);


--
-- Name: degrees degrees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.degrees
    ADD CONSTRAINT degrees_pkey PRIMARY KEY (degree_id);


--
-- Name: degrees degrees_plural_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.degrees
    ADD CONSTRAINT degrees_plural_name_key UNIQUE (plural_name);


--
-- Name: departments departments_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_name_key UNIQUE (name);


--
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (department_id);


--
-- Name: lectors_departments lectors_departments_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lectors_departments
    ADD CONSTRAINT lectors_departments_pk PRIMARY KEY (lector_id, department_id);


--
-- Name: lectors lectors_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lectors
    ADD CONSTRAINT lectors_name_key UNIQUE (name);


--
-- Name: lectors lectors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lectors
    ADD CONSTRAINT lectors_pkey PRIMARY KEY (lector_id);


--
-- Name: departments departments_lectors_lector_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_lectors_lector_id_fk FOREIGN KEY (head_id) REFERENCES public.lectors(lector_id) ON UPDATE SET NULL ON DELETE SET NULL;


--
-- Name: lectors lectors_degrees_degree_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lectors
    ADD CONSTRAINT lectors_degrees_degree_id_fk FOREIGN KEY (degree_id) REFERENCES public.degrees(degree_id);


--
-- Name: lectors_departments lectors_departments_departments_department_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lectors_departments
    ADD CONSTRAINT lectors_departments_departments_department_id_fk FOREIGN KEY (department_id) REFERENCES public.departments(department_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lectors_departments lectors_departments_lectors_lector_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lectors_departments
    ADD CONSTRAINT lectors_departments_lectors_lector_id_fk FOREIGN KEY (lector_id) REFERENCES public.lectors(lector_id);


--
-- PostgreSQL database dump complete
--

