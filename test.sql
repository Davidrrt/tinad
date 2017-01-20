--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.1

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
-- Name: categorie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE categorie (
    idcategorie integer NOT NULL,
    designation character varying(50)
);


ALTER TABLE categorie OWNER TO postgres;

--
-- Name: categorie_idcategorie_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE categorie_idcategorie_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categorie_idcategorie_seq OWNER TO postgres;

--
-- Name: categorie_idcategorie_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE categorie_idcategorie_seq OWNED BY categorie.idcategorie;


--
-- Name: motdepasse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE motdepasse (
    idmotdepasse integer NOT NULL,
    idutilisateur integer NOT NULL,
    datemodification date,
    motdepasse character varying(50)
);


ALTER TABLE motdepasse OWNER TO postgres;

--
-- Name: motdepasse_idmotdepasse_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE motdepasse_idmotdepasse_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE motdepasse_idmotdepasse_seq OWNER TO postgres;

--
-- Name: motdepasse_idmotdepasse_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE motdepasse_idmotdepasse_seq OWNED BY motdepasse.idmotdepasse;


--
-- Name: photo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE photo (
    idphoto integer NOT NULL,
    idservice integer NOT NULL,
    libele character varying(50)
);


ALTER TABLE photo OWNER TO postgres;

--
-- Name: photo_idphoto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE photo_idphoto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE photo_idphoto_seq OWNER TO postgres;

--
-- Name: photo_idphoto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE photo_idphoto_seq OWNED BY photo.idphoto;


--
-- Name: reactionreponse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE reactionreponse (
    idutilisateur integer NOT NULL,
    idreponse integer NOT NULL,
    idreactionreponse integer NOT NULL,
    reaction boolean,
    datereaction date
);


ALTER TABLE reactionreponse OWNER TO postgres;

--
-- Name: reactionreponse_idreactionreponse_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reactionreponse_idreactionreponse_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reactionreponse_idreactionreponse_seq OWNER TO postgres;

--
-- Name: reactionreponse_idreactionreponse_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reactionreponse_idreactionreponse_seq OWNED BY reactionreponse.idreactionreponse;


--
-- Name: reactionservice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE reactionservice (
    idutilisateur integer NOT NULL,
    idservice integer NOT NULL,
    idreactionservice integer NOT NULL,
    reaction boolean,
    datereaction date
);


ALTER TABLE reactionservice OWNER TO postgres;

--
-- Name: reactionservice_idreactionservice_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reactionservice_idreactionservice_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reactionservice_idreactionservice_seq OWNER TO postgres;

--
-- Name: reactionservice_idreactionservice_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reactionservice_idreactionservice_seq OWNED BY reactionservice.idreactionservice;


--
-- Name: reponse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE reponse (
    idreponse integer NOT NULL,
    idutilisateur integer NOT NULL,
    reponse text,
    datereponse date,
    etat boolean
);


ALTER TABLE reponse OWNER TO postgres;

--
-- Name: reponse_idreponse_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reponse_idreponse_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reponse_idreponse_seq OWNER TO postgres;

--
-- Name: reponse_idreponse_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reponse_idreponse_seq OWNED BY reponse.idreponse;


--
-- Name: service; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE service (
    idservice integer NOT NULL,
    idcategorie integer NOT NULL,
    idutilisateur integer NOT NULL,
    titre text,
    description text,
    datepublication date,
    datedebutdisponibilite date,
    datefindisponibilite date,
    type smallint
);


ALTER TABLE service OWNER TO postgres;

--
-- Name: service_idservice_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE service_idservice_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE service_idservice_seq OWNER TO postgres;

--
-- Name: service_idservice_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE service_idservice_seq OWNED BY service.idservice;


--
-- Name: utilisateur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE utilisateur (
    idutilisateur integer NOT NULL,
    nom character varying(50),
    prenom character varying(50),
    email character varying(50),
    adresse character varying(50),
    latitude character varying(50),
    longitude character varying(50),
    sexe character varying(10),
    specialitre character varying(50),
    dateinscription date,
    statut character varying(255)
);


ALTER TABLE utilisateur OWNER TO postgres;

--
-- Name: utilisateur_idutilisateur_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE utilisateur_idutilisateur_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE utilisateur_idutilisateur_seq OWNER TO postgres;

--
-- Name: utilisateur_idutilisateur_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE utilisateur_idutilisateur_seq OWNED BY utilisateur.idutilisateur;


--
-- Name: categorie idcategorie; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categorie ALTER COLUMN idcategorie SET DEFAULT nextval('categorie_idcategorie_seq'::regclass);


--
-- Name: motdepasse idmotdepasse; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY motdepasse ALTER COLUMN idmotdepasse SET DEFAULT nextval('motdepasse_idmotdepasse_seq'::regclass);


--
-- Name: photo idphoto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY photo ALTER COLUMN idphoto SET DEFAULT nextval('photo_idphoto_seq'::regclass);


--
-- Name: reactionreponse idreactionreponse; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reactionreponse ALTER COLUMN idreactionreponse SET DEFAULT nextval('reactionreponse_idreactionreponse_seq'::regclass);


--
-- Name: reactionservice idreactionservice; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reactionservice ALTER COLUMN idreactionservice SET DEFAULT nextval('reactionservice_idreactionservice_seq'::regclass);


--
-- Name: reponse idreponse; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reponse ALTER COLUMN idreponse SET DEFAULT nextval('reponse_idreponse_seq'::regclass);


--
-- Name: service idservice; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY service ALTER COLUMN idservice SET DEFAULT nextval('service_idservice_seq'::regclass);


--
-- Name: utilisateur idutilisateur; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY utilisateur ALTER COLUMN idutilisateur SET DEFAULT nextval('utilisateur_idutilisateur_seq'::regclass);


--
-- Data for Name: categorie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY categorie (idcategorie, designation) FROM stdin;
\.


--
-- Name: categorie_idcategorie_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('categorie_idcategorie_seq', 1, false);


--
-- Data for Name: motdepasse; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY motdepasse (idmotdepasse, idutilisateur, datemodification, motdepasse) FROM stdin;
\.


--
-- Name: motdepasse_idmotdepasse_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('motdepasse_idmotdepasse_seq', 1, false);


--
-- Data for Name: photo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY photo (idphoto, idservice, libele) FROM stdin;
\.


--
-- Name: photo_idphoto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('photo_idphoto_seq', 1, false);


--
-- Data for Name: reactionreponse; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reactionreponse (idutilisateur, idreponse, idreactionreponse, reaction, datereaction) FROM stdin;
\.


--
-- Name: reactionreponse_idreactionreponse_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reactionreponse_idreactionreponse_seq', 1, false);


--
-- Data for Name: reactionservice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reactionservice (idutilisateur, idservice, idreactionservice, reaction, datereaction) FROM stdin;
\.


--
-- Name: reactionservice_idreactionservice_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reactionservice_idreactionservice_seq', 1, false);


--
-- Data for Name: reponse; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reponse (idreponse, idutilisateur, reponse, datereponse, etat) FROM stdin;
\.


--
-- Name: reponse_idreponse_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reponse_idreponse_seq', 1, false);


--
-- Data for Name: service; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY service (idservice, idcategorie, idutilisateur, titre, description, datepublication, datedebutdisponibilite, datefindisponibilite, type) FROM stdin;
\.


--
-- Name: service_idservice_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('service_idservice_seq', 1, false);


--
-- Data for Name: utilisateur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY utilisateur (idutilisateur, nom, prenom, email, adresse, latitude, longitude, sexe, specialitre, dateinscription, statut) FROM stdin;
\.


--
-- Name: utilisateur_idutilisateur_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('utilisateur_idutilisateur_seq', 1, false);


--
-- Name: categorie pk_categorie; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categorie
    ADD CONSTRAINT pk_categorie PRIMARY KEY (idcategorie);


--
-- Name: motdepasse pk_motdepasse; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY motdepasse
    ADD CONSTRAINT pk_motdepasse PRIMARY KEY (idmotdepasse);


--
-- Name: photo pk_photo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY photo
    ADD CONSTRAINT pk_photo PRIMARY KEY (idphoto);


--
-- Name: reactionreponse pk_reactionreponse; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reactionreponse
    ADD CONSTRAINT pk_reactionreponse PRIMARY KEY (idutilisateur, idreponse);


--
-- Name: reactionservice pk_reactionservice; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reactionservice
    ADD CONSTRAINT pk_reactionservice PRIMARY KEY (idutilisateur, idservice);


--
-- Name: reponse pk_reponse; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reponse
    ADD CONSTRAINT pk_reponse PRIMARY KEY (idreponse);


--
-- Name: service pk_service; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY service
    ADD CONSTRAINT pk_service PRIMARY KEY (idservice);


--
-- Name: utilisateur pk_utilisateur; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY utilisateur
    ADD CONSTRAINT pk_utilisateur PRIMARY KEY (idutilisateur);


--
-- Name: categorie_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX categorie_pk ON categorie USING btree (idcategorie);


--
-- Name: categoriedeservice_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX categoriedeservice_fk ON service USING btree (idcategorie);


--
-- Name: demanderoffrir_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX demanderoffrir_fk ON service USING btree (idutilisateur);


--
-- Name: motdepasse_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX motdepasse_pk ON motdepasse USING btree (idmotdepasse);


--
-- Name: motdepasse_utilisateur_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX motdepasse_utilisateur_fk ON motdepasse USING btree (idutilisateur);


--
-- Name: photo_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX photo_pk ON photo USING btree (idphoto);


--
-- Name: photoservice_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX photoservice_fk ON photo USING btree (idservice);


--
-- Name: reactionreponse2_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reactionreponse2_fk ON reactionreponse USING btree (idreponse);


--
-- Name: reactionreponse_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reactionreponse_fk ON reactionreponse USING btree (idutilisateur);


--
-- Name: reactionreponse_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX reactionreponse_pk ON reactionreponse USING btree (idutilisateur, idreponse);


--
-- Name: reactionservice2_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reactionservice2_fk ON reactionservice USING btree (idservice);


--
-- Name: reactionservice_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reactionservice_fk ON reactionservice USING btree (idutilisateur);


--
-- Name: reactionservice_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX reactionservice_pk ON reactionservice USING btree (idutilisateur, idservice);


--
-- Name: repondre_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX repondre_fk ON reponse USING btree (idutilisateur);


--
-- Name: reponse_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX reponse_pk ON reponse USING btree (idreponse);


--
-- Name: service_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX service_pk ON service USING btree (idservice);


--
-- Name: utilisateur_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX utilisateur_pk ON utilisateur USING btree (idutilisateur);


--
-- Name: motdepasse fk_motdepas_motdepass_utilisat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY motdepasse
    ADD CONSTRAINT fk_motdepas_motdepass_utilisat FOREIGN KEY (idutilisateur) REFERENCES utilisateur(idutilisateur) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: photo fk_photo_photoserv_service; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY photo
    ADD CONSTRAINT fk_photo_photoserv_service FOREIGN KEY (idservice) REFERENCES service(idservice) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: reactionreponse fk_reaction_reactionr_reponse; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reactionreponse
    ADD CONSTRAINT fk_reaction_reactionr_reponse FOREIGN KEY (idreponse) REFERENCES reponse(idreponse) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: reactionreponse fk_reaction_reactionr_utilisat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reactionreponse
    ADD CONSTRAINT fk_reaction_reactionr_utilisat FOREIGN KEY (idutilisateur) REFERENCES utilisateur(idutilisateur) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: reactionservice fk_reaction_reactions_service; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reactionservice
    ADD CONSTRAINT fk_reaction_reactions_service FOREIGN KEY (idservice) REFERENCES service(idservice) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: reactionservice fk_reaction_reactions_utilisat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reactionservice
    ADD CONSTRAINT fk_reaction_reactions_utilisat FOREIGN KEY (idutilisateur) REFERENCES utilisateur(idutilisateur) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: reponse fk_reponse_repondre_utilisat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reponse
    ADD CONSTRAINT fk_reponse_repondre_utilisat FOREIGN KEY (idutilisateur) REFERENCES utilisateur(idutilisateur) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: service fk_service_categorie_categori; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY service
    ADD CONSTRAINT fk_service_categorie_categori FOREIGN KEY (idcategorie) REFERENCES categorie(idcategorie) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: service fk_service_demandero_utilisat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY service
    ADD CONSTRAINT fk_service_demandero_utilisat FOREIGN KEY (idutilisateur) REFERENCES utilisateur(idutilisateur) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

