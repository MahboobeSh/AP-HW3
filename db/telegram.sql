--
-- PostgreSQL database dump
--

-- Dumped from database version 10.7 (Ubuntu 10.7-0ubuntu0.18.10.1)
-- Dumped by pg_dump version 10.7 (Ubuntu 10.7-0ubuntu0.18.10.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
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


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: blockuser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.blockuser (
    blocker_user_id integer NOT NULL,
    blocked_user_id integer NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.blockuser OWNER TO postgres;

--
-- Name: channel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.channel (
    id integer NOT NULL,
    telegram_id character varying NOT NULL,
    title character varying NOT NULL,
    info character varying,
    creator_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.channel OWNER TO postgres;

--
-- Name: channel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.channel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.channel_id_seq OWNER TO postgres;

--
-- Name: channel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.channel_id_seq OWNED BY public.channel.id;


--
-- Name: channelmembership; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.channelmembership (
    user_id integer NOT NULL,
    channel_id integer NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.channelmembership OWNER TO postgres;

--
-- Name: channelmessage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.channelmessage (
    id integer NOT NULL,
    channel_id integer NOT NULL,
    message_type character varying NOT NULL,
    message_text text NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    CONSTRAINT channelmessage_message_type_check CHECK (((message_type)::text = ANY ((ARRAY['text'::character varying, 'photo'::character varying, 'voice'::character varying, 'video'::character varying])::text[])))
);


ALTER TABLE public.channelmessage OWNER TO postgres;

--
-- Name: channelmessage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.channelmessage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.channelmessage_id_seq OWNER TO postgres;

--
-- Name: channelmessage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.channelmessage_id_seq OWNED BY public.channelmessage.id;


--
-- Name: channelmessageattachment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.channelmessageattachment (
    message_id integer NOT NULL,
    attachment_url character varying NOT NULL,
    attachment_thumb_url character varying NOT NULL
);


ALTER TABLE public.channelmessageattachment OWNER TO postgres;

--
-- Name: groupmembership; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groupmembership (
    user_id integer NOT NULL,
    group_id integer NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.groupmembership OWNER TO postgres;

--
-- Name: groupmessage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groupmessage (
    id integer NOT NULL,
    group_id integer NOT NULL,
    sender_id integer NOT NULL,
    message_type character varying NOT NULL,
    message_text text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    CONSTRAINT groupmessage_message_type_check CHECK (((message_type)::text = ANY ((ARRAY['text'::character varying, 'photo'::character varying, 'voice'::character varying, 'video'::character varying])::text[])))
);


ALTER TABLE public.groupmessage OWNER TO postgres;

--
-- Name: groupmessage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.groupmessage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groupmessage_id_seq OWNER TO postgres;

--
-- Name: groupmessage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.groupmessage_id_seq OWNED BY public.groupmessage.id;


--
-- Name: groupmessageattachment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groupmessageattachment (
    message_id integer NOT NULL,
    attachment_url character varying NOT NULL,
    attachment_thumb_url character varying NOT NULL
);


ALTER TABLE public.groupmessageattachment OWNER TO postgres;

--
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groups (
    id integer NOT NULL,
    creator_id integer NOT NULL,
    title character varying NOT NULL,
    join_url character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.groups OWNER TO postgres;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groups_id_seq OWNER TO postgres;

--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;


--
-- Name: messageattachment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.messageattachment (
    message_id integer NOT NULL,
    attachment_url character varying NOT NULL,
    attachment_thumb_url character varying NOT NULL
);


ALTER TABLE public.messageattachment OWNER TO postgres;

--
-- Name: messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    sender_id integer NOT NULL,
    receiver_id integer NOT NULL,
    message_type character varying NOT NULL,
    message_text text NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    CONSTRAINT messages_message_type_check CHECK (((message_type)::text = ANY ((ARRAY['text'::character varying, 'photo'::character varying, 'voice'::character varying, 'video'::character varying])::text[])))
);


ALTER TABLE public.messages OWNER TO postgres;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_id_seq OWNER TO postgres;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    telegram_id character varying,
    phone character varying NOT NULL,
    email character varying,
    pasword character varying NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    verification_code integer,
    profile_picture_url character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: channel id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channel ALTER COLUMN id SET DEFAULT nextval('public.channel_id_seq'::regclass);


--
-- Name: channelmessage id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channelmessage ALTER COLUMN id SET DEFAULT nextval('public.channelmessage_id_seq'::regclass);


--
-- Name: groupmessage id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groupmessage ALTER COLUMN id SET DEFAULT nextval('public.groupmessage_id_seq'::regclass);


--
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: blockuser; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.blockuser (blocker_user_id, blocked_user_id, created_at) FROM stdin;
7	2	2018-04-01 09:21:34.001
7	5	2018-04-09 09:21:34.001
7	1	2018-01-01 09:21:34.001
7	11	2017-04-01 09:21:34.001
7	9	2018-03-17 09:21:34.001
7	3	2017-04-01 09:21:34.001
\.


--
-- Data for Name: channel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.channel (id, telegram_id, title, info, creator_id, created_at, updated_at) FROM stdin;
1	ideatherapy	ideatherapy	\N	6	2018-01-04 01:01:01.001	2018-01-11 01:01:01.001
2	eminemfans	Eminem	\N	7	2018-01-02 01:09:11.001	2018-01-10 01:01:01.001
3	JokerFans	Joker	\N	3	2018-01-03 01:01:25.001	2018-01-12 01:05:01.001
4	EEautShora	Shora	\N	5	2018-01-04 01:15:01.001	2018-03-01 01:01:01.001
5	GolMusic	MyMusic	\N	2	2018-01-05 01:11:01.001	2018-02-11 01:01:01.001
6	aut_ap_2019	ap2019	\N	13	2018-01-07 01:06:01.001	2018-03-01 01:01:01.001
\.


--
-- Data for Name: channelmembership; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.channelmembership (user_id, channel_id, created_at) FROM stdin;
7	2	2019-04-12 19:20:38.056156
7	6	2019-04-12 19:20:38.060681
12	6	2019-04-12 19:20:38.065038
9	6	2019-04-12 19:20:38.069406
2	6	2019-04-12 19:20:38.073877
1	6	2019-04-12 19:20:38.078384
12	3	2019-04-12 19:20:38.082792
8	2	2019-04-12 19:20:38.086839
11	2	2019-04-12 19:20:38.090983
1	4	2019-04-12 19:20:38.095178
7	4	2019-04-12 19:20:38.099294
5	4	2019-04-12 19:20:38.103252
12	5	2019-04-12 19:20:38.107223
13	6	2019-04-12 19:20:38.111619
\.


--
-- Data for Name: channelmessage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.channelmessage (id, channel_id, message_type, message_text, created_at, updated_at) FROM stdin;
1	1	text	text 1	2018-02-11 09:21:34.001	2018-02-11 09:21:34.001
2	1	text	text2	2018-03-25 09:21:34.001	2018-03-25 09:21:34.001
3	2	text	text 3	2018-02-11 09:21:34.001	2018-03-11 09:21:34.001
4	2	text	text 4	2018-02-15 09:21:34.001	2018-04-01 09:21:34.001
5	3	text	text 5	2018-01-07 09:21:34.001	2018-04-01 09:21:34.001
6	3	text	text 6	2018-02-11 09:21:34.001	2018-02-11 09:21:34.001
7	3	text	text 7	2018-03-20 09:21:34.001	2018-03-20 09:21:34.001
8	4	text	text 8	2018-01-11 09:21:34.001	2018-01-11 09:21:34.001
9	4	text	text 9	2018-02-21 09:21:34.001	2018-03-21 09:21:34.001
10	5	text	text 10	2018-01-11 09:21:34.001	2018-01-11 09:21:34.001
11	6	text	ap-hw1 .........	2018-02-11 09:21:34.001	2018-02-11 09:21:34.001
12	6	text	ap-hw2 .........	2018-02-20 09:21:34.001	2018-02-20 09:21:34.001
13	6	text	ap-hw3 .........	2018-03-11 09:21:34.001	2018-03-11 09:21:34.001
14	6	text	ap-hw4 .........	2018-03-21 09:21:34.001	2018-03-21 09:21:34.001
15	6	text	ap-hw5 .........	2018-04-11 09:21:34.001	2018-04-11 09:21:34.001
\.


--
-- Data for Name: channelmessageattachment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.channelmessageattachment (message_id, attachment_url, attachment_thumb_url) FROM stdin;
\.


--
-- Data for Name: groupmembership; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groupmembership (user_id, group_id, created_at) FROM stdin;
\.


--
-- Data for Name: groupmessage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groupmessage (id, group_id, sender_id, message_type, message_text, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: groupmessageattachment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groupmessageattachment (message_id, attachment_url, attachment_thumb_url) FROM stdin;
\.


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groups (id, creator_id, title, join_url, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: messageattachment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.messageattachment (message_id, attachment_url, attachment_thumb_url) FROM stdin;
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.messages (id, sender_id, receiver_id, message_type, message_text, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, telegram_id, phone, email, pasword, first_name, last_name, verification_code, profile_picture_url, created_at, updated_at) FROM stdin;
1	mahboobe98	09199523067	m_shakeri@yahoo.com	6356335f70dd8f75915f2bb50c8a0148	mahboobe	sh	\N	\N	2015-09-12 12:22:44.001	2017-09-13 01:22:44.001
2	golnaz	09359523405	golnaz.b@yahoo.com	7b2317a5dd073f8db54a67c18bfea148	golnaz	bn	\N	\N	2016-11-12 10:06:44.001	2016-10-12 07:22:44.001
3	behnam	09359423028	bjt@yahoo.com	4477c33b2408fe7eae57dfe4336fc23e	behnam	jabbari	\N	\N	2016-01-12 01:22:10.001	2017-12-12 02:22:44.001
4	saman	09109523048	ranjbar@gmail.com	827ccb0eea8a706c4c34a16891f84e7b	saman	ranjbar	\N	\N	2017-09-12 09:22:44.001	2017-12-19 08:22:44.001
5	ahs	09129523070	ahso@yahoo.com	b648c1735112fc2bd1b586dd04310e18	amir	sh	\N	\N	2015-09-12 12:22:44.001	2017-09-25 06:22:24.001
6	junior	09359523412	mhmd.eeaut@yahoo.com	46d045ff5190f6ea93739da6c0aa19bc	mhmd	bgl	\N	\N	2017-01-12 08:22:44.001	2018-02-12 03:11:44.001
7	nill_ra	09120000001	nillR@yahoo.com	3497acb6042d34010b18560f00ce0f01	nill	R	\N	\N	2016-06-12 08:06:44.001	2019-04-12 19:20:37.980033
8	delaram_gh	09129623083	del_gh@yahoo.com	b24892b66650c547de61d0ea4d2290f3	delaram	gh	\N	\N	2017-09-14 04:22:45.001	2019-04-12 19:20:37.986273
9	kimia	09359523418	hakimi@yahoo.com	bb5cc2bbd90a5d9bb81ce454d66d940c	kimia	m	\N	\N	2016-04-25 01:02:03.001	2019-04-12 19:20:37.993202
10	hooman_kh	09359523419	khorsand@yahoo.com	111bec34ff2b3af70179c12588abb35b	hooman	kh	\N	\N	2016-05-04 01:22:44.001	2019-04-12 19:20:38.001068
11	nila	09129523111	nila_mas@yahoo.com	20ce5b0542a1b4796f6b5546568d590c	nilaa	mas	\N	\N	2015-02-05 01:24:44.001	2019-04-12 19:20:38.009637
12	nima	09359623115	niman@yahoo.com	c621cd28fc0161d027277ba61c86c788	nima	n	\N	\N	2017-06-12 05:22:19.001	2019-04-12 19:20:38.015962
13	amir.jahanshahi	09121234567	aj@aut.ac.ir	36e33d9ec73cab9b7deb610a64581b71	amir	jahanshahi	\N	\N	2014-05-12 12:21:27.001	2017-01-12 05:34:44.001
14	sHDiV4RHs	09359876543	shadi@yahoo.com	8bdc7fd636ffd0511cc6ada7c206cd68	shadi	v	\N	\N	2017-01-12 09:21:34.001	2019-04-12 19:20:38.023931
\.


--
-- Name: channel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.channel_id_seq', 6, true);


--
-- Name: channelmessage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.channelmessage_id_seq', 15, true);


--
-- Name: groupmessage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.groupmessage_id_seq', 1, false);


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.groups_id_seq', 1, false);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.messages_id_seq', 16, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 14, true);


--
-- Name: blockuser blockuser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blockuser
    ADD CONSTRAINT blockuser_pkey PRIMARY KEY (blocked_user_id, blocker_user_id);


--
-- Name: channel channel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channel
    ADD CONSTRAINT channel_pkey PRIMARY KEY (id);


--
-- Name: channelmembership channelmembership_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channelmembership
    ADD CONSTRAINT channelmembership_pkey PRIMARY KEY (user_id, channel_id);


--
-- Name: channelmessage channelmessage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channelmessage
    ADD CONSTRAINT channelmessage_pkey PRIMARY KEY (id);


--
-- Name: channelmessageattachment channelmessageattachment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channelmessageattachment
    ADD CONSTRAINT channelmessageattachment_pkey PRIMARY KEY (message_id);


--
-- Name: groupmembership groupmembership_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groupmembership
    ADD CONSTRAINT groupmembership_pkey PRIMARY KEY (user_id, group_id);


--
-- Name: groupmessage groupmessage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groupmessage
    ADD CONSTRAINT groupmessage_pkey PRIMARY KEY (id);


--
-- Name: groupmessageattachment groupmessageattachment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groupmessageattachment
    ADD CONSTRAINT groupmessageattachment_pkey PRIMARY KEY (message_id);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: messageattachment messageattachment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messageattachment
    ADD CONSTRAINT messageattachment_pkey PRIMARY KEY (message_id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: blockuser blockuser_blocked_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blockuser
    ADD CONSTRAINT blockuser_blocked_user_id_fkey FOREIGN KEY (blocked_user_id) REFERENCES public.users(id);


--
-- Name: blockuser blockuser_blocker_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blockuser
    ADD CONSTRAINT blockuser_blocker_user_id_fkey FOREIGN KEY (blocker_user_id) REFERENCES public.users(id);


--
-- Name: channel channel_creator_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channel
    ADD CONSTRAINT channel_creator_id_fkey FOREIGN KEY (creator_id) REFERENCES public.users(id);


--
-- Name: channelmembership channelmembership_channel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channelmembership
    ADD CONSTRAINT channelmembership_channel_id_fkey FOREIGN KEY (channel_id) REFERENCES public.channel(id);


--
-- Name: channelmembership channelmembership_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channelmembership
    ADD CONSTRAINT channelmembership_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: channelmessage channelmessage_channel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channelmessage
    ADD CONSTRAINT channelmessage_channel_id_fkey FOREIGN KEY (channel_id) REFERENCES public.channel(id);


--
-- Name: channelmessageattachment channelmessageattachment_message_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channelmessageattachment
    ADD CONSTRAINT channelmessageattachment_message_id_fkey FOREIGN KEY (message_id) REFERENCES public.channelmessage(id);


--
-- Name: groupmembership groupmembership_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groupmembership
    ADD CONSTRAINT groupmembership_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- Name: groupmembership groupmembership_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groupmembership
    ADD CONSTRAINT groupmembership_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: groupmessage groupmessage_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groupmessage
    ADD CONSTRAINT groupmessage_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- Name: groupmessage groupmessage_sender_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groupmessage
    ADD CONSTRAINT groupmessage_sender_id_fkey FOREIGN KEY (sender_id) REFERENCES public.users(id);


--
-- Name: groupmessageattachment groupmessageattachment_message_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groupmessageattachment
    ADD CONSTRAINT groupmessageattachment_message_id_fkey FOREIGN KEY (message_id) REFERENCES public.groupmessage(id);


--
-- Name: groups groups_creator_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_creator_id_fkey FOREIGN KEY (creator_id) REFERENCES public.users(id);


--
-- Name: messageattachment messageattachment_message_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messageattachment
    ADD CONSTRAINT messageattachment_message_id_fkey FOREIGN KEY (message_id) REFERENCES public.messages(id);


--
-- Name: messages messages_receiver_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_receiver_id_fkey FOREIGN KEY (receiver_id) REFERENCES public.users(id);


--
-- Name: messages messages_sender_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_sender_id_fkey FOREIGN KEY (sender_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

