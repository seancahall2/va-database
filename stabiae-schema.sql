--
-- PostgreSQL database dump
--

-- Dumped from database version 13.7
-- Dumped by pg_dump version 13.7

-- Started on 2023-10-13 14:30:32

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

--
-- TOC entry 4 (class 2615 OID 41587)
-- Name: stabiae; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA stabiae;


ALTER SCHEMA stabiae OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 204 (class 1259 OID 16547)
-- Name: area; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.area (
    area_id integer NOT NULL,
    area character varying(255)
);


ALTER TABLE public.area OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16947)
-- Name: artifact; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.artifact (
    artifact_id integer NOT NULL,
    artifact "char",
    room_fkid integer,
    site_idfk integer
);


ALTER TABLE public.artifact OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16914)
-- Name: author; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.author (
    author_id integer NOT NULL,
    author "char"
);


ALTER TABLE public.author OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16551)
-- Name: building; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.building (
    building_id integer NOT NULL,
    building character varying(255),
    site_idfk integer DEFAULT 0
);


ALTER TABLE public.building OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16972)
-- Name: building_feature; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.building_feature (
    building_idfk integer NOT NULL,
    feature_idfk integer NOT NULL
);


ALTER TABLE public.building_feature OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 17014)
-- Name: ceiling; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ceiling (
    ceiling_id integer NOT NULL,
    ceiling character(55),
    ceiling_description character varying(255),
    room_fkid integer
);


ALTER TABLE public.ceiling OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 17039)
-- Name: document; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.document (
    document_id integer NOT NULL,
    document_path character varying(255),
    document_type_fkid integer,
    region_fkid integer
);


ALTER TABLE public.document OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 17044)
-- Name: document_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.document_type (
    document_type_id integer NOT NULL,
    document_type character(55)
);


ALTER TABLE public.document_type OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16487)
-- Name: dragonskin_casts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dragonskin_casts (
    "grid_#" text,
    "cavity_#" text,
    "bed_#" text,
    cavity_opening_area text,
    cavity_depth text,
    primary_root_length text,
    "lateral_root_length(s)" text,
    description text,
    photograph_2 bytea,
    photograph_1 bytea,
    photograph_3 bytea,
    planting_bed_artifact_fkid integer DEFAULT 0,
    dragonskin_casts_id integer NOT NULL
);


ALTER TABLE public.dragonskin_casts OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16880)
-- Name: dragonskin_casts_dragonskin_casts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dragonskin_casts_dragonskin_casts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dragonskin_casts_dragonskin_casts_id_seq OWNER TO postgres;

--
-- TOC entry 3302 (class 0 OID 0)
-- Dependencies: 218
-- Name: dragonskin_casts_dragonskin_casts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dragonskin_casts_dragonskin_casts_id_seq OWNED BY public.dragonskin_casts.dragonskin_casts_id;


--
-- TOC entry 210 (class 1259 OID 16574)
-- Name: drawing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.drawing (
    drawing_id integer NOT NULL,
    drawing_name character varying(255),
    wall_idfk integer DEFAULT 0,
    drawing_format_idfk integer DEFAULT 0,
    date_created date,
    "drawing type_idfk" integer DEFAULT 0,
    digital_drawing character varying(255),
    edm character varying(255),
    hand_drawing character varying(255),
    cad_photo character varying(255),
    author_idfk integer
);


ALTER TABLE public.drawing OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16550)
-- Name: drawing type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."drawing type" (
    "drawing type id" integer NOT NULL,
    "drawing type" character varying(255)
);


ALTER TABLE public."drawing type" OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16546)
-- Name: drawing_format; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.drawing_format (
    drawing_format_id integer NOT NULL,
    drawing_format character varying(255)
);


ALTER TABLE public.drawing_format OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16934)
-- Name: feature; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.feature (
    feature_id integer NOT NULL,
    feature "char"
);


ALTER TABLE public.feature OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16937)
-- Name: floor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.floor (
    floor_id integer NOT NULL,
    floor "char",
    room_fkid integer
);


ALTER TABLE public.floor OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16575)
-- Name: garden; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.garden (
    "garden id" integer NOT NULL,
    garden character varying(255),
    room_fkid integer DEFAULT 0
);


ALTER TABLE public.garden OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16924)
-- Name: garden_artifact; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.garden_artifact (
    garden_artifact_id integer NOT NULL,
    garden_artifact "char",
    garden_idfk integer,
    photo_idfk integer
);


ALTER TABLE public.garden_artifact OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 17029)
-- Name: geology; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.geology (
    geology_id integer NOT NULL,
    geology character varying(255)
);


ALTER TABLE public.geology OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16942)
-- Name: paving_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paving_type (
    paving_type_id integer NOT NULL,
    paving_type "char",
    floor_fkid integer
);


ALTER TABLE public.paving_type OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16577)
-- Name: photo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.photo (
    photo_id integer NOT NULL,
    photo_type_idfk integer DEFAULT 0,
    photo character varying(255),
    wall_idfk integer DEFAULT 0,
    author integer,
    create_date date
);


ALTER TABLE public.photo OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16572)
-- Name: photo_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.photo_type (
    photo_type_id integer NOT NULL,
    photo_type character varying(255)
);


ALTER TABLE public.photo_type OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 25286)
-- Name: planting_bed; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planting_bed (
    planting_bed_id integer NOT NULL,
    planting_bed character varying(255),
    garden_fkid integer DEFAULT 0
);


ALTER TABLE public.planting_bed OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16611)
-- Name: planting_bed_artifact; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planting_bed_artifact (
    "planting_bed _artifact_id" integer NOT NULL,
    planting_bed_artifact character varying(255),
    planting_bed_artifact_type_fkid integer DEFAULT 0,
    photo_fkid integer DEFAULT 0,
    planting_bed_fkid integer DEFAULT 0
);


ALTER TABLE public.planting_bed_artifact OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16607)
-- Name: planting_bed_artifact_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planting_bed_artifact_type (
    planting_bed_artifact_type_id integer NOT NULL,
    planting_bed_artifact_type character varying(255)
);


ALTER TABLE public.planting_bed_artifact_type OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 25284)
-- Name: planting_bed_planting_bed_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.planting_bed_planting_bed_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planting_bed_planting_bed_id_seq OWNER TO postgres;

--
-- TOC entry 3303 (class 0 OID 0)
-- Dependencies: 236
-- Name: planting_bed_planting_bed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planting_bed_planting_bed_id_seq OWNED BY public.planting_bed.planting_bed_id;


--
-- TOC entry 219 (class 1259 OID 16893)
-- Name: region; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.region (
    region_id integer NOT NULL,
    region "char" NOT NULL,
    geology_fkid integer
);


ALTER TABLE public.region OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 17054)
-- Name: region_document; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.region_document (
    region_fkid integer NOT NULL,
    document_fkid integer NOT NULL
);


ALTER TABLE public.region_document OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 17024)
-- Name: region_features; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.region_features (
    region_fkid integer NOT NULL,
    feature_idfk integer NOT NULL
);


ALTER TABLE public.region_features OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16573)
-- Name: room; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.room (
    room_id integer NOT NULL,
    room character varying(255),
    description text,
    building_idfk integer DEFAULT 0
);


ALTER TABLE public.room OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16612)
-- Name: room_area; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.room_area (
    room_idfk integer DEFAULT 0 NOT NULL,
    area_idfk integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.room_area OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16488)
-- Name: root_casts_pb12678; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.root_casts_pb12678 (
    "cavity_#" text,
    "bed_#" text,
    "grid_#" text,
    date date,
    initials text,
    notes text,
    method_of_removal text,
    drawings bytea,
    "drawing_#s" text,
    photograph bytea,
    "photographs_#" text,
    sample_number text,
    phytolith text,
    flotation text,
    pollen text,
    soil_analysis text,
    "date-casting" date,
    method_of_casting text,
    "photographs-sampling" bytea,
    "photograph_#s-sampling" text,
    removed_for_study text,
    exposed_for_study text,
    not_exposed text,
    gesso_marker_poured_at text,
    "numbered?" text,
    "notes-examination" text,
    lapilli_removal_date_27 date,
    "initials-lapilli" text,
    "notes-lapilli" text,
    "drawings-examination" bytea,
    "drawing_#s-examination" text,
    "photographs-examination" bytea,
    "photograph_#s-examination" text,
    "prominent_primary_root?" text,
    root_depth double precision,
    "laterals?" double precision,
    depth_of_laterals double precision,
    root_spread double precision,
    "root_type_1-5" double precision,
    interpretation text,
    "initials-casting" text,
    video text,
    "interpretation-drawings" bytea,
    photograph2_ bytea,
    drawing_2 bytea,
    root_casts_pb12678_id integer NOT NULL,
    planting_bed_artifact_fkid integer
);


ALTER TABLE public.root_casts_pb12678 OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16811)
-- Name: root_casts_pb12678_root_casts_pb12678_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.root_casts_pb12678_root_casts_pb12678_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.root_casts_pb12678_root_casts_pb12678_id_seq OWNER TO postgres;

--
-- TOC entry 3304 (class 0 OID 0)
-- Dependencies: 217
-- Name: root_casts_pb12678_root_casts_pb12678_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.root_casts_pb12678_root_casts_pb12678_id_seq OWNED BY public.root_casts_pb12678.root_casts_pb12678_id;


--
-- TOC entry 235 (class 1259 OID 25272)
-- Name: root_casts_pb345; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.root_casts_pb345 (
    grid text,
    cavity text,
    bed text,
    dimensions_of_cavity_opening text,
    prominent_roots text,
    prominent_roots_count double precision,
    prominent_root_depth text,
    lateral_roots text,
    prominent_lateral_root_count double precision,
    prominent_lateral_root_depth text,
    root_spread_area text,
    drawing text,
    artist text,
    notes text,
    drawing_date text,
    cross_section_drawing text,
    artist_2 text,
    cross_section_date text,
    notes_x text,
    cross_section_2 text,
    photograph text,
    photograph_2 text,
    root_cast_photograph text,
    root_casts_pb345_id integer NOT NULL
);


ALTER TABLE public.root_casts_pb345 OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 25270)
-- Name: root_casts_pb345_root_casts_pb345_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.root_casts_pb345_root_casts_pb345_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.root_casts_pb345_root_casts_pb345_id_seq OWNER TO postgres;

--
-- TOC entry 3305 (class 0 OID 0)
-- Dependencies: 234
-- Name: root_casts_pb345_root_casts_pb345_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.root_casts_pb345_root_casts_pb345_id_seq OWNED BY public.root_casts_pb345.root_casts_pb345_id;


--
-- TOC entry 207 (class 1259 OID 16552)
-- Name: site; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.site (
    site_id integer NOT NULL,
    site character varying(255),
    region_idfk integer DEFAULT 0
);


ALTER TABLE public.site OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16969)
-- Name: site_feature; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.site_feature (
    site_idfk integer NOT NULL,
    feature_idfk integer NOT NULL
);


ALTER TABLE public.site_feature OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16576)
-- Name: wall; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wall (
    wall_id integer NOT NULL,
    wall character varying(255),
    room_idfk integer DEFAULT 0,
    revetement "char"
);


ALTER TABLE public.wall OWNER TO postgres;

--
-- TOC entry 2991 (class 2604 OID 16882)
-- Name: dragonskin_casts dragonskin_casts_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dragonskin_casts ALTER COLUMN dragonskin_casts_id SET DEFAULT nextval('public.dragonskin_casts_dragonskin_casts_id_seq'::regclass);


--
-- TOC entry 3009 (class 2604 OID 25289)
-- Name: planting_bed planting_bed_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planting_bed ALTER COLUMN planting_bed_id SET DEFAULT nextval('public.planting_bed_planting_bed_id_seq'::regclass);


--
-- TOC entry 2992 (class 2604 OID 16813)
-- Name: root_casts_pb12678 root_casts_pb12678_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.root_casts_pb12678 ALTER COLUMN root_casts_pb12678_id SET DEFAULT nextval('public.root_casts_pb12678_root_casts_pb12678_id_seq'::regclass);


--
-- TOC entry 3008 (class 2604 OID 25275)
-- Name: root_casts_pb345 root_casts_pb345_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.root_casts_pb345 ALTER COLUMN root_casts_pb345_id SET DEFAULT nextval('public.root_casts_pb345_root_casts_pb345_id_seq'::regclass);


--
-- TOC entry 3110 (class 2606 OID 16951)
-- Name: artifact artifact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artifact
    ADD CONSTRAINT artifact_pkey PRIMARY KEY (artifact_id);


--
-- TOC entry 3100 (class 2606 OID 16918)
-- Name: author authore_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author
    ADD CONSTRAINT authore_pkey PRIMARY KEY (author_id);


--
-- TOC entry 3114 (class 2606 OID 16976)
-- Name: building_feature building_feature_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.building_feature
    ADD CONSTRAINT building_feature_id PRIMARY KEY (building_idfk, feature_idfk);


--
-- TOC entry 3116 (class 2606 OID 17018)
-- Name: ceiling ceiling_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ceiling
    ADD CONSTRAINT ceiling_pkey PRIMARY KEY (ceiling_id);


--
-- TOC entry 3122 (class 2606 OID 17043)
-- Name: document document_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.document
    ADD CONSTRAINT document_pkey PRIMARY KEY (document_id);


--
-- TOC entry 3124 (class 2606 OID 17048)
-- Name: document_type document_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.document_type
    ADD CONSTRAINT document_type_pkey PRIMARY KEY (document_type_id);


--
-- TOC entry 3012 (class 2606 OID 16884)
-- Name: dragonskin_casts dragonskin_casts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dragonskin_casts
    ADD CONSTRAINT dragonskin_casts_pkey PRIMARY KEY (dragonskin_casts_id);


--
-- TOC entry 3104 (class 2606 OID 16958)
-- Name: feature feature_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feature
    ADD CONSTRAINT feature_pkey PRIMARY KEY (feature_id);


--
-- TOC entry 3106 (class 2606 OID 16941)
-- Name: floor floor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.floor
    ADD CONSTRAINT floor_pkey PRIMARY KEY (floor_id);


--
-- TOC entry 3102 (class 2606 OID 16928)
-- Name: garden_artifact garden_artifact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.garden_artifact
    ADD CONSTRAINT garden_artifact_pkey PRIMARY KEY (garden_artifact_id);


--
-- TOC entry 3120 (class 2606 OID 17033)
-- Name: geology geology_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geology
    ADD CONSTRAINT geology_pkey PRIMARY KEY (geology_id);


--
-- TOC entry 3108 (class 2606 OID 16946)
-- Name: paving_type paving_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paving_type
    ADD CONSTRAINT paving_type_pkey PRIMARY KEY (paving_type_id);


--
-- TOC entry 3092 (class 2606 OID 16684)
-- Name: planting_bed_artifact primarykey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planting_bed_artifact
    ADD CONSTRAINT primarykey PRIMARY KEY ("planting_bed _artifact_id");


--
-- TOC entry 3062 (class 2606 OID 16655)
-- Name: site primarykey1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site
    ADD CONSTRAINT primarykey1 PRIMARY KEY (site_id);


--
-- TOC entry 3068 (class 2606 OID 16667)
-- Name: room primarykey10; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room
    ADD CONSTRAINT primarykey10 PRIMARY KEY (room_id);


--
-- TOC entry 3081 (class 2606 OID 16673)
-- Name: photo primarykey11; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photo
    ADD CONSTRAINT primarykey11 PRIMARY KEY (photo_id);


--
-- TOC entry 3134 (class 2606 OID 25292)
-- Name: planting_bed primarykey12; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planting_bed
    ADD CONSTRAINT primarykey12 PRIMARY KEY (planting_bed_id);


--
-- TOC entry 3057 (class 2606 OID 16654)
-- Name: drawing type primarykey13; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."drawing type"
    ADD CONSTRAINT primarykey13 PRIMARY KEY ("drawing type id");


--
-- TOC entry 3065 (class 2606 OID 16671)
-- Name: photo_type primarykey14; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photo_type
    ADD CONSTRAINT primarykey14 PRIMARY KEY (photo_type_id);


--
-- TOC entry 3072 (class 2606 OID 16670)
-- Name: drawing primarykey15; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drawing
    ADD CONSTRAINT primarykey15 PRIMARY KEY (drawing_id);


--
-- TOC entry 3075 (class 2606 OID 16669)
-- Name: garden primarykey17; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.garden
    ADD CONSTRAINT primarykey17 PRIMARY KEY ("garden id");


--
-- TOC entry 3078 (class 2606 OID 16672)
-- Name: wall primarykey3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wall
    ADD CONSTRAINT primarykey3 PRIMARY KEY (wall_id);


--
-- TOC entry 3055 (class 2606 OID 16658)
-- Name: area primarykey4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area
    ADD CONSTRAINT primarykey4 PRIMARY KEY (area_id);


--
-- TOC entry 3059 (class 2606 OID 16656)
-- Name: building primarykey5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.building
    ADD CONSTRAINT primarykey5 PRIMARY KEY (building_id);


--
-- TOC entry 3053 (class 2606 OID 16659)
-- Name: drawing_format primarykey7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drawing_format
    ADD CONSTRAINT primarykey7 PRIMARY KEY (drawing_format_id);


--
-- TOC entry 3095 (class 2606 OID 16685)
-- Name: room_area primarykey8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room_area
    ADD CONSTRAINT primarykey8 PRIMARY KEY (room_idfk, area_idfk);


--
-- TOC entry 3085 (class 2606 OID 16683)
-- Name: planting_bed_artifact_type primarykey9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planting_bed_artifact_type
    ADD CONSTRAINT primarykey9 PRIMARY KEY (planting_bed_artifact_type_id);


--
-- TOC entry 3126 (class 2606 OID 17058)
-- Name: region_document region_document_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region_document
    ADD CONSTRAINT region_document_id PRIMARY KEY (region_fkid, document_fkid) INCLUDE (region_fkid, document_fkid);


--
-- TOC entry 3118 (class 2606 OID 17028)
-- Name: region_features region_feature_fkid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region_features
    ADD CONSTRAINT region_feature_fkid PRIMARY KEY (region_fkid, feature_idfk);


--
-- TOC entry 3098 (class 2606 OID 16897)
-- Name: region region_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region
    ADD CONSTRAINT region_pkey PRIMARY KEY (region_id);


--
-- TOC entry 3048 (class 2606 OID 16815)
-- Name: root_casts_pb12678 root_casts_pb12678_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.root_casts_pb12678
    ADD CONSTRAINT root_casts_pb12678_pkey PRIMARY KEY (root_casts_pb12678_id);


--
-- TOC entry 3131 (class 2606 OID 25280)
-- Name: root_casts_pb345 root_casts_pb3_to_pb5_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.root_casts_pb345
    ADD CONSTRAINT root_casts_pb3_to_pb5_pkey PRIMARY KEY (root_casts_pb345_id);


--
-- TOC entry 3112 (class 2606 OID 16978)
-- Name: site_feature site_feature_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_feature
    ADD CONSTRAINT site_feature_id PRIMARY KEY (site_idfk, feature_idfk);


--
-- TOC entry 3093 (class 1259 OID 16702)
-- Name: arearoom area; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "arearoom area" ON public.room_area USING btree (area_idfk);


--
-- TOC entry 3014 (class 1259 OID 16527)
-- Name: bed #; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "bed #" ON public.root_casts_pb12678 USING btree ("bed_#");


--
-- TOC entry 3127 (class 1259 OID 25281)
-- Name: bed #1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "bed #1" ON public.root_casts_pb345 USING btree (bed);


--
-- TOC entry 3066 (class 1259 OID 16679)
-- Name: buildingroom; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX buildingroom ON public.room USING btree (building_idfk);


--
-- TOC entry 3015 (class 1259 OID 16505)
-- Name: cavity #; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "cavity #" ON public.root_casts_pb12678 USING btree ("cavity_#");


--
-- TOC entry 3016 (class 1259 OID 16530)
-- Name: date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX date ON public.root_casts_pb12678 USING btree (date);


--
-- TOC entry 3017 (class 1259 OID 16520)
-- Name: depth of laterals; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "depth of laterals" ON public.root_casts_pb12678 USING btree (depth_of_laterals);


--
-- TOC entry 3128 (class 1259 OID 25282)
-- Name: dimensions of cavity opening; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "dimensions of cavity opening" ON public.root_casts_pb345 USING btree (dimensions_of_cavity_opening);


--
-- TOC entry 3018 (class 1259 OID 16533)
-- Name: drawing #s; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "drawing #s" ON public.root_casts_pb12678 USING btree ("drawing_#s");


--
-- TOC entry 3019 (class 1259 OID 16514)
-- Name: drawing #s-examination; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "drawing #s-examination" ON public.root_casts_pb12678 USING btree ("drawing_#s-examination");


--
-- TOC entry 3069 (class 1259 OID 16691)
-- Name: drawing formatdrawing; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "drawing formatdrawing" ON public.drawing USING btree (drawing_format_idfk);


--
-- TOC entry 3070 (class 1259 OID 16690)
-- Name: drawing typedrawing; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "drawing typedrawing" ON public.drawing USING btree ("drawing type_idfk");


--
-- TOC entry 3020 (class 1259 OID 16526)
-- Name: exposed for study; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "exposed for study" ON public.root_casts_pb12678 USING btree (exposed_for_study);


--
-- TOC entry 3021 (class 1259 OID 16537)
-- Name: flotation; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX flotation ON public.root_casts_pb12678 USING btree (flotation);


--
-- TOC entry 3132 (class 1259 OID 25298)
-- Name: gardenplanting bed; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "gardenplanting bed" ON public.planting_bed USING btree (garden_fkid);


--
-- TOC entry 3022 (class 1259 OID 16516)
-- Name: gesso marker poured at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "gesso marker poured at" ON public.root_casts_pb12678 USING btree (gesso_marker_poured_at);


--
-- TOC entry 3023 (class 1259 OID 16528)
-- Name: grid #; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "grid #" ON public.root_casts_pb12678 USING btree ("grid_#");


--
-- TOC entry 3013 (class 1259 OID 16510)
-- Name: grid #1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "grid #1" ON public.dragonskin_casts USING btree ("grid_#");


--
-- TOC entry 3129 (class 1259 OID 25283)
-- Name: grid #2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "grid #2" ON public.root_casts_pb345 USING btree (grid);


--
-- TOC entry 3024 (class 1259 OID 16529)
-- Name: initials; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX initials ON public.root_casts_pb12678 USING btree (initials);


--
-- TOC entry 3025 (class 1259 OID 16541)
-- Name: initials-casting; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "initials-casting" ON public.root_casts_pb12678 USING btree ("initials-casting");


--
-- TOC entry 3026 (class 1259 OID 16511)
-- Name: initials-lapilli; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "initials-lapilli" ON public.root_casts_pb12678 USING btree ("initials-lapilli");


--
-- TOC entry 3027 (class 1259 OID 16518)
-- Name: interpretation; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX interpretation ON public.root_casts_pb12678 USING btree (interpretation);


--
-- TOC entry 3028 (class 1259 OID 16512)
-- Name: lapilli removal date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "lapilli removal date" ON public.root_casts_pb12678 USING btree (lapilli_removal_date_27);


--
-- TOC entry 3029 (class 1259 OID 16521)
-- Name: laterals?; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "laterals?" ON public.root_casts_pb12678 USING btree ("laterals?");


--
-- TOC entry 3030 (class 1259 OID 16543)
-- Name: method of casting; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "method of casting" ON public.root_casts_pb12678 USING btree (method_of_casting);


--
-- TOC entry 3031 (class 1259 OID 16532)
-- Name: method of removal; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "method of removal" ON public.root_casts_pb12678 USING btree (method_of_removal);


--
-- TOC entry 3032 (class 1259 OID 16519)
-- Name: not exposed; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "not exposed" ON public.root_casts_pb12678 USING btree (not_exposed);


--
-- TOC entry 3033 (class 1259 OID 16531)
-- Name: notes; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX notes ON public.root_casts_pb12678 USING btree (notes);


--
-- TOC entry 3034 (class 1259 OID 16508)
-- Name: notes-examination; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "notes-examination" ON public.root_casts_pb12678 USING btree ("notes-examination");


--
-- TOC entry 3035 (class 1259 OID 16513)
-- Name: notes-lapilli; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "notes-lapilli" ON public.root_casts_pb12678 USING btree ("notes-lapilli");


--
-- TOC entry 3036 (class 1259 OID 16504)
-- Name: numbered?; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "numbered?" ON public.root_casts_pb12678 USING btree ("numbered?");


--
-- TOC entry 3086 (class 1259 OID 16697)
-- Name: photo fkid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "photo fkid" ON public.planting_bed_artifact USING btree (photo_fkid);


--
-- TOC entry 3037 (class 1259 OID 16515)
-- Name: photograph #s-examination; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "photograph #s-examination" ON public.root_casts_pb12678 USING btree ("photograph_#s-examination");


--
-- TOC entry 3038 (class 1259 OID 16539)
-- Name: photograph #s-sampling; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "photograph #s-sampling" ON public.root_casts_pb12678 USING btree ("photograph_#s-sampling");


--
-- TOC entry 3039 (class 1259 OID 16536)
-- Name: photographs #; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "photographs #" ON public.root_casts_pb12678 USING btree ("photographs_#");


--
-- TOC entry 3040 (class 1259 OID 16535)
-- Name: phytolith; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX phytolith ON public.root_casts_pb12678 USING btree (phytolith);


--
-- TOC entry 3087 (class 1259 OID 16698)
-- Name: planting bed fkid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "planting bed fkid" ON public.planting_bed_artifact USING btree (planting_bed_fkid);


--
-- TOC entry 3088 (class 1259 OID 16699)
-- Name: planting bed item type id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "planting bed item type id" ON public.planting_bed_artifact USING btree (planting_bed_artifact_type_fkid);


--
-- TOC entry 3083 (class 1259 OID 16696)
-- Name: planting bed item type id1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "planting bed item type id1" ON public.planting_bed_artifact_type USING btree (planting_bed_artifact_type_id);


--
-- TOC entry 3089 (class 1259 OID 16700)
-- Name: planting bed item typeplanting bed item; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "planting bed item typeplanting bed item" ON public.planting_bed_artifact USING btree (planting_bed_artifact_type_fkid);


--
-- TOC entry 3090 (class 1259 OID 16701)
-- Name: planting bedplanting bed item; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "planting bedplanting bed item" ON public.planting_bed_artifact USING btree (planting_bed_fkid);


--
-- TOC entry 3041 (class 1259 OID 16540)
-- Name: pollen; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pollen ON public.root_casts_pb12678 USING btree (pollen);


--
-- TOC entry 3042 (class 1259 OID 16523)
-- Name: prominent primary root?; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "prominent primary root?" ON public.root_casts_pb12678 USING btree ("prominent_primary_root?");


--
-- TOC entry 3043 (class 1259 OID 16525)
-- Name: removed for study; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "removed for study" ON public.root_casts_pb12678 USING btree (removed_for_study);


--
-- TOC entry 3076 (class 1259 OID 16693)
-- Name: room fkid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "room fkid" ON public.garden USING btree (room_fkid);


--
-- TOC entry 3096 (class 1259 OID 16703)
-- Name: roomroom area; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "roomroom area" ON public.room_area USING btree (room_idfk);


--
-- TOC entry 3079 (class 1259 OID 16687)
-- Name: roomwall; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX roomwall ON public.wall USING btree (room_idfk);


--
-- TOC entry 3044 (class 1259 OID 16517)
-- Name: root depth; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "root depth" ON public.root_casts_pb12678 USING btree (root_depth);


--
-- TOC entry 3045 (class 1259 OID 16524)
-- Name: root spread; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "root spread" ON public.root_casts_pb12678 USING btree (root_spread);


--
-- TOC entry 3046 (class 1259 OID 16522)
-- Name: root type, 1-5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "root type, 1-5" ON public.root_casts_pb12678 USING btree ("root_type_1-5");


--
-- TOC entry 3049 (class 1259 OID 16534)
-- Name: sample number; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "sample number" ON public.root_casts_pb12678 USING btree (sample_number);


--
-- TOC entry 3060 (class 1259 OID 16677)
-- Name: sitebuilding; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sitebuilding ON public.building USING btree (site_idfk);


--
-- TOC entry 3063 (class 1259 OID 16681)
-- Name: siteid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX siteid ON public.site USING btree (site_id);


--
-- TOC entry 3050 (class 1259 OID 16538)
-- Name: soil analysis; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "soil analysis" ON public.root_casts_pb12678 USING btree (soil_analysis);


--
-- TOC entry 3051 (class 1259 OID 16542)
-- Name: video; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX video ON public.root_casts_pb12678 USING btree (video);


--
-- TOC entry 3073 (class 1259 OID 16692)
-- Name: walldrawing; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX walldrawing ON public.drawing USING btree (wall_idfk);


--
-- TOC entry 3082 (class 1259 OID 16694)
-- Name: wallphoto; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX wallphoto ON public.photo USING btree (wall_idfk);


--
-- TOC entry 3149 (class 2606 OID 16745)
-- Name: room_area arearoom area1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room_area
    ADD CONSTRAINT "arearoom area1" FOREIGN KEY (area_idfk) REFERENCES public.area(area_id);


--
-- TOC entry 3143 (class 2606 OID 16919)
-- Name: drawing author_idfk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drawing
    ADD CONSTRAINT author_idfk FOREIGN KEY (author_idfk) REFERENCES public.author(author_id) NOT VALID;


--
-- TOC entry 3159 (class 2606 OID 16979)
-- Name: building_feature building_idfk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.building_feature
    ADD CONSTRAINT building_idfk FOREIGN KEY (building_idfk) REFERENCES public.building(building_id) NOT VALID;


--
-- TOC entry 3139 (class 2606 OID 16753)
-- Name: room buildingroom1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room
    ADD CONSTRAINT buildingroom1 FOREIGN KEY (building_idfk) REFERENCES public.building(building_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3164 (class 2606 OID 17049)
-- Name: document document_type_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.document
    ADD CONSTRAINT document_type_fk FOREIGN KEY (document_type_fkid) REFERENCES public.document_type(document_type_id) NOT VALID;


--
-- TOC entry 3140 (class 2606 OID 16716)
-- Name: drawing drawing formatdrawing1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drawing
    ADD CONSTRAINT "drawing formatdrawing1" FOREIGN KEY (drawing_format_idfk) REFERENCES public.drawing_format(drawing_format_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3141 (class 2606 OID 16752)
-- Name: drawing drawing typedrawing1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drawing
    ADD CONSTRAINT "drawing typedrawing1" FOREIGN KEY ("drawing type_idfk") REFERENCES public."drawing type"("drawing type id") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3160 (class 2606 OID 16984)
-- Name: building_feature feature_idfk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.building_feature
    ADD CONSTRAINT feature_idfk FOREIGN KEY (feature_idfk) REFERENCES public.feature(feature_id) NOT VALID;


--
-- TOC entry 3158 (class 2606 OID 16994)
-- Name: site_feature feature_idfk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_feature
    ADD CONSTRAINT feature_idfk FOREIGN KEY (feature_idfk) REFERENCES public.feature(feature_id) NOT VALID;


--
-- TOC entry 3163 (class 2606 OID 17064)
-- Name: region_features feature_region_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region_features
    ADD CONSTRAINT feature_region_fk FOREIGN KEY (feature_idfk) REFERENCES public.feature(feature_id) NOT VALID;


--
-- TOC entry 3154 (class 2606 OID 16964)
-- Name: paving_type floor_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paving_type
    ADD CONSTRAINT floor_fk FOREIGN KEY (floor_fkid) REFERENCES public.floor(floor_id) NOT VALID;


--
-- TOC entry 3152 (class 2606 OID 16929)
-- Name: garden_artifact garden_artifact; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.garden_artifact
    ADD CONSTRAINT garden_artifact FOREIGN KEY (garden_idfk) REFERENCES public.garden("garden id");


--
-- TOC entry 3166 (class 2606 OID 25293)
-- Name: planting_bed gardenplanting bed1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planting_bed
    ADD CONSTRAINT "gardenplanting bed1" FOREIGN KEY (garden_fkid) REFERENCES public.garden("garden id");


--
-- TOC entry 3151 (class 2606 OID 17034)
-- Name: region geology_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region
    ADD CONSTRAINT geology_fk FOREIGN KEY (geology_fkid) REFERENCES public.geology(geology_id) NOT VALID;


--
-- TOC entry 3146 (class 2606 OID 16714)
-- Name: photo photo typephoto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photo
    ADD CONSTRAINT "photo typephoto" FOREIGN KEY (photo_type_idfk) REFERENCES public.photo_type(photo_type_id);


--
-- TOC entry 3148 (class 2606 OID 16713)
-- Name: planting_bed_artifact planting bed item typeplanting bed item1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planting_bed_artifact
    ADD CONSTRAINT "planting bed item typeplanting bed item1" FOREIGN KEY (planting_bed_artifact_type_fkid) REFERENCES public.planting_bed_artifact_type(planting_bed_artifact_type_id);


--
-- TOC entry 3135 (class 2606 OID 16865)
-- Name: dragonskin_casts planting_bed_artifact; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dragonskin_casts
    ADD CONSTRAINT planting_bed_artifact FOREIGN KEY (planting_bed_artifact_fkid) REFERENCES public.planting_bed_artifact("planting_bed _artifact_id") NOT VALID;


--
-- TOC entry 3136 (class 2606 OID 16875)
-- Name: root_casts_pb12678 planting_bed_artifact; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.root_casts_pb12678
    ADD CONSTRAINT planting_bed_artifact FOREIGN KEY (planting_bed_artifact_fkid) REFERENCES public.planting_bed_artifact("planting_bed _artifact_id") NOT VALID;


--
-- TOC entry 3162 (class 2606 OID 17059)
-- Name: region_features region_feature_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region_features
    ADD CONSTRAINT region_feature_fk FOREIGN KEY (region_fkid) REFERENCES public.region(region_id) NOT VALID;


--
-- TOC entry 3165 (class 2606 OID 17069)
-- Name: document region_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.document
    ADD CONSTRAINT region_fk FOREIGN KEY (region_fkid) REFERENCES public.region(region_id) NOT VALID;


--
-- TOC entry 3138 (class 2606 OID 16899)
-- Name: site region_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site
    ADD CONSTRAINT region_id FOREIGN KEY (region_idfk) REFERENCES public.region(region_id) NOT VALID;


--
-- TOC entry 3153 (class 2606 OID 16959)
-- Name: floor room_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.floor
    ADD CONSTRAINT room_fk FOREIGN KEY (room_fkid) REFERENCES public.room(room_id) NOT VALID;


--
-- TOC entry 3155 (class 2606 OID 16999)
-- Name: artifact room_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artifact
    ADD CONSTRAINT room_fk FOREIGN KEY (room_fkid) REFERENCES public.room(room_id) NOT VALID;


--
-- TOC entry 3161 (class 2606 OID 17019)
-- Name: ceiling room_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ceiling
    ADD CONSTRAINT room_fk FOREIGN KEY (room_fkid) REFERENCES public.room(room_id);


--
-- TOC entry 3144 (class 2606 OID 16785)
-- Name: garden roomgarden; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.garden
    ADD CONSTRAINT roomgarden FOREIGN KEY (room_fkid) REFERENCES public.room(room_id);


--
-- TOC entry 3150 (class 2606 OID 16790)
-- Name: room_area roomroom area1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room_area
    ADD CONSTRAINT "roomroom area1" FOREIGN KEY (room_idfk) REFERENCES public.room(room_id);


--
-- TOC entry 3145 (class 2606 OID 16780)
-- Name: wall roomwall1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wall
    ADD CONSTRAINT roomwall1 FOREIGN KEY (room_idfk) REFERENCES public.room(room_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3156 (class 2606 OID 17004)
-- Name: artifact site_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artifact
    ADD CONSTRAINT site_fk FOREIGN KEY (site_idfk) REFERENCES public.site(site_id) NOT VALID;


--
-- TOC entry 3157 (class 2606 OID 16989)
-- Name: site_feature site_idfk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_feature
    ADD CONSTRAINT site_idfk FOREIGN KEY (site_idfk) REFERENCES public.site(site_id) NOT VALID;


--
-- TOC entry 3137 (class 2606 OID 16715)
-- Name: building sitebuilding1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.building
    ADD CONSTRAINT sitebuilding1 FOREIGN KEY (site_idfk) REFERENCES public.site(site_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3142 (class 2606 OID 16770)
-- Name: drawing walldrawing1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drawing
    ADD CONSTRAINT walldrawing1 FOREIGN KEY (wall_idfk) REFERENCES public.wall(wall_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3147 (class 2606 OID 16750)
-- Name: photo wallphoto1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photo
    ADD CONSTRAINT wallphoto1 FOREIGN KEY (wall_idfk) REFERENCES public.wall(wall_id);


-- Completed on 2023-10-13 14:30:32

--
-- PostgreSQL database dump complete
--

