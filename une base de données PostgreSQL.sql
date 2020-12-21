--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

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
-- Name: admin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin (
    id_admin integer NOT NULL,
    email character varying(50),
    password character varying(50),
    id_responsable integer
);


ALTER TABLE public.admin OWNER TO postgres;

--
-- Name: domaine; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.domaine (
    id_domaine integer NOT NULL,
    nom character varying(50),
    prixdomaine character varying(50)
);


ALTER TABLE public.domaine OWNER TO postgres;

--
-- Name: notation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notation (
    id_notation integer NOT NULL,
    not1 character varying(50),
    not2 double precision,
    not3 double precision,
    not4 double precision,
    not5 double precision
);


ALTER TABLE public.notation OWNER TO postgres;

--
-- Name: question; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.question (
    id_question integer NOT NULL,
    prix double precision,
    introduction character varying(50),
    description character varying(50),
    formule character varying(50),
    tagdomaine character varying(50),
    tagnomredacteur character varying(50)
);


ALTER TABLE public.question OWNER TO postgres;

--
-- Name: questionneur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.questionneur (
    id_questionneur integer NOT NULL,
    email character varying(50),
    password character varying(50),
    id_user integer
);


ALTER TABLE public.questionneur OWNER TO postgres;

--
-- Name: repondeur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.repondeur (
    id_repondeur integer NOT NULL,
    domaine character varying(50),
    niveaudomaine character varying(50),
    nomredacteur character varying(50),
    id_user integer
);


ALTER TABLE public.repondeur OWNER TO postgres;

--
-- Name: reponse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reponse (
    id_reponse integer NOT NULL,
    reponsel character varying(50),
    notation character varying(50)
);


ALTER TABLE public.reponse OWNER TO postgres;

--
-- Name: responsable; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.responsable (
    id_responsable integer NOT NULL,
    email character varying(50),
    password character varying(50),
    id_user integer
);


ALTER TABLE public.responsable OWNER TO postgres;

--
-- Name: utilisateur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.utilisateur (
    id_user integer NOT NULL,
    nom character varying(50),
    prenom character varying(50),
    email character varying(50),
    password character varying(50),
    adresse character varying(50),
    numcompteb integer,
    solde double precision,
    role character varying(50)
);


ALTER TABLE public.utilisateur OWNER TO postgres;

--
-- Name: admin admin_id_admin_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_id_admin_key UNIQUE (id_admin);


--
-- Name: domaine domaine_id_domaine_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.domaine
    ADD CONSTRAINT domaine_id_domaine_key UNIQUE (id_domaine);


--
-- Name: notation notation_id_notation_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notation
    ADD CONSTRAINT notation_id_notation_key UNIQUE (id_notation);


--
-- Name: question question_id_question_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_id_question_key UNIQUE (id_question);


--
-- Name: questionneur questionneur_id_questionneur_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionneur
    ADD CONSTRAINT questionneur_id_questionneur_key UNIQUE (id_questionneur);


--
-- Name: repondeur repondeur_id_repondeur_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repondeur
    ADD CONSTRAINT repondeur_id_repondeur_key UNIQUE (id_repondeur);


--
-- Name: reponse reponse_id_reponse_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reponse
    ADD CONSTRAINT reponse_id_reponse_key UNIQUE (id_reponse);


--
-- Name: responsable responsable_id_responsable_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.responsable
    ADD CONSTRAINT responsable_id_responsable_key UNIQUE (id_responsable);


--
-- Name: utilisateur utilisateur_id_user_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_id_user_key UNIQUE (id_user);


--
-- Name: admin admin_id_responsable_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_id_responsable_fkey FOREIGN KEY (id_responsable) REFERENCES public.responsable(id_responsable);


--
-- Name: questionneur questionneur_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionneur
    ADD CONSTRAINT questionneur_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.utilisateur(id_user);


--
-- Name: repondeur repondeur_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repondeur
    ADD CONSTRAINT repondeur_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.utilisateur(id_user);


--
-- Name: responsable responsable_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.responsable
    ADD CONSTRAINT responsable_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.utilisateur(id_user);


--
-- PostgreSQL database dump complete
--

