SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- \restrict CAx8ZVDfyrQVO1iT2flBUnixeFUC0grXakepZ4QQWdXgedHpGhD1SM7rtHEbfkq

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

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
-- Data for Name: meal_plans; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."meal_plans" ("id", "created_at", "planned_date", "meal_title") VALUES
	(2, '2025-12-21 13:00:46.42447+00', '2025-12-15', 'Boerenkool met worst en spekjes'),
	(5, '2025-12-21 13:15:10.521874+00', '2025-12-16', 'Pasta met spinazie en spekjes'),
	(8, '2025-12-21 13:26:46.834396+00', '2025-12-17', 'Lasagne (van de slager)'),
	(10, '2025-12-21 13:34:01.313956+00', '2025-12-18', 'Kliekjes: Scones en lasagne (van de slager)'),
	(11, '2025-12-22 09:53:42.371525+00', '2025-12-22', 'Verspakket nasi met vega kipstukjes'),
	(12, '2025-12-22 09:57:26.839353+00', '2025-12-23', 'Pasta met spinazie'),
	(13, '2025-12-22 09:58:02.580145+00', '2025-12-24', 'Verspakket snelle stamppot met vega spekjes'),
	(14, '2025-12-22 09:59:31.17956+00', '2025-12-19', 'Verspakket snert'),
	(16, '2025-12-22 09:59:56.336822+00', '2025-12-21', 'Gebakken aardappeltjes met sperziebonen en kipburgers'),
	(15, '2025-12-22 09:59:39.492545+00', '2025-12-20', 'Kliekjes: Oliebollen en Snert'),
	(18, '2025-12-22 11:55:57.865227+00', '2025-12-14', 'AH Gesneden verspakket kip madras (vega)'),
	(17, '2025-12-22 11:55:28.724308+00', '2025-12-13', 'Enchilada''s (Opperdepop)');


--
-- Name: meal_plans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."meal_plans_id_seq"', 19, true);


--
-- PostgreSQL database dump complete
--

-- \unrestrict CAx8ZVDfyrQVO1iT2flBUnixeFUC0grXakepZ4QQWdXgedHpGhD1SM7rtHEbfkq

RESET ALL;
