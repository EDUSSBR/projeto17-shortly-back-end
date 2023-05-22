--
-- PostgreSQL database dump
--

-- Dumped from database version 12.14 (Ubuntu 12.14-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.14 (Ubuntu 12.14-0ubuntu0.20.04.1)

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
-- Name: accounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.accounts (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    password text,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.accounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.accounts_id_seq OWNED BY public.accounts.id;


--
-- Name: accounts_links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.accounts_links (
    id integer NOT NULL,
    "accountID" integer NOT NULL,
    "linkID" integer NOT NULL
);


--
-- Name: accounts_links_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.accounts_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: accounts_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.accounts_links_id_seq OWNED BY public.accounts_links.id;


--
-- Name: links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.links (
    id integer NOT NULL,
    url text NOT NULL,
    "shortUrl" character(21) NOT NULL,
    "visitCount" integer DEFAULT 0,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: links_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.links_id_seq OWNED BY public.links.id;


--
-- Name: tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tokens (
    id integer NOT NULL,
    "accountID" integer,
    token text,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tokens_id_seq OWNED BY public.tokens.id;


--
-- Name: accounts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accounts ALTER COLUMN id SET DEFAULT nextval('public.accounts_id_seq'::regclass);


--
-- Name: accounts_links id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accounts_links ALTER COLUMN id SET DEFAULT nextval('public.accounts_links_id_seq'::regclass);


--
-- Name: links id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links ALTER COLUMN id SET DEFAULT nextval('public.links_id_seq'::regclass);


--
-- Name: tokens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tokens ALTER COLUMN id SET DEFAULT nextval('public.tokens_id_seq'::regclass);


--
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.accounts VALUES (1, 'João', 'joa1o222@driven.com.br', '$2b$10$zabXAUXhSxkLe8vVxtKvbOVk85KONlflg.xAP1SapvFD3i8Qhw7RK', '2023-05-17 14:50:56.831823');
INSERT INTO public.accounts VALUES (2, 'João', 'joao@driven.com.br', '$2b$10$klNY.Oh51TnferCVTVGACuxIa7knQgnqtfaHS62aEHYt/5pVP4Kmm', '2023-05-17 14:53:35.246772');
INSERT INTO public.accounts VALUES (3, 'João', 'joao1@driven.com.br', '$2b$10$AQHHfSJ6Bv2dzkho8ABUleM71Bsp8Zba27CNz0Zu6dGKwkpbcvwSu', '2023-05-17 14:58:15.877144');
INSERT INTO public.accounts VALUES (4, 'Eduardo', 'edu@driven.com.br', '$2b$10$5.pWqpm/J0/VLsgv9/.LGeuRBqM6KLRFNIFUdGewiQndHL9zn.pNq', '2023-05-18 12:18:41.587865');
INSERT INTO public.accounts VALUES (5, 'Bruna', 'bru@bru.com.br', '$2b$10$3IYzV1tVyCuj7pNo8TRcq.XI4J95G87GD9Hg2ATH7ZtRQyZ/JyvZ6', '2023-05-20 10:33:16.929143');
INSERT INTO public.accounts VALUES (6, 'Bruna', 'bru@bru.com', '$2b$10$62KRWrFfDZdUINRZzanj4OcU06HObe.q72fTy25AussrzW1Cf2adG', '2023-05-20 10:37:30.125981');
INSERT INTO public.accounts VALUES (7, 'Diego', 'di@di.co', '$2b$10$UrpuO6oAD2fO9DW4oLXNGeTQS8DUZZQFFNgtLvtPin5a0GQoWJC62', '2023-05-20 10:37:51.223787');
INSERT INTO public.accounts VALUES (8, 'Rodrigo', 'ro@ro.com', '$2b$10$zrCgjzm0jzbwhnhJqnMlhup/BoGFkzNtPVa2C4Qluq2n2zf3tgVhe', '2023-05-20 11:25:17.842384');
INSERT INTO public.accounts VALUES (9, 'Rogerio', 'rog@ro.com', '$2b$10$TSwZExs62zon7ienOQ3OoO.q2SX1StPoX.Yct.Lv6lGKGdIQFe8Eu', '2023-05-20 11:27:02.835658');
INSERT INTO public.accounts VALUES (10, 'Ricardo', 'ri@ri.com', '$2b$10$ON2V1FLYMEvpErSZyaXA1e/yarQhbcySzcELqS1MxxKbhjKkoKOtS', '2023-05-20 11:35:25.941999');
INSERT INTO public.accounts VALUES (11, 'Gi Cavalleri', 'gi@gigi.com', '$2b$10$ACeJAK.zXrAUA9EmH7o1U.MArbkMZ8Tu9KqUaW/Ya4eKGiJwXAz0u', '2023-05-20 11:45:48.239379');
INSERT INTO public.accounts VALUES (12, 'asdasd', 'asdas@gmail.com', '$2b$10$IJya74N3rjwaA4hClLwJ8.e6B/TVbZrnM9F41knxs4kGy2EXUR/He', '2023-05-20 11:46:22.365868');
INSERT INTO public.accounts VALUES (13, 'Yooooo', 'yoyo@yo.com', '$2b$10$B.vlBgUVqLD9qnhLZcP9v.jlsjIYUQCLn3KemsaahL1AGCVz1yN9K', '2023-05-20 11:52:09.683285');
INSERT INTO public.accounts VALUES (14, 'Lolo', 'lo@lo.com', '$2b$10$7N8Kv/gpcI8EQhMofpScpepoLjZjHG6vZbtZmNBqGbAh2IYOR1lqC', '2023-05-20 14:35:46.702864');
INSERT INTO public.accounts VALUES (15, 'Juliano', 'ju@ju.com', '$2b$10$YuCoz341VSD2AF6dZh5tquVRlyPAGdMPG9zJWYSwTwvIFY/jnq2Jm', '2023-05-20 14:37:41.711196');
INSERT INTO public.accounts VALUES (16, 'hasudhausdh', 'haha@haha.com', '$2b$10$JOUtfA/pDupBToKM6nY04Ol0LpH4KZySfQQnGpQ6qZJ5L2JgEKStK', '2023-05-20 14:39:35.321456');
INSERT INTO public.accounts VALUES (17, 'Koko', 'koko@koko.com', '$2b$10$jOrUiESvii6QsCyecgFvC.L5T/O7lCtizM/2jauppg8r3sjxKLU5K', '2023-05-20 14:40:14.577396');
INSERT INTO public.accounts VALUES (18, 'hihi', 'hi@hi.com', '$2b$10$9dT4eiA/b9oWWi3xuvPUneElHF.MwjadFoOgIBZG1EXONZUO3ZuL2', '2023-05-20 14:40:47.042409');
INSERT INTO public.accounts VALUES (19, 'yuyu', 'yu@yu.com', '$2b$10$eF4a9vNG6llbMzrbfvLt/uvUlpwXCHafRQ1Z5.9Va7CUovjsJWmEe', '2023-05-20 14:41:21.286239');
INSERT INTO public.accounts VALUES (20, 'ioio', 'io@io.com', '$2b$10$fkFLSlrkCO41uXDX0no7de0xTNKgN6V77tttXhRBAbMAsDqejsdKi', '2023-05-20 14:42:04.910172');
INSERT INTO public.accounts VALUES (21, 'Jiovan', 'ji1@ji.com', '$2b$10$NgMGIDe8hUqOjrFOGfW.b.ie3ay2u6jIF4LFJd3JT44o.KALAPDey', '2023-05-20 14:59:41.09594');
INSERT INTO public.accounts VALUES (22, 'asdasdasd', 'bls.dudu@gmail.com', '$2b$10$ADW8nd2DFrTDijcQugvrx.n3Oe81fuDNL/JGcK1nXSKqdBr7euQG2', '2023-05-20 15:01:53.75998');
INSERT INTO public.accounts VALUES (23, 'sdasdasd', 'bls.dudu1@gmail.com', '$2b$10$1X7GNU9fZx1LcWJ6b9F7Ae80jHX/z7nnX.ERyO/ulCKn5KH9OuH92', '2023-05-20 15:02:22.265914');
INSERT INTO public.accounts VALUES (24, 'asdasdasd', 'bls.dudu11@gmail.com', '$2b$10$465uOdywznJ4SzHOyTbaSuWm1AnHS5k6eOd/HwQR27TLoW9ohwo4W', '2023-05-20 15:02:38.117378');
INSERT INTO public.accounts VALUES (25, 'wweerwer', 'bls.dudu111@gmail.com', '$2b$10$RUzubzytllVswfw1GE.mPO27TGLR2XX2qShlz97M6jHgd9ZyiT2J.', '2023-05-20 15:05:23.496677');
INSERT INTO public.accounts VALUES (26, 'Eduardo', 'edu@edu.com', '$2b$10$ISMOFWsQseTntyn70VbE..6T5vmuIN.sgZ20eakOD1B0suWzz4FJC', '2023-05-20 16:08:50.107025');
INSERT INTO public.accounts VALUES (27, 'Oiiiiii', 'oi@oi.com', '$2b$10$ZrLfPXoUZ8j9Jv1hR5P81ua0thVHHiZfZ0ITC9mFojpqt8SOlaarm', '2023-05-20 18:57:59.013489');
INSERT INTO public.accounts VALUES (28, 'Jonas', 'jonas@jonas.com', '$2b$10$UWyKnbDbl.IS1pm/gL7usuwzBXG8P8KbQrtWH5J3g3ZRYdH7XHU8e', '2023-05-21 08:55:55.186501');


--
-- Data for Name: accounts_links; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.accounts_links VALUES (3, 2, 3);
INSERT INTO public.accounts_links VALUES (4, 2, 4);
INSERT INTO public.accounts_links VALUES (5, 2, 5);
INSERT INTO public.accounts_links VALUES (6, 2, 6);
INSERT INTO public.accounts_links VALUES (7, 2, 7);
INSERT INTO public.accounts_links VALUES (8, 2, 8);
INSERT INTO public.accounts_links VALUES (9, 2, 9);
INSERT INTO public.accounts_links VALUES (10, 2, 10);
INSERT INTO public.accounts_links VALUES (11, 2, 11);
INSERT INTO public.accounts_links VALUES (12, 2, 12);
INSERT INTO public.accounts_links VALUES (13, 2, 13);
INSERT INTO public.accounts_links VALUES (14, 2, 14);
INSERT INTO public.accounts_links VALUES (15, 2, 15);
INSERT INTO public.accounts_links VALUES (16, 4, 16);
INSERT INTO public.accounts_links VALUES (17, 4, 17);
INSERT INTO public.accounts_links VALUES (18, 4, 18);
INSERT INTO public.accounts_links VALUES (33, 27, 33);
INSERT INTO public.accounts_links VALUES (34, 27, 34);
INSERT INTO public.accounts_links VALUES (35, 27, 35);
INSERT INTO public.accounts_links VALUES (36, 27, 36);
INSERT INTO public.accounts_links VALUES (42, 6, 42);


--
-- Data for Name: links; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.links VALUES (4, 'https://www.google.com', 'u_03T6rXtObSWQa9eCW4a', 1, '2023-05-18 09:13:50.070672');
INSERT INTO public.links VALUES (5, 'https://www.google.com', 'XZxfvO_wBlHQMA0XZi_tb', 1, '2023-05-18 09:14:27.677928');
INSERT INTO public.links VALUES (6, 'https://www.google.com', 'yXNqaFHsyAFqz20EevZgH', 1, '2023-05-18 09:14:52.414968');
INSERT INTO public.links VALUES (7, 'https://www.google.com', 'UrajRD7ZsECtwNkKmumcf', 1, '2023-05-18 09:17:07.963624');
INSERT INTO public.links VALUES (8, 'https://www.google.com', 'Vgfe-ciVO-FacypU2Dcv1', 1, '2023-05-18 09:18:16.805414');
INSERT INTO public.links VALUES (9, 'https://www.google.com', 'NXWAU2yEfaTDUyIEfd9op', 1, '2023-05-18 09:18:57.818018');
INSERT INTO public.links VALUES (10, 'https://www.google.com', 'skpd0xC2GpYPYXrfHVN_M', 1, '2023-05-18 09:19:44.624677');
INSERT INTO public.links VALUES (11, 'https://www.google.com', 'KUpMXLxRetb44xgUj6Bek', 1, '2023-05-18 09:19:48.324916');
INSERT INTO public.links VALUES (12, 'https://www.google.com', 'lN70jKopFCwxQuOsP2BDS', 1, '2023-05-18 09:20:16.556491');
INSERT INTO public.links VALUES (13, 'https://www.google.com', 'X9xjEBEw3zkpKlNldBwmL', 1, '2023-05-18 09:20:20.183765');
INSERT INTO public.links VALUES (14, 'https://www.google.com', '7daGrcnupjoKeWRxdDE38', 1, '2023-05-18 09:27:47.096028');
INSERT INTO public.links VALUES (15, 'https://www.google.com', 'j-4SYfNMHFyr8zDzKjqUB', 1, '2023-05-18 09:34:45.030408');
INSERT INTO public.links VALUES (42, 'www.cade.com.br', 'aU9u7ALUJs5ReoBVkABBi', 52, '2023-05-22 08:06:13.301171');
INSERT INTO public.links VALUES (16, 'https://www.google.com', 'eq-WibrcC764_Gh9uZ3_W', 4, '2023-05-18 12:19:02.389197');
INSERT INTO public.links VALUES (17, 'https://www.google.com', 'jmKdsRluq4I0413W9O0CD', 0, '2023-05-18 12:19:06.459176');
INSERT INTO public.links VALUES (18, 'https://www.google.com', 'LzjsVbM5g8gnepdQuVy1f', 100000000, '2023-05-18 12:19:06.68627');
INSERT INTO public.links VALUES (3, 'https://www.google.com', 'Wsw9ltfghtZi8SuuVnxoU', 31, '2023-05-18 09:13:40.498755');
INSERT INTO public.links VALUES (32, 'https://www.google.com', 'Pk0GPT6DEoiV7fSGBNKMQ', 0, '2023-05-20 19:34:40.049045');
INSERT INTO public.links VALUES (34, 'https://www.google.com', 'RWjuELEePeDnjVe8z3DZk', 0, '2023-05-20 19:34:40.365582');
INSERT INTO public.links VALUES (35, 'https://www.google.com', 'xl1zqX-Ypw3ln3lZn1hJU', 0, '2023-05-20 19:34:53.702937');
INSERT INTO public.links VALUES (36, 'www.google.com', 'E8hAHU9Q6IWHYDYRc7RB0', 0, '2023-05-21 15:21:13.127662');
INSERT INTO public.links VALUES (41, 'www.luadecristal.com', '0o8X8A-LZA_OQtpQi6hZv', 0, '2023-05-21 15:41:42.471057');
INSERT INTO public.links VALUES (33, 'https://www.google.com', 'VWj8JH02Mlw37JwQsISjl', 2, '2023-05-20 19:34:40.189633');


--
-- Data for Name: tokens; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tokens VALUES (19, 2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNjg0MzQ5OTYyLCJleHAiOjE2ODQ0MzYzNjJ9.FfF-54wKNGRnr6XR3ywLvwQy5nkLBecmh-CkZwldlHA', '2023-05-17 15:59:22.320196');
INSERT INTO public.tokens VALUES (20, 2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNjg0MzUwMDU1LCJleHAiOjE2ODQ0MzY0NTV9.I4nnLZ_txD6riQdG0vX5lCmScZOXxAk-kWgLhWiAETg', '2023-05-17 16:00:55.733309');
INSERT INTO public.tokens VALUES (21, 2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNjg0MzUwMTIxLCJleHAiOjE2ODQ0MzY1MjF9.D5gh98UMJglZGyDF_mP5DdDzqbI-Z3OAUuUunvZ1XGg', '2023-05-17 16:02:01.615208');
INSERT INTO public.tokens VALUES (22, 2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNjg0MzUwNzI3LCJleHAiOjE2ODQ0MzcxMjd9.NNKnroLGoyKcJwopOk3oBm-w2PBOmuq21qxksF8zOos', '2023-05-17 16:12:07.793396');
INSERT INTO public.tokens VALUES (23, 2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNjg0MzUxNzM4LCJleHAiOjE2ODQ0MzgxMzh9.4AubMVkuQdnTr6yyU31b1VCztKmVTq9jaMJHfHOsUp8', '2023-05-17 16:28:58.704908');
INSERT INTO public.tokens VALUES (24, 2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNjg0NDA3ODc4LCJleHAiOjE2ODQ0OTQyNzh9.n4tj48ptt_MAt6VVlYb-vXZkrreySptt5qOv1IBSK7g', '2023-05-18 08:04:38.299534');
INSERT INTO public.tokens VALUES (25, 2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNjg0NDA4NTg2LCJleHAiOjE2ODQ0OTQ5ODZ9.qzXcY4jP4Y1siT4ZB-LozSn7cXK6IWPMFgq2tLYru2s', '2023-05-18 08:16:26.895508');
INSERT INTO public.tokens VALUES (26, 2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNjg0NDE1MTgzLCJleHAiOjE2ODQ1MDE1ODN9.H6TxKXjXb9i4JDuN_e8B4OwfYJ9-9RmmyOhXeCo4DF4', '2023-05-18 10:06:23.386749');
INSERT INTO public.tokens VALUES (27, 3, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywiaWF0IjoxNjg0NDE1MTg2LCJleHAiOjE2ODQ1MDE1ODZ9.AMDRUHPLvANd4q5VWvO6f8M_pZsdpA_rS5GhYKpYuB4', '2023-05-18 10:06:26.501829');
INSERT INTO public.tokens VALUES (28, 4, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiaWF0IjoxNjg0NDIzMTI4LCJleHAiOjE2ODQ1MDk1Mjh9.4EvMtyoTnUv9fcKRniwKvf-Tbq3N9Sd3be9vij8dp58', '2023-05-18 12:18:48.3429');
INSERT INTO public.tokens VALUES (29, 26, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjYsImlhdCI6MTY4NDYwOTc0MywiZXhwIjoxNjg0Njk2MTQzfQ.2GJFQLv9CUqdwdmjJvnLSJ3jgZ7LoSZPg-GKLTST27E', '2023-05-20 16:09:03.102038');
INSERT INTO public.tokens VALUES (30, 26, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjYsImlhdCI6MTY4NDYwOTgwOSwiZXhwIjoxNjg0Njk2MjA5fQ.C8UuZO56BrCTUFJ2n5i6fDklQwaWxS-_vSbDS6WyR_8', '2023-05-20 16:10:09.298892');
INSERT INTO public.tokens VALUES (31, 26, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjYsImlhdCI6MTY4NDYwOTgyNSwiZXhwIjoxNjg0Njk2MjI1fQ.mnp3kNfpXC1xpFLD3GXe9s2k6B9485Awqmd3-6YGMVI', '2023-05-20 16:10:25.99216');
INSERT INTO public.tokens VALUES (32, 26, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjYsImlhdCI6MTY4NDYxMDI4NCwiZXhwIjoxNjg0Njk2Njg0fQ.2GtaTu2DPapGRU8GC18r_cCSvivcLxilp67PagvpSro', '2023-05-20 16:18:04.243256');
INSERT INTO public.tokens VALUES (33, 27, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsImlhdCI6MTY4NDYxOTg5MSwiZXhwIjoxNjg0NzA2MjkxfQ.fz5O9UVVoi-ATiS_TQAkxBe-7k-VrXteYEbhmqvyK5E', '2023-05-20 18:58:11.031365');
INSERT INTO public.tokens VALUES (34, 27, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsImlhdCI6MTY4NDYyMDY2OCwiZXhwIjoxNjg0NzA3MDY4fQ.LsP1gifiyz2N3D09ftQwqbBoVHjxRc8ktTqEJOuxzXs', '2023-05-20 19:11:08.264825');
INSERT INTO public.tokens VALUES (35, 4, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiaWF0IjoxNjg0NjIyMDQwLCJleHAiOjE2ODQ3MDg0NDB9.Qcr06SQGQgwKvIvMkhI2WoI9ASPHDTxfWDen67NLuQs', '2023-05-20 19:34:00.900069');
INSERT INTO public.tokens VALUES (36, 27, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsImlhdCI6MTY4NDYyMjA2MCwiZXhwIjoxNjg0NzA4NDYwfQ.BdRy9Zn6hoQ-e9wDwDp1Lba6YZUerMo9iwZSKczlA5M', '2023-05-20 19:34:20.382343');
INSERT INTO public.tokens VALUES (37, 27, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsImlhdCI6MTY4NDY2ODQ5OSwiZXhwIjoxNjg0NzU0ODk5fQ.mtwc9u0OUDPIrwv9JeYtJ_5pALSM75XNXZOh5SpLkOw', '2023-05-21 08:28:19.292799');
INSERT INTO public.tokens VALUES (38, 27, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsImlhdCI6MTY4NDY2ODk5OCwiZXhwIjoxNjg0NzU1Mzk4fQ.OkyjsLyqBM4YjlN-zK1C0eLSCN4dfNENKnCQYp9ztdY', '2023-05-21 08:36:38.547002');
INSERT INTO public.tokens VALUES (39, 27, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsImlhdCI6MTY4NDY2OTU0NywiZXhwIjoxNjg0NzU1OTQ3fQ.f1ANTZFir9ZsUkbVoEoJl8Xxmfyh6YUEYWqFU5L0DMs', '2023-05-21 08:45:47.105553');
INSERT INTO public.tokens VALUES (40, 28, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsImlhdCI6MTY4NDY3MDE2NSwiZXhwIjoxNjg0NzU2NTY1fQ.CE9d2z6tuaHW21IRdqjTORjzTDpz0_tmYcFDmHmPQ1U', '2023-05-21 08:56:05.118163');
INSERT INTO public.tokens VALUES (41, 28, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsImlhdCI6MTY4NDY3MDMwNiwiZXhwIjoxNjg0NzU2NzA2fQ.YUQg08EI04NhHoNh2b_26MiealnQx_o_o6RJgMQhWno', '2023-05-21 08:58:26.314048');
INSERT INTO public.tokens VALUES (42, 27, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsImlhdCI6MTY4NDY3MDM5NCwiZXhwIjoxNjg0NzU2Nzk0fQ.WWQWQnwQp2ZpXgqUnDg0ufLGGIlNYgZtPA4Sm4n1R04', '2023-05-21 08:59:54.453614');
INSERT INTO public.tokens VALUES (43, 28, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsImlhdCI6MTY4NDY3MDQwNCwiZXhwIjoxNjg0NzU2ODA0fQ.8ovSIJg5mFr4SUGm1gs1FAKoaeWHwcgvdjufsi7laQU', '2023-05-21 09:00:04.151665');
INSERT INTO public.tokens VALUES (44, 28, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsImlhdCI6MTY4NDY3MTUxOCwiZXhwIjoxNjg0NzU3OTE4fQ.kr49pQ6cUbSUntEVxaA9Z1-4MdfIr5mu2zWouA8el4s', '2023-05-21 09:18:38.958461');
INSERT INTO public.tokens VALUES (45, 28, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsImlhdCI6MTY4NDY3MTU0OSwiZXhwIjoxNjg0NzU3OTQ5fQ.ueKmVaub_IZXBLU3FMz4FUdfPJC7me66oCCRbWbpo34', '2023-05-21 09:19:09.049511');
INSERT INTO public.tokens VALUES (46, 28, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsImlhdCI6MTY4NDY3MTkwNywiZXhwIjoxNjg0NzU4MzA3fQ.QGOw45bX37yeMVKGnb08BQysd7N3OPLbuGZjfsbfZrg', '2023-05-21 09:25:07.375254');
INSERT INTO public.tokens VALUES (47, 28, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsImlhdCI6MTY4NDY3MTk5MSwiZXhwIjoxNjg0NzU4MzkxfQ.3drI54y7TY_G5A4kbmz02lzHkDYXZvhxJY5IVixfVnY', '2023-05-21 09:26:31.856723');
INSERT INTO public.tokens VALUES (48, 28, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsImlhdCI6MTY4NDY3MjA3NSwiZXhwIjoxNjg0NzU4NDc1fQ.vzBn2ZW5ZBnP9C5QVe0B3LSuuX1Be7PLHCVF617gAuI', '2023-05-21 09:27:55.98242');
INSERT INTO public.tokens VALUES (49, 27, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsImlhdCI6MTY4NDY4NjI3MSwiZXhwIjoxNjg0NzcyNjcxfQ.Jf1SNdELwAeltGWJi3IlDuRbQq19ShslOnxqbI9gu0w', '2023-05-21 13:24:31.151187');
INSERT INTO public.tokens VALUES (50, 27, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsImlhdCI6MTY4NDY4NjMzMSwiZXhwIjoxNjg0NzcyNzMxfQ._rGU87fsFsIV7JFlNolNPRz2kDnMEHgSM1YLRh9DZQQ', '2023-05-21 13:25:31.161635');
INSERT INTO public.tokens VALUES (51, 27, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsImlhdCI6MTY4NDY4ODIyMiwiZXhwIjoxNjg0Nzc0NjIyfQ.rGMzjb0SrZFMSJ8S-_JJOme7HQ--WNJjvHLkqm98q7c', '2023-05-21 13:57:02.168047');
INSERT INTO public.tokens VALUES (52, 27, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsImlhdCI6MTY4NDY4ODI3NSwiZXhwIjoxNjg0Nzc0Njc1fQ.aDi7J_jaTPK-DRVJBnu1ehAGMus-yjjE5Fy-RRrXxVU', '2023-05-21 13:57:55.887773');
INSERT INTO public.tokens VALUES (53, 27, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsImlhdCI6MTY4NDY5MTk3MSwiZXhwIjoxNjg0Nzc4MzcxfQ.RFT1x6rz6fkSV8c0hv6XZTAj400AeIz8azGjioANrro', '2023-05-21 14:59:31.058512');
INSERT INTO public.tokens VALUES (54, 27, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsImlhdCI6MTY4NDY5NDA1NywiZXhwIjoxNjg0NzgwNDU3fQ.qccEOAlOKNUFFq8VPFmH9RyL6Ng5OUQeb_QonLk2ztw', '2023-05-21 15:34:17.731432');
INSERT INTO public.tokens VALUES (55, 27, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsImlhdCI6MTY4NDY5NDE0NSwiZXhwIjoxNjg0NzgwNTQ1fQ.NvW0oNeb95mYOP1S8wAg8GGTxQrvuAw9aVq-3aa8GoY', '2023-05-21 15:35:45.306647');
INSERT INTO public.tokens VALUES (56, 27, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsImlhdCI6MTY4NDY5NDIwMywiZXhwIjoxNjg0NzgwNjAzfQ.VFQ57UdCKLJDvaVNJYDIoesfhIKwh-vEHc4pNtbE3As', '2023-05-21 15:36:43.382513');
INSERT INTO public.tokens VALUES (57, 27, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsImlhdCI6MTY4NDY5NDI5NSwiZXhwIjoxNjg0NzgwNjk1fQ.BvFXR36G94SJMqNG4dV1sHbzN6mHge0Q-f_tvLOYEOE', '2023-05-21 15:38:15.495823');
INSERT INTO public.tokens VALUES (58, 27, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsImlhdCI6MTY4NDY5NDQ3NCwiZXhwIjoxNjg0NzgwODc0fQ.hROB10skes_kUSx3q-g4VdZM9mR45ZuAtwj5pTPFNf8', '2023-05-21 15:41:14.948056');
INSERT INTO public.tokens VALUES (59, 27, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsImlhdCI6MTY4NDcwMzU3OSwiZXhwIjoxNjg0Nzg5OTc5fQ.IN6lhO6dUxcBUZcyBc6JO5ineGInU4Rv8C4fT9Rsdrc', '2023-05-21 18:12:59.538092');
INSERT INTO public.tokens VALUES (60, 27, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsImlhdCI6MTY4NDcwNDM0OSwiZXhwIjoxNjg0NzkwNzQ5fQ.XGQd-eaoGmbCTC_xDU5R3IqF4J6RC55xWEhBvkB0tvI', '2023-05-21 18:25:49.724691');
INSERT INTO public.tokens VALUES (61, 6, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiaWF0IjoxNjg0NzUzNTYyLCJleHAiOjE2ODQ4Mzk5NjJ9.L8w7d7sltQR0kq7WVBFQC5stLoAwNVDr09S76oyvKnw', '2023-05-22 08:06:02.688576');
INSERT INTO public.tokens VALUES (62, 4, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiaWF0IjoxNjg0NzU1NTE3LCJleHAiOjE2ODQ4NDE5MTd9.yh-cvtHqBNd3RiiyL6XikInuxcckDyYNUgh_CH6_pIQ', '2023-05-22 08:38:37.381704');
INSERT INTO public.tokens VALUES (63, 4, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiaWF0IjoxNjg0NzU1NTU1LCJleHAiOjE2ODQ4NDE5NTV9.HBlB-W7rNSzzfy1coDkh8nyt0i9eBHwBQi1YsNd69b8', '2023-05-22 08:39:15.194907');


--
-- Name: accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.accounts_id_seq', 28, true);


--
-- Name: accounts_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.accounts_links_id_seq', 42, true);


--
-- Name: links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.links_id_seq', 42, true);


--
-- Name: tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tokens_id_seq', 63, true);


--
-- Name: accounts accounts_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_email_key UNIQUE (email);


--
-- Name: accounts_links accounts_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accounts_links
    ADD CONSTRAINT accounts_links_pkey PRIMARY KEY (id);


--
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- Name: links links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT links_pkey PRIMARY KEY (id);


--
-- Name: tokens tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id);


--
-- Name: accounts_links accounts_links_accountID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accounts_links
    ADD CONSTRAINT "accounts_links_accountID_fkey" FOREIGN KEY ("accountID") REFERENCES public.accounts(id);


--
-- Name: accounts_links accounts_links_linkID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accounts_links
    ADD CONSTRAINT "accounts_links_linkID_fkey" FOREIGN KEY ("linkID") REFERENCES public.links(id);


--
-- PostgreSQL database dump complete
--

