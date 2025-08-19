--
-- PostgreSQL database dump
--

-- Dumped from database version 17.3 (Ubuntu 17.3-3.pgdg22.04+1)
-- Dumped by pg_dump version 17.3 (Ubuntu 17.3-3.pgdg22.04+1)

-- Started on 2025-02-17 11:57:51 +09

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 224 (class 1259 OID 16485)
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    name text,
    phone text
);


ALTER TABLE public.clients OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16484)
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clients_id_seq OWNER TO postgres;

--
-- TOC entry 3437 (class 0 OID 0)
-- Dependencies: 223
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clients_id_seq OWNED BY public.clients.id;


--
-- TOC entry 218 (class 1259 OID 16450)
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.countries (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    name text,
    visa boolean
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16449)
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.countries_id_seq OWNER TO postgres;

--
-- TOC entry 3438 (class 0 OID 0)
-- Dependencies: 217
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;


--
-- TOC entry 220 (class 1259 OID 16460)
-- Name: hotels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hotels (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    name text,
    country_id bigint
);


ALTER TABLE public.hotels OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16459)
-- Name: hotels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hotels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.hotels_id_seq OWNER TO postgres;

--
-- TOC entry 3439 (class 0 OID 0)
-- Dependencies: 219
-- Name: hotels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hotels_id_seq OWNED BY public.hotels.id;


--
-- TOC entry 222 (class 1259 OID 16475)
-- Name: services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    name text,
    price bigint
);


ALTER TABLE public.services OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16474)
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.services_id_seq OWNER TO postgres;

--
-- TOC entry 3440 (class 0 OID 0)
-- Dependencies: 221
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.services_id_seq OWNED BY public.services.id;


--
-- TOC entry 228 (class 1259 OID 16527)
-- Name: tour_hotels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tour_hotels (
    tour_id bigint NOT NULL,
    hotel_id bigint NOT NULL
);


ALTER TABLE public.tour_hotels OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16512)
-- Name: tour_services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tour_services (
    tour_id bigint NOT NULL,
    service_id bigint NOT NULL
);


ALTER TABLE public.tour_services OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16495)
-- Name: tours; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tours (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    client_id bigint,
    country_id bigint,
    departure_time timestamp with time zone,
    arrival_time timestamp with time zone
);


ALTER TABLE public.tours OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16494)
-- Name: tours_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tours_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tours_id_seq OWNER TO postgres;

--
-- TOC entry 3441 (class 0 OID 0)
-- Dependencies: 225
-- Name: tours_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tours_id_seq OWNED BY public.tours.id;


--
-- TOC entry 3258 (class 2604 OID 16488)
-- Name: clients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients ALTER COLUMN id SET DEFAULT nextval('public.clients_id_seq'::regclass);


--
-- TOC entry 3255 (class 2604 OID 16453)
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- TOC entry 3256 (class 2604 OID 16463)
-- Name: hotels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotels ALTER COLUMN id SET DEFAULT nextval('public.hotels_id_seq'::regclass);


--
-- TOC entry 3257 (class 2604 OID 16478)
-- Name: services id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services ALTER COLUMN id SET DEFAULT nextval('public.services_id_seq'::regclass);


--
-- TOC entry 3259 (class 2604 OID 16498)
-- Name: tours id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tours ALTER COLUMN id SET DEFAULT nextval('public.tours_id_seq'::regclass);


--
-- TOC entry 3270 (class 2606 OID 16492)
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- TOC entry 3261 (class 2606 OID 16457)
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- TOC entry 3264 (class 2606 OID 16467)
-- Name: hotels hotels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_pkey PRIMARY KEY (id);


--
-- TOC entry 3268 (class 2606 OID 16482)
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- TOC entry 3278 (class 2606 OID 16531)
-- Name: tour_hotels tour_hotels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tour_hotels
    ADD CONSTRAINT tour_hotels_pkey PRIMARY KEY (tour_id, hotel_id);


--
-- TOC entry 3276 (class 2606 OID 16516)
-- Name: tour_services tour_services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tour_services
    ADD CONSTRAINT tour_services_pkey PRIMARY KEY (tour_id, service_id);


--
-- TOC entry 3274 (class 2606 OID 16500)
-- Name: tours tours_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tours
    ADD CONSTRAINT tours_pkey PRIMARY KEY (id);


--
-- TOC entry 3271 (class 1259 OID 16493)
-- Name: idx_clients_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_clients_deleted_at ON public.clients USING btree (deleted_at);


--
-- TOC entry 3262 (class 1259 OID 16458)
-- Name: idx_countries_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_countries_deleted_at ON public.countries USING btree (deleted_at);


--
-- TOC entry 3265 (class 1259 OID 16473)
-- Name: idx_hotels_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_hotels_deleted_at ON public.hotels USING btree (deleted_at);


--
-- TOC entry 3266 (class 1259 OID 16483)
-- Name: idx_services_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_services_deleted_at ON public.services USING btree (deleted_at);


--
-- TOC entry 3272 (class 1259 OID 16511)
-- Name: idx_tours_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_tours_deleted_at ON public.tours USING btree (deleted_at);


--
-- TOC entry 3279 (class 2606 OID 16468)
-- Name: hotels fk_hotels_country; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT fk_hotels_country FOREIGN KEY (country_id) REFERENCES public.countries(id);


--
-- TOC entry 3284 (class 2606 OID 16537)
-- Name: tour_hotels fk_tour_hotels_hotel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tour_hotels
    ADD CONSTRAINT fk_tour_hotels_hotel FOREIGN KEY (hotel_id) REFERENCES public.hotels(id);


--
-- TOC entry 3285 (class 2606 OID 16532)
-- Name: tour_hotels fk_tour_hotels_tour; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tour_hotels
    ADD CONSTRAINT fk_tour_hotels_tour FOREIGN KEY (tour_id) REFERENCES public.tours(id);


--
-- TOC entry 3282 (class 2606 OID 16522)
-- Name: tour_services fk_tour_services_service; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tour_services
    ADD CONSTRAINT fk_tour_services_service FOREIGN KEY (service_id) REFERENCES public.services(id);


--
-- TOC entry 3283 (class 2606 OID 16517)
-- Name: tour_services fk_tour_services_tour; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tour_services
    ADD CONSTRAINT fk_tour_services_tour FOREIGN KEY (tour_id) REFERENCES public.tours(id);


--
-- TOC entry 3280 (class 2606 OID 16501)
-- Name: tours fk_tours_client; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tours
    ADD CONSTRAINT fk_tours_client FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- TOC entry 3281 (class 2606 OID 16506)
-- Name: tours fk_tours_country; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tours
    ADD CONSTRAINT fk_tours_country FOREIGN KEY (country_id) REFERENCES public.countries(id);


--
-- TOC entry 3436 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2025-02-17 11:57:51 +09

--
-- PostgreSQL database dump complete
--

