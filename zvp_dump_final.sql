--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)

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
-- Name: Departments; Type: TABLE; Schema: public; Owner: zvp_user
--

CREATE TABLE public."Departments" (
    id integer NOT NULL,
    department_name character varying(100) NOT NULL,
    department_head_id integer,
    department_head_rank_id integer
);


ALTER TABLE public."Departments" OWNER TO zvp_user;

--
-- Name: Departments_id_seq; Type: SEQUENCE; Schema: public; Owner: zvp_user
--

CREATE SEQUENCE public."Departments_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Departments_id_seq" OWNER TO zvp_user;

--
-- Name: Departments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zvp_user
--

ALTER SEQUENCE public."Departments_id_seq" OWNED BY public."Departments".id;


--
-- Name: Disciplines; Type: TABLE; Schema: public; Owner: zvp_user
--

CREATE TABLE public."Disciplines" (
    id integer NOT NULL,
    discipline_name character varying(100) NOT NULL,
    discipline_department_name_id integer
);


ALTER TABLE public."Disciplines" OWNER TO zvp_user;

--
-- Name: Disciplines_id_seq; Type: SEQUENCE; Schema: public; Owner: zvp_user
--

CREATE SEQUENCE public."Disciplines_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Disciplines_id_seq" OWNER TO zvp_user;

--
-- Name: Disciplines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zvp_user
--

ALTER SEQUENCE public."Disciplines_id_seq" OWNED BY public."Disciplines".id;


--
-- Name: Marks; Type: TABLE; Schema: public; Owner: zvp_user
--

CREATE TABLE public."Marks" (
    id integer NOT NULL,
    first_attempt_mark integer,
    second_attempt_mark integer,
    third_attempt_mark integer,
    discipline_id integer NOT NULL,
    quiz_id integer NOT NULL,
    student_id integer NOT NULL,
    CONSTRAINT "Marks_first_attempt_mark_check" CHECK ((first_attempt_mark >= 0)),
    CONSTRAINT "Marks_second_attempt_mark_check" CHECK ((second_attempt_mark >= 0)),
    CONSTRAINT "Marks_third_attempt_mark_check" CHECK ((third_attempt_mark >= 0))
);


ALTER TABLE public."Marks" OWNER TO zvp_user;

--
-- Name: Marks_id_seq; Type: SEQUENCE; Schema: public; Owner: zvp_user
--

CREATE SEQUENCE public."Marks_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Marks_id_seq" OWNER TO zvp_user;

--
-- Name: Marks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zvp_user
--

ALTER SEQUENCE public."Marks_id_seq" OWNED BY public."Marks".id;


--
-- Name: Questions; Type: TABLE; Schema: public; Owner: zvp_user
--

CREATE TABLE public."Questions" (
    id integer NOT NULL,
    question_content character varying(2000) NOT NULL,
    question_ticket_id integer
);


ALTER TABLE public."Questions" OWNER TO zvp_user;

--
-- Name: Questions_id_seq; Type: SEQUENCE; Schema: public; Owner: zvp_user
--

CREATE SEQUENCE public."Questions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Questions_id_seq" OWNER TO zvp_user;

--
-- Name: Questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zvp_user
--

ALTER SEQUENCE public."Questions_id_seq" OWNED BY public."Questions".id;


--
-- Name: Quizzes; Type: TABLE; Schema: public; Owner: zvp_user
--

CREATE TABLE public."Quizzes" (
    id integer NOT NULL,
    quiz_title character varying(200) NOT NULL,
    quiz_description text NOT NULL,
    quiz_single_attempt boolean NOT NULL,
    quiz_time character varying(5) NOT NULL,
    quiz_discipline_id integer,
    quiz_type character varying(200) NOT NULL
);


ALTER TABLE public."Quizzes" OWNER TO zvp_user;

--
-- Name: Quizzes_id_seq; Type: SEQUENCE; Schema: public; Owner: zvp_user
--

CREATE SEQUENCE public."Quizzes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Quizzes_id_seq" OWNER TO zvp_user;

--
-- Name: Quizzes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zvp_user
--

ALTER SEQUENCE public."Quizzes_id_seq" OWNED BY public."Quizzes".id;


--
-- Name: Results; Type: TABLE; Schema: public; Owner: zvp_user
--

CREATE TABLE public."Results" (
    id integer NOT NULL,
    results text NOT NULL,
    date_time_stamp timestamp with time zone NOT NULL,
    student_id integer NOT NULL,
    test_id integer NOT NULL,
    ticket_id integer
);


ALTER TABLE public."Results" OWNER TO zvp_user;

--
-- Name: Results_id_seq; Type: SEQUENCE; Schema: public; Owner: zvp_user
--

CREATE SEQUENCE public."Results_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Results_id_seq" OWNER TO zvp_user;

--
-- Name: Results_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zvp_user
--

ALTER SEQUENCE public."Results_id_seq" OWNED BY public."Results".id;


--
-- Name: Students; Type: TABLE; Schema: public; Owner: zvp_user
--

CREATE TABLE public."Students" (
    id integer NOT NULL,
    student_active boolean NOT NULL,
    student_full_name character varying(200),
    student_university_group character varying(100),
    student_faculty character varying(150),
    student_grade integer,
    student_state character varying(100),
    student_notes text,
    student_troop_id integer,
    user_id integer NOT NULL,
    troop_commander boolean NOT NULL
);


ALTER TABLE public."Students" OWNER TO zvp_user;

--
-- Name: Students_id_seq; Type: SEQUENCE; Schema: public; Owner: zvp_user
--

CREATE SEQUENCE public."Students_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Students_id_seq" OWNER TO zvp_user;

--
-- Name: Students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zvp_user
--

ALTER SEQUENCE public."Students_id_seq" OWNED BY public."Students".id;


--
-- Name: Teacher's ranks; Type: TABLE; Schema: public; Owner: zvp_user
--

CREATE TABLE public."Teacher's ranks" (
    id integer NOT NULL,
    teacher_rank character varying(100)
);


ALTER TABLE public."Teacher's ranks" OWNER TO zvp_user;

--
-- Name: Teacher's ranks_id_seq; Type: SEQUENCE; Schema: public; Owner: zvp_user
--

CREATE SEQUENCE public."Teacher's ranks_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Teacher's ranks_id_seq" OWNER TO zvp_user;

--
-- Name: Teacher's ranks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zvp_user
--

ALTER SEQUENCE public."Teacher's ranks_id_seq" OWNED BY public."Teacher's ranks".id;


--
-- Name: Teachers; Type: TABLE; Schema: public; Owner: zvp_user
--

CREATE TABLE public."Teachers" (
    id integer NOT NULL,
    teacher_full_name character varying(200) NOT NULL,
    teacher_check_tests boolean NOT NULL,
    teacher_department_id integer,
    teacher_rank_id integer
);


ALTER TABLE public."Teachers" OWNER TO zvp_user;

--
-- Name: Teachers_id_seq; Type: SEQUENCE; Schema: public; Owner: zvp_user
--

CREATE SEQUENCE public."Teachers_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Teachers_id_seq" OWNER TO zvp_user;

--
-- Name: Teachers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zvp_user
--

ALTER SEQUENCE public."Teachers_id_seq" OWNED BY public."Teachers".id;


--
-- Name: Troops; Type: TABLE; Schema: public; Owner: zvp_user
--

CREATE TABLE public."Troops" (
    id integer NOT NULL,
    troop_id integer NOT NULL,
    troop_department_id integer,
    troop_head_id integer,
    troop_head_rank_id integer
);


ALTER TABLE public."Troops" OWNER TO zvp_user;

--
-- Name: Troops_id_seq; Type: SEQUENCE; Schema: public; Owner: zvp_user
--

CREATE SEQUENCE public."Troops_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Troops_id_seq" OWNER TO zvp_user;

--
-- Name: Troops_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zvp_user
--

ALTER SEQUENCE public."Troops_id_seq" OWNED BY public."Troops".id;


--
-- Name: accesses; Type: TABLE; Schema: public; Owner: zvp_user
--

CREATE TABLE public.accesses (
    id integer NOT NULL,
    access_granted boolean NOT NULL,
    quiz_id integer NOT NULL,
    student_id integer NOT NULL
);


ALTER TABLE public.accesses OWNER TO zvp_user;

--
-- Name: accesses_id_seq; Type: SEQUENCE; Schema: public; Owner: zvp_user
--

CREATE SEQUENCE public.accesses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accesses_id_seq OWNER TO zvp_user;

--
-- Name: accesses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zvp_user
--

ALTER SEQUENCE public.accesses_id_seq OWNED BY public.accesses.id;


--
-- Name: answers; Type: TABLE; Schema: public; Owner: zvp_user
--

CREATE TABLE public.answers (
    id integer NOT NULL,
    title character varying(300) NOT NULL,
    is_true boolean NOT NULL,
    question_id integer NOT NULL
);


ALTER TABLE public.answers OWNER TO zvp_user;

--
-- Name: answers_id_seq; Type: SEQUENCE; Schema: public; Owner: zvp_user
--

CREATE SEQUENCE public.answers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.answers_id_seq OWNER TO zvp_user;

--
-- Name: answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zvp_user
--

ALTER SEQUENCE public.answers_id_seq OWNED BY public.answers.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: zvp_user
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO zvp_user;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: zvp_user
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO zvp_user;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zvp_user
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: zvp_user
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO zvp_user;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: zvp_user
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO zvp_user;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zvp_user
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: zvp_user
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO zvp_user;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: zvp_user
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO zvp_user;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zvp_user
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: zvp_user
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO zvp_user;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: zvp_user
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO zvp_user;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: zvp_user
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO zvp_user;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zvp_user
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: zvp_user
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO zvp_user;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zvp_user
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: zvp_user
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO zvp_user;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: zvp_user
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO zvp_user;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zvp_user
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: control_panel_presence; Type: TABLE; Schema: public; Owner: zvp_user
--

CREATE TABLE public.control_panel_presence (
    id integer NOT NULL,
    date_time timestamp with time zone NOT NULL,
    quiz_id integer,
    student_id integer NOT NULL
);


ALTER TABLE public.control_panel_presence OWNER TO zvp_user;

--
-- Name: control_panel_presence_id_seq; Type: SEQUENCE; Schema: public; Owner: zvp_user
--

CREATE SEQUENCE public.control_panel_presence_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.control_panel_presence_id_seq OWNER TO zvp_user;

--
-- Name: control_panel_presence_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zvp_user
--

ALTER SEQUENCE public.control_panel_presence_id_seq OWNED BY public.control_panel_presence.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: zvp_user
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO zvp_user;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: zvp_user
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO zvp_user;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zvp_user
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: zvp_user
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO zvp_user;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: zvp_user
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO zvp_user;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zvp_user
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: zvp_user
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO zvp_user;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: zvp_user
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO zvp_user;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zvp_user
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: zvp_user
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO zvp_user;

--
-- Name: quiz_app_startingquiz; Type: TABLE; Schema: public; Owner: zvp_user
--

CREATE TABLE public.quiz_app_startingquiz (
    id integer NOT NULL,
    "endTestTime" integer NOT NULL,
    quiz_id integer NOT NULL,
    student_id integer NOT NULL
);


ALTER TABLE public.quiz_app_startingquiz OWNER TO zvp_user;

--
-- Name: quiz_app_startingquiz_id_seq; Type: SEQUENCE; Schema: public; Owner: zvp_user
--

CREATE SEQUENCE public.quiz_app_startingquiz_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quiz_app_startingquiz_id_seq OWNER TO zvp_user;

--
-- Name: quiz_app_startingquiz_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zvp_user
--

ALTER SEQUENCE public.quiz_app_startingquiz_id_seq OWNED BY public.quiz_app_startingquiz.id;


--
-- Name: tickets; Type: TABLE; Schema: public; Owner: zvp_user
--

CREATE TABLE public.tickets (
    id integer NOT NULL,
    title character varying(120) NOT NULL,
    quiz_id integer NOT NULL
);


ALTER TABLE public.tickets OWNER TO zvp_user;

--
-- Name: tickets_id_seq; Type: SEQUENCE; Schema: public; Owner: zvp_user
--

CREATE SEQUENCE public.tickets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tickets_id_seq OWNER TO zvp_user;

--
-- Name: tickets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zvp_user
--

ALTER SEQUENCE public.tickets_id_seq OWNED BY public.tickets.id;


--
-- Name: Departments id; Type: DEFAULT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public."Departments" ALTER COLUMN id SET DEFAULT nextval('public."Departments_id_seq"'::regclass);


--
-- Name: Disciplines id; Type: DEFAULT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public."Disciplines" ALTER COLUMN id SET DEFAULT nextval('public."Disciplines_id_seq"'::regclass);


--
-- Name: Marks id; Type: DEFAULT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public."Marks" ALTER COLUMN id SET DEFAULT nextval('public."Marks_id_seq"'::regclass);


--
-- Name: Questions id; Type: DEFAULT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public."Questions" ALTER COLUMN id SET DEFAULT nextval('public."Questions_id_seq"'::regclass);


--
-- Name: Quizzes id; Type: DEFAULT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public."Quizzes" ALTER COLUMN id SET DEFAULT nextval('public."Quizzes_id_seq"'::regclass);


--
-- Name: Results id; Type: DEFAULT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public."Results" ALTER COLUMN id SET DEFAULT nextval('public."Results_id_seq"'::regclass);


--
-- Name: Students id; Type: DEFAULT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public."Students" ALTER COLUMN id SET DEFAULT nextval('public."Students_id_seq"'::regclass);


--
-- Name: Teacher's ranks id; Type: DEFAULT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public."Teacher's ranks" ALTER COLUMN id SET DEFAULT nextval('public."Teacher''s ranks_id_seq"'::regclass);


--
-- Name: Teachers id; Type: DEFAULT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public."Teachers" ALTER COLUMN id SET DEFAULT nextval('public."Teachers_id_seq"'::regclass);


--
-- Name: Troops id; Type: DEFAULT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public."Troops" ALTER COLUMN id SET DEFAULT nextval('public."Troops_id_seq"'::regclass);


--
-- Name: accesses id; Type: DEFAULT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.accesses ALTER COLUMN id SET DEFAULT nextval('public.accesses_id_seq'::regclass);


--
-- Name: answers id; Type: DEFAULT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.answers ALTER COLUMN id SET DEFAULT nextval('public.answers_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: control_panel_presence id; Type: DEFAULT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.control_panel_presence ALTER COLUMN id SET DEFAULT nextval('public.control_panel_presence_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: quiz_app_startingquiz id; Type: DEFAULT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.quiz_app_startingquiz ALTER COLUMN id SET DEFAULT nextval('public.quiz_app_startingquiz_id_seq'::regclass);


--
-- Name: tickets id; Type: DEFAULT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.tickets ALTER COLUMN id SET DEFAULT nextval('public.tickets_id_seq'::regclass);


--
-- Data for Name: Departments; Type: TABLE DATA; Schema: public; Owner: zvp_user
--

COPY public."Departments" (id, department_name, department_head_id, department_head_rank_id) FROM stdin;
\.


--
-- Data for Name: Disciplines; Type: TABLE DATA; Schema: public; Owner: zvp_user
--

COPY public."Disciplines" (id, discipline_name, discipline_department_name_id) FROM stdin;
1	ЗВП	\N
\.


--
-- Data for Name: Marks; Type: TABLE DATA; Schema: public; Owner: zvp_user
--

COPY public."Marks" (id, first_attempt_mark, second_attempt_mark, third_attempt_mark, discipline_id, quiz_id, student_id) FROM stdin;
\.


--
-- Data for Name: Questions; Type: TABLE DATA; Schema: public; Owner: zvp_user
--

COPY public."Questions" (id, question_content, question_ticket_id) FROM stdin;
1	Калібр кулемета Калашникова (ПК)	1
2	Найбільш дійсний вогонь по наземним та повітряним цілям з ПК	1
3	Прицільна дальність з ПК	1
4	Калібр гвинтівки СВД	1
5	Найбільш ефективний вогонь з СВД	1
6	Прицільна дальність стрільби з відкритим прицілом з СВД	1
7	Яка оцінка за виконання 1ВНС з ПМ	1
8	При переміщенні мушки в бік на 1 мм СТВ при стрільбі на 100 м з ПК зміщується на	1
9	Для чого використовуються снайперські патрони в СВД	1
10	Калібр ГП-25	1
11	Кількість нарізів у стволі ГП-25	1
12	Ефективна дальність стрільби осколковими гранатами з ГП-25	1
13	Калібр РПГ-22	1
14	Калібр РПГ-26	1
15	Прицільна дальність РПГ-22	1
16	Місця для зберігання всіх видів обмундирування закріплюються за військовослужбовцями й позначаються: ярликами із зазначенням військового звання, прізвища та ініціалів військовослужбовця.	1
17	Усі приміщення та фасади будівель мають бути пофарбовані	1
18	Опалення закінчується не пізніше ніж	1
19	Тривалість розводу варт не повинна перевищувати	1
20	Склад варт, що змінився, звільнюється від занять і робіт	1
21	Вступати в розмову з особами, які прибули до вартового приміщення можуть	1
295	Калібр кулемета Калашникова (ПК)	9
296	Найбільш дійсний вогонь по наземним та повітряним цілям з ПК	9
297	Прицільна дальність з ПК	9
298	Калібр гвинтівки СВД	9
299	Найбільш ефективний вогонь з СВД	9
300	Прицільна дальність стрільби з відкритим прицілом з СВД	9
301	Яка оцінка за виконання 1ВНС з ПМ	9
302	При переміщенні мушки в бік на 1 мм СТВ при стрільбі на 100 м з ПК зміщується на	9
303	Для чого використовуються снайперські патрони в СВД	9
304	Калібр ГП-25	9
305	Кількість нарізів у стволі ГП-25	9
306	Ефективна дальність стрільби осколковими гранатами з ГП-25	9
307	Калібр РПГ-22	9
308	Калібр РПГ-26	9
309	Прицільна дальність РПГ-22	9
310	Місця для зберігання всіх видів обмундирування закріплюються за військовослужбовцями й позначаються: ярликами із зазначенням військового звання, прізвища та ініціалів військовослужбовця.	9
311	Усі приміщення та фасади будівель мають бути пофарбовані	9
312	Опалення закінчується не пізніше ніж	9
313	Тривалість розводу варт не повинна перевищувати	9
314	Склад варт, що змінився, звільнюється від занять і робіт	9
315	Вступати в розмову з особами, які прибули до вартового приміщення можуть	9
316	Калібр кулемета Калашникова (ПК)	10
317	Найбільш дійсний вогонь по наземним та повітряним цілям з ПК	10
318	Прицільна дальність з ПК	10
319	Калібр гвинтівки СВД	10
320	Найбільш ефективний вогонь з СВД	10
321	Прицільна дальність стрільби з відкритим прицілом з СВД	10
322	Яка оцінка за виконання 1ВНС з ПМ	10
323	При переміщенні мушки в бік на 1 мм СТВ при стрільбі на 100 м з ПК зміщується на	10
324	Для чого використовуються снайперські патрони в СВД	10
325	Калібр ГП-25	10
326	Кількість нарізів у стволі ГП-25	10
327	Ефективна дальність стрільби осколковими гранатами з ГП-25	10
328	Калібр РПГ-22	10
329	Калібр РПГ-26	10
330	Прицільна дальність РПГ-22	10
331	Місця для зберігання всіх видів обмундирування закріплюються за військовослужбовцями й позначаються: ярликами із зазначенням військового звання, прізвища та ініціалів військовослужбовця.	10
332	Усі приміщення та фасади будівель мають бути пофарбовані	10
333	Опалення закінчується не пізніше ніж	10
334	Тривалість розводу варт не повинна перевищувати	10
335	Склад варт, що змінився, звільнюється від занять і робіт	10
379	Прицільна дальність з ПКТ	13
336	Вступати в розмову з особами, які прибули до вартового приміщення можуть	10
337	Калібр кулемета Калашникова (ПК)	11
338	Найбільш дійсний вогонь по наземним та повітряним цілям з ПК	11
339	Прицільна дальність з ПК	11
340	Калібр гвинтівки СВД	11
341	Найбільш ефективний вогонь з СВД	11
342	Прицільна дальність стрільби з відкритим прицілом з СВД	11
343	Яка оцінка за виконання 1ВНС з ПМ	11
344	При переміщенні мушки в бік на 1 мм СТВ при стрільбі на 100 м з ПК зміщується на	11
345	Для чого використовуються снайперські патрони в СВД	11
346	Калібр ГП-25	11
347	Кількість нарізів у стволі ГП-25	11
348	Ефективна дальність стрільби осколковими гранатами з ГП-25	11
349	Калібр РПГ-22	11
350	Калібр РПГ-26	11
351	Прицільна дальність РПГ-22	11
352	Місця для зберігання всіх видів обмундирування закріплюються за військовослужбовцями й позначаються: ярликами із зазначенням військового звання, прізвища та ініціалів військовослужбовця.	11
353	Усі приміщення та фасади будівель мають бути пофарбовані	11
354	Опалення закінчується не пізніше ніж	11
355	Тривалість розводу варт не повинна перевищувати	11
356	Склад варт, що змінився, звільнюється від занять і робіт	11
357	Вступати в розмову з особами, які прибули до вартового приміщення можуть	11
358	Калібр кулемета Калашникова (ПК)	12
359	Найбільш дійсний вогонь по наземним та повітряним цілям з ПК	12
360	Прицільна дальність з ПК	12
361	Калібр гвинтівки СВД	12
362	Найбільш ефективний вогонь з СВД	12
363	Прицільна дальність стрільби з відкритим прицілом з СВД	12
364	Яка оцінка за виконання 1ВНС з ПМ	12
365	При переміщенні мушки в бік на 1 мм СТВ при стрільбі на 100 м з ПК зміщується на	12
366	Для чого використовуються снайперські патрони в СВД	12
367	Калібр ГП-25	12
368	Кількість нарізів у стволі ГП-25	12
369	Ефективна дальність стрільби осколковими гранатами з ГП-25	12
370	Калібр РПГ-22	12
371	Калібр РПГ-26	12
372	Прицільна дальність РПГ-22	12
373	Місця для зберігання всіх видів обмундирування закріплюються за військовослужбовцями й позначаються: ярликами із зазначенням військового звання, прізвища та ініціалів військовослужбовця.	12
374	Усі приміщення та фасади будівель мають бути пофарбовані	12
375	Опалення закінчується не пізніше ніж	12
376	Тривалість розводу варт не повинна перевищувати	12
377	Склад варт, що змінився, звільнюється від занять і робіт	12
378	Вступати в розмову з особами, які прибули до вартового приміщення можуть	12
484	Прицільна дальність з ПКТ	14
485	Дальність прямого пострілу по грудній фігурі з ПК	14
486	Дальність прямого пострілу по грудній фігурі з ПКТ	14
487	Прицільна дальність стрільби з оптичним прицілом з СВД	14
488	Прицільна дальність стрільби з нічним прицілом з СВД	14
489	Дальність прямого пострілу по головній фігурі з СВД	14
490	Який небезпечний сектор виникає позаду при стрільбі з РПГ-22	14
491	Яка мішень використовується при виконанні 1ВНС з ПМ	14
492	Яка глибина небезпечної зони виникає позаду при стрільбі з РПГ-22	14
493	Ефективна дальність стрільби гранатою подразнюючої дії з ГП-25	14
494	Маса ГП - 25	14
495	Бойова швидкострільність з ГП-25	14
496	Прицільна дальність РПГ-26	14
497	Дальність прямого пострілу РПГ-22	14
498	Дальність прямого пострілу РПГ-26	14
499	Прапорщики і мічмани, які обіймають посаду старшини роти, розміщуються	14
500	Приміщення щоденно прибираються	14
501	Нагляд за пічним опаленням у підрозділах покладається на	14
502	Де стають розвідні попередньої варти по відношенню відповідних розвідних нової варти при команди начальника нової варти: «Перша зміна—СТАВАЙ»	14
380	Дальність прямого пострілу по грудній фігурі з ПК	13
381	Дальність прямого пострілу по грудній фігурі з ПКТ	13
382	Прицільна дальність стрільби з оптичним прицілом з СВД	13
383	Прицільна дальність стрільби з нічним прицілом з СВД	13
384	Дальність прямого пострілу по головній фігурі з СВД	13
385	Який небезпечний сектор виникає позаду при стрільбі з РПГ-22	13
386	Яка мішень використовується при виконанні 1ВНС з ПМ	13
387	Яка глибина небезпечної зони виникає позаду при стрільбі з РПГ-22	13
388	Ефективна дальність стрільби гранатою подразнюючої дії з ГП-25	13
389	Маса ГП - 25	13
390	Бойова швидкострільність з ГП-25	13
391	Прицільна дальність РПГ-26	13
392	Дальність прямого пострілу РПГ-22	13
393	Дальність прямого пострілу РПГ-26	13
394	Прапорщики і мічмани, які обіймають посаду старшини роти, розміщуються	13
395	Приміщення щоденно прибираються	13
396	Нагляд за пічним опаленням у підрозділах покладається на	13
397	Де стають розвідні попередньої варти по відношенню відповідних розвідних нової варти при команди начальника нової варти: «Перша зміна—СТАВАЙ»	13
398	Вартові, що охороняли об'єкти тільки вночі звільнюються від занять та робіт	13
399	Їжа особовому складові варти, яка перебуває поза розташуванням військової частини, постачається	13
503	Вартові, що охороняли об'єкти тільки вночі звільнюються від занять та робіт	14
504	Їжа особовому складові варти, яка перебуває поза розташуванням військової частини, постачається	14
505	Прицільна дальність з ПКТ	15
506	Дальність прямого пострілу по грудній фігурі з ПК	15
507	Дальність прямого пострілу по грудній фігурі з ПКТ	15
508	Прицільна дальність стрільби з оптичним прицілом з СВД	15
509	Прицільна дальність стрільби з нічним прицілом з СВД	15
510	Дальність прямого пострілу по головній фігурі з СВД	15
511	Який небезпечний сектор виникає позаду при стрільбі з РПГ-22	15
512	Яка мішень використовується при виконанні 1ВНС з ПМ	15
513	Яка глибина небезпечної зони виникає позаду при стрільбі з РПГ-22	15
514	Ефективна дальність стрільби гранатою подразнюючої дії з ГП-25	15
515	Маса ГП - 25	15
516	Бойова швидкострільність з ГП-25	15
517	Прицільна дальність РПГ-26	15
518	Дальність прямого пострілу РПГ-22	15
519	Дальність прямого пострілу РПГ-26	15
520	Прапорщики і мічмани, які обіймають посаду старшини роти, розміщуються	15
521	Приміщення щоденно прибираються	15
522	Нагляд за пічним опаленням у підрозділах покладається на	15
523	Де стають розвідні попередньої варти по відношенню відповідних розвідних нової варти при команди начальника нової варти: «Перша зміна—СТАВАЙ»	15
524	Вартові, що охороняли об'єкти тільки вночі звільнюються від занять та робіт	15
525	Їжа особовому складові варти, яка перебуває поза розташуванням військової частини, постачається	15
526	Прицільна дальність з ПКТ	16
527	Дальність прямого пострілу по грудній фігурі з ПК	16
528	Дальність прямого пострілу по грудній фігурі з ПКТ	16
529	Прицільна дальність стрільби з оптичним прицілом з СВД	16
530	Прицільна дальність стрільби з нічним прицілом з СВД	16
531	Дальність прямого пострілу по головній фігурі з СВД	16
532	Який небезпечний сектор виникає позаду при стрільбі з РПГ-22	16
533	Яка мішень використовується при виконанні 1ВНС з ПМ	16
534	Яка глибина небезпечної зони виникає позаду при стрільбі з РПГ-22	16
535	Ефективна дальність стрільби гранатою подразнюючої дії з ГП-25	16
536	Маса ГП - 25	16
537	Бойова швидкострільність з ГП-25	16
538	Прицільна дальність РПГ-26	16
539	Дальність прямого пострілу РПГ-22	16
540	Дальність прямого пострілу РПГ-26	16
541	Прапорщики і мічмани, які обіймають посаду старшини роти, розміщуються	16
542	Приміщення щоденно прибираються	16
543	Нагляд за пічним опаленням у підрозділах покладається на	16
544	Де стають розвідні попередньої варти по відношенню відповідних розвідних нової варти при команди начальника нової варти: «Перша зміна—СТАВАЙ»	16
545	Вартові, що охороняли об'єкти тільки вночі звільнюються від занять та робіт	16
546	Їжа особовому складові варти, яка перебуває поза розташуванням військової частини, постачається	16
547	Прицільна дальність з ПКТ	17
548	Дальність прямого пострілу по грудній фігурі з ПК	17
549	Дальність прямого пострілу по грудній фігурі з ПКТ	17
550	Прицільна дальність стрільби з оптичним прицілом з СВД	17
551	Прицільна дальність стрільби з нічним прицілом з СВД	17
552	Дальність прямого пострілу по головній фігурі з СВД	17
553	Який небезпечний сектор виникає позаду при стрільбі з РПГ-22	17
554	Яка мішень використовується при виконанні 1ВНС з ПМ	17
555	Яка глибина небезпечної зони виникає позаду при стрільбі з РПГ-22	17
556	Ефективна дальність стрільби гранатою подразнюючої дії з ГП-25	17
557	Маса ГП - 25	17
558	Бойова швидкострільність з ГП-25	17
559	Прицільна дальність РПГ-26	17
560	Дальність прямого пострілу РПГ-22	17
561	Дальність прямого пострілу РПГ-26	17
562	Прапорщики і мічмани, які обіймають посаду старшини роти, розміщуються	17
563	Приміщення щоденно прибираються	17
564	Нагляд за пічним опаленням у підрозділах покладається на	17
565	Де стають розвідні попередньої варти по відношенню відповідних розвідних нової варти при команди начальника нової варти: «Перша зміна—СТАВАЙ»	17
566	Вартові, що охороняли об'єкти тільки вночі звільнюються від занять та робіт	17
567	Їжа особовому складові варти, яка перебуває поза розташуванням військової частини, постачається	17
568	Дальність прямого пострілу по фігурі, що рухається з ПК	18
569	Дальність прямого пострілу по грудній фігурі з ПКТ	18
570	Бойова швидкострільність з ПК	18
571	Дальність прямого пострілу по грудній фігурі з СВД	18
572	Дальність прямого пострілу по фігурі, що рухається з СВД	18
573	Маса СВД	18
574	Самоліквідація підривача гранати ПГ-26	18
575	Дальність до мішені при виконанні 1ВНС з ПМ	18
576	Маса кулемета ПКТ	18
577	Носимий боєкомплект ГП-25	18
578	На яку висоту “підстрибує” граната ВОГ - 25П	18
579	Калібр гранати ВОГ-25П	18
580	Початкова швидкість гранати РПГ-22	18
581	Початкова швидкість гранати РПГ-26	18
582	Довжина в похідному положенні РПГ-22	18
583	Сержанти строкової служби, які обіймають посаду старшини роти розміщуються	18
584	Якщо підлога не натирається мастикою, її миють не менше ніж	18
585	Взимку в житлових приміщеннях підтримується температура не нижче	18
586	Коли помічник начальника варти проводить бойовий розподіл особового складу варти та ставить завдання	18
587	Ніхто зі складу варти не може залишати вартове приміщення	18
588	Якщо варта розташована на території військової частини, постачання їжі організовується	18
1051	Бойова швидкострільність з ПК	22
1052	Взимку в житлових приміщеннях підтримується температура не нижче	22
1053	Дальність до мішені при виконанні 1ВНС з ПМ	22
1054	Дальність прямого пострілу по грудній фігурі з ПКТ	22
1055	Дальність прямого пострілу по грудній фігурі з СВД	22
1056	Дальність прямого пострілу по фігурі, що рухається з ПК	22
1057	Дальність прямого пострілу по фігурі, що рухається з СВД	22
1058	Довжина в похідному положенні РПГ-22	22
1059	Калібр гранати ВОГ-25П	22
1060	Коли помічник начальника варти проводить бойовий розподіл особового складу варти та ставить завдання	22
1061	Маса кулемета ПКТ	22
1062	Маса СВД	22
1063	На яку висоту “підстрибує” граната ВОГ - 25П	22
1064	Ніхто зі складу варти не може залишати вартове приміщення	22
1065	Носимий боєкомплект ГП-25	22
1066	Початкова швидкість гранати РПГ-22	22
1067	Початкова швидкість гранати РПГ-26	22
1068	Самоліквідація підривача гранати ПГ-26	22
1069	Сержанти строкової служби, які обіймають посаду старшини роти розміщуються	22
1070	Якщо варта розташована на території військової частини, постачання їжі організовується	22
1071	Якщо підлога не натирається мастикою, її миють не менше ніж	22
757	Якщо варта розташована на території військової частини, постачання їжі організовується	23
758	Ніхто зі складу варти не може залишати вартове приміщення	23
759	Коли помічник начальника варти проводить бойовий розподіл особового складу варти та ставить завдання	23
760	Взимку в житлових приміщеннях підтримується температура не нижче	23
761	Якщо підлога не натирається мастикою, її миють не менше ніж	23
762	Сержанти строкової служби, які обіймають посаду старшини роти розміщуються	23
763	Довжина в похідному положенні РПГ-22	23
764	Початкова швидкість гранати РПГ-26	23
765	Початкова швидкість гранати РПГ-22	23
766	Калібр гранати ВОГ-25П	23
767	На яку висоту “підстрибує” граната ВОГ - 25П	23
768	Носимий боєкомплект ГП-25	23
769	Маса кулемета ПКТ	23
770	Дальність до мішені при виконанні 1ВНС з ПМ	23
771	Самоліквідація підривача гранати ПГ-26	23
772	Маса СВД	23
773	Дальність прямого пострілу по фігурі, що рухається з СВД	23
774	Дальність прямого пострілу по грудній фігурі з СВД	23
775	Бойова швидкострільність з ПК	23
776	Дальність прямого пострілу по грудній фігурі з ПКТ	23
777	Дальність прямого пострілу по фігурі, що рухається з ПК	23
778	Якщо варта розташована на території військової частини, постачання їжі організовується	20
779	Ніхто зі складу варти не може залишати вартове приміщення	20
780	Коли помічник начальника варти проводить бойовий розподіл особового складу варти та ставить завдання	20
781	Взимку в житлових приміщеннях підтримується температура не нижче	20
782	Якщо підлога не натирається мастикою, її миють не менше ніж	20
783	Сержанти строкової служби, які обіймають посаду старшини роти розміщуються	20
784	Довжина в похідному положенні РПГ-22	20
785	Початкова швидкість гранати РПГ-26	20
786	Початкова швидкість гранати РПГ-22	20
787	Калібр гранати ВОГ-25П	20
788	На яку висоту “підстрибує” граната ВОГ - 25П	20
789	Носимий боєкомплект ГП-25	20
790	Маса кулемета ПКТ	20
791	Дальність до мішені при виконанні 1ВНС з ПМ	20
792	Самоліквідація підривача гранати ПГ-26	20
793	Маса СВД	20
794	Дальність прямого пострілу по фігурі, що рухається з СВД	20
795	Дальність прямого пострілу по грудній фігурі з СВД	20
796	Бойова швидкострільність з ПК	20
797	Дальність прямого пострілу по грудній фігурі з ПКТ	20
798	Дальність прямого пострілу по фігурі, що рухається з ПК	20
799	Якщо варта розташована на території військової частини, постачання їжі організовується	21
800	Ніхто зі складу варти не може залишати вартове приміщення	21
801	Коли помічник начальника варти проводить бойовий розподіл особового складу варти та ставить завдання	21
802	Взимку в житлових приміщеннях підтримується температура не нижче	21
803	Якщо підлога не натирається мастикою, її миють не менше ніж	21
804	Сержанти строкової служби, які обіймають посаду старшини роти розміщуються	21
805	Довжина в похідному положенні РПГ-22	21
806	Початкова швидкість гранати РПГ-26	21
807	Початкова швидкість гранати РПГ-22	21
808	Калібр гранати ВОГ-25П	21
809	На яку висоту “підстрибує” граната ВОГ - 25П	21
810	Носимий боєкомплект ГП-25	21
811	Маса кулемета ПКТ	21
812	Дальність до мішені при виконанні 1ВНС з ПМ	21
813	Самоліквідація підривача гранати ПГ-26	21
814	Маса СВД	21
815	Дальність прямого пострілу по фігурі, що рухається з СВД	21
816	Дальність прямого пострілу по грудній фігурі з СВД	21
1072	Початкова швидкість кулі з ПК	26
1073	Початкова швидкість кулі з ПКТ	26
1074	Маса патрона до ПК	26
1075	Початкова швидкість кулі з СВД	26
1076	Бойова швидкострільність з СВД	26
1077	Ємність магазину СВД	26
1078	Прицільна дальність з ПКТ	26
1079	Яка кількість боєприпасів використовується при виконанні 1ВНС з ПМ	26
1080	Калібр ГП-25	26
1081	Маса заряду ВВ гранати ВОГ-25	26
1082	Зона суцільного ураження осколками гранати ВОГ-25	26
1083	Початкова швидкість польоту гранати ВОГ-25	26
1084	Довжина в бойовому положенні РПГ-22	26
1085	Довжина в похідному і бойовому положенні РПГ-26	26
1086	Маса РПГ-22	26
1087	Всі описи, що знаходяться в кімнаті для зберігання зброї у ставницях, шафах і ящиках, підписуються	26
1088	На горищах, у віддалених від димарів місцях, дозволяється зберігати	26
1089	Термометри вивішуються у приміщеннях на внутрішніх стінах, подалі від печей та нагрівальних пристроїв на висоті	26
1090	Де іде розвідний під час прямування змін на пости та з постів	26
1091	Дозволяється начальникові варти відпочивати лежачи (спати), не знімаючи спорядження та не роздягаючись	26
1092	У вартовому приміщення у холодний період температура повітря підтримується не нижче	26
817	Бойова швидкострільність з ПК	21
818	Дальність прямого пострілу по грудній фігурі з ПКТ	21
819	Дальність прямого пострілу по фігурі, що рухається з ПК	21
1114	Який колір має трасуюча куля	32
1115	Дальність до мішені при перевірці бою ПК	32
1116	Кількість патронів для перевірки бою одиночними пострілами з ПК	32
1117	Маса оптичного прицілу СВД	32
1118	Дальність до мішені при перевірці бою з СВД	32
1119	З яким прицілом проводиться перевірка бою СВД	32
1120	Калібр гвинтівки СВД	32
1121	Час на виконання 1ВНС з ПМ	32
1122	Калібр РПГ-22	32
1123	Час активного газовиділення гранати “Гвоздь”	32
1124	Яка граната наповнена подразнюючим газом	32
1125	При який наводці стрільба з ГП-25 проводиться з упором приклада автомата в грунт	32
1126	Бронебійність РПГ-26	32
1127	Якої дії граната в РПГ-22	32
1128	Дистанція дальнього взведення підривача гранати ПГ-26	32
1129	Особиста зброя офіцерів та прапорщиків батальйону і патрони до неї зберігаються	32
1130	Зовнішні туалети влаштовуються з водонепроникними вигрібними ямами від житлових приміщень, їдалень і пекарень	32
1131	З ме­тою оцінки фізичного розвитку, стану здоров’я поглиблені медичні обстеження військовослужбовців строкової служби здійснюються  і прово­дяться	32
1132	Прибувши до підрозділу після зміни, начальник варти вишиковує особовий склад і доповідає про виконання завдання	32
1093	Найменша ємність кулеметної стрічки до ПК	31
1094	Маса кулемета ПК:	31
1095	Маса кулемета ПКТ	31
1096	Носимий боєкомплект СВД	31
1097	Кратність (збільшення) оптичного прицілу СВД	31
1098	Поле зору оптичного прицілу СВД	31
1099	Бойова швидкострільність з ПК	31
1100	Як називається 1ВНС з ПМ згідно КС СЗ і БМ СВ - 16	31
1101	Маса ГП - 25	31
1102	Час спрацювання самоліквідатора гранати ВОГ-25	31
1103	Маса гранати “Гвоздь”	31
1104	Яка граната має капсуль-запалювач лілового кольору	31
1105	Маса РПГ-26	31
1106	Час переводу ПУ з похідного положення в бойове РПГ-22	31
1107	Бронебійність РПГ-22	31
1108	Запасні стволи до кулеметів зберігаються	31
1109	Туалети обладнуються з розрахунку одна кабіна з унітазом (очком) та один пісуар на	31
1110	Електричне освітлення в районі розташування військової частини	31
1111	Де іде розвідний попередньої варти по відношенню до розвідного нової варти при прямуванні на пости	31
1112	Дозволяється помічникові начальника варти відпочивати лежачи (спати), не знімаючи спорядження та не роздягаючись	31
1113	В вартовому приміщенні у кімнаті відпочинку має бути	31
1133	Дозволяється розвідним, вивідним і водіям транспортних засобів відпочивати лежачи (спати), не знімаючи спорядження та не роздягаючись	32
1134	Особи, які перевіряють несення служби чатовими, супроводжуються до постів	32
1135	З яким прицілом проводиться перевірка бою ПК	33
1136	На скільки змінюється положення СТВ по висоті при повному оберті мушки при стрільбі з ПК	33
1137	Носимий боєкомплект для ПКМ	33
1138	Кучність бою з СВД визнається нормальною, якщо всі 4 пробоїни вміщуються в коло діаметром	33
1139	Кількість патронів для перевірки бою СВД	33
1140	При переміщенні запобіжника мушки в СВД в бік на 1 мм і при вкручуванні (викручуванні) мушки на один повний оберт СТВ зміщується на	33
1141	Початкова швидкість кулі з СВД	33
1142	Час на виконання вправи КС2.12.1.1	33
1143	Прицільна дальність РПГ-26	33
1144	Кратність (збільшення) прицілу НСПУ	33
1145	Дальність виявлення танків в НСПУ	33
1146	Маса НСПУ в бойовому положенні	33
1147	Якої дії граната в РПГ-26	33
1148	Дистанція дальнього взведення підривача гранати ПГ-22	33
1149	Самоліквідація підривача гранати ПГ-22	33
1150	Боєприпаси особовому складові варти видається	33
1151	Початок і кінець опалювального періоду в військової частині	33
1152	Стаціонарне лікування хворих у медичному пункті військової частини прово­диться	33
1153	Вартові, які охороняли об'єкти тільки вночі, після закінчення строку охорони об'єктів здають боєприпаси	33
1154	Дозволяється вартовим тризмінних постів відпочивати лежачи (спати), не знімаючи спорядження та не роздягаючись	33
1155	Під час перевірки несення служби чатовими йому можуть робити зауваження	33
1156	Бойова швидкострільність з СВД	27
1157	Всі описи, що знаходяться в кімнаті для зберігання зброї у ставницях, шафах і ящиках, підписуються	27
1158	Де іде розвідний під час прямування змін на пости та з постів	27
1159	Довжина в бойовому положенні РПГ-22	27
1160	Довжина в похідному і бойовому положенні РПГ-26	27
1161	Дозволяється начальникові варти відпочивати лежачи (спати), не знімаючи спорядження та не роздягаючись	27
1162	Ємність магазину СВД	27
1163	Зона суцільного ураження осколками гранати ВОГ-25	27
1164	Калібр ГП-25	27
1165	Маса заряду ВВ гранати ВОГ-25	27
1166	Маса патрона до ПК	27
1167	Маса РПГ-22	27
1168	На горищах, у віддалених від димарів місцях, дозволяється зберігати	27
1169	Початкова швидкість кулі з ПК	27
1170	Початкова швидкість кулі з ПКТ	27
1171	Початкова швидкість кулі з СВД	27
1172	Початкова швидкість польоту гранати ВОГ-25	27
1173	Прицільна дальність з ПКТ	27
1174	Термометри вивішуються у приміщеннях на внутрішніх стінах, подалі від печей та нагрівальних пристроїв на висоті	27
1175	У вартовому приміщення у холодний період температура повітря підтримується не нижче	27
1176	Яка кількість боєприпасів використовується при виконанні 1ВНС з ПМ	27
1177	Бойова швидкострільність з СВД	28
1178	Всі описи, що знаходяться в кімнаті для зберігання зброї у ставницях, шафах і ящиках, підписуються	28
1179	Де іде розвідний під час прямування змін на пости та з постів	28
1180	Довжина в бойовому положенні РПГ-22	28
1181	Довжина в похідному і бойовому положенні РПГ-26	28
1182	Дозволяється начальникові варти відпочивати лежачи (спати), не знімаючи спорядження та не роздягаючись	28
1183	Ємність магазину СВД	28
1184	Зона суцільного ураження осколками гранати ВОГ-25	28
1185	Калібр ГП-25	28
1186	Маса заряду ВВ гранати ВОГ-25	28
1187	Маса патрона до ПК	28
1188	Маса РПГ-22	28
1189	На горищах, у віддалених від димарів місцях, дозволяється зберігати	28
1190	Початкова швидкість кулі з ПК	28
1191	Початкова швидкість кулі з ПКТ	28
1192	Початкова швидкість кулі з СВД	28
1193	Початкова швидкість польоту гранати ВОГ-25	28
1194	Прицільна дальність з ПКТ	28
1195	Термометри вивішуються у приміщеннях на внутрішніх стінах, подалі від печей та нагрівальних пристроїв на висоті	28
1196	У вартовому приміщення у холодний період температура повітря підтримується не нижче	28
1197	Яка кількість боєприпасів використовується при виконанні 1ВНС з ПМ	28
1198	Бойова швидкострільність з СВД	29
1199	Всі описи, що знаходяться в кімнаті для зберігання зброї у ставницях, шафах і ящиках, підписуються	29
1200	Де іде розвідний під час прямування змін на пости та з постів	29
1201	Довжина в бойовому положенні РПГ-22	29
1202	Довжина в похідному і бойовому положенні РПГ-26	29
1203	Дозволяється начальникові варти відпочивати лежачи (спати), не знімаючи спорядження та не роздягаючись	29
1204	Ємність магазину СВД	29
1205	Зона суцільного ураження осколками гранати ВОГ-25	29
1206	Калібр ГП-25	29
1207	Маса заряду ВВ гранати ВОГ-25	29
1208	Маса патрона до ПК	29
1209	Маса РПГ-22	29
1210	На горищах, у віддалених від димарів місцях, дозволяється зберігати	29
1211	Початкова швидкість кулі з ПК	29
1212	Початкова швидкість кулі з ПКТ	29
1213	Початкова швидкість кулі з СВД	29
1214	Початкова швидкість польоту гранати ВОГ-25	29
1215	Прицільна дальність з ПКТ	29
1216	Термометри вивішуються у приміщеннях на внутрішніх стінах, подалі від печей та нагрівальних пристроїв на висоті	29
1217	У вартовому приміщення у холодний період температура повітря підтримується не нижче	29
1218	Яка кількість боєприпасів використовується при виконанні 1ВНС з ПМ	29
1219	Бойова швидкострільність з СВД	30
1220	Всі описи, що знаходяться в кімнаті для зберігання зброї у ставницях, шафах і ящиках, підписуються	30
1221	Де іде розвідний під час прямування змін на пости та з постів	30
1222	Довжина в бойовому положенні РПГ-22	30
1223	Довжина в похідному і бойовому положенні РПГ-26	30
1224	Дозволяється начальникові варти відпочивати лежачи (спати), не знімаючи спорядження та не роздягаючись	30
1225	Ємність магазину СВД	30
1226	Зона суцільного ураження осколками гранати ВОГ-25	30
1227	Калібр ГП-25	30
1228	Маса заряду ВВ гранати ВОГ-25	30
1229	Маса патрона до ПК	30
1230	Маса РПГ-22	30
1231	На горищах, у віддалених від димарів місцях, дозволяється зберігати	30
1232	Початкова швидкість кулі з ПК	30
1233	Початкова швидкість кулі з ПКТ	30
1234	Початкова швидкість кулі з СВД	30
1235	Початкова швидкість польоту гранати ВОГ-25	30
1236	Прицільна дальність з ПКТ	30
1237	Термометри вивішуються у приміщеннях на внутрішніх стінах, подалі від печей та нагрівальних пристроїв на висоті	30
1238	У вартовому приміщення у холодний період температура повітря підтримується не нижче	30
1239	Яка кількість боєприпасів використовується при виконанні 1ВНС з ПМ	30
1240	Бойова швидкострільність з ПК	34
1241	Бронебійність РПГ-22	34
1242	В вартовому приміщенні у кімнаті відпочинку має бути	34
1243	Де іде розвідний попередньої варти по відношенню до розвідного нової варти при прямуванні на пости	34
1244	Дозволяється помічникові начальника варти відпочивати лежачи (спати), не знімаючи спорядження та не роздягаючись	34
1245	Електричне освітлення в районі розташування військової частини	34
1246	Запасні стволи до кулеметів зберігаються	34
1247	Кратність (збільшення) оптичного прицілу СВД	34
1248	Маса ГП - 25	34
1249	Маса гранати “Гвоздь”	34
1250	Маса кулемета ПК:	34
1251	Маса кулемета ПКТ	34
1252	Маса РПГ-26	34
1253	Найменша ємність кулеметної стрічки до ПК	34
1254	Носимий боєкомплект СВД	34
1255	Поле зору оптичного прицілу СВД	34
1256	Туалети обладнуються з розрахунку одна кабіна з унітазом (очком) та один пісуар на	34
1257	Час переводу ПУ з похідного положення в бойове РПГ-22	34
1258	Час спрацювання самоліквідатора гранати ВОГ-25	34
1259	Яка граната має капсуль-запалювач лілового кольору	34
1260	Як називається 1ВНС з ПМ згідно КС СЗ і БМ СВ - 16	34
1261	Бойова швидкострільність з ПК	35
1262	Бронебійність РПГ-22	35
1263	В вартовому приміщенні у кімнаті відпочинку має бути	35
1264	Де іде розвідний попередньої варти по відношенню до розвідного нової варти при прямуванні на пости	35
1265	Дозволяється помічникові начальника варти відпочивати лежачи (спати), не знімаючи спорядження та не роздягаючись	35
1266	Електричне освітлення в районі розташування військової частини	35
1267	Запасні стволи до кулеметів зберігаються	35
1268	Кратність (збільшення) оптичного прицілу СВД	35
1269	Маса ГП - 25	35
1270	Маса гранати “Гвоздь”	35
1271	Маса кулемета ПК:	35
1272	Маса кулемета ПКТ	35
1273	Маса РПГ-26	35
1274	Найменша ємність кулеметної стрічки до ПК	35
1275	Носимий боєкомплект СВД	35
1276	Поле зору оптичного прицілу СВД	35
1277	Туалети обладнуються з розрахунку одна кабіна з унітазом (очком) та один пісуар на	35
1278	Час переводу ПУ з похідного положення в бойове РПГ-22	35
1279	Час спрацювання самоліквідатора гранати ВОГ-25	35
1280	Яка граната має капсуль-запалювач лілового кольору	35
1281	Як називається 1ВНС з ПМ згідно КС СЗ і БМ СВ - 16	35
1282	Бойова швидкострільність з ПК	36
1283	Бронебійність РПГ-22	36
1284	В вартовому приміщенні у кімнаті відпочинку має бути	36
1285	Де іде розвідний попередньої варти по відношенню до розвідного нової варти при прямуванні на пости	36
1286	Дозволяється помічникові начальника варти відпочивати лежачи (спати), не знімаючи спорядження та не роздягаючись	36
1287	Електричне освітлення в районі розташування військової частини	36
1288	Запасні стволи до кулеметів зберігаються	36
1289	Кратність (збільшення) оптичного прицілу СВД	36
1290	Маса ГП - 25	36
1291	Маса гранати “Гвоздь”	36
1292	Маса кулемета ПК:	36
1293	Маса кулемета ПКТ	36
1294	Маса РПГ-26	36
1295	Найменша ємність кулеметної стрічки до ПК	36
1296	Носимий боєкомплект СВД	36
1297	Поле зору оптичного прицілу СВД	36
1298	Туалети обладнуються з розрахунку одна кабіна з унітазом (очком) та один пісуар на	36
1299	Час переводу ПУ з похідного положення в бойове РПГ-22	36
1300	Час спрацювання самоліквідатора гранати ВОГ-25	36
1301	Яка граната має капсуль-запалювач лілового кольору	36
1302	Як називається 1ВНС з ПМ згідно КС СЗ і БМ СВ - 16	36
1303	Бойова швидкострільність з ПК	37
1304	Бронебійність РПГ-22	37
1305	В вартовому приміщенні у кімнаті відпочинку має бути	37
1306	Де іде розвідний попередньої варти по відношенню до розвідного нової варти при прямуванні на пости	37
1307	Дозволяється помічникові начальника варти відпочивати лежачи (спати), не знімаючи спорядження та не роздягаючись	37
1308	Електричне освітлення в районі розташування військової частини	37
1309	Запасні стволи до кулеметів зберігаються	37
1310	Кратність (збільшення) оптичного прицілу СВД	37
1311	Маса ГП - 25	37
1312	Маса гранати “Гвоздь”	37
1313	Маса кулемета ПК:	37
1314	Маса кулемета ПКТ	37
1315	Маса РПГ-26	37
1316	Найменша ємність кулеметної стрічки до ПК	37
1317	Носимий боєкомплект СВД	37
1318	Поле зору оптичного прицілу СВД	37
1319	Туалети обладнуються з розрахунку одна кабіна з унітазом (очком) та один пісуар на	37
1320	Час переводу ПУ з похідного положення в бойове РПГ-22	37
1321	Час спрацювання самоліквідатора гранати ВОГ-25	37
1322	Яка граната має капсуль-запалювач лілового кольору	37
1323	Як називається 1ВНС з ПМ згідно КС СЗ і БМ СВ - 16	37
1324	Бронебійність РПГ-26	38
1325	Дальність до мішені при перевірці бою з СВД	38
1326	Дальність до мішені при перевірці бою ПК	38
1327	Дистанція дальнього взведення підривача гранати ПГ-26	38
1328	Дозволяється розвідним, вивідним і водіям транспортних засобів відпочивати лежачи (спати), не знімаючи спорядження та не роздягаючись	38
1329	З ме­тою оцінки фізичного розвитку, стану здоров’я поглиблені медичні обстеження військовослужбовців строкової служби здійснюються  і прово­дяться	38
1330	Зовнішні туалети влаштовуються з водонепроникними вигрібними ямами від житлових приміщень, їдалень і пекарень	38
1331	З яким прицілом проводиться перевірка бою СВД	38
1332	Калібр гвинтівки СВД	38
1333	Калібр РПГ-22	38
1334	Кількість патронів для перевірки бою одиночними пострілами з ПК	38
1335	Маса оптичного прицілу СВД	38
1336	Особиста зброя офіцерів та прапорщиків батальйону і патрони до неї зберігаються	38
1337	Особи, які перевіряють несення служби чатовими, супроводжуються до постів	38
1338	Прибувши до підрозділу після зміни, начальник варти вишиковує особовий склад і доповідає про виконання завдання	38
1339	При який наводці стрільба з ГП-25 проводиться з упором приклада автомата в грунт	38
1340	Час активного газовиділення гранати “Гвоздь”	38
1341	Час на виконання 1ВНС з ПМ	38
1342	Яка граната наповнена подразнюючим газом	38
1343	Який колір має трасуюча куля	38
1344	Якої дії граната в РПГ-22	38
1345	Бронебійність РПГ-26	39
1346	Дальність до мішені при перевірці бою з СВД	39
1347	Дальність до мішені при перевірці бою ПК	39
1348	Дистанція дальнього взведення підривача гранати ПГ-26	39
1349	Дозволяється розвідним, вивідним і водіям транспортних засобів відпочивати лежачи (спати), не знімаючи спорядження та не роздягаючись	39
1350	З ме­тою оцінки фізичного розвитку, стану здоров’я поглиблені медичні обстеження військовослужбовців строкової служби здійснюються  і прово­дяться	39
1351	Зовнішні туалети влаштовуються з водонепроникними вигрібними ямами від житлових приміщень, їдалень і пекарень	39
1352	З яким прицілом проводиться перевірка бою СВД	39
1353	Калібр гвинтівки СВД	39
1354	Калібр РПГ-22	39
1355	Кількість патронів для перевірки бою одиночними пострілами з ПК	39
1356	Маса оптичного прицілу СВД	39
1357	Особиста зброя офіцерів та прапорщиків батальйону і патрони до неї зберігаються	39
1358	Особи, які перевіряють несення служби чатовими, супроводжуються до постів	39
1359	Прибувши до підрозділу після зміни, начальник варти вишиковує особовий склад і доповідає про виконання завдання	39
1360	При який наводці стрільба з ГП-25 проводиться з упором приклада автомата в грунт	39
1361	Час активного газовиділення гранати “Гвоздь”	39
1362	Час на виконання 1ВНС з ПМ	39
1363	Яка граната наповнена подразнюючим газом	39
1364	Який колір має трасуюча куля	39
1365	Якої дії граната в РПГ-22	39
1366	Бронебійність РПГ-26	40
1367	Дальність до мішені при перевірці бою з СВД	40
1368	Дальність до мішені при перевірці бою ПК	40
1369	Дистанція дальнього взведення підривача гранати ПГ-26	40
1370	Дозволяється розвідним, вивідним і водіям транспортних засобів відпочивати лежачи (спати), не знімаючи спорядження та не роздягаючись	40
1371	З ме­тою оцінки фізичного розвитку, стану здоров’я поглиблені медичні обстеження військовослужбовців строкової служби здійснюються  і прово­дяться	40
1372	Зовнішні туалети влаштовуються з водонепроникними вигрібними ямами від житлових приміщень, їдалень і пекарень	40
1373	З яким прицілом проводиться перевірка бою СВД	40
1374	Калібр гвинтівки СВД	40
1375	Калібр РПГ-22	40
1376	Кількість патронів для перевірки бою одиночними пострілами з ПК	40
1377	Маса оптичного прицілу СВД	40
1378	Особиста зброя офіцерів та прапорщиків батальйону і патрони до неї зберігаються	40
1379	Особи, які перевіряють несення служби чатовими, супроводжуються до постів	40
1380	Прибувши до підрозділу після зміни, начальник варти вишиковує особовий склад і доповідає про виконання завдання	40
1381	При який наводці стрільба з ГП-25 проводиться з упором приклада автомата в грунт	40
1382	Час активного газовиділення гранати “Гвоздь”	40
1383	Час на виконання 1ВНС з ПМ	40
1384	Яка граната наповнена подразнюючим газом	40
1385	Який колір має трасуюча куля	40
1386	Якої дії граната в РПГ-22	40
1387	Бронебійність РПГ-26	41
1388	Дальність до мішені при перевірці бою з СВД	41
1389	Дальність до мішені при перевірці бою ПК	41
1390	Дистанція дальнього взведення підривача гранати ПГ-26	41
1391	Дозволяється розвідним, вивідним і водіям транспортних засобів відпочивати лежачи (спати), не знімаючи спорядження та не роздягаючись	41
1392	З ме­тою оцінки фізичного розвитку, стану здоров’я поглиблені медичні обстеження військовослужбовців строкової служби здійснюються  і прово­дяться	41
1393	Зовнішні туалети влаштовуються з водонепроникними вигрібними ямами від житлових приміщень, їдалень і пекарень	41
1394	З яким прицілом проводиться перевірка бою СВД	41
1395	Калібр гвинтівки СВД	41
1396	Калібр РПГ-22	41
1397	Кількість патронів для перевірки бою одиночними пострілами з ПК	41
1398	Маса оптичного прицілу СВД	41
1399	Особиста зброя офіцерів та прапорщиків батальйону і патрони до неї зберігаються	41
1400	Особи, які перевіряють несення служби чатовими, супроводжуються до постів	41
1401	Прибувши до підрозділу після зміни, начальник варти вишиковує особовий склад і доповідає про виконання завдання	41
1402	При який наводці стрільба з ГП-25 проводиться з упором приклада автомата в грунт	41
1403	Час активного газовиділення гранати “Гвоздь”	41
1404	Час на виконання 1ВНС з ПМ	41
1405	Яка граната наповнена подразнюючим газом	41
1406	Який колір має трасуюча куля	41
1407	Якої дії граната в РПГ-22	41
1463	Початкова швидкість кулі з СВД	44
1408	Боєприпаси особовому складові варти видається	42
1409	Вартові, які охороняли об'єкти тільки вночі, після закінчення строку охорони об'єктів здають боєприпаси	42
1410	Дальність виявлення танків в НСПУ	42
1411	Дистанція дальнього взведення підривача гранати ПГ-22	42
1412	Дозволяється вартовим тризмінних постів відпочивати лежачи (спати), не знімаючи спорядження та не роздягаючись	42
1413	З яким прицілом проводиться перевірка бою ПК	42
1414	Кількість патронів для перевірки бою СВД	42
1415	Кратність (збільшення) прицілу НСПУ	42
1416	Кучність бою з СВД визнається нормальною, якщо всі 4 пробоїни вміщуються в коло діаметром	42
1417	Маса НСПУ в бойовому положенні	42
1418	На скільки змінюється положення СТВ по висоті при повному оберті мушки при стрільбі з ПК	42
1419	Носимий боєкомплект для ПКМ	42
1420	Під час перевірки несення служби чатовими йому можуть робити зауваження	42
1421	Початкова швидкість кулі з СВД	42
1422	Початок і кінець опалювального періоду в військової частині	42
1423	При переміщенні запобіжника мушки в СВД в бік на 1 мм і при вкручуванні (викручуванні) мушки на один повний оберт СТВ зміщується на	42
1424	Прицільна дальність РПГ-26	42
1425	Самоліквідація підривача гранати ПГ-22	42
1426	Стаціонарне лікування хворих у медичному пункті військової частини прово­диться	42
1427	Час на виконання вправи КС2.12.1.1	42
1428	Якої дії граната в РПГ-26	42
1429	Боєприпаси особовому складові варти видається	43
1430	Вартові, які охороняли об'єкти тільки вночі, після закінчення строку охорони об'єктів здають боєприпаси	43
1431	Дальність виявлення танків в НСПУ	43
1432	Дистанція дальнього взведення підривача гранати ПГ-22	43
1433	Дозволяється вартовим тризмінних постів відпочивати лежачи (спати), не знімаючи спорядження та не роздягаючись	43
1434	З яким прицілом проводиться перевірка бою ПК	43
1435	Кількість патронів для перевірки бою СВД	43
1436	Кратність (збільшення) прицілу НСПУ	43
1437	Кучність бою з СВД визнається нормальною, якщо всі 4 пробоїни вміщуються в коло діаметром	43
1438	Маса НСПУ в бойовому положенні	43
1439	На скільки змінюється положення СТВ по висоті при повному оберті мушки при стрільбі з ПК	43
1440	Носимий боєкомплект для ПКМ	43
1441	Під час перевірки несення служби чатовими йому можуть робити зауваження	43
1442	Початкова швидкість кулі з СВД	43
1443	Початок і кінець опалювального періоду в військової частині	43
1444	При переміщенні запобіжника мушки в СВД в бік на 1 мм і при вкручуванні (викручуванні) мушки на один повний оберт СТВ зміщується на	43
1445	Прицільна дальність РПГ-26	43
1446	Самоліквідація підривача гранати ПГ-22	43
1447	Стаціонарне лікування хворих у медичному пункті військової частини прово­диться	43
1448	Час на виконання вправи КС2.12.1.1	43
1449	Якої дії граната в РПГ-26	43
1450	Боєприпаси особовому складові варти видається	44
1451	Вартові, які охороняли об'єкти тільки вночі, після закінчення строку охорони об'єктів здають боєприпаси	44
1452	Дальність виявлення танків в НСПУ	44
1453	Дистанція дальнього взведення підривача гранати ПГ-22	44
1454	Дозволяється вартовим тризмінних постів відпочивати лежачи (спати), не знімаючи спорядження та не роздягаючись	44
1455	З яким прицілом проводиться перевірка бою ПК	44
1456	Кількість патронів для перевірки бою СВД	44
1457	Кратність (збільшення) прицілу НСПУ	44
1458	Кучність бою з СВД визнається нормальною, якщо всі 4 пробоїни вміщуються в коло діаметром	44
1459	Маса НСПУ в бойовому положенні	44
1460	На скільки змінюється положення СТВ по висоті при повному оберті мушки при стрільбі з ПК	44
1461	Носимий боєкомплект для ПКМ	44
1462	Під час перевірки несення служби чатовими йому можуть робити зауваження	44
1464	Початок і кінець опалювального періоду в військової частині	44
1465	При переміщенні запобіжника мушки в СВД в бік на 1 мм і при вкручуванні (викручуванні) мушки на один повний оберт СТВ зміщується на	44
1466	Прицільна дальність РПГ-26	44
1467	Самоліквідація підривача гранати ПГ-22	44
1468	Стаціонарне лікування хворих у медичному пункті військової частини прово­диться	44
1469	Час на виконання вправи КС2.12.1.1	44
1470	Якої дії граната в РПГ-26	44
1471	Боєприпаси особовому складові варти видається	45
1472	Вартові, які охороняли об'єкти тільки вночі, після закінчення строку охорони об'єктів здають боєприпаси	45
1473	Дальність виявлення танків в НСПУ	45
1474	Дистанція дальнього взведення підривача гранати ПГ-22	45
1475	Дозволяється вартовим тризмінних постів відпочивати лежачи (спати), не знімаючи спорядження та не роздягаючись	45
1476	З яким прицілом проводиться перевірка бою ПК	45
1477	Кількість патронів для перевірки бою СВД	45
1478	Кратність (збільшення) прицілу НСПУ	45
1479	Кучність бою з СВД визнається нормальною, якщо всі 4 пробоїни вміщуються в коло діаметром	45
1480	Маса НСПУ в бойовому положенні	45
1481	На скільки змінюється положення СТВ по висоті при повному оберті мушки при стрільбі з ПК	45
1482	Носимий боєкомплект для ПКМ	45
1483	Під час перевірки несення служби чатовими йому можуть робити зауваження	45
1484	Початкова швидкість кулі з СВД	45
1485	Початок і кінець опалювального періоду в військової частині	45
1486	При переміщенні запобіжника мушки в СВД в бік на 1 мм і при вкручуванні (викручуванні) мушки на один повний оберт СТВ зміщується на	45
1487	Прицільна дальність РПГ-26	45
1488	Самоліквідація підривача гранати ПГ-22	45
1489	Стаціонарне лікування хворих у медичному пункті військової частини прово­диться	45
1490	Час на виконання вправи КС2.12.1.1	45
1491	Якої дії граната в РПГ-26	45
\.


--
-- Data for Name: Quizzes; Type: TABLE DATA; Schema: public; Owner: zvp_user
--

COPY public."Quizzes" (id, quiz_title, quiz_description, quiz_single_attempt, quiz_time, quiz_discipline_id, quiz_type) FROM stdin;
1	Контрольна №1		f	10:00	1	Контрольна робота
\.


--
-- Data for Name: Results; Type: TABLE DATA; Schema: public; Owner: zvp_user
--

COPY public."Results" (id, results, date_time_stamp, student_id, test_id, ticket_id) FROM stdin;
\.


--
-- Data for Name: Students; Type: TABLE DATA; Schema: public; Owner: zvp_user
--

COPY public."Students" (id, student_active, student_full_name, student_university_group, student_faculty, student_grade, student_state, student_notes, student_troop_id, user_id, troop_commander) FROM stdin;
\.


--
-- Data for Name: Teacher's ranks; Type: TABLE DATA; Schema: public; Owner: zvp_user
--

COPY public."Teacher's ranks" (id, teacher_rank) FROM stdin;
\.


--
-- Data for Name: Teachers; Type: TABLE DATA; Schema: public; Owner: zvp_user
--

COPY public."Teachers" (id, teacher_full_name, teacher_check_tests, teacher_department_id, teacher_rank_id) FROM stdin;
\.


--
-- Data for Name: Troops; Type: TABLE DATA; Schema: public; Owner: zvp_user
--

COPY public."Troops" (id, troop_id, troop_department_id, troop_head_id, troop_head_rank_id) FROM stdin;
\.


--
-- Data for Name: accesses; Type: TABLE DATA; Schema: public; Owner: zvp_user
--

COPY public.accesses (id, access_granted, quiz_id, student_id) FROM stdin;
\.


--
-- Data for Name: answers; Type: TABLE DATA; Schema: public; Owner: zvp_user
--

COPY public.answers (id, title, is_true, question_id) FROM stdin;
2017	5,45 мм	f	1
2018	7,62 мм	t	1
2019	до 800 м	f	2
2020	40 мм	t	10
2021	40 мм	f	13
2022	73 мм	t	13
2023	64 мм	f	13
2276	7,62 мм	t	295
2277	5,45 мм	f	295
2278	12,7 мм	f	295
2279	до 800 м	f	296
2280	до 1000м	t	296
2281	до 1500 м	f	296
2282	800м	f	297
2283	1000м	f	297
2284	1500м	t	297
2285	7,62 мм	t	298
2286	9 мм	f	298
2287	5,45 мм	f	298
2288	до 1200 м	f	299
2289	до 1000 м	f	299
2290	до 800 м	t	299
2291	1200 м	t	300
2292	1000 м	f	300
2293	1300 м	f	300
2294	“5” - 30; “4” - 25; “3” - 20	f	301
2295	“5” - 40; “4” - 35; “3” - 30	f	301
2296	“5” - 35; “4” - 30; “3” - 25	t	301
2297	15 см	t	302
2298	18 см	f	302
2299	12 см	f	302
2300	для більшої бронебійності кулі	f	303
2301	для більшої кучності бою	t	303
2302	для більшої дальності польоту кулі	f	303
2303	40 мм	t	304
2304	37 мм	f	304
2305	30 мм	f	304
2306	12	t	305
2307	10	f	305
2308	4	f	305
2309	до 300 м	f	306
2310	до 250 м	t	306
2311	до 200 м	f	306
2312	64 мм	f	307
2313	73 мм	t	307
2314	40 мм	f	307
2315	73 мм	t	308
2316	40 мм	f	308
2317	64 мм	f	308
2318	300 м	f	309
2319	200 м	f	309
2320	250 м	t	309
2321	ярликами із зазначенням номерами, військового звання, прізвища та ініціалів військовослужбовця	f	310
2322	ярликами із зазначенням військового звання, прізвища та ініціалів військовослужбовця	t	310
2323	номерами	f	310
2324	у визначений колір.	t	311
2325	у колір державного прапора	f	311
2326	у маскуючий колір	f	311
2327	за тригодини до відбою	f	312
2328	за дві години до відбою	t	312
2329	за одну годину до відбою	f	312
2330	50 хвилин	f	313
2331	40 хвилин	t	313
2332	30 хвилин	f	313
2333	на 4 години після прибуття до підрозділу	f	314
2334	у день зміни	t	314
2335	на 4 години після зміни	f	314
2336	тільки чатовий на вході до вартового приміщення	f	315
2337	тільки розвідний	f	315
2338	начальник варти та його помічник	t	315
2339	7,62 мм	t	316
2340	5,45 мм	f	316
2341	12,7 мм	f	316
2342	до 800 м	f	317
2343	до 1000м	t	317
2344	до 1500 м	f	317
2345	800м	f	318
2346	1000м	f	318
2347	1500м	t	318
2348	7,62 мм	t	319
2349	9 мм	f	319
2350	5,45 мм	f	319
2351	до 1200 м	f	320
2352	до 1000 м	f	320
2353	до 800 м	t	320
2354	1200 м	t	321
2355	1000 м	f	321
2356	1300 м	f	321
2357	“5” - 30; “4” - 25; “3” - 20	f	322
2358	“5” - 40; “4” - 35; “3” - 30	f	322
2359	“5” - 35; “4” - 30; “3” - 25	t	322
2360	15 см	t	323
2361	18 см	f	323
2362	12 см	f	323
2363	для більшої бронебійності кулі	f	324
2364	для більшої кучності бою	t	324
2365	для більшої дальності польоту кулі	f	324
2366	40 мм	t	325
2367	37 мм	f	325
2368	30 мм	f	325
2369	12	t	326
2370	10	f	326
2371	4	f	326
2372	до 300 м	f	327
2373	до 250 м	t	327
2374	до 200 м	f	327
2375	64 мм	f	328
2376	73 мм	t	328
2377	40 мм	f	328
2378	73 мм	t	329
2379	40 мм	f	329
2380	64 мм	f	329
2381	300 м	f	330
2382	200 м	f	330
2383	250 м	t	330
2384	ярликами із зазначенням номерами, військового звання, прізвища та ініціалів військовослужбовця	f	331
2385	ярликами із зазначенням військового звання, прізвища та ініціалів військовослужбовця	t	331
2386	номерами	f	331
2387	у визначений колір.	t	332
2388	у колір державного прапора	f	332
2389	у маскуючий колір	f	332
2390	за тригодини до відбою	f	333
2391	за дві години до відбою	t	333
2392	за одну годину до відбою	f	333
2393	50 хвилин	f	334
2394	40 хвилин	t	334
2395	30 хвилин	f	334
2396	на 4 години після прибуття до підрозділу	f	335
2397	у день зміни	t	335
2398	на 4 години після зміни	f	335
2399	тільки чатовий на вході до вартового приміщення	f	336
2400	тільки розвідний	f	336
2401	начальник варти та його помічник	t	336
2402	7,62 мм	t	337
2403	5,45 мм	f	337
2404	12,7 мм	f	337
2405	до 800 м	f	338
2406	до 1000м	t	338
2407	до 1500 м	f	338
2408	800м	f	339
2409	1000м	f	339
2410	1500м	t	339
2411	7,62 мм	t	340
2412	9 мм	f	340
2413	5,45 мм	f	340
2414	до 1200 м	f	341
2415	до 1000 м	f	341
2416	до 800 м	t	341
2417	1200 м	t	342
2418	1000 м	f	342
2419	1300 м	f	342
2420	“5” - 30; “4” - 25; “3” - 20	f	343
2421	“5” - 40; “4” - 35; “3” - 30	f	343
2422	“5” - 35; “4” - 30; “3” - 25	t	343
2423	15 см	t	344
2424	18 см	f	344
2425	12 см	f	344
2426	для більшої бронебійності кулі	f	345
2427	для більшої кучності бою	t	345
2428	для більшої дальності польоту кулі	f	345
2429	40 мм	t	346
2430	37 мм	f	346
2431	30 мм	f	346
2432	12	t	347
2433	10	f	347
2434	4	f	347
2435	до 300 м	f	348
2436	до 250 м	t	348
2437	до 200 м	f	348
2438	64 мм	f	349
2439	73 мм	t	349
2440	40 мм	f	349
2441	73 мм	t	350
2442	40 мм	f	350
2443	64 мм	f	350
2444	300 м	f	351
2445	200 м	f	351
2446	250 м	t	351
2447	ярликами із зазначенням номерами, військового звання, прізвища та ініціалів військовослужбовця	f	352
2448	ярликами із зазначенням військового звання, прізвища та ініціалів військовослужбовця	t	352
2449	номерами	f	352
2450	у визначений колір.	t	353
2451	у колір державного прапора	f	353
2452	у маскуючий колір	f	353
2453	за тригодини до відбою	f	354
2454	за дві години до відбою	t	354
2455	за одну годину до відбою	f	354
2456	50 хвилин	f	355
2457	40 хвилин	t	355
2458	30 хвилин	f	355
2459	на 4 години після прибуття до підрозділу	f	356
2460	у день зміни	t	356
2461	на 4 години після зміни	f	356
2462	тільки чатовий на вході до вартового приміщення	f	357
2463	тільки розвідний	f	357
2464	начальник варти та його помічник	t	357
2465	7,62 мм	t	358
2466	5,45 мм	f	358
2467	12,7 мм	f	358
2468	до 800 м	f	359
2469	до 1000м	t	359
2470	до 1500 м	f	359
2471	800м	f	360
2472	1000м	f	360
2473	1500м	t	360
2474	7,62 мм	t	361
2475	9 мм	f	361
2476	5,45 мм	f	361
2477	до 1200 м	f	362
2478	до 1000 м	f	362
2479	до 800 м	t	362
2480	1200 м	t	363
2481	1000 м	f	363
2482	1300 м	f	363
2483	“5” - 30; “4” - 25; “3” - 20	f	364
2484	“5” - 40; “4” - 35; “3” - 30	f	364
2485	“5” - 35; “4” - 30; “3” - 25	t	364
2486	15 см	t	365
2487	18 см	f	365
2488	12 см	f	365
2489	для більшої бронебійності кулі	f	366
2490	для більшої кучності бою	t	366
2491	для більшої дальності польоту кулі	f	366
2492	40 мм	t	367
2493	37 мм	f	367
2494	30 мм	f	367
2495	12	t	368
2496	10	f	368
2497	4	f	368
2498	до 300 м	f	369
2499	до 250 м	t	369
2500	до 200 м	f	369
2501	64 мм	f	370
2502	73 мм	t	370
2503	40 мм	f	370
2504	73 мм	t	371
2505	40 мм	f	371
2506	64 мм	f	371
2507	300 м	f	372
2508	200 м	f	372
2509	250 м	t	372
2510	ярликами із зазначенням номерами, військового звання, прізвища та ініціалів військовослужбовця	f	373
2511	ярликами із зазначенням військового звання, прізвища та ініціалів військовослужбовця	t	373
2512	номерами	f	373
2513	у визначений колір.	t	374
2514	у колір державного прапора	f	374
2515	у маскуючий колір	f	374
2516	за тригодини до відбою	f	375
2517	за дві години до відбою	t	375
2518	за одну годину до відбою	f	375
2519	50 хвилин	f	376
2520	40 хвилин	t	376
2521	30 хвилин	f	376
2522	на 4 години після прибуття до підрозділу	f	377
2523	у день зміни	t	377
2524	на 4 години після зміни	f	377
2525	тільки чатовий на вході до вартового приміщення	f	378
2526	тільки розвідний	f	378
2527	начальник варти та його помічник	t	378
3781	150 п/хв.	f	1240
3782	220 мм	f	1241
3783	200 мм	t	1241
3784	250 мм	f	1241
3785	постійне освітлення.	f	1242
3786	постійне темно - синє  освітлення	t	1242
3787	постійно виключене освітлення	f	1242
3788	поруч і праворуч	f	1243
3789	іде на чолі колони	f	1243
3790	поруч і зліва	t	1243
3791	не більше 2 годин у денний час та 2 годин у нічний час	f	1244
3792	не більше 4 годин у нічний час	f	1244
3793	не більше 4 годин з дозволу начальника варти	t	1244
3794	на ніч вмикається сине чергове освітлення	f	1245
3795	на ніч не вимикається і підтримується у черговому режимі	t	1245
3796	Вимикається на ніч для світломаскування	f	1245
3797	на складах	f	1246
3798	в металевих замкнених шафах або ящиках	f	1246
3799	у ставницях	t	1246
3800	4,5х	f	1247
3801	4х	t	1247
3802	3,5х	f	1247
3803	2 кг	f	1248
3804	1,3 кг	f	1248
3805	1,5 кг	t	1248
3806	225 гр.	f	1249
3807	170 гр.	t	1249
3808	150 гр.	f	1249
3809	10 кг	f	1250
3810	9,5 кг	f	1250
3811	9 кг	t	1250
3812	10,5 кг	t	1251
3813	9,5 кг	f	1251
3814	9 кг	f	1251
3815	2,7 кг	f	1252
3816	2,9 кг	t	1252
3817	3 кг	f	1252
3818	150 патр.	f	1253
3819	100 патр.	t	1253
3820	50 патр.	f	1253
3821	50 патр.	t	1254
3822	45 патр.	f	1254
3823	30 патр.	f	1254
3824	5 град.	f	1255
3825	7 град.	f	1255
3826	6 град.	t	1255
3827	8-10 осіб	f	1256
3828	12-14 осіб	f	1256
3829	10-12 осіб	t	1256
3830	6-8 с	f	1257
3831	10-12 с	f	1257
3832	8-10 с	t	1257
3833	14-19 с	t	1258
3834	10-15 с	f	1258
3835	15-20 с	f	1258
3836	ВОГ-25	f	1259
3837	ВОГ-25П	t	1259
3838	ВФГ-25	f	1259
3839	КС2.12.1.1	t	1260
3840	КС2.01.1.1	f	1260
3841	КС4.16.1.1	f	1260
3842	250 п/хв.	t	1261
3843	200 п/хв.	f	1261
3844	150 п/хв.	f	1261
3845	220 мм	f	1262
3846	200 мм	t	1262
3847	250 мм	f	1262
3848	постійне освітлення.	f	1263
3849	постійне темно - синє  освітлення	t	1263
3850	постійно виключене освітлення	f	1263
3851	поруч і праворуч	f	1264
3852	іде на чолі колони	f	1264
3853	поруч і зліва	t	1264
3854	не більше 2 годин у денний час та 2 годин у нічний час	f	1265
3855	не більше 4 годин у нічний час	f	1265
3856	не більше 4 годин з дозволу начальника варти	t	1265
3857	на ніч вмикається сине чергове освітлення	f	1266
3858	на ніч не вимикається і підтримується у черговому режимі	t	1266
3859	Вимикається на ніч для світломаскування	f	1266
3860	на складах	f	1267
3861	в металевих замкнених шафах або ящиках	f	1267
3862	у ставницях	t	1267
3863	4,5х	f	1268
3864	4х	t	1268
3865	3,5х	f	1268
3866	2 кг	f	1269
3867	1,3 кг	f	1269
3868	1,5 кг	t	1269
3869	225 гр.	f	1270
3870	170 гр.	t	1270
3871	150 гр.	f	1270
3872	10 кг	f	1271
3873	9,5 кг	f	1271
3874	9 кг	t	1271
3875	10,5 кг	t	1272
3876	9,5 кг	f	1272
3877	9 кг	f	1272
3878	2,7 кг	f	1273
3879	2,9 кг	t	1273
3880	3 кг	f	1273
3881	150 патр.	f	1274
3882	100 патр.	t	1274
3883	50 патр.	f	1274
3884	50 патр.	t	1275
3885	45 патр.	f	1275
3886	30 патр.	f	1275
3887	5 град.	f	1276
3888	7 град.	f	1276
3889	6 град.	t	1276
3890	8-10 осіб	f	1277
2528	800м	f	379
2529	1000м	f	379
2530	1500м	t	379
2531	360м	f	380
2532	420м	t	380
2533	400м	f	380
2534	420м	f	381
2535	440м	t	381
2536	640м	f	381
2537	1200 м	f	382
2538	1300 м	t	382
2539	1000 м	f	382
2540	300 м	t	383
2541	1000 м	f	383
2542	800 м	f	383
2543	300 м	t	384
2544	350 м	t	384
2545	340 м	f	384
2546	90 град	t	385
2547	120 град.	f	385
2548	30 град.	f	385
2549	№ 4А	f	386
2550	№ 6	f	386
2551	№ 4	t	386
2552	до 15 м	f	387
2553	до 30 м	t	387
2554	до 20 м	f	387
2555	до 250 м	f	388
2556	до 200 м	f	388
2557	до 150 м	f	388
2558	1,5 кг	t	389
2559	1,3 кг	f	389
2560	2 кг	f	389
2561	4-5 п/хв.	t	390
2562	3-4 п/хв.	f	390
2563	5-6 п/хв.	f	390
2564	300 м	f	391
2565	250 м	t	391
2566	200 м	f	391
3891	12-14 осіб	f	1277
3892	10-12 осіб	t	1277
3893	6-8 с	f	1278
3894	10-12 с	f	1278
3895	8-10 с	t	1278
3896	14-19 с	t	1279
3897	10-15 с	f	1279
3898	15-20 с	f	1279
3899	ВОГ-25	f	1280
3900	ВОГ-25П	t	1280
3901	ВФГ-25	f	1280
3902	КС2.12.1.1	t	1281
3903	КС2.01.1.1	f	1281
3904	КС4.16.1.1	f	1281
3905	250 п/хв.	t	1282
3906	200 п/хв.	f	1282
3907	150 п/хв.	f	1282
3908	220 мм	f	1283
3909	200 мм	t	1283
3910	250 мм	f	1283
3911	постійне освітлення.	f	1284
3912	постійне темно - синє  освітлення	t	1284
3913	постійно виключене освітлення	f	1284
3914	поруч і праворуч	f	1285
3915	іде на чолі колони	f	1285
3916	поруч і зліва	t	1285
3917	не більше 2 годин у денний час та 2 годин у нічний час	f	1286
3918	не більше 4 годин у нічний час	f	1286
3919	не більше 4 годин з дозволу начальника варти	t	1286
3920	на ніч вмикається сине чергове освітлення	f	1287
3921	на ніч не вимикається і підтримується у черговому режимі	t	1287
3922	Вимикається на ніч для світломаскування	f	1287
3923	на складах	f	1288
3924	в металевих замкнених шафах або ящиках	f	1288
3925	у ставницях	t	1288
3926	4,5х	f	1289
3927	4х	t	1289
3928	3,5х	f	1289
3929	2 кг	f	1290
3930	1,3 кг	f	1290
3931	1,5 кг	t	1290
3932	225 гр.	f	1291
3933	170 гр.	t	1291
3934	150 гр.	f	1291
3935	10 кг	f	1292
3936	9,5 кг	f	1292
3937	9 кг	t	1292
3938	10,5 кг	t	1293
3939	9,5 кг	f	1293
3940	9 кг	f	1293
3941	2,7 кг	f	1294
3942	2,9 кг	t	1294
3943	3 кг	f	1294
3944	150 патр.	f	1295
3945	100 патр.	t	1295
3946	50 патр.	f	1295
3947	50 патр.	t	1296
3948	45 патр.	f	1296
3949	30 патр.	f	1296
3950	5 град.	f	1297
3951	7 град.	f	1297
3952	6 град.	t	1297
3953	8-10 осіб	f	1298
3954	12-14 осіб	f	1298
3955	10-12 осіб	t	1298
3956	6-8 с	f	1299
3957	10-12 с	f	1299
3958	8-10 с	t	1299
3959	14-19 с	t	1300
3960	10-15 с	f	1300
3961	15-20 с	f	1300
3962	ВОГ-25	f	1301
3963	ВОГ-25П	t	1301
3964	ВФГ-25	f	1301
3965	КС2.12.1.1	t	1302
3966	КС2.01.1.1	f	1302
3967	КС4.16.1.1	f	1302
3968	250 п/хв.	t	1303
3969	200 п/хв.	f	1303
3970	150 п/хв.	f	1303
3971	220 мм	f	1304
3972	200 мм	t	1304
3973	250 мм	f	1304
3974	постійне освітлення.	f	1305
3975	постійне темно - синє  освітлення	t	1305
3976	постійно виключене освітлення	f	1305
3977	поруч і праворуч	f	1306
3978	іде на чолі колони	f	1306
3979	поруч і зліва	t	1306
3980	не більше 2 годин у денний час та 2 годин у нічний час	f	1307
3981	не більше 4 годин у нічний час	f	1307
3982	не більше 4 годин з дозволу начальника варти	t	1307
3983	на ніч вмикається сине чергове освітлення	f	1308
3984	на ніч не вимикається і підтримується у черговому режимі	t	1308
3985	Вимикається на ніч для світломаскування	f	1308
2567	150 м	f	392
2568	200 м	f	392
2569	160м	t	392
2570	160 м	f	393
2571	170 м	t	393
2572	200 м	f	393
2573	поблизу розташування військової частини	t	394
2574	в окремому приміщенні (кімнаті) казарми	f	394
2575	на квартирах поза розташуванням військової частини	f	394
2576	днювальними по роті під безпосереднім  наглядом  чергового роти	f	395
2577	черговими прибиральниками під безпосереднім  наглядом  чергового роти	t	395
2578	черговими прибиральниками під безпосереднім  наглядом  старшини роти	f	395
2579	днювального  й чергового роти	f	396
2580	відповідального за опалення й чергового роти	f	396
2581	старшину й чергового роти	t	396
2582	на чолі варти	f	397
2583	поруч і зліва	f	397
2584	поруч і справа	t	397
2585	на 4 години після зміни	f	398
2586	на 4 години після прибуття до підрозділу	t	398
2587	у день зміни	f	398
2588	за розпорядженням командира частини, від якої вона віднаряджена, або чергового військової частини	t	399
2589	за розпорядженням чергового варт	f	399
2590	за розпорядженням начальника гарнізону	f	399
3986	на складах	f	1309
3987	в металевих замкнених шафах або ящиках	f	1309
3988	у ставницях	t	1309
3989	4,5х	f	1310
3990	4х	t	1310
3991	3,5х	f	1310
3992	2 кг	f	1311
3993	1,3 кг	f	1311
3994	1,5 кг	t	1311
3995	225 гр.	f	1312
3996	170 гр.	t	1312
3997	150 гр.	f	1312
3998	10 кг	f	1313
3999	9,5 кг	f	1313
4000	9 кг	t	1313
4001	10,5 кг	t	1314
4002	9,5 кг	f	1314
4003	9 кг	f	1314
4004	2,7 кг	f	1315
4005	2,9 кг	t	1315
4006	3 кг	f	1315
4007	150 патр.	f	1316
4008	100 патр.	t	1316
4009	50 патр.	f	1316
4010	50 патр.	t	1317
4011	45 патр.	f	1317
4012	30 патр.	f	1317
4013	5 град.	f	1318
4014	7 град.	f	1318
4015	6 град.	t	1318
4016	8-10 осіб	f	1319
4017	12-14 осіб	f	1319
4018	10-12 осіб	t	1319
4019	6-8 с	f	1320
4020	10-12 с	f	1320
4021	8-10 с	t	1320
4022	14-19 с	t	1321
4023	10-15 с	f	1321
4024	15-20 с	f	1321
4025	ВОГ-25	f	1322
4026	ВОГ-25П	t	1322
4027	ВФГ-25	f	1322
4028	КС2.12.1.1	t	1323
4029	КС2.01.1.1	f	1323
4030	КС4.16.1.1	f	1323
4280	осколкової	f	1407
4281	фугасної	f	1407
4282	кумулятивної	t	1407
4283	під особисту розписку в книзі видачі зброї та боєприпасів,	f	1408
4284	під підпис помічника начальника варти в книзі видачі зброї та боєприпасів	f	1408
4285	під підпис начальника варти в книзі видачі зброї та боєприпасів.	t	1408
4286	начальникові варти	t	1409
4287	розвідному	f	1409
4288	заступнику начальникові варти	f	1409
4289	600 м	t	1410
4290	500 м	f	1410
4291	400 м	f	1410
4292	3-10 м	f	1411
4293	2,5-15 м	t	1411
4294	5-15 м	f	1411
4295	перед заступанням на пости (після того, як повернеться зміна з постів та буде проведено у варті бойовий розподіл)	t	1412
4296	після повернення з постів (після того, як повернеться зміна з постів та буде проведено у варті бойовий розподіл)	f	1412
4297	по розпорядженню начальника варти в будь-який час	f	1412
4298	постійний (П)	f	1413
4299	1	f	1413
4300	3	t	1413
4301	3 патр.	f	1414
4302	4 патр.	t	1414
4303	5 патр.	f	1414
4304	7х	f	1415
4305	3,5х	t	1415
4306	4х	f	1415
4307	15 см	f	1416
4308	10 см	f	1416
4309	8 см	t	1416
4310	2 кг	f	1417
4311	2,2 кг	t	1417
4312	1,5 кг	f	1417
4313	на 20 см	f	1418
4314	на 12 см	t	1418
4315	на 15 см	f	1418
4316	650 патр.	f	1419
4317	600 патр.	t	1419
4318	700 патр.	f	1419
4319	особи, яким чатові підпорядковані	t	1420
4426	3	t	1455
4427	3 патр.	f	1456
4428	4 патр.	t	1456
3023	150 п/хв.	f	1051
3024	200 п/хв.	f	1051
3025	250 п/хв.	t	1051
3026	+18° С	t	1052
3027	+20° С	f	1052
3028	+22° С	f	1052
3029	50 м	f	1053
3030	25 м	t	1053
3031	20 м	f	1053
3032	420 м	f	1054
3033	440 м	t	1054
3034	640 м	f	1054
3035	420 м	f	1055
3036	450 м	t	1055
3037	430 м	f	1055
3038	440 м	f	1056
3039	670 м	f	1056
3040	640 м	t	1056
3041	650 м	f	1057
3042	640 м	t	1057
3043	670 м	f	1057
3044	750 мм	f	1058
3045	755 мм	t	1058
3046	760 мм	f	1058
3047	30 мм	f	1059
3048	35 мм	f	1059
3049	40 мм	t	1059
3050	до відправлення першої зміни на пости	f	1060
3051	після того, як перша зміна піде на пости	t	1060
3052	після того, як перша зміна прийде з постів	f	1060
3053	9 кг	f	1061
3054	9,5 кг	f	1061
3055	10,5 кг	t	1061
3056	4,2 кг	f	1062
3057	4 кг	f	1062
3058	4,3 кг	t	1062
3059	20-50 см	f	1063
3060	50-100 см	f	1063
3061	50-150см	t	1063
3062	без дозволу командира частини	f	1064
3063	без дозволу розвідного	f	1064
3064	без дозволу начальника варти.	t	1064
3065	12 постр	f	1065
3066	10 постр.	t	1065
3067	15 постр.	f	1065
3068	120 м/с	f	1066
3069	130 м/с	f	1066
3070	133 м/с	t	1066
3071	133 м/с	f	1067
3072	144 м/с	t	1067
3073	155 м/с	f	1067
3074	3,5-6,5 с	f	1068
3075	4,5-6,5 с	f	1068
3076	3,5-8 с	t	1068
3077	поблизу розташування військової частини	t	1069
3078	в окремому приміщенні (кімнаті) казарми	f	1069
3079	на квартирах поза розташуванням військової частини	f	1069
3080	черговим військової частини	f	1070
3081	за розпорядженням командира частини, від якої вона віднаряджена, або чергового військової частини	f	1070
3082	начальником варти	t	1070
3083	один раз на тиждень	t	1071
3084	два раза на тиждень	f	1071
3085	один раз на день	f	1071
3086	150 п/хв.	f	775
3087	200 п/хв.	f	775
3088	250 п/хв.	t	775
3089	+18° С	t	760
3090	+20° С	f	760
3091	+22° С	f	760
3092	50 м	f	770
3093	25 м	t	770
3094	20 м	f	770
3095	420 м	f	776
3096	440 м	t	776
3097	640 м	f	776
3098	420 м	f	774
3099	450 м	t	774
3100	430 м	f	774
3101	440 м	f	777
3102	670 м	f	777
3103	640 м	t	777
3104	650 м	f	773
3105	640 м	t	773
3106	670 м	f	773
3107	750 мм	f	763
3108	755 мм	t	763
3109	760 мм	f	763
3110	30 мм	f	766
3111	35 мм	f	766
3112	40 мм	t	766
3113	до відправлення першої зміни на пости	f	759
3114	після того, як перша зміна піде на пости	t	759
3115	після того, як перша зміна прийде з постів	f	759
3116	9 кг	f	769
3117	9,5 кг	f	769
3118	10,5 кг	t	769
3119	4,2 кг	f	772
3120	4 кг	f	772
3121	4,3 кг	t	772
3122	20-50 см	f	767
3123	50-100 см	f	767
3124	50-150см	t	767
3125	без дозволу командира частини	f	758
3126	без дозволу розвідного	f	758
3127	без дозволу начальника варти.	t	758
3128	12 постр	f	768
3129	10 постр.	t	768
3130	15 постр.	f	768
3131	120 м/с	f	765
3132	130 м/с	f	765
3133	133 м/с	t	765
3134	133 м/с	f	764
3135	144 м/с	t	764
3136	155 м/с	f	764
3137	3,5-6,5 с	f	771
3138	4,5-6,5 с	f	771
3139	3,5-8 с	t	771
3140	поблизу розташування військової частини	t	762
3141	в окремому приміщенні (кімнаті) казарми	f	762
3142	на квартирах поза розташуванням військової частини	f	762
3143	черговим військової частини	f	757
4031	220 мм	t	1324
4032	250 мм	f	1324
4033	200 мм	f	1324
4034	150 м	f	1325
4035	100 м	t	1325
4036	200 м	f	1325
4037	100 м	t	1326
4038	150 м	f	1326
4039	50 м	f	1326
4040	5-15 м	f	1327
4041	3,5-10,5 м	f	1327
4042	2,5-15 м	t	1327
4043	у вільний час	f	1328
4424	постійний (П)	f	1455
2603	800м	f	484
2604	1000м	f	484
2605	1500м	t	484
2606	360м	f	485
2607	420м	t	485
2608	400м	f	485
2609	420м	f	486
2610	440м	t	486
2611	640м	f	486
2612	1200 м	f	487
2613	1300 м	t	487
2614	1000 м	f	487
2615	300 м	t	488
2616	1000 м	f	488
2617	800 м	f	488
2618	300 м	t	489
2619	350 м	t	489
2620	340 м	f	489
2621	90 град	t	490
2622	120 град.	f	490
2623	30 град.	f	490
2624	№ 4А	f	491
2625	№ 6	f	491
2626	№ 4	t	491
2627	до 15 м	f	492
2628	до 30 м	t	492
2629	до 20 м	f	492
2630	до 250 м	f	493
2631	до 200 м	f	493
2632	до 150 м	f	493
2633	1,5 кг	t	494
2634	1,3 кг	f	494
2635	2 кг	f	494
2636	4-5 п/хв.	t	495
2637	3-4 п/хв.	f	495
2638	5-6 п/хв.	f	495
2639	300 м	f	496
2640	250 м	t	496
2641	200 м	f	496
2642	150 м	f	497
2643	200 м	f	497
2644	160м	t	497
2645	160 м	f	498
2646	170 м	t	498
2647	200 м	f	498
2648	поблизу розташування військової частини	t	499
2649	в окремому приміщенні (кімнаті) казарми	f	499
2650	на квартирах поза розташуванням військової частини	f	499
2651	днювальними по роті під безпосереднім  наглядом  чергового роти	f	500
2652	черговими прибиральниками під безпосереднім  наглядом  чергового роти	t	500
2653	черговими прибиральниками під безпосереднім  наглядом  старшини роти	f	500
2654	днювального  й чергового роти	f	501
2655	відповідального за опалення й чергового роти	f	501
2656	старшину й чергового роти	t	501
2657	на чолі варти	f	502
2658	поруч і зліва	f	502
2659	поруч і справа	t	502
2660	на 4 години після зміни	f	503
2661	на 4 години після прибуття до підрозділу	t	503
2662	у день зміни	f	503
2663	за розпорядженням командира частини, від якої вона віднаряджена, або чергового військової частини	t	504
2664	за розпорядженням чергового варт	f	504
2665	за розпорядженням начальника гарнізону	f	504
2666	800м	f	505
2667	1000м	f	505
2668	1500м	t	505
2669	360м	f	506
2670	420м	t	506
2671	400м	f	506
2672	420м	f	507
2673	440м	t	507
2674	640м	f	507
2675	1200 м	f	508
2676	1300 м	t	508
2677	1000 м	f	508
2678	300 м	t	509
2679	1000 м	f	509
2680	800 м	f	509
2681	300 м	t	510
2682	350 м	t	510
2683	340 м	f	510
2684	90 град	t	511
2685	120 град.	f	511
2686	30 град.	f	511
2687	№ 4А	f	512
2688	№ 6	f	512
2689	№ 4	t	512
2690	до 15 м	f	513
2691	до 30 м	t	513
2692	до 20 м	f	513
2693	до 250 м	f	514
2694	до 200 м	f	514
2695	до 150 м	f	514
2696	1,5 кг	t	515
2697	1,3 кг	f	515
2698	2 кг	f	515
2699	4-5 п/хв.	t	516
2700	3-4 п/хв.	f	516
2701	5-6 п/хв.	f	516
2702	300 м	f	517
2703	250 м	t	517
2704	200 м	f	517
2705	150 м	f	518
2706	200 м	f	518
2707	160м	t	518
2708	160 м	f	519
2709	170 м	t	519
2710	200 м	f	519
2711	поблизу розташування військової частини	t	520
2712	в окремому приміщенні (кімнаті) казарми	f	520
2713	на квартирах поза розташуванням військової частини	f	520
2714	днювальними по роті під безпосереднім  наглядом  чергового роти	f	521
2715	черговими прибиральниками під безпосереднім  наглядом  чергового роти	t	521
2716	черговими прибиральниками під безпосереднім  наглядом  старшини роти	f	521
2717	днювального  й чергового роти	f	522
2718	відповідального за опалення й чергового роти	f	522
2719	старшину й чергового роти	t	522
2720	на чолі варти	f	523
2721	поруч і зліва	f	523
2722	поруч і справа	t	523
2723	на 4 години після зміни	f	524
2724	на 4 години після прибуття до підрозділу	t	524
2725	у день зміни	f	524
4044	у вільний час з дозволу помічника варти	f	1328
2726	за розпорядженням командира частини, від якої вона віднаряджена, або чергового військової частини	t	525
2727	за розпорядженням чергового варт	f	525
2728	за розпорядженням начальника гарнізону	f	525
2729	800м	f	526
2730	1000м	f	526
2731	1500м	t	526
2732	360м	f	527
2733	420м	t	527
2734	400м	f	527
2735	420м	f	528
2736	440м	t	528
2737	640м	f	528
2738	1200 м	f	529
2739	1300 м	t	529
2740	1000 м	f	529
2741	300 м	t	530
2742	1000 м	f	530
2743	800 м	f	530
2744	300 м	t	531
2745	350 м	t	531
2746	340 м	f	531
2747	90 град	t	532
2748	120 град.	f	532
2749	30 град.	f	532
2750	№ 4А	f	533
2751	№ 6	f	533
2752	№ 4	t	533
2753	до 15 м	f	534
2754	до 30 м	t	534
2755	до 20 м	f	534
2756	до 250 м	f	535
2757	до 200 м	f	535
2758	до 150 м	f	535
2759	1,5 кг	t	536
2760	1,3 кг	f	536
2761	2 кг	f	536
2762	4-5 п/хв.	t	537
2763	3-4 п/хв.	f	537
2764	5-6 п/хв.	f	537
2765	300 м	f	538
2766	250 м	t	538
2767	200 м	f	538
2768	150 м	f	539
2769	200 м	f	539
2770	160м	t	539
2771	160 м	f	540
2772	170 м	t	540
2773	200 м	f	540
2774	поблизу розташування військової частини	t	541
2775	в окремому приміщенні (кімнаті) казарми	f	541
2776	на квартирах поза розташуванням військової частини	f	541
2777	днювальними по роті під безпосереднім  наглядом  чергового роти	f	542
2778	черговими прибиральниками під безпосереднім  наглядом  чергового роти	t	542
2779	черговими прибиральниками під безпосереднім  наглядом  старшини роти	f	542
2780	днювального  й чергового роти	f	543
2781	відповідального за опалення й чергового роти	f	543
2782	старшину й чергового роти	t	543
2783	на чолі варти	f	544
2784	поруч і зліва	f	544
2785	поруч і справа	t	544
2786	на 4 години після зміни	f	545
2787	на 4 години після прибуття до підрозділу	t	545
2788	у день зміни	f	545
2789	за розпорядженням командира частини, від якої вона віднаряджена, або чергового військової частини	t	546
2790	за розпорядженням чергового варт	f	546
2791	за розпорядженням начальника гарнізону	f	546
2792	800м	f	547
2793	1000м	f	547
2794	1500м	t	547
2795	360м	f	548
2796	420м	t	548
2797	400м	f	548
2798	420м	f	549
2799	440м	t	549
2800	640м	f	549
2801	1200 м	f	550
2802	1300 м	t	550
2803	1000 м	f	550
2804	300 м	t	551
2805	1000 м	f	551
2806	800 м	f	551
2807	300 м	t	552
2808	350 м	t	552
2809	340 м	f	552
2810	90 град	t	553
2811	120 град.	f	553
2812	30 град.	f	553
2813	№ 4А	f	554
2814	№ 6	f	554
2815	№ 4	t	554
2816	до 15 м	f	555
2817	до 30 м	t	555
2818	до 20 м	f	555
2819	до 250 м	f	556
2820	до 200 м	f	556
2821	до 150 м	f	556
2822	1,5 кг	t	557
2823	1,3 кг	f	557
2824	2 кг	f	557
2825	4-5 п/хв.	t	558
2826	3-4 п/хв.	f	558
2827	5-6 п/хв.	f	558
2828	300 м	f	559
2829	250 м	t	559
2830	200 м	f	559
2831	150 м	f	560
2832	200 м	f	560
2833	160м	t	560
2834	160 м	f	561
2835	170 м	t	561
2836	200 м	f	561
2837	поблизу розташування військової частини	t	562
2838	в окремому приміщенні (кімнаті) казарми	f	562
2839	на квартирах поза розташуванням військової частини	f	562
2840	днювальними по роті під безпосереднім  наглядом  чергового роти	f	563
2841	черговими прибиральниками під безпосереднім  наглядом  чергового роти	t	563
2842	черговими прибиральниками під безпосереднім  наглядом  старшини роти	f	563
2843	днювального  й чергового роти	f	564
2844	відповідального за опалення й чергового роти	f	564
2845	старшину й чергового роти	t	564
2846	на чолі варти	f	565
2847	поруч і зліва	f	565
2848	поруч і справа	t	565
2849	на 4 години після зміни	f	566
2850	на 4 години після прибуття до підрозділу	t	566
2851	у день зміни	f	566
2852	за розпорядженням командира частини, від якої вона віднаряджена, або чергового військової частини	t	567
2853	за розпорядженням чергового варт	f	567
2854	за розпорядженням начальника гарнізону	f	567
3144	за розпорядженням командира частини, від якої вона віднаряджена, або чергового військової частини	f	757
3145	начальником варти	t	757
3146	один раз на тиждень	t	761
3147	два раза на тиждень	f	761
3148	один раз на день	f	761
3149	150 п/хв.	f	796
3150	200 п/хв.	f	796
3151	250 п/хв.	t	796
3152	+18° С	t	781
3153	+20° С	f	781
3154	+22° С	f	781
3155	50 м	f	791
3156	25 м	t	791
3157	20 м	f	791
3158	420 м	f	797
3159	440 м	t	797
3160	640 м	f	797
3161	420 м	f	795
3162	450 м	t	795
3163	430 м	f	795
3164	440 м	f	798
3165	670 м	f	798
3166	640 м	t	798
3167	650 м	f	794
3168	640 м	t	794
3169	670 м	f	794
3170	750 мм	f	784
3171	755 мм	t	784
3172	760 мм	f	784
3173	30 мм	f	787
3174	35 мм	f	787
3175	40 мм	t	787
3176	до відправлення першої зміни на пости	f	780
3177	після того, як перша зміна піде на пости	t	780
3178	після того, як перша зміна прийде з постів	f	780
3179	9 кг	f	790
3180	9,5 кг	f	790
3181	10,5 кг	t	790
3182	4,2 кг	f	793
3183	4 кг	f	793
3184	4,3 кг	t	793
3185	20-50 см	f	788
3186	50-100 см	f	788
3187	50-150см	t	788
3188	без дозволу командира частини	f	779
3189	без дозволу розвідного	f	779
3190	без дозволу начальника варти.	t	779
3191	12 постр	f	789
3192	10 постр.	t	789
3193	15 постр.	f	789
3194	120 м/с	f	786
3195	130 м/с	f	786
3196	133 м/с	t	786
3197	133 м/с	f	785
3198	144 м/с	t	785
3199	155 м/с	f	785
3200	3,5-6,5 с	f	792
3201	4,5-6,5 с	f	792
3202	3,5-8 с	t	792
3203	поблизу розташування військової частини	t	783
3204	в окремому приміщенні (кімнаті) казарми	f	783
3205	на квартирах поза розташуванням військової частини	f	783
3206	черговим військової частини	f	778
1055	12,7 мм	f	1
3207	за розпорядженням командира частини, від якої вона віднаряджена, або чергового військової частини	f	778
3208	начальником варти	t	778
3209	один раз на тиждень	t	782
3210	два раза на тиждень	f	782
3211	один раз на день	f	782
3212	150 п/хв.	f	817
3213	200 п/хв.	f	817
3214	250 п/хв.	t	817
3215	+18° С	t	802
3216	+20° С	f	802
3217	+22° С	f	802
3218	50 м	f	812
3219	25 м	t	812
3220	20 м	f	812
3221	420 м	f	818
3222	440 м	t	818
3223	640 м	f	818
3224	420 м	f	816
3225	450 м	t	816
3226	430 м	f	816
3227	440 м	f	819
3228	670 м	f	819
3229	640 м	t	819
3230	650 м	f	815
3231	640 м	t	815
3232	670 м	f	815
3233	750 мм	f	805
3234	755 мм	t	805
3235	760 мм	f	805
3236	30 мм	f	808
3237	35 мм	f	808
3238	40 мм	t	808
3239	до відправлення першої зміни на пости	f	801
3240	після того, як перша зміна піде на пости	t	801
3241	після того, як перша зміна прийде з постів	f	801
3242	9 кг	f	811
3243	9,5 кг	f	811
3244	10,5 кг	t	811
3245	4,2 кг	f	814
3246	4 кг	f	814
3247	4,3 кг	t	814
3248	20-50 см	f	809
3249	50-100 см	f	809
3250	50-150см	t	809
3251	без дозволу командира частини	f	800
3252	без дозволу розвідного	f	800
3253	без дозволу начальника варти.	t	800
1103	до 1500 м	f	2
1104	до 1000м	t	2
3254	12 постр	f	810
3255	10 постр.	t	810
3256	15 постр.	f	810
3257	120 м/с	f	807
3258	130 м/с	f	807
3259	133 м/с	t	807
2855	440 м	f	568
2856	670 м	f	568
2857	640 м	t	568
2858	420 м	f	569
2859	440 м	t	569
2860	640 м	f	569
2861	150 п/хв.	f	570
2862	200 п/хв.	f	570
2863	250 п/хв.	t	570
2864	420 м	f	571
2865	450 м	t	571
2866	430 м	f	571
2867	650 м	f	572
2868	640 м	t	572
2869	670 м	f	572
2870	4,2 кг	f	573
2871	4 кг	f	573
2872	4,3 кг	t	573
2873	3,5-6,5 с	f	574
2874	4,5-6,5 с	f	574
2875	3,5-8 с	t	574
2876	50 м	f	575
2877	25 м	t	575
2878	20 м	f	575
2879	9 кг	f	576
2880	9,5 кг	f	576
2881	10,5 кг	t	576
2882	12 постр	f	577
2883	10 постр.	t	577
1150	1500м	t	3
1151	1000м	f	3
1152	800м	f	3
2884	15 постр.	f	577
2885	20-50 см	f	578
2886	50-100 см	f	578
2887	50-150см	t	578
2888	30 мм	f	579
2889	35 мм	f	579
2890	40 мм	t	579
2891	120 м/с	f	580
2892	130 м/с	f	580
2893	133 м/с	t	580
2894	133 м/с	f	581
2895	144 м/с	t	581
2896	155 м/с	f	581
2897	750 мм	f	582
2898	755 мм	t	582
2899	760 мм	f	582
2900	поблизу розташування військової частини	t	583
2901	в окремому приміщенні (кімнаті) казарми	f	583
2902	на квартирах поза розташуванням військової частини	f	583
2903	один раз на тиждень	t	584
2904	два раза на тиждень	f	584
2905	один раз на день	f	584
2906	+18° С	t	585
2907	+20° С	f	585
2908	+22° С	f	585
2909	до відправлення першої зміни на пости	f	586
2910	після того, як перша зміна піде на пости	t	586
2911	після того, як перша зміна прийде з постів	f	586
2912	без дозволу командира частини	f	587
2913	без дозволу розвідного	f	587
2914	без дозволу начальника варти.	t	587
2915	черговим військової частини	f	588
2916	за розпорядженням командира частини, від якої вона віднаряджена, або чергового військової частини	f	588
2917	начальником варти	t	588
3260	133 м/с	f	806
3261	144 м/с	t	806
3262	155 м/с	f	806
3263	3,5-6,5 с	f	813
3264	4,5-6,5 с	f	813
3265	3,5-8 с	t	813
3266	поблизу розташування військової частини	t	804
3267	в окремому приміщенні (кімнаті) казарми	f	804
3268	на квартирах поза розташуванням військової частини	f	804
3269	черговим військової частини	f	799
3270	за розпорядженням командира частини, від якої вона віднаряджена, або чергового військової частини	f	799
1198	5,45 мм	f	4
1199	9 мм	f	4
1200	7,62 мм	t	4
3271	начальником варти	t	799
3272	один раз на тиждень	t	803
3273	два раза на тиждень	f	803
3274	один раз на день	f	803
4045	у вільний час з дозволу начальника варти	t	1328
4046	раз на рік	f	1329
4047	двічі на рік перед початком  весняного та осіннього періодів навчання	f	1329
4048	двічі на рік перед початком зимового і літнього періодів навчання	t	1329
4049	на відстані 100 метрів	f	1330
4050	на відстані 150 метрів	f	1330
4051	не ближче 100 метрів	t	1330
4052	3	t	1331
4053	постійний (П)	f	1331
4054	1	f	1331
4055	5,45 мм	f	1332
4056	9 мм	f	1332
4057	7,62 мм	t	1332
4058	40 мм	f	1333
4059	73 мм	t	1333
4060	64 мм	f	1333
4061	3 патр.	f	1334
4062	4 патр.	t	1334
4063	10 патр.	f	1334
4064	550 гр.	f	1335
4065	580 гр.	t	1335
4066	600 гр.	f	1335
4067	у чергового частини в металевій замкненій шафі разом з пістолетами офіцерів і прапорщиків штабу, але в окремому металевому замкненому ящику	t	1336
4068	у чергового по роті в окремому металевому замкненому ящику	f	1336
4069	у чергового частини в металевій замкненій шафі, але окремо від пістолетів офіцерів і прапорщиків штабу	f	1336
1246	до 800 м	t	5
1247	до 1000 м	f	5
1248	до 1200 м	f	5
3275	825 м/с	t	1072
3276	800 м/с	f	1072
3277	850 м/с	f	1072
1294	1300 м	f	6
1295	1000 м	f	6
1296	1200 м	t	6
3278	825 м/с	f	1073
3279	855 м/с	t	1073
3280	850 м/с	f	1073
3281	20 гр.	f	1074
3282	21 гр.	f	1074
3283	21,8 гр.	t	1074
3284	810 м/с	f	1075
3285	830 м/с	t	1075
3286	850 м/с	f	1075
3287	50 п/хв.	f	1076
3288	20 п/хв.	f	1076
3289	30 п/хв.	t	1076
3290	30 патр.	f	1077
3291	10 патр.	t	1077
3292	15 патр.	f	1077
3293	800м	f	1078
3294	1000м	f	1078
3295	1500м	t	1078
3296	5 патр.	t	1079
3297	3 патр.	f	1079
3298	7 патр.	f	1079
3299	30 мм	f	1080
3300	40 мм	t	1080
3301	В - 37 мм	f	1080
3302	40 гр.	f	1081
3303	48 гр\t.	t	1081
3304	52 гр.	f	1081
3305	до 7 м	t	1082
3306	до 10 м	f	1082
3307	до 12 м	f	1082
3308	72 м/с	f	1083
3309	75 м/с	f	1083
3310	76 м/с	t	1083
3311	755 мм	f	1084
3312	800 мм	f	1084
3313	850 мм	t	1084
3314	770 мм	t	1085
3315	755 мм	f	1085
3316	850 мм	f	1085
3317	2,2 кг	f	1086
3318	3 кг	f	1086
3319	2,7 кг	t	1086
3320	старшиною роти	f	1087
3321	командиром роти	t	1087
3322	командиром батальйону	f	1087
1342	“5” - 35; “4” - 30; “3” - 25	t	7
1343	“5” - 40; “4” - 35; “3” - 30	f	7
1344	“5” - 30; “4” - 25; “3” - 20	f	7
3323	зимові віконні рами	t	1088
3324	зимові віконні рами та двері.	f	1088
3325	нічого не дозволяється зберігати, у протипожежному стані	f	1088
3326	1.2 метра від підлоги	f	1089
3327	1.25 метра від підлоги	f	1089
3328	1.5 метра від підлоги	t	1089
3329	іде ліворуч колони	f	1090
3330	іде праворуч колони	f	1090
3331	іде на чолі колони	t	1090
3332	не більше 2 годин у денний час та 2 годин у ночний час	f	1091
3333	більше 4 годин у нічний час	f	1091
3334	не більше 4 годин у денний час	t	1091
3335	+18° С	t	1092
3336	+20° С	f	1092
3337	+22° С	f	1092
4070	начальником варти, його помічником або своїм розвідним з одним-двома озброєними вартовими	f	1337
4071	начальником варти або його помічником з одним-двома озброєними вартовими	t	1337
4072	начальником варти з одним-двома озброєними вартовими	f	1337
4073	старшині роти	f	1338
4074	командирові підрозділу	t	1338
4075	командирові взводу	f	1338
4076	прямій	f	1339
4077	не прямій	f	1339
4078	полупрямій	t	1339
4079	до 15 с	t	1340
4080	до 10 с	f	1340
4081	до 12 с	f	1340
4082	необмежений	t	1341
4083	3 хв.	f	1341
4084	5 хв.	f	1341
4085	ВОГ-25М	f	1342
4086	“Гвоздь”	t	1342
4087	“Подкидыш”	f	1342
4088	жовтий	f	1343
4089	зелений	t	1343
4090	сріблястий	f	1343
4091	осколкової	f	1344
4092	фугасної	f	1344
4093	кумулятивної	t	1344
4094	220 мм	t	1345
4095	250 мм	f	1345
4096	200 мм	f	1345
4097	150 м	f	1346
4098	100 м	t	1346
4099	200 м	f	1346
1390	15 см	t	8
1391	12 см	f	8
1392	18 см	f	8
4100	100 м	t	1347
4101	150 м	f	1347
4102	50 м	f	1347
4103	5-15 м	f	1348
4104	3,5-10,5 м	f	1348
4105	2,5-15 м	t	1348
4106	у вільний час	f	1349
4107	у вільний час з дозволу помічника варти	f	1349
4108	у вільний час з дозволу начальника варти	t	1349
4109	раз на рік	f	1350
4110	двічі на рік перед початком  весняного та осіннього періодів навчання	f	1350
4111	двічі на рік перед початком зимового і літнього періодів навчання	t	1350
4112	на відстані 100 метрів	f	1351
4113	на відстані 150 метрів	f	1351
4114	не ближче 100 метрів	t	1351
4115	3	t	1352
4116	постійний (П)	f	1352
4117	1	f	1352
4118	5,45 мм	f	1353
3338	50 патр.	f	1093
3339	100 патр.	t	1093
3340	150 патр.	f	1093
3341	9 кг	t	1094
3342	9,5 кг	f	1094
3343	10 кг	f	1094
3344	9 кг	f	1095
3345	9,5 кг	f	1095
3346	10,5 кг	t	1095
3347	30 патр.	f	1096
3348	45 патр.	f	1096
3349	50 патр.	t	1096
3350	3,5х	f	1097
3351	4х	t	1097
3352	4,5х	f	1097
3353	6 град.	t	1098
3354	7 град.	f	1098
3355	5 град.	f	1098
3356	150 п/хв.	f	1099
3357	200 п/хв.	f	1099
3358	250 п/хв.	t	1099
3359	КС4.16.1.1	f	1100
3360	КС2.01.1.1	f	1100
3361	КС2.12.1.1	t	1100
3362	1,5 кг	t	1101
3363	1,3 кг	f	1101
3364	2 кг	f	1101
3365	15-20 с	f	1102
3366	10-15 с	f	1102
1438	для більшої дальності польоту кулі	f	9
1439	для більшої кучності бою	t	9
1440	для більшої бронебійності кулі	f	9
3367	14-19 с	t	1102
3368	150 гр.	f	1103
3369	170 гр.	t	1103
3370	225 гр.	f	1103
3371	ВФГ-25	f	1104
3372	ВОГ-25П	t	1104
3373	ВОГ-25	f	1104
3374	3 кг	f	1105
3375	2,9 кг	t	1105
3376	2,7 кг	f	1105
3377	8-10 с	t	1106
3378	10-12 с	f	1106
3379	6-8 с	f	1106
3380	250 мм	f	1107
3381	200 мм	t	1107
3382	220 мм	f	1107
3383	у ставницях	t	1108
3384	в металевих замкнених шафах або ящиках	f	1108
3385	на складах	f	1108
3386	10-12 осіб	t	1109
3387	12-14 осіб	f	1109
3388	8-10 осіб	f	1109
3389	Вимикається на ніч для світломаскування	f	1110
3390	на ніч не вимикається і підтримується у черговому режимі	t	1110
3391	на ніч вмикається сине чергове освітлення	f	1110
3392	поруч і зліва	t	1111
3393	іде на чолі колони	f	1111
3394	поруч і праворуч	f	1111
3395	не більше 4 годин з дозволу начальника варти	t	1112
3396	не більше 4 годин у нічний час	f	1112
3397	не більше 2 годин у денний час та 2 годин у нічний час	f	1112
3398	постійно виключене освітлення	f	1113
3399	постійне темно - синє  освітлення	t	1113
3400	постійне освітлення.	f	1113
4119	9 мм	f	1353
4120	7,62 мм	t	1353
4121	40 мм	f	1354
4122	73 мм	t	1354
4123	64 мм	f	1354
4124	3 патр.	f	1355
4125	4 патр.	t	1355
4126	10 патр.	f	1355
4127	550 гр.	f	1356
4128	580 гр.	t	1356
4129	600 гр.	f	1356
1486	30 мм	f	10
4130	у чергового частини в металевій замкненій шафі разом з пістолетами офіцерів і прапорщиків штабу, але в окремому металевому замкненому ящику	t	1357
1488	37 мм	f	10
4131	у чергового по роті в окремому металевому замкненому ящику	f	1357
4132	у чергового частини в металевій замкненій шафі, але окремо від пістолетів офіцерів і прапорщиків штабу	f	1357
4133	начальником варти, його помічником або своїм розвідним з одним-двома озброєними вартовими	f	1358
4134	начальником варти або його помічником з одним-двома озброєними вартовими	t	1358
4135	начальником варти з одним-двома озброєними вартовими	f	1358
4136	старшині роти	f	1359
4137	командирові підрозділу	t	1359
4138	командирові взводу	f	1359
4139	прямій	f	1360
4140	не прямій	f	1360
4141	полупрямій	t	1360
4142	до 15 с	t	1361
4143	до 10 с	f	1361
4144	до 12 с	f	1361
4145	необмежений	t	1362
4146	3 хв.	f	1362
4147	5 хв.	f	1362
4148	ВОГ-25М	f	1363
4149	“Гвоздь”	t	1363
4150	“Подкидыш”	f	1363
4151	жовтий	f	1364
4152	зелений	t	1364
4153	сріблястий	f	1364
4154	осколкової	f	1365
4155	фугасної	f	1365
4156	кумулятивної	t	1365
4157	220 мм	t	1366
4158	250 мм	f	1366
4159	200 мм	f	1366
4160	150 м	f	1367
4161	100 м	t	1367
4162	200 м	f	1367
4163	100 м	t	1368
4164	150 м	f	1368
4165	50 м	f	1368
4166	5-15 м	f	1369
1534	4	f	11
1535	10	f	11
1536	12	t	11
3401	жовтий	f	1114
3402	зелений	t	1114
3403	сріблястий	f	1114
3404	100 м	t	1115
3405	150 м	f	1115
3406	50 м	f	1115
3407	3 патр.	f	1116
3408	4 патр.	t	1116
3409	10 патр.	f	1116
3410	550 гр.	f	1117
3411	580 гр.	t	1117
3412	600 гр.	f	1117
3413	150 м	f	1118
3414	100 м	t	1118
3415	200 м	f	1118
3416	3	t	1119
3417	постійний (П)	f	1119
3418	1	f	1119
3419	5,45 мм	f	1120
3420	9 мм	f	1120
3421	7,62 мм	t	1120
3422	необмежений	t	1121
3423	3 хв.	f	1121
3424	5 хв.	f	1121
3425	40 мм	f	1122
3426	73 мм	t	1122
3427	64 мм	f	1122
3428	до 15 с	t	1123
3429	до 10 с	f	1123
3430	до 12 с	f	1123
3431	ВОГ-25М	f	1124
3432	“Гвоздь”	t	1124
3433	“Подкидыш”	f	1124
3434	прямій	f	1125
3435	не прямій	f	1125
3436	полупрямій	t	1125
3437	220 мм	t	1126
3438	250 мм	f	1126
3439	200 мм	f	1126
1582	до 200 м	f	12
1583	до 250 м	t	12
1584	до 300 м	f	12
3440	осколкової	f	1127
3441	фугасної	f	1127
3442	кумулятивної	t	1127
3443	5-15 м	f	1128
3444	3,5-10,5 м	f	1128
3445	2,5-15 м	t	1128
3446	у чергового частини в металевій замкненій шафі разом з пістолетами офіцерів і прапорщиків штабу, але в окремому металевому замкненому ящику	t	1129
3447	у чергового по роті в окремому металевому замкненому ящику	f	1129
3448	у чергового частини в металевій замкненій шафі, але окремо від пістолетів офіцерів і прапорщиків штабу	f	1129
3449	на відстані 100 метрів	f	1130
3450	на відстані 150 метрів	f	1130
3451	не ближче 100 метрів	t	1130
3452	раз на рік	f	1131
3453	двічі на рік перед початком  весняного та осіннього періодів навчання	f	1131
3454	двічі на рік перед початком зимового і літнього періодів навчання	t	1131
3455	старшині роти	f	1132
3456	командирові підрозділу	t	1132
3457	командирові взводу	f	1132
3458	у вільний час	f	1133
3459	у вільний час з дозволу помічника варти	f	1133
3460	у вільний час з дозволу начальника варти	t	1133
3461	начальником варти, його помічником або своїм розвідним з одним-двома озброєними вартовими	f	1134
3462	начальником варти або його помічником з одним-двома озброєними вартовими	t	1134
3463	начальником варти з одним-двома озброєними вартовими	f	1134
4167	3,5-10,5 м	f	1369
4168	2,5-15 м	t	1369
4169	у вільний час	f	1370
4170	у вільний час з дозволу помічника варти	f	1370
4171	у вільний час з дозволу начальника варти	t	1370
4172	раз на рік	f	1371
4173	двічі на рік перед початком  весняного та осіннього періодів навчання	f	1371
4174	двічі на рік перед початком зимового і літнього періодів навчання	t	1371
4175	на відстані 100 метрів	f	1372
4176	на відстані 150 метрів	f	1372
4177	не ближче 100 метрів	t	1372
4178	3	t	1373
4179	постійний (П)	f	1373
4180	1	f	1373
4181	5,45 мм	f	1374
4182	9 мм	f	1374
4183	7,62 мм	t	1374
4184	40 мм	f	1375
4185	73 мм	t	1375
4186	64 мм	f	1375
4187	3 патр.	f	1376
4188	4 патр.	t	1376
4189	10 патр.	f	1376
4190	550 гр.	f	1377
4191	580 гр.	t	1377
4192	600 гр.	f	1377
4193	у чергового частини в металевій замкненій шафі разом з пістолетами офіцерів і прапорщиків штабу, але в окремому металевому замкненому ящику	t	1378
4194	у чергового по роті в окремому металевому замкненому ящику	f	1378
4195	у чергового частини в металевій замкненій шафі, але окремо від пістолетів офіцерів і прапорщиків штабу	f	1378
4196	начальником варти, його помічником або своїм розвідним з одним-двома озброєними вартовими	f	1379
4425	1	f	1455
1678	64 мм	f	14
1679	40 мм	f	14
1680	73 мм	t	14
3464	постійний (П)	f	1135
3465	1	f	1135
3466	3	t	1135
3467	на 20 см	f	1136
3468	на 12 см	t	1136
3469	на 15 см	f	1136
3470	650 патр.	f	1137
3471	600 патр.	t	1137
3472	700 патр.	f	1137
3473	15 см	f	1138
3474	10 см	f	1138
3475	8 см	t	1138
3476	3 патр.	f	1139
3477	4 патр.	t	1139
3478	5 патр.	f	1139
3479	12 см	f	1140
3480	16 см	t	1140
3481	15 см	f	1140
3482	810 м/с	f	1141
3483	830 м/с	t	1141
3484	850 м/с	f	1141
3485	необмежений	f	1142
3486	3 хв.	f	1142
3487	5 хв.	t	1142
3488	300 м	f	1143
3489	250 м	t	1143
3490	200 м	f	1143
3491	7х	f	1144
3492	3,5х	t	1144
3493	4х	f	1144
1726	250 м	t	15
1727	200 м	f	15
1728	300 м	f	15
3494	600 м	t	1145
3495	500 м	f	1145
3496	400 м	f	1145
3497	2 кг	f	1146
3498	2,2 кг	t	1146
3499	1,5 кг	f	1146
3500	кумулятивної	t	1147
3501	осколкової	f	1147
3502	фугасної	f	1147
3503	3-10 м	f	1148
3504	2,5-15 м	t	1148
3505	5-15 м	f	1148
3506	4-6 с	f	1149
3507	3,5-6,5 с	t	1149
3508	4,5 - 6,5 с	f	1149
3509	під особисту розписку в книзі видачі зброї та боєприпасів,	f	1150
3510	під підпис помічника начальника варти в книзі видачі зброї та боєприпасів	f	1150
3511	під підпис начальника варти в книзі видачі зброї та боєприпасів.	t	1150
3512	оголошується наказом командира частини	f	1151
3513	оголошується наказом начальника гарнізону	t	1151
3514	відбувається з 15 жовтня по 15 квітня	f	1151
3515	14-денне	t	1152
3516	15-денне	f	1152
3517	не більше 21 дня	f	1152
3518	начальникові варти	t	1153
3519	розвідному	f	1153
3520	заступнику начальникові варти	f	1153
3521	перед заступанням на пости (після того, як повернеться зміна з постів та буде проведено у варті бойовий розподіл)	t	1154
3522	після повернення з постів (після того, як повернеться зміна з постів та буде проведено у варті бойовий розподіл)	f	1154
3523	по розпорядженню начальника варти в будь-який час	f	1154
3524	особи, яким чатові підпорядковані	t	1155
3525	особи, яким чатові підпорядковані та особи, які прибули для перевірки варт із штабів вищого рівня	f	1155
3526	особи, яким чатові підпорядковані, та військовий комендант гарнізону	f	1155
4197	начальником варти або його помічником з одним-двома озброєними вартовими	t	1379
4198	начальником варти з одним-двома озброєними вартовими	f	1379
4199	старшині роти	f	1380
4200	командирові підрозділу	t	1380
4201	командирові взводу	f	1380
4202	прямій	f	1381
4203	не прямій	f	1381
4204	полупрямій	t	1381
4205	до 15 с	t	1382
4206	до 10 с	f	1382
4207	до 12 с	f	1382
4208	необмежений	t	1383
4209	3 хв.	f	1383
4210	5 хв.	f	1383
4211	ВОГ-25М	f	1384
4212	“Гвоздь”	t	1384
4213	“Подкидыш”	f	1384
4214	жовтий	f	1385
4215	зелений	t	1385
4216	сріблястий	f	1385
4217	осколкової	f	1386
4218	фугасної	f	1386
4219	кумулятивної	t	1386
4220	220 мм	t	1387
4221	250 мм	f	1387
4222	200 мм	f	1387
4223	150 м	f	1388
4224	100 м	t	1388
4225	200 м	f	1388
4226	100 м	t	1389
4227	150 м	f	1389
4228	50 м	f	1389
4229	5-15 м	f	1390
4230	3,5-10,5 м	f	1390
4231	2,5-15 м	t	1390
4232	у вільний час	f	1391
4233	у вільний час з дозволу помічника варти	f	1391
4234	у вільний час з дозволу начальника варти	t	1391
4235	раз на рік	f	1392
4236	двічі на рік перед початком  весняного та осіннього періодів навчання	f	1392
4237	двічі на рік перед початком зимового і літнього періодів навчання	t	1392
4238	на відстані 100 метрів	f	1393
4239	на відстані 150 метрів	f	1393
4240	не ближче 100 метрів	t	1393
4241	3	t	1394
4242	постійний (П)	f	1394
4243	1	f	1394
1774	номерами	f	16
1775	ярликами із зазначенням військового звання, прізвища та ініціалів військовослужбовця	t	16
1776	ярликами із зазначенням номерами, військового звання, прізвища та ініціалів військовослужбовця	f	16
3527	50 п/хв.	f	1156
3528	20 п/хв.	f	1156
3529	30 п/хв.	t	1156
3530	старшиною роти	f	1157
3531	командиром роти	t	1157
3532	командиром батальйону	f	1157
3533	іде ліворуч колони	f	1158
3534	іде праворуч колони	f	1158
3535	іде на чолі колони	t	1158
3536	755 мм	f	1159
3537	800 мм	f	1159
3538	850 мм	t	1159
3539	770 мм	t	1160
3540	755 мм	f	1160
3541	850 мм	f	1160
3542	не більше 2 годин у денний час та 2 годин у ночний час	f	1161
3543	більше 4 годин у нічний час	f	1161
3544	не більше 4 годин у денний час	t	1161
3545	30 патр.	f	1162
3546	10 патр.	t	1162
3547	15 патр.	f	1162
3548	до 7 м	t	1163
3549	до 10 м	f	1163
3550	до 12 м	f	1163
3551	30 мм	f	1164
3552	40 мм	t	1164
3553	В - 37 мм	f	1164
3554	40 гр.	f	1165
3555	48 гр\t.	t	1165
3556	52 гр.	f	1165
3557	20 гр.	f	1166
3558	21 гр.	f	1166
3559	21,8 гр.	t	1166
3560	2,2 кг	f	1167
3561	3 кг	f	1167
3562	2,7 кг	t	1167
3563	зимові віконні рами	t	1168
3564	зимові віконні рами та двері.	f	1168
3565	нічого не дозволяється зберігати, у протипожежному стані	f	1168
3566	825 м/с	t	1169
3567	800 м/с	f	1169
3568	850 м/с	f	1169
3569	825 м/с	f	1170
1822	у маскуючий колір	f	17
1823	у колір державного прапора	f	17
1824	у визначений колір.	t	17
3570	855 м/с	t	1170
3571	850 м/с	f	1170
3572	810 м/с	f	1171
3573	830 м/с	t	1171
3574	850 м/с	f	1171
3575	72 м/с	f	1172
3576	75 м/с	f	1172
3577	76 м/с	t	1172
3578	800м	f	1173
3579	1000м	f	1173
3580	1500м	t	1173
3581	1.2 метра від підлоги	f	1174
3582	1.25 метра від підлоги	f	1174
3583	1.5 метра від підлоги	t	1174
3584	+18° С	t	1175
3585	+20° С	f	1175
3586	+22° С	f	1175
3587	5 патр.	t	1176
3588	3 патр.	f	1176
3589	7 патр.	f	1176
3590	50 п/хв.	f	1177
3591	20 п/хв.	f	1177
3592	30 п/хв.	t	1177
3593	старшиною роти	f	1178
3594	командиром роти	t	1178
3595	командиром батальйону	f	1178
3596	іде ліворуч колони	f	1179
3597	іде праворуч колони	f	1179
3598	іде на чолі колони	t	1179
3599	755 мм	f	1180
3600	800 мм	f	1180
3601	850 мм	t	1180
3602	770 мм	t	1181
3603	755 мм	f	1181
3604	850 мм	f	1181
3605	не більше 2 годин у денний час та 2 годин у ночний час	f	1182
3606	більше 4 годин у нічний час	f	1182
3607	не більше 4 годин у денний час	t	1182
3608	30 патр.	f	1183
3609	10 патр.	t	1183
3610	15 патр.	f	1183
3611	до 7 м	t	1184
3612	до 10 м	f	1184
3613	до 12 м	f	1184
3614	30 мм	f	1185
3615	40 мм	t	1185
3616	В - 37 мм	f	1185
3617	40 гр.	f	1186
3618	48 гр\t.	t	1186
3619	52 гр.	f	1186
3620	20 гр.	f	1187
3621	21 гр.	f	1187
3622	21,8 гр.	t	1187
3623	2,2 кг	f	1188
3624	3 кг	f	1188
3625	2,7 кг	t	1188
3626	зимові віконні рами	t	1189
3627	зимові віконні рами та двері.	f	1189
3628	нічого не дозволяється зберігати, у протипожежному стані	f	1189
3629	825 м/с	t	1190
3630	800 м/с	f	1190
3631	850 м/с	f	1190
3632	825 м/с	f	1191
3633	855 м/с	t	1191
3634	850 м/с	f	1191
3635	810 м/с	f	1192
3636	830 м/с	t	1192
3637	850 м/с	f	1192
3638	72 м/с	f	1193
3639	75 м/с	f	1193
3640	76 м/с	t	1193
3641	800м	f	1194
3642	1000м	f	1194
3643	1500м	t	1194
3644	1.2 метра від підлоги	f	1195
3645	1.25 метра від підлоги	f	1195
3646	1.5 метра від підлоги	t	1195
3647	+18° С	t	1196
1870	за одну годину до відбою	f	18
1871	за дві години до відбою	t	18
1872	за тригодини до відбою	f	18
3648	+20° С	f	1196
3649	+22° С	f	1196
3650	5 патр.	t	1197
3651	3 патр.	f	1197
3652	7 патр.	f	1197
3653	50 п/хв.	f	1198
3654	20 п/хв.	f	1198
3655	30 п/хв.	t	1198
3656	старшиною роти	f	1199
3657	командиром роти	t	1199
3658	командиром батальйону	f	1199
3659	іде ліворуч колони	f	1200
3660	іде праворуч колони	f	1200
3661	іде на чолі колони	t	1200
3662	755 мм	f	1201
3663	800 мм	f	1201
3664	850 мм	t	1201
3665	770 мм	t	1202
3666	755 мм	f	1202
3667	850 мм	f	1202
3668	не більше 2 годин у денний час та 2 годин у ночний час	f	1203
3669	більше 4 годин у нічний час	f	1203
3670	не більше 4 годин у денний час	t	1203
3671	30 патр.	f	1204
3672	10 патр.	t	1204
3673	15 патр.	f	1204
3674	до 7 м	t	1205
3675	до 10 м	f	1205
3676	до 12 м	f	1205
3677	30 мм	f	1206
3678	40 мм	t	1206
3679	В - 37 мм	f	1206
3680	40 гр.	f	1207
3681	48 гр\t.	t	1207
3682	52 гр.	f	1207
3683	20 гр.	f	1208
3684	21 гр.	f	1208
3685	21,8 гр.	t	1208
3686	2,2 кг	f	1209
3687	3 кг	f	1209
3688	2,7 кг	t	1209
3689	зимові віконні рами	t	1210
3690	зимові віконні рами та двері.	f	1210
3691	нічого не дозволяється зберігати, у протипожежному стані	f	1210
3692	825 м/с	t	1211
1918	30 хвилин	f	19
1919	40 хвилин	t	19
1920	50 хвилин	f	19
3693	800 м/с	f	1211
3694	850 м/с	f	1211
3695	825 м/с	f	1212
3696	855 м/с	t	1212
3697	850 м/с	f	1212
3698	810 м/с	f	1213
3699	830 м/с	t	1213
3700	850 м/с	f	1213
3701	72 м/с	f	1214
3702	75 м/с	f	1214
3703	76 м/с	t	1214
3704	800м	f	1215
3705	1000м	f	1215
3706	1500м	t	1215
3707	1.2 метра від підлоги	f	1216
3708	1.25 метра від підлоги	f	1216
3709	1.5 метра від підлоги	t	1216
3710	+18° С	t	1217
3711	+20° С	f	1217
3712	+22° С	f	1217
3713	5 патр.	t	1218
3714	3 патр.	f	1218
3715	7 патр.	f	1218
4244	5,45 мм	f	1395
4245	9 мм	f	1395
4246	7,62 мм	t	1395
4247	40 мм	f	1396
4248	73 мм	t	1396
4249	64 мм	f	1396
4250	3 патр.	f	1397
4251	4 патр.	t	1397
4252	10 патр.	f	1397
4253	550 гр.	f	1398
4254	580 гр.	t	1398
4255	600 гр.	f	1398
4256	у чергового частини в металевій замкненій шафі разом з пістолетами офіцерів і прапорщиків штабу, але в окремому металевому замкненому ящику	t	1399
4257	у чергового по роті в окремому металевому замкненому ящику	f	1399
4258	у чергового частини в металевій замкненій шафі, але окремо від пістолетів офіцерів і прапорщиків штабу	f	1399
4259	начальником варти, його помічником або своїм розвідним з одним-двома озброєними вартовими	f	1400
4260	начальником варти або його помічником з одним-двома озброєними вартовими	t	1400
4261	начальником варти з одним-двома озброєними вартовими	f	1400
4262	старшині роти	f	1401
4263	командирові підрозділу	t	1401
4264	командирові взводу	f	1401
4265	прямій	f	1402
1966	на 4 години після зміни	f	20
1967	у день зміни	t	20
1968	на 4 години після прибуття до підрозділу	f	20
4266	не прямій	f	1402
4267	полупрямій	t	1402
4268	до 15 с	t	1403
4269	до 10 с	f	1403
4270	до 12 с	f	1403
4271	необмежений	t	1404
4272	3 хв.	f	1404
4273	5 хв.	f	1404
4274	ВОГ-25М	f	1405
4275	“Гвоздь”	t	1405
4276	“Подкидыш”	f	1405
4277	жовтий	f	1406
4278	зелений	t	1406
4279	сріблястий	f	1406
2014	начальник варти та його помічник	t	21
2015	тільки розвідний	f	21
2016	тільки чатовий на вході до вартового приміщення	f	21
3716	30 п/хв.	t	1219
3717	20 п/хв.	f	1219
3718	50 п/хв.	f	1219
3719	командиром батальйону	f	1220
3720	командиром роти	t	1220
3721	старшиною роти	f	1220
3722	іде на чолі колони	t	1221
3723	іде праворуч колони	f	1221
3724	іде ліворуч колони	f	1221
3725	850 мм	t	1222
3726	800 мм	f	1222
3727	755 мм	f	1222
3728	850 мм	f	1223
3729	755 мм	f	1223
3730	770 мм	t	1223
3731	не більше 4 годин у денний час	t	1224
3732	більше 4 годин у нічний час	f	1224
3733	не більше 2 годин у денний час та 2 годин у ночний час	f	1224
3734	15 патр.	f	1225
3735	10 патр.	t	1225
3736	30 патр.	f	1225
3737	до 12 м	f	1226
3738	до 10 м	f	1226
3739	до 7 м	t	1226
3740	В - 37 мм	f	1227
3741	40 мм	t	1227
3742	30 мм	f	1227
3743	52 гр.	f	1228
3744	48 гр\t.	t	1228
3745	40 гр.	f	1228
3746	21,8 гр.	t	1229
3747	21 гр.	f	1229
3748	20 гр.	f	1229
3749	2,7 кг	t	1230
3750	3 кг	f	1230
3751	2,2 кг	f	1230
3752	нічого не дозволяється зберігати, у протипожежному стані	f	1231
3753	зимові віконні рами та двері.	f	1231
3754	зимові віконні рами	t	1231
3755	850 м/с	f	1232
3756	800 м/с	f	1232
3757	825 м/с	t	1232
3758	850 м/с	f	1233
3759	855 м/с	t	1233
3760	825 м/с	f	1233
3761	850 м/с	f	1234
3762	830 м/с	t	1234
3763	810 м/с	f	1234
3764	76 м/с	t	1235
3765	75 м/с	f	1235
3766	72 м/с	f	1235
3767	1500м	t	1236
3768	1000м	f	1236
3769	800м	f	1236
3770	1.5 метра від підлоги	t	1237
3771	1.25 метра від підлоги	f	1237
3772	1.2 метра від підлоги	f	1237
3773	+22° С	f	1238
3774	+20° С	f	1238
3775	+18° С	t	1238
3776	7 патр.	f	1239
3777	3 патр.	f	1239
3778	5 патр.	t	1239
3779	250 п/хв.	t	1240
3780	200 п/хв.	f	1240
4320	особи, яким чатові підпорядковані та особи, які прибули для перевірки варт із штабів вищого рівня	f	1420
4321	особи, яким чатові підпорядковані, та військовий комендант гарнізону	f	1420
4322	810 м/с	f	1421
4323	830 м/с	t	1421
4324	850 м/с	f	1421
4325	оголошується наказом командира частини	f	1422
4326	оголошується наказом начальника гарнізону	t	1422
4327	відбувається з 15 жовтня по 15 квітня	f	1422
4328	12 см	f	1423
4329	16 см	t	1423
4330	15 см	f	1423
4331	300 м	f	1424
4332	250 м	t	1424
4333	200 м	f	1424
4334	4-6 с	f	1425
4335	3,5-6,5 с	t	1425
4336	4,5 - 6,5 с	f	1425
4337	14-денне	t	1426
4338	15-денне	f	1426
4339	не більше 21 дня	f	1426
4340	необмежений	f	1427
4341	3 хв.	f	1427
4342	5 хв.	t	1427
4343	кумулятивної	t	1428
4344	осколкової	f	1428
4345	фугасної	f	1428
4346	під особисту розписку в книзі видачі зброї та боєприпасів,	f	1429
4347	під підпис помічника начальника варти в книзі видачі зброї та боєприпасів	f	1429
4348	під підпис начальника варти в книзі видачі зброї та боєприпасів.	t	1429
4349	начальникові варти	t	1430
4350	розвідному	f	1430
4351	заступнику начальникові варти	f	1430
4352	600 м	t	1431
4353	500 м	f	1431
4354	400 м	f	1431
4355	3-10 м	f	1432
4356	2,5-15 м	t	1432
4357	5-15 м	f	1432
4358	перед заступанням на пости (після того, як повернеться зміна з постів та буде проведено у варті бойовий розподіл)	t	1433
4359	після повернення з постів (після того, як повернеться зміна з постів та буде проведено у варті бойовий розподіл)	f	1433
4360	по розпорядженню начальника варти в будь-який час	f	1433
4361	постійний (П)	f	1434
4362	1	f	1434
4363	3	t	1434
4364	3 патр.	f	1435
4365	4 патр.	t	1435
4366	5 патр.	f	1435
4367	7х	f	1436
4368	3,5х	t	1436
4369	4х	f	1436
4370	15 см	f	1437
4371	10 см	f	1437
4372	8 см	t	1437
4373	2 кг	f	1438
4374	2,2 кг	t	1438
4375	1,5 кг	f	1438
4376	на 20 см	f	1439
4377	на 12 см	t	1439
4378	на 15 см	f	1439
4379	650 патр.	f	1440
4380	600 патр.	t	1440
4381	700 патр.	f	1440
4382	особи, яким чатові підпорядковані	t	1441
4383	особи, яким чатові підпорядковані та особи, які прибули для перевірки варт із штабів вищого рівня	f	1441
4384	особи, яким чатові підпорядковані, та військовий комендант гарнізону	f	1441
4385	810 м/с	f	1442
4386	830 м/с	t	1442
4387	850 м/с	f	1442
4388	оголошується наказом командира частини	f	1443
4389	оголошується наказом начальника гарнізону	t	1443
4390	відбувається з 15 жовтня по 15 квітня	f	1443
4391	12 см	f	1444
4392	16 см	t	1444
4393	15 см	f	1444
4394	300 м	f	1445
4395	250 м	t	1445
4396	200 м	f	1445
4397	4-6 с	f	1446
4398	3,5-6,5 с	t	1446
4399	4,5 - 6,5 с	f	1446
4400	14-денне	t	1447
4401	15-денне	f	1447
4402	не більше 21 дня	f	1447
4403	необмежений	f	1448
4404	3 хв.	f	1448
4405	5 хв.	t	1448
4406	кумулятивної	t	1449
4407	осколкової	f	1449
4408	фугасної	f	1449
4409	під особисту розписку в книзі видачі зброї та боєприпасів,	f	1450
4410	під підпис помічника начальника варти в книзі видачі зброї та боєприпасів	f	1450
4411	під підпис начальника варти в книзі видачі зброї та боєприпасів.	t	1450
4412	начальникові варти	t	1451
4413	розвідному	f	1451
4414	заступнику начальникові варти	f	1451
4415	600 м	t	1452
4416	500 м	f	1452
4417	400 м	f	1452
4418	3-10 м	f	1453
4419	2,5-15 м	t	1453
4420	5-15 м	f	1453
4421	перед заступанням на пости (після того, як повернеться зміна з постів та буде проведено у варті бойовий розподіл)	t	1454
4422	після повернення з постів (після того, як повернеться зміна з постів та буде проведено у варті бойовий розподіл)	f	1454
4423	по розпорядженню начальника варти в будь-який час	f	1454
4429	5 патр.	f	1456
4430	7х	f	1457
4431	3,5х	t	1457
4432	4х	f	1457
4433	15 см	f	1458
4434	10 см	f	1458
4435	8 см	t	1458
4436	2 кг	f	1459
4437	2,2 кг	t	1459
4438	1,5 кг	f	1459
4439	на 20 см	f	1460
4440	на 12 см	t	1460
4441	на 15 см	f	1460
4442	650 патр.	f	1461
4443	600 патр.	t	1461
4444	700 патр.	f	1461
4445	особи, яким чатові підпорядковані	t	1462
4446	особи, яким чатові підпорядковані та особи, які прибули для перевірки варт із штабів вищого рівня	f	1462
4447	особи, яким чатові підпорядковані, та військовий комендант гарнізону	f	1462
4448	810 м/с	f	1463
4449	830 м/с	t	1463
4450	850 м/с	f	1463
4451	оголошується наказом командира частини	f	1464
4452	оголошується наказом начальника гарнізону	t	1464
4453	відбувається з 15 жовтня по 15 квітня	f	1464
4454	12 см	f	1465
4455	16 см	t	1465
4456	15 см	f	1465
4457	300 м	f	1466
4458	250 м	t	1466
4459	200 м	f	1466
4460	4-6 с	f	1467
4461	3,5-6,5 с	t	1467
4462	4,5 - 6,5 с	f	1467
4463	14-денне	t	1468
4464	15-денне	f	1468
4465	не більше 21 дня	f	1468
4466	необмежений	f	1469
4467	3 хв.	f	1469
4468	5 хв.	t	1469
4469	кумулятивної	t	1470
4470	осколкової	f	1470
4471	фугасної	f	1470
4472	під особисту розписку в книзі видачі зброї та боєприпасів,	f	1471
4473	під підпис помічника начальника варти в книзі видачі зброї та боєприпасів	f	1471
4474	під підпис начальника варти в книзі видачі зброї та боєприпасів.	t	1471
4475	начальникові варти	t	1472
4476	розвідному	f	1472
4477	заступнику начальникові варти	f	1472
4478	600 м	t	1473
4479	500 м	f	1473
4480	400 м	f	1473
4481	3-10 м	f	1474
4482	2,5-15 м	t	1474
4483	5-15 м	f	1474
4484	перед заступанням на пости (після того, як повернеться зміна з постів та буде проведено у варті бойовий розподіл)	t	1475
4485	після повернення з постів (після того, як повернеться зміна з постів та буде проведено у варті бойовий розподіл)	f	1475
4486	по розпорядженню начальника варти в будь-який час	f	1475
4487	постійний (П)	f	1476
4488	1	f	1476
4489	3	t	1476
4490	3 патр.	f	1477
4491	4 патр.	t	1477
4492	5 патр.	f	1477
4493	7х	f	1478
4494	3,5х	t	1478
4495	4х	f	1478
4496	15 см	f	1479
4497	10 см	f	1479
4498	8 см	t	1479
4499	2 кг	f	1480
4500	2,2 кг	t	1480
4501	1,5 кг	f	1480
4502	на 20 см	f	1481
4503	на 12 см	t	1481
4504	на 15 см	f	1481
4505	650 патр.	f	1482
4506	600 патр.	t	1482
4507	700 патр.	f	1482
4508	особи, яким чатові підпорядковані	t	1483
4509	особи, яким чатові підпорядковані та особи, які прибули для перевірки варт із штабів вищого рівня	f	1483
4510	особи, яким чатові підпорядковані, та військовий комендант гарнізону	f	1483
4511	810 м/с	f	1484
4512	830 м/с	t	1484
4513	850 м/с	f	1484
4514	оголошується наказом командира частини	f	1485
4515	оголошується наказом начальника гарнізону	t	1485
4516	відбувається з 15 жовтня по 15 квітня	f	1485
4517	12 см	f	1486
4518	16 см	t	1486
4519	15 см	f	1486
4520	300 м	f	1487
4521	250 м	t	1487
4522	200 м	f	1487
4523	4-6 с	f	1488
4524	3,5-6,5 с	t	1488
4525	4,5 - 6,5 с	f	1488
4526	14-денне	t	1489
4527	15-денне	f	1489
4528	не більше 21 дня	f	1489
4529	необмежений	f	1490
4530	3 хв.	f	1490
4531	5 хв.	t	1490
4532	кумулятивної	t	1491
4533	осколкової	f	1491
4534	фугасної	f	1491
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: zvp_user
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: zvp_user
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: zvp_user
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add Допуск	7	add_access
26	Can change Допуск	7	change_access
27	Can delete Допуск	7	delete_access
28	Can view Допуск	7	view_access
29	Can add Відповідь	8	add_answer
30	Can change Відповідь	8	change_answer
31	Can delete Відповідь	8	delete_answer
32	Can view Відповідь	8	view_answer
33	Can add Питання	9	add_question
34	Can change Питання	9	change_question
35	Can delete Питання	9	delete_question
36	Can view Питання	9	view_question
37	Can add Тест	10	add_quiz
38	Can change Тест	10	change_quiz
39	Can delete Тест	10	delete_quiz
40	Can view Тест	10	view_quiz
41	Can add Результат	11	add_result
42	Can change Результат	11	change_result
43	Can delete Результат	11	delete_result
44	Can view Результат	11	view_result
45	Can add starting quiz	12	add_startingquiz
46	Can change starting quiz	12	change_startingquiz
47	Can delete starting quiz	12	delete_startingquiz
48	Can view starting quiz	12	view_startingquiz
49	Can add Білет	13	add_ticket
50	Can change Білет	13	change_ticket
51	Can delete Білет	13	delete_ticket
52	Can view Білет	13	view_ticket
53	Can add ПМК	14	add_department
54	Can change ПМК	14	change_department
55	Can delete ПМК	14	delete_department
56	Can view ПМК	14	view_department
57	Can add Предмет	15	add_discipline
58	Can change Предмет	15	change_discipline
59	Can delete Предмет	15	delete_discipline
60	Can view Предмет	15	view_discipline
61	Can add Оцінка	16	add_mark
62	Can change Оцінка	16	change_mark
63	Can delete Оцінка	16	delete_mark
64	Can view Оцінка	16	view_mark
65	Can add Студент	17	add_student
66	Can change Студент	17	change_student
67	Can delete Студент	17	delete_student
68	Can view Студент	17	view_student
69	Can add Викладач	18	add_teacher
70	Can change Викладач	18	change_teacher
71	Can delete Викладач	18	delete_teacher
72	Can view Викладач	18	view_teacher
73	Can add Звання викладача	19	add_teacherrank
74	Can change Звання викладача	19	change_teacherrank
75	Can delete Звання викладача	19	delete_teacherrank
76	Can view Звання викладача	19	view_teacherrank
77	Can add Взвод	20	add_troop
78	Can change Взвод	20	change_troop
79	Can delete Взвод	20	delete_troop
80	Can view Взвод	20	view_troop
81	Can add presence	21	add_presence
82	Can change presence	21	change_presence
83	Can delete presence	21	delete_presence
84	Can view presence	21	view_presence
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: zvp_user
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$120000$8bAFtLtoBe6P$ZpFDUdqbzaywynL/SJSGnc+2m1F4lEJp/6+PsqHyHIw=	2019-04-04 21:44:21.138739+03	t	admin				t	t	2019-04-03 21:24:26.510735+03
2	pbkdf2_sha256$120000$uwlBBQB1QUir$oBLsFH3IzinIxBV2VYDxZuysFM7/fm1l51XTeyd8n6k=	\N	f	jurash				f	t	2019-04-04 21:44:48.597582+03
4	pbkdf2_sha256$120000$Q0UtGGcqIU4b$i9J3hunum9M638AILi0k1yZp0eeQnYILwDs/cRZLMkc=	\N	f	vasylenko				f	t	2019-04-04 21:44:48.912099+03
5	pbkdf2_sha256$120000$9SYf0j0Nn5eS$D+CBTumxii+4nCOrxkyj7Vmm+hQDo+moRUgs2cvY5JM=	\N	f	djadenko				f	t	2019-04-04 21:44:49.012298+03
3	pbkdf2_sha256$120000$HA2SQprQYjgr$5dRU58NEHOKvF7kOLQbXF/pGEOqaQEwVeqYkpWCI3ck=	2019-04-04 21:47:21.444118+03	f	lemeshko				f	t	2019-04-04 21:44:48.778126+03
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: zvp_user
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: zvp_user
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: control_panel_presence; Type: TABLE DATA; Schema: public; Owner: zvp_user
--

COPY public.control_panel_presence (id, date_time, quiz_id, student_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: zvp_user
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2019-04-03 21:25:17.353419+03	1	ЗВП	1	[{"added": {}}]	15	1
2	2019-04-03 21:25:19.876651+03	1	Контрольна №1	1	[{"added": {}}]	10	1
3	2019-04-03 21:36:32.968193+03	1	Білет 1	1	[{"added": {}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041a\\u0430\\u043b\\u0456\\u0431\\u0440 \\u043a\\u0443\\u043b\\u0435\\u043c\\u0435\\u0442\\u0430 \\u041a\\u0430\\u043b\\u0430\\u0448\\u043d\\u0438\\u043a\\u043e\\u0432\\u0430 (\\u041f\\u041a)"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041d\\u0430\\u0439\\u0431\\u0456\\u043b\\u044c\\u0448 \\u0434\\u0456\\u0439\\u0441\\u043d\\u0438\\u0439 \\u0432\\u043e\\u0433\\u043e\\u043d\\u044c \\u043f\\u043e \\u043d\\u0430\\u0437\\u0435\\u043c\\u043d\\u0438\\u043c \\u0442\\u0430 \\u043f\\u043e\\u0432\\u0456\\u0442\\u0440\\u044f\\u043d\\u0438\\u043c \\u0446\\u0456\\u043b\\u044f\\u043c \\u0437 \\u041f\\u041a"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041f\\u0440\\u0438\\u0446\\u0456\\u043b\\u044c\\u043d\\u0430 \\u0434\\u0430\\u043b\\u044c\\u043d\\u0456\\u0441\\u0442\\u044c \\u0437 \\u041f\\u041a"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041a\\u0430\\u043b\\u0456\\u0431\\u0440 \\u0433\\u0432\\u0438\\u043d\\u0442\\u0456\\u0432\\u043a\\u0438 \\u0421\\u0412\\u0414"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041d\\u0430\\u0439\\u0431\\u0456\\u043b\\u044c\\u0448 \\u0435\\u0444\\u0435\\u043a\\u0442\\u0438\\u0432\\u043d\\u0438\\u0439 \\u0432\\u043e\\u0433\\u043e\\u043d\\u044c \\u0437 \\u0421\\u0412\\u0414"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041f\\u0440\\u0438\\u0446\\u0456\\u043b\\u044c\\u043d\\u0430 \\u0434\\u0430\\u043b\\u044c\\u043d\\u0456\\u0441\\u0442\\u044c \\u0441\\u0442\\u0440\\u0456\\u043b\\u044c\\u0431\\u0438 \\u0437 \\u0432\\u0456\\u0434\\u043a\\u0440\\u0438\\u0442\\u0438\\u043c \\u043f\\u0440\\u0438\\u0446\\u0456\\u043b\\u043e\\u043c \\u0437 \\u0421\\u0412\\u0414"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u042f\\u043a\\u0430 \\u043e\\u0446\\u0456\\u043d\\u043a\\u0430 \\u0437\\u0430 \\u0432\\u0438\\u043a\\u043e\\u043d\\u0430\\u043d\\u043d\\u044f 1\\u0412\\u041d\\u0421 \\u0437 \\u041f\\u041c"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041f\\u0440\\u0438 \\u043f\\u0435\\u0440\\u0435\\u043c\\u0456\\u0449\\u0435\\u043d\\u043d\\u0456 \\u043c\\u0443\\u0448\\u043a\\u0438 \\u0432 \\u0431\\u0456\\u043a \\u043d\\u0430 1 \\u043c\\u043c \\u0421\\u0422\\u0412 \\u043f\\u0440\\u0438 \\u0441\\u0442\\u0440\\u0456\\u043b\\u044c\\u0431\\u0456 \\u043d\\u0430 100 \\u043c \\u0437 \\u041f\\u041a \\u0437\\u043c\\u0456\\u0449\\u0443\\u0454\\u0442\\u044c\\u0441\\u044f \\u043d\\u0430"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0414\\u043b\\u044f \\u0447\\u043e\\u0433\\u043e \\u0432\\u0438\\u043a\\u043e\\u0440\\u0438\\u0441\\u0442\\u043e\\u0432\\u0443\\u044e\\u0442\\u044c\\u0441\\u044f \\u0441\\u043d\\u0430\\u0439\\u043f\\u0435\\u0440\\u0441\\u044c\\u043a\\u0456 \\u043f\\u0430\\u0442\\u0440\\u043e\\u043d\\u0438 \\u0432 \\u0421\\u0412\\u0414"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "5,45 \\u043c\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "12,7 \\u043c\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "7,62 \\u043c\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0434\\u043e 800 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0434\\u043e 1500 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0434\\u043e 1000\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "1500\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "1000\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "800\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "5,45 \\u043c\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "9 \\u043c\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "7,62 \\u043c\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0434\\u043e 800 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0434\\u043e 1000 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0434\\u043e 1200 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "1300 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "1000 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "1200 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u201c5\\u201d - 35; \\u201c4\\u201d - 30; \\u201c3\\u201d - 25"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u201c5\\u201d - 40; \\u201c4\\u201d - 35; \\u201c3\\u201d - 30"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u201c5\\u201d - 30; \\u201c4\\u201d - 25; \\u201c3\\u201d - 20"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "15 \\u0441\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "12 \\u0441\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "18 \\u0441\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0434\\u043b\\u044f \\u0431\\u0456\\u043b\\u044c\\u0448\\u043e\\u0457 \\u0434\\u0430\\u043b\\u044c\\u043d\\u043e\\u0441\\u0442\\u0456 \\u043f\\u043e\\u043b\\u044c\\u043e\\u0442\\u0443 \\u043a\\u0443\\u043b\\u0456"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0434\\u043b\\u044f \\u0431\\u0456\\u043b\\u044c\\u0448\\u043e\\u0457 \\u043a\\u0443\\u0447\\u043d\\u043e\\u0441\\u0442\\u0456 \\u0431\\u043e\\u044e"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0434\\u043b\\u044f \\u0431\\u0456\\u043b\\u044c\\u0448\\u043e\\u0457 \\u0431\\u0440\\u043e\\u043d\\u0435\\u0431\\u0456\\u0439\\u043d\\u043e\\u0441\\u0442\\u0456 \\u043a\\u0443\\u043b\\u0456"}}]	13	1
4	2019-04-03 21:38:47.926965+03	1	Білет 1	2	[{"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041a\\u0430\\u043b\\u0456\\u0431\\u0440 \\u0413\\u041f-25"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041a\\u0456\\u043b\\u044c\\u043a\\u0456\\u0441\\u0442\\u044c \\u043d\\u0430\\u0440\\u0456\\u0437\\u0456\\u0432 \\u0443 \\u0441\\u0442\\u0432\\u043e\\u043b\\u0456 \\u0413\\u041f-25"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0415\\u0444\\u0435\\u043a\\u0442\\u0438\\u0432\\u043d\\u0430 \\u0434\\u0430\\u043b\\u044c\\u043d\\u0456\\u0441\\u0442\\u044c \\u0441\\u0442\\u0440\\u0456\\u043b\\u044c\\u0431\\u0438 \\u043e\\u0441\\u043a\\u043e\\u043b\\u043a\\u043e\\u0432\\u0438\\u043c\\u0438 \\u0433\\u0440\\u0430\\u043d\\u0430\\u0442\\u0430\\u043c\\u0438 \\u0437 \\u0413\\u041f-25"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041a\\u0430\\u043b\\u0456\\u0431\\u0440 \\u0420\\u041f\\u0413-22"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "30 \\u043c\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "40 \\u043c\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "37 \\u043c\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "4"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "10"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "12"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0434\\u043e 200 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0434\\u043e 250 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0434\\u043e 300 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "40 \\u043c\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "73 \\u043c\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "64 \\u043c\\u043c"}}]	13	1
5	2019-04-03 21:42:51.298744+03	1	Білет 1	2	[{"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041a\\u0430\\u043b\\u0456\\u0431\\u0440 \\u0420\\u041f\\u0413-26"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041f\\u0440\\u0438\\u0446\\u0456\\u043b\\u044c\\u043d\\u0430 \\u0434\\u0430\\u043b\\u044c\\u043d\\u0456\\u0441\\u0442\\u044c \\u0420\\u041f\\u0413-22"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041c\\u0456\\u0441\\u0446\\u044f \\u0434\\u043b\\u044f \\u0437\\u0431\\u0435\\u0440\\u0456\\u0433\\u0430\\u043d\\u043d\\u044f \\u0432\\u0441\\u0456\\u0445 \\u0432\\u0438\\u0434\\u0456\\u0432 \\u043e\\u0431\\u043c\\u0443\\u043d\\u0434\\u0438\\u0440\\u0443\\u0432\\u0430\\u043d\\u043d\\u044f \\u0437\\u0430\\u043a\\u0440\\u0456\\u043f\\u043b\\u044e\\u044e\\u0442\\u044c\\u0441\\u044f \\u0437\\u0430 \\u0432\\u0456\\u0439\\u0441\\u044c\\u043a\\u043e\\u0432\\u043e\\u0441\\u043b\\u0443\\u0436\\u0431\\u043e\\u0432\\u0446\\u044f\\u043c\\u0438 \\u0439 \\u043f\\u043e\\u0437\\u043d\\u0430\\u0447\\u0430\\u044e\\u0442\\u044c\\u0441\\u044f: \\u044f\\u0440\\u043b\\u0438\\u043a\\u0430\\u043c\\u0438 \\u0456\\u0437 \\u0437\\u0430\\u0437\\u043d\\u0430\\u0447\\u0435\\u043d\\u043d\\u044f\\u043c \\u0432\\u0456\\u0439\\u0441\\u044c\\u043a\\u043e\\u0432\\u043e\\u0433\\u043e \\u0437\\u0432\\u0430\\u043d\\u043d\\u044f, \\u043f\\u0440\\u0456\\u0437\\u0432\\u0438\\u0449\\u0430 \\u0442\\u0430 \\u0456\\u043d\\u0456\\u0446\\u0456\\u0430\\u043b\\u0456\\u0432 \\u0432\\u0456\\u0439\\u0441\\u044c\\u043a\\u043e\\u0432\\u043e\\u0441\\u043b\\u0443\\u0436\\u0431\\u043e\\u0432\\u0446\\u044f."}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0423\\u0441\\u0456 \\u043f\\u0440\\u0438\\u043c\\u0456\\u0449\\u0435\\u043d\\u043d\\u044f \\u0442\\u0430 \\u0444\\u0430\\u0441\\u0430\\u0434\\u0438 \\u0431\\u0443\\u0434\\u0456\\u0432\\u0435\\u043b\\u044c \\u043c\\u0430\\u044e\\u0442\\u044c \\u0431\\u0443\\u0442\\u0438 \\u043f\\u043e\\u0444\\u0430\\u0440\\u0431\\u043e\\u0432\\u0430\\u043d\\u0456"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041e\\u043f\\u0430\\u043b\\u0435\\u043d\\u043d\\u044f \\u0437\\u0430\\u043a\\u0456\\u043d\\u0447\\u0443\\u0454\\u0442\\u044c\\u0441\\u044f \\u043d\\u0435 \\u043f\\u0456\\u0437\\u043d\\u0456\\u0448\\u0435 \\u043d\\u0456\\u0436"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0422\\u0440\\u0438\\u0432\\u0430\\u043b\\u0456\\u0441\\u0442\\u044c \\u0440\\u043e\\u0437\\u0432\\u043e\\u0434\\u0443 \\u0432\\u0430\\u0440\\u0442 \\u043d\\u0435 \\u043f\\u043e\\u0432\\u0438\\u043d\\u043d\\u0430 \\u043f\\u0435\\u0440\\u0435\\u0432\\u0438\\u0449\\u0443\\u0432\\u0430\\u0442\\u0438"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0421\\u043a\\u043b\\u0430\\u0434 \\u0432\\u0430\\u0440\\u0442, \\u0449\\u043e \\u0437\\u043c\\u0456\\u043d\\u0438\\u0432\\u0441\\u044f, \\u0437\\u0432\\u0456\\u043b\\u044c\\u043d\\u044e\\u0454\\u0442\\u044c\\u0441\\u044f \\u0432\\u0456\\u0434 \\u0437\\u0430\\u043d\\u044f\\u0442\\u044c \\u0456 \\u0440\\u043e\\u0431\\u0456\\u0442"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0412\\u0441\\u0442\\u0443\\u043f\\u0430\\u0442\\u0438 \\u0432 \\u0440\\u043e\\u0437\\u043c\\u043e\\u0432\\u0443 \\u0437 \\u043e\\u0441\\u043e\\u0431\\u0430\\u043c\\u0438, \\u044f\\u043a\\u0456 \\u043f\\u0440\\u0438\\u0431\\u0443\\u043b\\u0438 \\u0434\\u043e \\u0432\\u0430\\u0440\\u0442\\u043e\\u0432\\u043e\\u0433\\u043e \\u043f\\u0440\\u0438\\u043c\\u0456\\u0449\\u0435\\u043d\\u043d\\u044f \\u043c\\u043e\\u0436\\u0443\\u0442\\u044c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "64 \\u043c\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "40 \\u043c\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "73 \\u043c\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "250 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "200 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "300 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043d\\u043e\\u043c\\u0435\\u0440\\u0430\\u043c\\u0438"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u044f\\u0440\\u043b\\u0438\\u043a\\u0430\\u043c\\u0438 \\u0456\\u0437 \\u0437\\u0430\\u0437\\u043d\\u0430\\u0447\\u0435\\u043d\\u043d\\u044f\\u043c \\u0432\\u0456\\u0439\\u0441\\u044c\\u043a\\u043e\\u0432\\u043e\\u0433\\u043e \\u0437\\u0432\\u0430\\u043d\\u043d\\u044f, \\u043f\\u0440\\u0456\\u0437\\u0432\\u0438\\u0449\\u0430 \\u0442\\u0430 \\u0456\\u043d\\u0456\\u0446\\u0456\\u0430\\u043b\\u0456\\u0432 \\u0432\\u0456\\u0439\\u0441\\u044c\\u043a\\u043e\\u0432\\u043e\\u0441\\u043b\\u0443\\u0436\\u0431\\u043e\\u0432\\u0446\\u044f"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u044f\\u0440\\u043b\\u0438\\u043a\\u0430\\u043c\\u0438 \\u0456\\u0437 \\u0437\\u0430\\u0437\\u043d\\u0430\\u0447\\u0435\\u043d\\u043d\\u044f\\u043c \\u043d\\u043e\\u043c\\u0435\\u0440\\u0430\\u043c\\u0438, \\u0432\\u0456\\u0439\\u0441\\u044c\\u043a\\u043e\\u0432\\u043e\\u0433\\u043e \\u0437\\u0432\\u0430\\u043d\\u043d\\u044f, \\u043f\\u0440\\u0456\\u0437\\u0432\\u0438\\u0449\\u0430 \\u0442\\u0430 \\u0456\\u043d\\u0456\\u0446\\u0456\\u0430\\u043b\\u0456\\u0432 \\u0432\\u0456\\u0439\\u0441\\u044c\\u043a\\u043e\\u0432\\u043e\\u0441\\u043b\\u0443\\u0436\\u0431\\u043e\\u0432\\u0446\\u044f"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0443 \\u043c\\u0430\\u0441\\u043a\\u0443\\u044e\\u0447\\u0438\\u0439 \\u043a\\u043e\\u043b\\u0456\\u0440"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0443 \\u043a\\u043e\\u043b\\u0456\\u0440 \\u0434\\u0435\\u0440\\u0436\\u0430\\u0432\\u043d\\u043e\\u0433\\u043e \\u043f\\u0440\\u0430\\u043f\\u043e\\u0440\\u0430"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0443 \\u0432\\u0438\\u0437\\u043d\\u0430\\u0447\\u0435\\u043d\\u0438\\u0439 \\u043a\\u043e\\u043b\\u0456\\u0440."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0437\\u0430 \\u043e\\u0434\\u043d\\u0443 \\u0433\\u043e\\u0434\\u0438\\u043d\\u0443 \\u0434\\u043e \\u0432\\u0456\\u0434\\u0431\\u043e\\u044e"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0437\\u0430 \\u0434\\u0432\\u0456 \\u0433\\u043e\\u0434\\u0438\\u043d\\u0438 \\u0434\\u043e \\u0432\\u0456\\u0434\\u0431\\u043e\\u044e"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0437\\u0430 \\u0442\\u0440\\u0438\\u0433\\u043e\\u0434\\u0438\\u043d\\u0438 \\u0434\\u043e \\u0432\\u0456\\u0434\\u0431\\u043e\\u044e"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "30 \\u0445\\u0432\\u0438\\u043b\\u0438\\u043d"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "40 \\u0445\\u0432\\u0438\\u043b\\u0438\\u043d"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "50 \\u0445\\u0432\\u0438\\u043b\\u0438\\u043d"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0443 \\u0434\\u0435\\u043d\\u044c \\u0437\\u043c\\u0456\\u043d\\u0438"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043d\\u0430 4 \\u0433\\u043e\\u0434\\u0438\\u043d\\u0438 \\u043f\\u0456\\u0441\\u043b\\u044f \\u043f\\u0440\\u0438\\u0431\\u0443\\u0442\\u0442\\u044f \\u0434\\u043e \\u043f\\u0456\\u0434\\u0440\\u043e\\u0437\\u0434\\u0456\\u043b\\u0443"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043d\\u0430 4 \\u0433\\u043e\\u0434\\u0438\\u043d\\u0438 \\u043f\\u0456\\u0441\\u043b\\u044f \\u0437\\u043c\\u0456\\u043d\\u0438"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043d\\u0430\\u0447\\u0430\\u043b\\u044c\\u043d\\u0438\\u043a \\u0432\\u0430\\u0440\\u0442\\u0438 \\u0442\\u0430 \\u0439\\u043e\\u0433\\u043e \\u043f\\u043e\\u043c\\u0456\\u0447\\u043d\\u0438\\u043a"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0442\\u0456\\u043b\\u044c\\u043a\\u0438 \\u0440\\u043e\\u0437\\u0432\\u0456\\u0434\\u043d\\u0438\\u0439"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0442\\u0456\\u043b\\u044c\\u043a\\u0438 \\u0447\\u0430\\u0442\\u043e\\u0432\\u0438\\u0439 \\u043d\\u0430 \\u0432\\u0445\\u043e\\u0434\\u0456 \\u0434\\u043e \\u0432\\u0430\\u0440\\u0442\\u043e\\u0432\\u043e\\u0433\\u043e \\u043f\\u0440\\u0438\\u043c\\u0456\\u0449\\u0435\\u043d\\u043d\\u044f"}}]	13	1
6	2019-04-03 21:45:44.850074+03	2	Білет 8	2	[{"changed": {"fields": ["title"]}}]	13	1
7	2019-04-03 21:51:17.119396+03	2	Білет 8	3		13	1
8	2019-04-03 21:51:26.730735+03	3	Білет 8	1	[{"added": {}}]	13	1
9	2019-04-03 21:59:30.293271+03	4	Білет 1	3		13	1
10	2019-04-03 21:59:30.321152+03	3	Білет 8	3		13	1
11	2019-04-03 22:00:37.325004+03	5	Білет 8	2	[{"changed": {"fields": ["title"]}}]	13	1
12	2019-04-03 22:07:53.329569+03	63	Вступати в розмову з особами, які прибули до вартового приміщення можуть	3		9	1
13	2019-04-03 22:07:53.343803+03	62	Склад варт, що змінився, звільнюється від занять і робіт	3		9	1
14	2019-04-03 22:07:53.351981+03	61	Тривалість розводу варт не повинна перевищувати	3		9	1
15	2019-04-03 22:07:53.360366+03	60	Опалення закінчується не пізніше ніж	3		9	1
16	2019-04-03 22:07:53.368714+03	59	Усі приміщення та фасади будівель мають бути пофарбовані	3		9	1
17	2019-04-03 22:07:53.377171+03	58	Місця для зберігання всіх видів обмундирування закріплюються за військовослужбовцями й позначаються: ярликами із зазначенням військового звання, прізвища та ініціалів військовослужбовця.	3		9	1
18	2019-04-03 22:07:53.385386+03	57	Прицільна дальність РПГ-22	3		9	1
19	2019-04-03 22:07:53.393805+03	56	Калібр РПГ-26	3		9	1
20	2019-04-03 22:07:53.401998+03	55	Калібр РПГ-22	3		9	1
21	2019-04-03 22:07:53.410384+03	54	Ефективна дальність стрільби осколковими гранатами з ГП-25	3		9	1
22	2019-04-03 22:07:53.418771+03	53	Кількість нарізів у стволі ГП-25	3		9	1
23	2019-04-03 22:07:53.42748+03	52	Калібр ГП-25	3		9	1
24	2019-04-03 22:07:53.435339+03	51	Для чого використовуються снайперські патрони в СВД	3		9	1
25	2019-04-03 22:07:53.443754+03	50	При переміщенні мушки в бік на 1 мм СТВ при стрільбі на 100 м з ПК зміщується на	3		9	1
26	2019-04-03 22:07:53.45207+03	49	Яка оцінка за виконання 1ВНС з ПМ	3		9	1
27	2019-04-03 22:07:53.460573+03	48	Прицільна дальність стрільби з відкритим прицілом з СВД	3		9	1
28	2019-04-03 22:07:53.468697+03	47	Найбільш ефективний вогонь з СВД	3		9	1
29	2019-04-03 22:07:53.477102+03	46	Калібр гвинтівки СВД	3		9	1
30	2019-04-03 22:07:53.485402+03	45	Прицільна дальність з ПК	3		9	1
31	2019-04-03 22:07:53.493754+03	44	Найбільш дійсний вогонь по наземним та повітряним цілям з ПК	3		9	1
32	2019-04-03 22:07:53.502043+03	43	Калібр кулемета Калашникова (ПК)	3		9	1
33	2019-04-03 22:07:53.510347+03	42	Калібр кулемета Калашникова (ПК)	3		9	1
34	2019-04-03 22:07:53.518645+03	41	Найбільш дійсний вогонь по наземним та повітряним цілям з ПК	3		9	1
35	2019-04-03 22:07:53.52721+03	40	Прицільна дальність з ПК	3		9	1
36	2019-04-03 22:07:53.535397+03	39	Калібр гвинтівки СВД	3		9	1
37	2019-04-03 22:07:53.54384+03	38	Найбільш ефективний вогонь з СВД	3		9	1
38	2019-04-03 22:07:53.552058+03	37	Прицільна дальність стрільби з відкритим прицілом з СВД	3		9	1
39	2019-04-03 22:07:53.560496+03	36	Яка оцінка за виконання 1ВНС з ПМ	3		9	1
40	2019-04-03 22:07:53.568781+03	35	При переміщенні мушки в бік на 1 мм СТВ при стрільбі на 100 м з ПК зміщується на	3		9	1
41	2019-04-03 22:07:53.577094+03	34	Для чого використовуються снайперські патрони в СВД	3		9	1
42	2019-04-03 22:07:53.58545+03	33	Калібр ГП-25	3		9	1
43	2019-04-03 22:07:53.5937+03	32	Кількість нарізів у стволі ГП-25	3		9	1
44	2019-04-03 22:07:53.60201+03	31	Ефективна дальність стрільби осколковими гранатами з ГП-25	3		9	1
45	2019-04-03 22:07:53.610344+03	30	Калібр РПГ-22	3		9	1
46	2019-04-03 22:07:53.618617+03	29	Калібр РПГ-26	3		9	1
47	2019-04-03 22:07:53.63541+03	28	Прицільна дальність РПГ-22	3		9	1
48	2019-04-03 22:07:53.643655+03	27	Місця для зберігання всіх видів обмундирування закріплюються за військовослужбовцями й позначаються: ярликами із зазначенням військового звання, прізвища та ініціалів військовослужбовця.	3		9	1
49	2019-04-03 22:07:53.652034+03	26	Усі приміщення та фасади будівель мають бути пофарбовані	3		9	1
50	2019-04-03 22:07:53.660477+03	25	Опалення закінчується не пізніше ніж	3		9	1
51	2019-04-03 22:07:53.668808+03	24	Тривалість розводу варт не повинна перевищувати	3		9	1
52	2019-04-03 22:07:53.677219+03	23	Склад варт, що змінився, звільнюється від занять і робіт	3		9	1
53	2019-04-03 22:07:53.68546+03	22	Вступати в розмову з особами, які прибули до вартового приміщення можуть	3		9	1
54	2019-04-03 22:11:21.867601+03	84	Вступати в розмову з особами, які прибули до вартового приміщення можуть	3		9	1
55	2019-04-03 22:11:21.899786+03	83	Склад варт, що змінився, звільнюється від занять і робіт	3		9	1
56	2019-04-03 22:11:21.908182+03	82	Тривалість розводу варт не повинна перевищувати	3		9	1
57	2019-04-03 22:11:21.916388+03	81	Опалення закінчується не пізніше ніж	3		9	1
58	2019-04-03 22:11:21.924847+03	80	Усі приміщення та фасади будівель мають бути пофарбовані	3		9	1
59	2019-04-03 22:11:21.933053+03	79	Місця для зберігання всіх видів обмундирування закріплюються за військовослужбовцями й позначаються: ярликами із зазначенням військового звання, прізвища та ініціалів військовослужбовця.	3		9	1
60	2019-04-03 22:11:21.941645+03	78	Прицільна дальність РПГ-22	3		9	1
61	2019-04-03 22:11:21.949801+03	77	Калібр РПГ-26	3		9	1
62	2019-04-03 22:11:21.958041+03	76	Калібр РПГ-22	3		9	1
63	2019-04-03 22:11:21.966482+03	75	Ефективна дальність стрільби осколковими гранатами з ГП-25	3		9	1
64	2019-04-03 22:11:21.975327+03	74	Кількість нарізів у стволі ГП-25	3		9	1
65	2019-04-03 22:11:21.983081+03	73	Калібр ГП-25	3		9	1
66	2019-04-03 22:11:21.991457+03	72	Для чого використовуються снайперські патрони в СВД	3		9	1
67	2019-04-03 22:11:21.999767+03	71	При переміщенні мушки в бік на 1 мм СТВ при стрільбі на 100 м з ПК зміщується на	3		9	1
68	2019-04-03 22:11:22.008224+03	70	Яка оцінка за виконання 1ВНС з ПМ	3		9	1
69	2019-04-03 22:11:22.016478+03	69	Прицільна дальність стрільби з відкритим прицілом з СВД	3		9	1
70	2019-04-03 22:11:22.024694+03	68	Найбільш ефективний вогонь з СВД	3		9	1
71	2019-04-03 22:11:22.033137+03	67	Калібр гвинтівки СВД	3		9	1
72	2019-04-03 22:11:22.041431+03	66	Прицільна дальність з ПК	3		9	1
73	2019-04-03 22:11:22.049795+03	65	Найбільш дійсний вогонь по наземним та повітряним цілям з ПК	3		9	1
74	2019-04-03 22:11:22.058122+03	64	Калібр кулемета Калашникова (ПК)	3		9	1
75	2019-04-03 22:15:53.504937+03	105	Вступати в розмову з особами, які прибули до вартового приміщення можуть	3		9	1
76	2019-04-03 22:15:53.527435+03	104	Склад варт, що змінився, звільнюється від занять і робіт	3		9	1
77	2019-04-03 22:15:53.535738+03	103	Тривалість розводу варт не повинна перевищувати	3		9	1
78	2019-04-03 22:15:53.54422+03	102	Опалення закінчується не пізніше ніж	3		9	1
79	2019-04-03 22:15:53.552393+03	101	Усі приміщення та фасади будівель мають бути пофарбовані	3		9	1
80	2019-04-03 22:15:53.560707+03	100	Місця для зберігання всіх видів обмундирування закріплюються за військовослужбовцями й позначаються: ярликами із зазначенням військового звання, прізвища та ініціалів військовослужбовця.	3		9	1
81	2019-04-03 22:15:53.569076+03	99	Прицільна дальність РПГ-22	3		9	1
82	2019-04-03 22:15:53.577562+03	98	Калібр РПГ-26	3		9	1
83	2019-04-03 22:15:53.585639+03	97	Калібр РПГ-22	3		9	1
84	2019-04-03 22:15:53.594016+03	96	Ефективна дальність стрільби осколковими гранатами з ГП-25	3		9	1
85	2019-04-03 22:15:53.602392+03	95	Кількість нарізів у стволі ГП-25	3		9	1
86	2019-04-03 22:15:53.610722+03	94	Калібр ГП-25	3		9	1
87	2019-04-03 22:15:53.619085+03	93	Для чого використовуються снайперські патрони в СВД	3		9	1
88	2019-04-03 22:15:53.627373+03	92	При переміщенні мушки в бік на 1 мм СТВ при стрільбі на 100 м з ПК зміщується на	3		9	1
89	2019-04-03 22:15:53.635787+03	91	Яка оцінка за виконання 1ВНС з ПМ	3		9	1
90	2019-04-03 22:15:53.644186+03	90	Прицільна дальність стрільби з відкритим прицілом з СВД	3		9	1
91	2019-04-03 22:15:53.652323+03	89	Найбільш ефективний вогонь з СВД	3		9	1
92	2019-04-03 22:15:53.660854+03	88	Калібр гвинтівки СВД	3		9	1
93	2019-04-03 22:15:53.669143+03	87	Прицільна дальність з ПК	3		9	1
94	2019-04-03 22:15:53.677439+03	86	Найбільш дійсний вогонь по наземним та повітряним цілям з ПК	3		9	1
95	2019-04-03 22:15:53.685727+03	85	Калібр кулемета Калашникова (ПК)	3		9	1
96	2019-04-03 22:18:34.105982+03	126	Вступати в розмову з особами, які прибули до вартового приміщення можуть	3		9	1
97	2019-04-03 22:18:34.119507+03	125	Склад варт, що змінився, звільнюється від занять і робіт	3		9	1
98	2019-04-03 22:18:34.127718+03	124	Тривалість розводу варт не повинна перевищувати	3		9	1
99	2019-04-03 22:18:34.136038+03	123	Опалення закінчується не пізніше ніж	3		9	1
100	2019-04-03 22:18:34.144486+03	122	Усі приміщення та фасади будівель мають бути пофарбовані	3		9	1
101	2019-04-03 22:18:34.152848+03	121	Місця для зберігання всіх видів обмундирування закріплюються за військовослужбовцями й позначаються: ярликами із зазначенням військового звання, прізвища та ініціалів військовослужбовця.	3		9	1
102	2019-04-03 22:18:34.161123+03	120	Прицільна дальність РПГ-22	3		9	1
103	2019-04-03 22:18:34.169423+03	119	Калібр РПГ-26	3		9	1
104	2019-04-03 22:18:34.177694+03	118	Калібр РПГ-22	3		9	1
105	2019-04-03 22:18:34.18654+03	117	Ефективна дальність стрільби осколковими гранатами з ГП-25	3		9	1
106	2019-04-03 22:18:34.19434+03	116	Кількість нарізів у стволі ГП-25	3		9	1
107	2019-04-03 22:18:34.20278+03	115	Калібр ГП-25	3		9	1
108	2019-04-03 22:18:34.211032+03	114	Для чого використовуються снайперські патрони в СВД	3		9	1
109	2019-04-03 22:18:34.220023+03	113	При переміщенні мушки в бік на 1 мм СТВ при стрільбі на 100 м з ПК зміщується на	3		9	1
110	2019-04-03 22:18:34.22804+03	112	Яка оцінка за виконання 1ВНС з ПМ	3		9	1
111	2019-04-03 22:18:34.2368+03	111	Прицільна дальність стрільби з відкритим прицілом з СВД	3		9	1
112	2019-04-03 22:18:34.244518+03	110	Найбільш ефективний вогонь з СВД	3		9	1
113	2019-04-03 22:18:34.252967+03	109	Калібр гвинтівки СВД	3		9	1
114	2019-04-03 22:18:34.261093+03	108	Прицільна дальність з ПК	3		9	1
115	2019-04-03 22:18:34.270485+03	107	Найбільш дійсний вогонь по наземним та повітряним цілям з ПК	3		9	1
116	2019-04-03 22:18:34.27781+03	106	Калібр кулемета Калашникова (ПК)	3		9	1
117	2019-04-03 22:22:15.957233+03	147	Вступати в розмову з особами, які прибули до вартового приміщення можуть	3		9	1
118	2019-04-03 22:22:15.976362+03	146	Склад варт, що змінився, звільнюється від занять і робіт	3		9	1
119	2019-04-03 22:22:15.984492+03	145	Тривалість розводу варт не повинна перевищувати	3		9	1
120	2019-04-03 22:22:15.992789+03	144	Опалення закінчується не пізніше ніж	3		9	1
121	2019-04-03 22:22:16.001168+03	143	Усі приміщення та фасади будівель мають бути пофарбовані	3		9	1
122	2019-04-03 22:22:16.009589+03	142	Місця для зберігання всіх видів обмундирування закріплюються за військовослужбовцями й позначаються: ярликами із зазначенням військового звання, прізвища та ініціалів військовослужбовця.	3		9	1
123	2019-04-03 22:22:16.017903+03	141	Прицільна дальність РПГ-22	3		9	1
124	2019-04-03 22:22:16.026222+03	140	Калібр РПГ-26	3		9	1
125	2019-04-03 22:22:16.034558+03	139	Калібр РПГ-22	3		9	1
126	2019-04-03 22:22:16.042885+03	138	Ефективна дальність стрільби осколковими гранатами з ГП-25	3		9	1
127	2019-04-03 22:22:16.051238+03	137	Кількість нарізів у стволі ГП-25	3		9	1
128	2019-04-03 22:22:16.05954+03	136	Калібр ГП-25	3		9	1
129	2019-04-03 22:22:16.067834+03	135	Для чого використовуються снайперські патрони в СВД	3		9	1
130	2019-04-03 22:22:16.076282+03	134	При переміщенні мушки в бік на 1 мм СТВ при стрільбі на 100 м з ПК зміщується на	3		9	1
131	2019-04-03 22:22:16.084555+03	133	Яка оцінка за виконання 1ВНС з ПМ	3		9	1
132	2019-04-03 22:22:16.092929+03	132	Прицільна дальність стрільби з відкритим прицілом з СВД	3		9	1
133	2019-04-03 22:22:16.101166+03	131	Найбільш ефективний вогонь з СВД	3		9	1
134	2019-04-03 22:22:16.109549+03	130	Калібр гвинтівки СВД	3		9	1
135	2019-04-03 22:22:16.117887+03	129	Прицільна дальність з ПК	3		9	1
136	2019-04-03 22:22:16.126253+03	128	Найбільш дійсний вогонь по наземним та повітряним цілям з ПК	3		9	1
137	2019-04-03 22:22:16.134538+03	127	Калібр кулемета Калашникова (ПК)	3		9	1
138	2019-04-03 22:22:44.055866+03	168	Вступати в розмову з особами, які прибули до вартового приміщення можуть	3		9	1
139	2019-04-03 22:22:44.067016+03	167	Склад варт, що змінився, звільнюється від занять і робіт	3		9	1
140	2019-04-03 22:22:44.075198+03	166	Тривалість розводу варт не повинна перевищувати	3		9	1
141	2019-04-03 22:22:44.083485+03	165	Опалення закінчується не пізніше ніж	3		9	1
142	2019-04-03 22:22:44.091893+03	164	Усі приміщення та фасади будівель мають бути пофарбовані	3		9	1
143	2019-04-03 22:22:44.100284+03	163	Місця для зберігання всіх видів обмундирування закріплюються за військовослужбовцями й позначаються: ярликами із зазначенням військового звання, прізвища та ініціалів військовослужбовця.	3		9	1
144	2019-04-03 22:22:44.108584+03	162	Прицільна дальність РПГ-22	3		9	1
145	2019-04-03 22:22:44.175386+03	161	Калібр РПГ-26	3		9	1
146	2019-04-03 22:22:44.225402+03	160	Калібр РПГ-22	3		9	1
147	2019-04-03 22:22:44.275302+03	159	Ефективна дальність стрільби осколковими гранатами з ГП-25	3		9	1
148	2019-04-03 22:22:44.333637+03	158	Кількість нарізів у стволі ГП-25	3		9	1
149	2019-04-03 22:22:44.383706+03	157	Калібр ГП-25	3		9	1
150	2019-04-03 22:22:44.391847+03	156	Для чого використовуються снайперські патрони в СВД	3		9	1
151	2019-04-03 22:22:44.400238+03	155	При переміщенні мушки в бік на 1 мм СТВ при стрільбі на 100 м з ПК зміщується на	3		9	1
152	2019-04-03 22:22:44.408523+03	154	Яка оцінка за виконання 1ВНС з ПМ	3		9	1
153	2019-04-03 22:22:44.416932+03	153	Прицільна дальність стрільби з відкритим прицілом з СВД	3		9	1
154	2019-04-03 22:22:44.425145+03	152	Найбільш ефективний вогонь з СВД	3		9	1
155	2019-04-03 22:22:44.433598+03	151	Калібр гвинтівки СВД	3		9	1
156	2019-04-03 22:22:44.441867+03	150	Прицільна дальність з ПК	3		9	1
157	2019-04-03 22:22:44.450369+03	149	Найбільш дійсний вогонь по наземним та повітряним цілям з ПК	3		9	1
158	2019-04-03 22:22:44.458559+03	148	Калібр кулемета Калашникова (ПК)	3		9	1
159	2019-04-03 22:23:44.2563+03	189	Вступати в розмову з особами, які прибули до вартового приміщення можуть	3		9	1
160	2019-04-03 22:23:44.279907+03	188	Склад варт, що змінився, звільнюється від занять і робіт	3		9	1
161	2019-04-03 22:23:44.288221+03	187	Тривалість розводу варт не повинна перевищувати	3		9	1
162	2019-04-03 22:23:44.296639+03	186	Опалення закінчується не пізніше ніж	3		9	1
163	2019-04-03 22:23:44.30492+03	185	Усі приміщення та фасади будівель мають бути пофарбовані	3		9	1
164	2019-04-03 22:23:44.313225+03	184	Місця для зберігання всіх видів обмундирування закріплюються за військовослужбовцями й позначаються: ярликами із зазначенням військового звання, прізвища та ініціалів військовослужбовця.	3		9	1
165	2019-04-03 22:23:44.321563+03	183	Прицільна дальність РПГ-22	3		9	1
166	2019-04-03 22:23:44.329913+03	182	Калібр РПГ-26	3		9	1
167	2019-04-03 22:23:44.338491+03	181	Калібр РПГ-22	3		9	1
168	2019-04-03 22:23:44.346904+03	180	Ефективна дальність стрільби осколковими гранатами з ГП-25	3		9	1
169	2019-04-03 22:23:44.355213+03	179	Кількість нарізів у стволі ГП-25	3		9	1
170	2019-04-03 22:23:44.36361+03	178	Калібр ГП-25	3		9	1
171	2019-04-03 22:23:44.371862+03	177	Для чого використовуються снайперські патрони в СВД	3		9	1
172	2019-04-03 22:23:44.380347+03	176	При переміщенні мушки в бік на 1 мм СТВ при стрільбі на 100 м з ПК зміщується на	3		9	1
173	2019-04-03 22:23:44.38852+03	175	Яка оцінка за виконання 1ВНС з ПМ	3		9	1
174	2019-04-03 22:23:44.397171+03	174	Прицільна дальність стрільби з відкритим прицілом з СВД	3		9	1
175	2019-04-03 22:23:44.405169+03	173	Найбільш ефективний вогонь з СВД	3		9	1
176	2019-04-03 22:23:44.413671+03	172	Калібр гвинтівки СВД	3		9	1
177	2019-04-03 22:23:44.421914+03	171	Прицільна дальність з ПК	3		9	1
178	2019-04-03 22:23:44.430461+03	170	Найбільш дійсний вогонь по наземним та повітряним цілям з ПК	3		9	1
179	2019-04-03 22:23:44.438532+03	169	Калібр кулемета Калашникова (ПК)	3		9	1
180	2019-04-03 22:24:19.837265+03	210	Вступати в розмову з особами, які прибули до вартового приміщення можуть	3		9	1
181	2019-04-03 22:24:19.854595+03	209	Склад варт, що змінився, звільнюється від занять і робіт	3		9	1
182	2019-04-03 22:24:19.862972+03	208	Тривалість розводу варт не повинна перевищувати	3		9	1
183	2019-04-03 22:24:19.871273+03	207	Опалення закінчується не пізніше ніж	3		9	1
184	2019-04-03 22:24:19.879549+03	206	Усі приміщення та фасади будівель мають бути пофарбовані	3		9	1
185	2019-04-03 22:24:19.887838+03	205	Місця для зберігання всіх видів обмундирування закріплюються за військовослужбовцями й позначаються: ярликами із зазначенням військового звання, прізвища та ініціалів військовослужбовця.	3		9	1
186	2019-04-03 22:24:19.896252+03	204	Прицільна дальність РПГ-22	3		9	1
187	2019-04-03 22:24:19.90453+03	203	Калібр РПГ-26	3		9	1
188	2019-04-03 22:24:19.912944+03	202	Калібр РПГ-22	3		9	1
189	2019-04-03 22:24:19.921184+03	201	Ефективна дальність стрільби осколковими гранатами з ГП-25	3		9	1
190	2019-04-03 22:24:19.929557+03	200	Кількість нарізів у стволі ГП-25	3		9	1
191	2019-04-03 22:24:19.937878+03	199	Калібр ГП-25	3		9	1
192	2019-04-03 22:24:19.946264+03	198	Для чого використовуються снайперські патрони в СВД	3		9	1
193	2019-04-03 22:24:19.954549+03	197	При переміщенні мушки в бік на 1 мм СТВ при стрільбі на 100 м з ПК зміщується на	3		9	1
194	2019-04-03 22:24:19.963036+03	196	Яка оцінка за виконання 1ВНС з ПМ	3		9	1
195	2019-04-03 22:24:19.971239+03	195	Прицільна дальність стрільби з відкритим прицілом з СВД	3		9	1
196	2019-04-03 22:24:19.979585+03	194	Найбільш ефективний вогонь з СВД	3		9	1
197	2019-04-03 22:24:19.987935+03	193	Калібр гвинтівки СВД	3		9	1
198	2019-04-03 22:24:19.996381+03	192	Прицільна дальність з ПК	3		9	1
199	2019-04-03 22:24:20.004543+03	191	Найбільш дійсний вогонь по наземним та повітряним цілям з ПК	3		9	1
200	2019-04-03 22:24:20.012896+03	190	Калібр кулемета Калашникова (ПК)	3		9	1
253	2019-04-03 22:43:17.894271+03	250	Тривалість розводу варт не повинна перевищувати	3		9	1
254	2019-04-03 22:43:17.902448+03	249	Опалення закінчується не пізніше ніж	3		9	1
255	2019-04-03 22:43:17.910832+03	248	Усі приміщення та фасади будівель мають бути пофарбовані	3		9	1
346	2019-04-03 23:11:34.965298+03	462	Прицільна дальність з ПКТ	3		9	1
201	2019-04-03 22:33:41.299973+03	1	Білет 1	2	[{"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "5,45 \\u043c\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "7,62 \\u043c\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0434\\u043e 800 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "40 \\u043c\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "40 \\u043c\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "73 \\u043c\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "64 \\u043c\\u043c"}}]	13	1
202	2019-04-03 22:40:09.402092+03	6	Білет 15	1	[{"added": {}}]	13	1
203	2019-04-03 22:40:22.262235+03	7	Білет 22	1	[{"added": {}}]	13	1
204	2019-04-03 22:40:30.105858+03	8	Білет 29	1	[{"added": {}}]	13	1
205	2019-04-03 22:42:30.230012+03	8	Білет 29	3		13	1
206	2019-04-03 22:42:30.238324+03	7	Білет 22	3		13	1
207	2019-04-03 22:42:30.246648+03	6	Білет 15	3		13	1
208	2019-04-03 22:42:30.254913+03	5	Білет 8	3		13	1
209	2019-04-03 22:43:17.493133+03	294	Вступати в розмову з особами, які прибули до вартового приміщення можуть	3		9	1
210	2019-04-03 22:43:17.519093+03	293	Склад варт, що змінився, звільнюється від занять і робіт	3		9	1
211	2019-04-03 22:43:17.527369+03	292	Тривалість розводу варт не повинна перевищувати	3		9	1
212	2019-04-03 22:43:17.535661+03	291	Опалення закінчується не пізніше ніж	3		9	1
213	2019-04-03 22:43:17.544228+03	290	Усі приміщення та фасади будівель мають бути пофарбовані	3		9	1
214	2019-04-03 22:43:17.552497+03	289	Місця для зберігання всіх видів обмундирування закріплюються за військовослужбовцями й позначаються: ярликами із зазначенням військового звання, прізвища та ініціалів військовослужбовця.	3		9	1
215	2019-04-03 22:43:17.56064+03	288	Прицільна дальність РПГ-22	3		9	1
216	2019-04-03 22:43:17.568933+03	287	Калібр РПГ-26	3		9	1
217	2019-04-03 22:43:17.577387+03	286	Калібр РПГ-22	3		9	1
218	2019-04-03 22:43:17.585691+03	285	Ефективна дальність стрільби осколковими гранатами з ГП-25	3		9	1
219	2019-04-03 22:43:17.594037+03	284	Кількість нарізів у стволі ГП-25	3		9	1
220	2019-04-03 22:43:17.602345+03	283	Калібр ГП-25	3		9	1
221	2019-04-03 22:43:17.610707+03	282	Для чого використовуються снайперські патрони в СВД	3		9	1
222	2019-04-03 22:43:17.619054+03	281	При переміщенні мушки в бік на 1 мм СТВ при стрільбі на 100 м з ПК зміщується на	3		9	1
223	2019-04-03 22:43:17.627151+03	280	Яка оцінка за виконання 1ВНС з ПМ	3		9	1
224	2019-04-03 22:43:17.635538+03	279	Прицільна дальність стрільби з відкритим прицілом з СВД	3		9	1
225	2019-04-03 22:43:17.643973+03	278	Найбільш ефективний вогонь з СВД	3		9	1
226	2019-04-03 22:43:17.652274+03	277	Калібр гвинтівки СВД	3		9	1
227	2019-04-03 22:43:17.660772+03	276	Прицільна дальність з ПК	3		9	1
228	2019-04-03 22:43:17.669027+03	275	Найбільш дійсний вогонь по наземним та повітряним цілям з ПК	3		9	1
229	2019-04-03 22:43:17.677502+03	274	Калібр кулемета Калашникова (ПК)	3		9	1
230	2019-04-03 22:43:17.685694+03	273	Вступати в розмову з особами, які прибули до вартового приміщення можуть	3		9	1
231	2019-04-03 22:43:17.694221+03	272	Склад варт, що змінився, звільнюється від занять і робіт	3		9	1
232	2019-04-03 22:43:17.702323+03	271	Тривалість розводу варт не повинна перевищувати	3		9	1
233	2019-04-03 22:43:17.710602+03	270	Опалення закінчується не пізніше ніж	3		9	1
234	2019-04-03 22:43:17.719044+03	269	Усі приміщення та фасади будівель мають бути пофарбовані	3		9	1
235	2019-04-03 22:43:17.727435+03	268	Місця для зберігання всіх видів обмундирування закріплюються за військовослужбовцями й позначаються: ярликами із зазначенням військового звання, прізвища та ініціалів військовослужбовця.	3		9	1
236	2019-04-03 22:43:17.735723+03	267	Прицільна дальність РПГ-22	3		9	1
237	2019-04-03 22:43:17.744045+03	266	Калібр РПГ-26	3		9	1
238	2019-04-03 22:43:17.75242+03	265	Калібр РПГ-22	3		9	1
239	2019-04-03 22:43:17.769199+03	264	Ефективна дальність стрільби осколковими гранатами з ГП-25	3		9	1
240	2019-04-03 22:43:17.777521+03	263	Кількість нарізів у стволі ГП-25	3		9	1
241	2019-04-03 22:43:17.785813+03	262	Калібр ГП-25	3		9	1
242	2019-04-03 22:43:17.802507+03	261	Для чого використовуються снайперські патрони в СВД	3		9	1
243	2019-04-03 22:43:17.810829+03	260	При переміщенні мушки в бік на 1 мм СТВ при стрільбі на 100 м з ПК зміщується на	3		9	1
244	2019-04-03 22:43:17.819073+03	259	Яка оцінка за виконання 1ВНС з ПМ	3		9	1
245	2019-04-03 22:43:17.827575+03	258	Прицільна дальність стрільби з відкритим прицілом з СВД	3		9	1
246	2019-04-03 22:43:17.8358+03	257	Найбільш ефективний вогонь з СВД	3		9	1
247	2019-04-03 22:43:17.844179+03	256	Калібр гвинтівки СВД	3		9	1
248	2019-04-03 22:43:17.852495+03	255	Прицільна дальність з ПК	3		9	1
249	2019-04-03 22:43:17.860915+03	254	Найбільш дійсний вогонь по наземним та повітряним цілям з ПК	3		9	1
250	2019-04-03 22:43:17.869088+03	253	Калібр кулемета Калашникова (ПК)	3		9	1
251	2019-04-03 22:43:17.877539+03	252	Вступати в розмову з особами, які прибули до вартового приміщення можуть	3		9	1
252	2019-04-03 22:43:17.885789+03	251	Склад варт, що змінився, звільнюється від занять і робіт	3		9	1
256	2019-04-03 22:43:17.919167+03	247	Місця для зберігання всіх видів обмундирування закріплюються за військовослужбовцями й позначаються: ярликами із зазначенням військового звання, прізвища та ініціалів військовослужбовця.	3		9	1
257	2019-04-03 22:43:17.927564+03	246	Прицільна дальність РПГ-22	3		9	1
258	2019-04-03 22:43:17.936027+03	245	Калібр РПГ-26	3		9	1
259	2019-04-03 22:43:17.944259+03	244	Калібр РПГ-22	3		9	1
260	2019-04-03 22:43:17.952531+03	243	Ефективна дальність стрільби осколковими гранатами з ГП-25	3		9	1
261	2019-04-03 22:43:17.960871+03	242	Кількість нарізів у стволі ГП-25	3		9	1
262	2019-04-03 22:43:17.969172+03	241	Калібр ГП-25	3		9	1
263	2019-04-03 22:43:17.977579+03	240	Для чого використовуються снайперські патрони в СВД	3		9	1
264	2019-04-03 22:43:17.985903+03	239	При переміщенні мушки в бік на 1 мм СТВ при стрільбі на 100 м з ПК зміщується на	3		9	1
265	2019-04-03 22:43:17.994217+03	238	Яка оцінка за виконання 1ВНС з ПМ	3		9	1
266	2019-04-03 22:43:18.00256+03	237	Прицільна дальність стрільби з відкритим прицілом з СВД	3		9	1
267	2019-04-03 22:43:18.010894+03	236	Найбільш ефективний вогонь з СВД	3		9	1
268	2019-04-03 22:43:18.019226+03	235	Калібр гвинтівки СВД	3		9	1
269	2019-04-03 22:43:18.027641+03	234	Прицільна дальність з ПК	3		9	1
270	2019-04-03 22:43:18.035872+03	233	Найбільш дійсний вогонь по наземним та повітряним цілям з ПК	3		9	1
271	2019-04-03 22:43:18.04439+03	232	Калібр кулемета Калашникова (ПК)	3		9	1
272	2019-04-03 22:43:18.052569+03	231	Вступати в розмову з особами, які прибули до вартового приміщення можуть	3		9	1
273	2019-04-03 22:43:18.060977+03	230	Склад варт, що змінився, звільнюється від занять і робіт	3		9	1
274	2019-04-03 22:43:18.0692+03	229	Тривалість розводу варт не повинна перевищувати	3		9	1
275	2019-04-03 22:43:18.077585+03	228	Опалення закінчується не пізніше ніж	3		9	1
276	2019-04-03 22:43:18.085862+03	227	Усі приміщення та фасади будівель мають бути пофарбовані	3		9	1
277	2019-04-03 22:43:18.094301+03	226	Місця для зберігання всіх видів обмундирування закріплюються за військовослужбовцями й позначаються: ярликами із зазначенням військового звання, прізвища та ініціалів військовослужбовця.	3		9	1
278	2019-04-03 22:43:18.102626+03	225	Прицільна дальність РПГ-22	3		9	1
279	2019-04-03 22:43:18.111+03	224	Калібр РПГ-26	3		9	1
280	2019-04-03 22:43:18.119167+03	223	Калібр РПГ-22	3		9	1
281	2019-04-03 22:43:18.127635+03	222	Ефективна дальність стрільби осколковими гранатами з ГП-25	3		9	1
282	2019-04-03 22:43:18.135952+03	221	Кількість нарізів у стволі ГП-25	3		9	1
283	2019-04-03 22:43:18.144316+03	220	Калібр ГП-25	3		9	1
284	2019-04-03 22:43:18.152588+03	219	Для чого використовуються снайперські патрони в СВД	3		9	1
285	2019-04-03 22:43:18.16097+03	218	При переміщенні мушки в бік на 1 мм СТВ при стрільбі на 100 м з ПК зміщується на	3		9	1
286	2019-04-03 22:43:18.169266+03	217	Яка оцінка за виконання 1ВНС з ПМ	3		9	1
287	2019-04-03 22:43:18.177649+03	216	Прицільна дальність стрільби з відкритим прицілом з СВД	3		9	1
288	2019-04-03 22:43:18.185926+03	215	Найбільш ефективний вогонь з СВД	3		9	1
289	2019-04-03 22:43:18.194303+03	214	Калібр гвинтівки СВД	3		9	1
290	2019-04-03 22:43:18.202632+03	213	Прицільна дальність з ПК	3		9	1
291	2019-04-03 22:43:18.21098+03	212	Найбільш дійсний вогонь по наземним та повітряним цілям з ПК	3		9	1
292	2019-04-03 22:43:18.21926+03	211	Калібр кулемета Калашникова (ПК)	3		9	1
293	2019-04-03 22:44:45.697178+03	9	Білет 8	1	[{"added": {}}]	13	1
294	2019-04-03 22:44:52.550701+03	10	Білет 15	1	[{"added": {}}]	13	1
295	2019-04-03 22:45:05.79647+03	11	Білет 22	1	[{"added": {}}]	13	1
296	2019-04-03 22:45:12.682265+03	12	Білет 29	1	[{"added": {}}]	13	1
297	2019-04-03 22:57:09.641818+03	13	Білет 2	1	[{"added": {}}]	13	1
298	2019-04-03 23:02:49.699552+03	13	Білет 2	2	[{"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041f\\u0440\\u0438\\u0446\\u0456\\u043b\\u044c\\u043d\\u0430 \\u0434\\u0430\\u043b\\u044c\\u043d\\u0456\\u0441\\u0442\\u044c \\u0437 \\u041f\\u041a\\u0422"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0414\\u0430\\u043b\\u044c\\u043d\\u0456\\u0441\\u0442\\u044c \\u043f\\u0440\\u044f\\u043c\\u043e\\u0433\\u043e \\u043f\\u043e\\u0441\\u0442\\u0440\\u0456\\u043b\\u0443 \\u043f\\u043e \\u0433\\u0440\\u0443\\u0434\\u043d\\u0456\\u0439 \\u0444\\u0456\\u0433\\u0443\\u0440\\u0456 \\u0437 \\u041f\\u041a"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0414\\u0430\\u043b\\u044c\\u043d\\u0456\\u0441\\u0442\\u044c \\u043f\\u0440\\u044f\\u043c\\u043e\\u0433\\u043e \\u043f\\u043e\\u0441\\u0442\\u0440\\u0456\\u043b\\u0443 \\u043f\\u043e \\u0433\\u0440\\u0443\\u0434\\u043d\\u0456\\u0439 \\u0444\\u0456\\u0433\\u0443\\u0440\\u0456 \\u0437 \\u041f\\u041a\\u0422"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041f\\u0440\\u0438\\u0446\\u0456\\u043b\\u044c\\u043d\\u0430 \\u0434\\u0430\\u043b\\u044c\\u043d\\u0456\\u0441\\u0442\\u044c \\u0441\\u0442\\u0440\\u0456\\u043b\\u044c\\u0431\\u0438 \\u0437 \\u043e\\u043f\\u0442\\u0438\\u0447\\u043d\\u0438\\u043c \\u043f\\u0440\\u0438\\u0446\\u0456\\u043b\\u043e\\u043c \\u0437 \\u0421\\u0412\\u0414"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041f\\u0440\\u0438\\u0446\\u0456\\u043b\\u044c\\u043d\\u0430 \\u0434\\u0430\\u043b\\u044c\\u043d\\u0456\\u0441\\u0442\\u044c \\u0441\\u0442\\u0440\\u0456\\u043b\\u044c\\u0431\\u0438 \\u0437 \\u043d\\u0456\\u0447\\u043d\\u0438\\u043c \\u043f\\u0440\\u0438\\u0446\\u0456\\u043b\\u043e\\u043c \\u0437 \\u0421\\u0412\\u0414"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0414\\u0430\\u043b\\u044c\\u043d\\u0456\\u0441\\u0442\\u044c \\u043f\\u0440\\u044f\\u043c\\u043e\\u0433\\u043e \\u043f\\u043e\\u0441\\u0442\\u0440\\u0456\\u043b\\u0443 \\u043f\\u043e \\u0433\\u043e\\u043b\\u043e\\u0432\\u043d\\u0456\\u0439 \\u0444\\u0456\\u0433\\u0443\\u0440\\u0456 \\u0437 \\u0421\\u0412\\u0414"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u042f\\u043a\\u0438\\u0439 \\u043d\\u0435\\u0431\\u0435\\u0437\\u043f\\u0435\\u0447\\u043d\\u0438\\u0439 \\u0441\\u0435\\u043a\\u0442\\u043e\\u0440 \\u0432\\u0438\\u043d\\u0438\\u043a\\u0430\\u0454 \\u043f\\u043e\\u0437\\u0430\\u0434\\u0443 \\u043f\\u0440\\u0438 \\u0441\\u0442\\u0440\\u0456\\u043b\\u044c\\u0431\\u0456 \\u0437 \\u0420\\u041f\\u0413-22"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u042f\\u043a\\u0430 \\u043c\\u0456\\u0448\\u0435\\u043d\\u044c \\u0432\\u0438\\u043a\\u043e\\u0440\\u0438\\u0441\\u0442\\u043e\\u0432\\u0443\\u0454\\u0442\\u044c\\u0441\\u044f \\u043f\\u0440\\u0438 \\u0432\\u0438\\u043a\\u043e\\u043d\\u0430\\u043d\\u043d\\u0456 1\\u0412\\u041d\\u0421 \\u0437 \\u041f\\u041c"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u042f\\u043a\\u0430 \\u0433\\u043b\\u0438\\u0431\\u0438\\u043d\\u0430 \\u043d\\u0435\\u0431\\u0435\\u0437\\u043f\\u0435\\u0447\\u043d\\u043e\\u0457 \\u0437\\u043e\\u043d\\u0438 \\u0432\\u0438\\u043d\\u0438\\u043a\\u0430\\u0454 \\u043f\\u043e\\u0437\\u0430\\u0434\\u0443 \\u043f\\u0440\\u0438 \\u0441\\u0442\\u0440\\u0456\\u043b\\u044c\\u0431\\u0456 \\u0437 \\u0420\\u041f\\u0413-22"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0415\\u0444\\u0435\\u043a\\u0442\\u0438\\u0432\\u043d\\u0430 \\u0434\\u0430\\u043b\\u044c\\u043d\\u0456\\u0441\\u0442\\u044c \\u0441\\u0442\\u0440\\u0456\\u043b\\u044c\\u0431\\u0438 \\u0433\\u0440\\u0430\\u043d\\u0430\\u0442\\u043e\\u044e \\u043f\\u043e\\u0434\\u0440\\u0430\\u0437\\u043d\\u044e\\u044e\\u0447\\u043e\\u0457 \\u0434\\u0456\\u0457 \\u0437 \\u0413\\u041f-25"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041c\\u0430\\u0441\\u0430 \\u0413\\u041f - 25"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0411\\u043e\\u0439\\u043e\\u0432\\u0430 \\u0448\\u0432\\u0438\\u0434\\u043a\\u043e\\u0441\\u0442\\u0440\\u0456\\u043b\\u044c\\u043d\\u0456\\u0441\\u0442\\u044c \\u0437 \\u0413\\u041f-25"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041f\\u0440\\u0438\\u0446\\u0456\\u043b\\u044c\\u043d\\u0430 \\u0434\\u0430\\u043b\\u044c\\u043d\\u0456\\u0441\\u0442\\u044c \\u0420\\u041f\\u0413-26"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "800\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "1000\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "1500\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "360\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "420\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "400\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "420\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "440\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "640\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "1200 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "1300 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "1000 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "300 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "1000 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "800 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "300 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "350 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "340 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "90 \\u0433\\u0440\\u0430\\u0434"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "120 \\u0433\\u0440\\u0430\\u0434."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "30 \\u0433\\u0440\\u0430\\u0434."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u2116 4\\u0410"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u2116 6"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u2116 4"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0434\\u043e 15 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0434\\u043e 30 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0434\\u043e 20 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0434\\u043e 250 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0434\\u043e 200 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0434\\u043e 150 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "1,5 \\u043a\\u0433"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "1,3 \\u043a\\u0433"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "2 \\u043a\\u0433"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "4-5 \\u043f/\\u0445\\u0432."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "3-4 \\u043f/\\u0445\\u0432."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "5-6 \\u043f/\\u0445\\u0432."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "300 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "250 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "200 \\u043c"}}]	13	1
344	2019-04-03 23:11:25.431943+03	422	Вартові, що охороняли об'єкти тільки вночі звільнюються від занять та робіт	3		9	1
345	2019-04-03 23:11:25.440321+03	421	Їжа особовому складові варти, яка перебуває поза розташуванням військової частини, постачається	3		9	1
347	2019-04-03 23:11:34.972762+03	461	Дальність прямого пострілу по грудній фігурі з ПК	3		9	1
348	2019-04-03 23:11:34.981086+03	460	Дальність прямого пострілу по грудній фігурі з ПКТ	3		9	1
349	2019-04-03 23:11:34.989477+03	459	Прицільна дальність стрільби з оптичним прицілом з СВД	3		9	1
350	2019-04-03 23:11:34.99814+03	458	Прицільна дальність стрільби з нічним прицілом з СВД	3		9	1
351	2019-04-03 23:11:35.006421+03	457	Дальність прямого пострілу по головній фігурі з СВД	3		9	1
299	2019-04-03 23:06:44.895744+03	13	Білет 2	2	[{"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0414\\u0430\\u043b\\u044c\\u043d\\u0456\\u0441\\u0442\\u044c \\u043f\\u0440\\u044f\\u043c\\u043e\\u0433\\u043e \\u043f\\u043e\\u0441\\u0442\\u0440\\u0456\\u043b\\u0443 \\u0420\\u041f\\u0413-22"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0414\\u0430\\u043b\\u044c\\u043d\\u0456\\u0441\\u0442\\u044c \\u043f\\u0440\\u044f\\u043c\\u043e\\u0433\\u043e \\u043f\\u043e\\u0441\\u0442\\u0440\\u0456\\u043b\\u0443 \\u0420\\u041f\\u0413-26"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041f\\u0440\\u0430\\u043f\\u043e\\u0440\\u0449\\u0438\\u043a\\u0438 \\u0456 \\u043c\\u0456\\u0447\\u043c\\u0430\\u043d\\u0438, \\u044f\\u043a\\u0456 \\u043e\\u0431\\u0456\\u0439\\u043c\\u0430\\u044e\\u0442\\u044c \\u043f\\u043e\\u0441\\u0430\\u0434\\u0443 \\u0441\\u0442\\u0430\\u0440\\u0448\\u0438\\u043d\\u0438 \\u0440\\u043e\\u0442\\u0438, \\u0440\\u043e\\u0437\\u043c\\u0456\\u0449\\u0443\\u044e\\u0442\\u044c\\u0441\\u044f"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041f\\u0440\\u0438\\u043c\\u0456\\u0449\\u0435\\u043d\\u043d\\u044f \\u0449\\u043e\\u0434\\u0435\\u043d\\u043d\\u043e \\u043f\\u0440\\u0438\\u0431\\u0438\\u0440\\u0430\\u044e\\u0442\\u044c\\u0441\\u044f"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041d\\u0430\\u0433\\u043b\\u044f\\u0434 \\u0437\\u0430 \\u043f\\u0456\\u0447\\u043d\\u0438\\u043c \\u043e\\u043f\\u0430\\u043b\\u0435\\u043d\\u043d\\u044f\\u043c \\u0443 \\u043f\\u0456\\u0434\\u0440\\u043e\\u0437\\u0434\\u0456\\u043b\\u0430\\u0445 \\u043f\\u043e\\u043a\\u043b\\u0430\\u0434\\u0430\\u0454\\u0442\\u044c\\u0441\\u044f \\u043d\\u0430"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0414\\u0435 \\u0441\\u0442\\u0430\\u044e\\u0442\\u044c \\u0440\\u043e\\u0437\\u0432\\u0456\\u0434\\u043d\\u0456 \\u043f\\u043e\\u043f\\u0435\\u0440\\u0435\\u0434\\u043d\\u044c\\u043e\\u0457 \\u0432\\u0430\\u0440\\u0442\\u0438 \\u043f\\u043e \\u0432\\u0456\\u0434\\u043d\\u043e\\u0448\\u0435\\u043d\\u043d\\u044e \\u0432\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u043d\\u0438\\u0445 \\u0440\\u043e\\u0437\\u0432\\u0456\\u0434\\u043d\\u0438\\u0445 \\u043d\\u043e\\u0432\\u043e\\u0457 \\u0432\\u0430\\u0440\\u0442\\u0438 \\u043f\\u0440\\u0438 \\u043a\\u043e\\u043c\\u0430\\u043d\\u0434\\u0438 \\u043d\\u0430\\u0447\\u0430\\u043b\\u044c\\u043d\\u0438\\u043a\\u0430 \\u043d\\u043e\\u0432\\u043e\\u0457 \\u0432\\u0430\\u0440\\u0442\\u0438: \\u00ab\\u041f\\u0435\\u0440\\u0448\\u0430 \\u0437\\u043c\\u0456\\u043d\\u0430\\u2014\\u0421\\u0422\\u0410\\u0412\\u0410\\u0419\\u00bb"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0412\\u0430\\u0440\\u0442\\u043e\\u0432\\u0456, \\u0449\\u043e \\u043e\\u0445\\u043e\\u0440\\u043e\\u043d\\u044f\\u043b\\u0438 \\u043e\\u0431'\\u0454\\u043a\\u0442\\u0438 \\u0442\\u0456\\u043b\\u044c\\u043a\\u0438 \\u0432\\u043d\\u043e\\u0447\\u0456 \\u0437\\u0432\\u0456\\u043b\\u044c\\u043d\\u044e\\u044e\\u0442\\u044c\\u0441\\u044f \\u0432\\u0456\\u0434 \\u0437\\u0430\\u043d\\u044f\\u0442\\u044c \\u0442\\u0430 \\u0440\\u043e\\u0431\\u0456\\u0442"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0407\\u0436\\u0430 \\u043e\\u0441\\u043e\\u0431\\u043e\\u0432\\u043e\\u043c\\u0443 \\u0441\\u043a\\u043b\\u0430\\u0434\\u043e\\u0432\\u0456 \\u0432\\u0430\\u0440\\u0442\\u0438, \\u044f\\u043a\\u0430 \\u043f\\u0435\\u0440\\u0435\\u0431\\u0443\\u0432\\u0430\\u0454 \\u043f\\u043e\\u0437\\u0430 \\u0440\\u043e\\u0437\\u0442\\u0430\\u0448\\u0443\\u0432\\u0430\\u043d\\u043d\\u044f\\u043c \\u0432\\u0456\\u0439\\u0441\\u044c\\u043a\\u043e\\u0432\\u043e\\u0457 \\u0447\\u0430\\u0441\\u0442\\u0438\\u043d\\u0438, \\u043f\\u043e\\u0441\\u0442\\u0430\\u0447\\u0430\\u0454\\u0442\\u044c\\u0441\\u044f"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "150 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "200 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "160\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "160 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "170 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "200 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043f\\u043e\\u0431\\u043b\\u0438\\u0437\\u0443 \\u0440\\u043e\\u0437\\u0442\\u0430\\u0448\\u0443\\u0432\\u0430\\u043d\\u043d\\u044f \\u0432\\u0456\\u0439\\u0441\\u044c\\u043a\\u043e\\u0432\\u043e\\u0457 \\u0447\\u0430\\u0441\\u0442\\u0438\\u043d\\u0438"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0432 \\u043e\\u043a\\u0440\\u0435\\u043c\\u043e\\u043c\\u0443 \\u043f\\u0440\\u0438\\u043c\\u0456\\u0449\\u0435\\u043d\\u043d\\u0456 (\\u043a\\u0456\\u043c\\u043d\\u0430\\u0442\\u0456) \\u043a\\u0430\\u0437\\u0430\\u0440\\u043c\\u0438"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043d\\u0430 \\u043a\\u0432\\u0430\\u0440\\u0442\\u0438\\u0440\\u0430\\u0445 \\u043f\\u043e\\u0437\\u0430 \\u0440\\u043e\\u0437\\u0442\\u0430\\u0448\\u0443\\u0432\\u0430\\u043d\\u043d\\u044f\\u043c \\u0432\\u0456\\u0439\\u0441\\u044c\\u043a\\u043e\\u0432\\u043e\\u0457 \\u0447\\u0430\\u0441\\u0442\\u0438\\u043d\\u0438"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0434\\u043d\\u044e\\u0432\\u0430\\u043b\\u044c\\u043d\\u0438\\u043c\\u0438 \\u043f\\u043e \\u0440\\u043e\\u0442\\u0456 \\u043f\\u0456\\u0434 \\u0431\\u0435\\u0437\\u043f\\u043e\\u0441\\u0435\\u0440\\u0435\\u0434\\u043d\\u0456\\u043c  \\u043d\\u0430\\u0433\\u043b\\u044f\\u0434\\u043e\\u043c  \\u0447\\u0435\\u0440\\u0433\\u043e\\u0432\\u043e\\u0433\\u043e \\u0440\\u043e\\u0442\\u0438"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0447\\u0435\\u0440\\u0433\\u043e\\u0432\\u0438\\u043c\\u0438 \\u043f\\u0440\\u0438\\u0431\\u0438\\u0440\\u0430\\u043b\\u044c\\u043d\\u0438\\u043a\\u0430\\u043c\\u0438 \\u043f\\u0456\\u0434 \\u0431\\u0435\\u0437\\u043f\\u043e\\u0441\\u0435\\u0440\\u0435\\u0434\\u043d\\u0456\\u043c  \\u043d\\u0430\\u0433\\u043b\\u044f\\u0434\\u043e\\u043c  \\u0447\\u0435\\u0440\\u0433\\u043e\\u0432\\u043e\\u0433\\u043e \\u0440\\u043e\\u0442\\u0438"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0447\\u0435\\u0440\\u0433\\u043e\\u0432\\u0438\\u043c\\u0438 \\u043f\\u0440\\u0438\\u0431\\u0438\\u0440\\u0430\\u043b\\u044c\\u043d\\u0438\\u043a\\u0430\\u043c\\u0438 \\u043f\\u0456\\u0434 \\u0431\\u0435\\u0437\\u043f\\u043e\\u0441\\u0435\\u0440\\u0435\\u0434\\u043d\\u0456\\u043c  \\u043d\\u0430\\u0433\\u043b\\u044f\\u0434\\u043e\\u043c  \\u0441\\u0442\\u0430\\u0440\\u0448\\u0438\\u043d\\u0438 \\u0440\\u043e\\u0442\\u0438"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0434\\u043d\\u044e\\u0432\\u0430\\u043b\\u044c\\u043d\\u043e\\u0433\\u043e  \\u0439 \\u0447\\u0435\\u0440\\u0433\\u043e\\u0432\\u043e\\u0433\\u043e \\u0440\\u043e\\u0442\\u0438"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0432\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u0430\\u043b\\u044c\\u043d\\u043e\\u0433\\u043e \\u0437\\u0430 \\u043e\\u043f\\u0430\\u043b\\u0435\\u043d\\u043d\\u044f \\u0439 \\u0447\\u0435\\u0440\\u0433\\u043e\\u0432\\u043e\\u0433\\u043e \\u0440\\u043e\\u0442\\u0438"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0441\\u0442\\u0430\\u0440\\u0448\\u0438\\u043d\\u0443 \\u0439 \\u0447\\u0435\\u0440\\u0433\\u043e\\u0432\\u043e\\u0433\\u043e \\u0440\\u043e\\u0442\\u0438"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043d\\u0430 \\u0447\\u043e\\u043b\\u0456 \\u0432\\u0430\\u0440\\u0442\\u0438"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043f\\u043e\\u0440\\u0443\\u0447 \\u0456 \\u0437\\u043b\\u0456\\u0432\\u0430"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043f\\u043e\\u0440\\u0443\\u0447 \\u0456 \\u0441\\u043f\\u0440\\u0430\\u0432\\u0430"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043d\\u0430 4 \\u0433\\u043e\\u0434\\u0438\\u043d\\u0438 \\u043f\\u0456\\u0441\\u043b\\u044f \\u0437\\u043c\\u0456\\u043d\\u0438"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043d\\u0430 4 \\u0433\\u043e\\u0434\\u0438\\u043d\\u0438 \\u043f\\u0456\\u0441\\u043b\\u044f \\u043f\\u0440\\u0438\\u0431\\u0443\\u0442\\u0442\\u044f \\u0434\\u043e \\u043f\\u0456\\u0434\\u0440\\u043e\\u0437\\u0434\\u0456\\u043b\\u0443"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0443 \\u0434\\u0435\\u043d\\u044c \\u0437\\u043c\\u0456\\u043d\\u0438"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0437\\u0430 \\u0440\\u043e\\u0437\\u043f\\u043e\\u0440\\u044f\\u0434\\u0436\\u0435\\u043d\\u043d\\u044f\\u043c \\u043a\\u043e\\u043c\\u0430\\u043d\\u0434\\u0438\\u0440\\u0430 \\u0447\\u0430\\u0441\\u0442\\u0438\\u043d\\u0438, \\u0432\\u0456\\u0434 \\u044f\\u043a\\u043e\\u0457 \\u0432\\u043e\\u043d\\u0430 \\u0432\\u0456\\u0434\\u043d\\u0430\\u0440\\u044f\\u0434\\u0436\\u0435\\u043d\\u0430, \\u0430\\u0431\\u043e \\u0447\\u0435\\u0440\\u0433\\u043e\\u0432\\u043e\\u0433\\u043e \\u0432\\u0456\\u0439\\u0441\\u044c\\u043a\\u043e\\u0432\\u043e\\u0457 \\u0447\\u0430\\u0441\\u0442\\u0438\\u043d\\u0438"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0437\\u0430 \\u0440\\u043e\\u0437\\u043f\\u043e\\u0440\\u044f\\u0434\\u0436\\u0435\\u043d\\u043d\\u044f\\u043c \\u0447\\u0435\\u0440\\u0433\\u043e\\u0432\\u043e\\u0433\\u043e \\u0432\\u0430\\u0440\\u0442"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0437\\u0430 \\u0440\\u043e\\u0437\\u043f\\u043e\\u0440\\u044f\\u0434\\u0436\\u0435\\u043d\\u043d\\u044f\\u043c \\u043d\\u0430\\u0447\\u0430\\u043b\\u044c\\u043d\\u0438\\u043a\\u0430 \\u0433\\u0430\\u0440\\u043d\\u0456\\u0437\\u043e\\u043d\\u0443"}}]	13	1
300	2019-04-03 23:07:27.571118+03	14	Білет 9	1	[{"added": {}}]	13	1
301	2019-04-03 23:07:34.16981+03	15	Білет 16	1	[{"added": {}}]	13	1
302	2019-04-03 23:07:40.331601+03	16	Білет 23	1	[{"added": {}}]	13	1
303	2019-04-03 23:07:46.335239+03	17	Білет 30	1	[{"added": {}}]	13	1
304	2019-04-03 23:11:17.707324+03	420	Прицільна дальність з ПКТ	3		9	1
305	2019-04-03 23:11:17.732349+03	419	Дальність прямого пострілу по грудній фігурі з ПК	3		9	1
306	2019-04-03 23:11:17.74071+03	418	Дальність прямого пострілу по грудній фігурі з ПКТ	3		9	1
307	2019-04-03 23:11:17.748938+03	417	Прицільна дальність стрільби з оптичним прицілом з СВД	3		9	1
308	2019-04-03 23:11:17.757233+03	416	Прицільна дальність стрільби з нічним прицілом з СВД	3		9	1
309	2019-04-03 23:11:17.76563+03	415	Дальність прямого пострілу по головній фігурі з СВД	3		9	1
310	2019-04-03 23:11:17.773908+03	414	Який небезпечний сектор виникає позаду при стрільбі з РПГ-22	3		9	1
311	2019-04-03 23:11:17.7822+03	413	Яка мішень використовується при виконанні 1ВНС з ПМ	3		9	1
312	2019-04-03 23:11:17.790568+03	412	Яка глибина небезпечної зони виникає позаду при стрільбі з РПГ-22	3		9	1
313	2019-04-03 23:11:17.798823+03	411	Ефективна дальність стрільби гранатою подразнюючої дії з ГП-25	3		9	1
314	2019-04-03 23:11:17.807523+03	410	Маса ГП - 25	3		9	1
315	2019-04-03 23:11:17.815565+03	409	Бойова швидкострільність з ГП-25	3		9	1
316	2019-04-03 23:11:17.823988+03	408	Прицільна дальність РПГ-26	3		9	1
317	2019-04-03 23:11:17.832236+03	407	Дальність прямого пострілу РПГ-22	3		9	1
318	2019-04-03 23:11:17.840614+03	406	Дальність прямого пострілу РПГ-26	3		9	1
319	2019-04-03 23:11:17.849005+03	405	Прапорщики і мічмани, які обіймають посаду старшини роти, розміщуються	3		9	1
320	2019-04-03 23:11:17.857351+03	404	Приміщення щоденно прибираються	3		9	1
321	2019-04-03 23:11:17.865652+03	403	Нагляд за пічним опаленням у підрозділах покладається на	3		9	1
322	2019-04-03 23:11:17.873936+03	402	Де стають розвідні попередньої варти по відношенню відповідних розвідних нової варти при команди начальника нової варти: «Перша зміна—СТАВАЙ»	3		9	1
323	2019-04-03 23:11:17.882237+03	401	Вартові, що охороняли об'єкти тільки вночі звільнюються від занять та робіт	3		9	1
324	2019-04-03 23:11:17.89056+03	400	Їжа особовому складові варти, яка перебуває поза розташуванням військової частини, постачається	3		9	1
325	2019-04-03 23:11:25.257972+03	441	Прицільна дальність з ПКТ	3		9	1
326	2019-04-03 23:11:25.281622+03	440	Дальність прямого пострілу по грудній фігурі з ПК	3		9	1
327	2019-04-03 23:11:25.289886+03	439	Дальність прямого пострілу по грудній фігурі з ПКТ	3		9	1
328	2019-04-03 23:11:25.298444+03	438	Прицільна дальність стрільби з оптичним прицілом з СВД	3		9	1
329	2019-04-03 23:11:25.306839+03	437	Прицільна дальність стрільби з нічним прицілом з СВД	3		9	1
330	2019-04-03 23:11:25.31519+03	436	Дальність прямого пострілу по головній фігурі з СВД	3		9	1
331	2019-04-03 23:11:25.323553+03	435	Який небезпечний сектор виникає позаду при стрільбі з РПГ-22	3		9	1
332	2019-04-03 23:11:25.331873+03	434	Яка мішень використовується при виконанні 1ВНС з ПМ	3		9	1
333	2019-04-03 23:11:25.340232+03	433	Яка глибина небезпечної зони виникає позаду при стрільбі з РПГ-22	3		9	1
334	2019-04-03 23:11:25.348589+03	432	Ефективна дальність стрільби гранатою подразнюючої дії з ГП-25	3		9	1
335	2019-04-03 23:11:25.356951+03	431	Маса ГП - 25	3		9	1
336	2019-04-03 23:11:25.365095+03	430	Бойова швидкострільність з ГП-25	3		9	1
337	2019-04-03 23:11:25.374142+03	429	Прицільна дальність РПГ-26	3		9	1
338	2019-04-03 23:11:25.381794+03	428	Дальність прямого пострілу РПГ-22	3		9	1
339	2019-04-03 23:11:25.390298+03	427	Дальність прямого пострілу РПГ-26	3		9	1
340	2019-04-03 23:11:25.398559+03	426	Прапорщики і мічмани, які обіймають посаду старшини роти, розміщуються	3		9	1
341	2019-04-03 23:11:25.407338+03	425	Приміщення щоденно прибираються	3		9	1
342	2019-04-03 23:11:25.415227+03	424	Нагляд за пічним опаленням у підрозділах покладається на	3		9	1
343	2019-04-03 23:11:25.423745+03	423	Де стають розвідні попередньої варти по відношенню відповідних розвідних нової варти при команди начальника нової варти: «Перша зміна—СТАВАЙ»	3		9	1
352	2019-04-03 23:11:35.014693+03	456	Який небезпечний сектор виникає позаду при стрільбі з РПГ-22	3		9	1
353	2019-04-03 23:11:35.023199+03	455	Яка мішень використовується при виконанні 1ВНС з ПМ	3		9	1
354	2019-04-03 23:11:35.031369+03	454	Яка глибина небезпечної зони виникає позаду при стрільбі з РПГ-22	3		9	1
355	2019-04-03 23:11:35.039865+03	453	Ефективна дальність стрільби гранатою подразнюючої дії з ГП-25	3		9	1
356	2019-04-03 23:11:35.069521+03	452	Маса ГП - 25	3		9	1
357	2019-04-03 23:11:35.081485+03	451	Бойова швидкострільність з ГП-25	3		9	1
358	2019-04-03 23:11:35.089732+03	450	Прицільна дальність РПГ-26	3		9	1
359	2019-04-03 23:11:35.098058+03	449	Дальність прямого пострілу РПГ-22	3		9	1
360	2019-04-03 23:11:35.10644+03	448	Дальність прямого пострілу РПГ-26	3		9	1
361	2019-04-03 23:11:35.114709+03	447	Прапорщики і мічмани, які обіймають посаду старшини роти, розміщуються	3		9	1
362	2019-04-03 23:11:35.123069+03	446	Приміщення щоденно прибираються	3		9	1
363	2019-04-03 23:11:35.131512+03	445	Нагляд за пічним опаленням у підрозділах покладається на	3		9	1
364	2019-04-03 23:11:35.139808+03	444	Де стають розвідні попередньої варти по відношенню відповідних розвідних нової варти при команди начальника нової варти: «Перша зміна—СТАВАЙ»	3		9	1
365	2019-04-03 23:11:35.148133+03	443	Вартові, що охороняли об'єкти тільки вночі звільнюються від занять та робіт	3		9	1
366	2019-04-03 23:11:35.156425+03	442	Їжа особовому складові варти, яка перебуває поза розташуванням військової частини, постачається	3		9	1
367	2019-04-03 23:11:44.328749+03	483	Прицільна дальність з ПКТ	3		9	1
368	2019-04-03 23:11:44.364386+03	482	Дальність прямого пострілу по грудній фігурі з ПК	3		9	1
369	2019-04-03 23:11:44.372614+03	481	Дальність прямого пострілу по грудній фігурі з ПКТ	3		9	1
370	2019-04-03 23:11:44.380999+03	480	Прицільна дальність стрільби з оптичним прицілом з СВД	3		9	1
371	2019-04-03 23:11:44.389418+03	479	Прицільна дальність стрільби з нічним прицілом з СВД	3		9	1
372	2019-04-03 23:11:44.397595+03	478	Дальність прямого пострілу по головній фігурі з СВД	3		9	1
373	2019-04-03 23:11:44.406018+03	477	Який небезпечний сектор виникає позаду при стрільбі з РПГ-22	3		9	1
374	2019-04-03 23:11:44.414285+03	476	Яка мішень використовується при виконанні 1ВНС з ПМ	3		9	1
375	2019-04-03 23:11:44.422709+03	475	Яка глибина небезпечної зони виникає позаду при стрільбі з РПГ-22	3		9	1
376	2019-04-03 23:11:44.430954+03	474	Ефективна дальність стрільби гранатою подразнюючої дії з ГП-25	3		9	1
377	2019-04-03 23:11:44.439436+03	473	Маса ГП - 25	3		9	1
378	2019-04-03 23:11:44.447617+03	472	Бойова швидкострільність з ГП-25	3		9	1
379	2019-04-03 23:11:44.456301+03	471	Прицільна дальність РПГ-26	3		9	1
380	2019-04-03 23:11:44.46444+03	470	Дальність прямого пострілу РПГ-22	3		9	1
381	2019-04-03 23:11:44.472701+03	469	Дальність прямого пострілу РПГ-26	3		9	1
382	2019-04-03 23:11:44.48092+03	468	Прапорщики і мічмани, які обіймають посаду старшини роти, розміщуються	3		9	1
383	2019-04-03 23:11:44.489403+03	467	Приміщення щоденно прибираються	3		9	1
384	2019-04-03 23:11:44.497658+03	466	Нагляд за пічним опаленням у підрозділах покладається на	3		9	1
385	2019-04-03 23:11:44.507496+03	465	Де стають розвідні попередньої варти по відношенню відповідних розвідних нової варти при команди начальника нової варти: «Перша зміна—СТАВАЙ»	3		9	1
386	2019-04-03 23:11:44.514279+03	464	Вартові, що охороняли об'єкти тільки вночі звільнюються від занять та робіт	3		9	1
387	2019-04-03 23:11:44.522749+03	463	Їжа особовому складові варти, яка перебуває поза розташуванням військової частини, постачається	3		9	1
388	2019-04-03 23:14:50.386093+03	18	Білет 3	1	[{"added": {}}]	13	1
389	2019-04-03 23:14:57.514212+03	19	Білет 17	1	[{"added": {}}]	13	1
390	2019-04-03 23:15:04.877147+03	20	Білет 24	1	[{"added": {}}]	13	1
391	2019-04-03 23:15:13.370361+03	21	Білет 31	1	[{"added": {}}]	13	1
438	2019-04-03 23:36:05.732066+03	613	Взимку в житлових приміщеннях підтримується температура не нижче	3		9	1
439	2019-04-03 23:36:05.740561+03	612	Коли помічник начальника варти проводить бойовий розподіл особового складу варти та ставить завдання	3		9	1
440	2019-04-03 23:36:05.748909+03	611	Ніхто зі складу варти не може залишати вартове приміщення	3		9	1
441	2019-04-03 23:36:05.757206+03	610	Якщо варта розташована на території військової частини, постачання їжі організовується	3		9	1
442	2019-04-03 23:37:39.326333+03	714	Дальність прямого пострілу по фігурі, що рухається з ПК	3		9	1
443	2019-04-03 23:37:39.351434+03	713	Дальність прямого пострілу по грудній фігурі з ПКТ	3		9	1
444	2019-04-03 23:37:39.359716+03	712	Бойова швидкострільність з ПК	3		9	1
445	2019-04-03 23:37:39.368111+03	711	Дальність прямого пострілу по грудній фігурі з СВД	3		9	1
446	2019-04-03 23:37:39.376649+03	710	Дальність прямого пострілу по фігурі, що рухається з СВД	3		9	1
447	2019-04-03 23:37:39.384909+03	709	Маса СВД	3		9	1
448	2019-04-03 23:37:39.393297+03	708	Самоліквідація підривача гранати ПГ-26	3		9	1
392	2019-04-03 23:32:25.321492+03	18	Білет 3	2	[{"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0414\\u0430\\u043b\\u044c\\u043d\\u0456\\u0441\\u0442\\u044c \\u043f\\u0440\\u044f\\u043c\\u043e\\u0433\\u043e \\u043f\\u043e\\u0441\\u0442\\u0440\\u0456\\u043b\\u0443 \\u043f\\u043e \\u0444\\u0456\\u0433\\u0443\\u0440\\u0456, \\u0449\\u043e \\u0440\\u0443\\u0445\\u0430\\u0454\\u0442\\u044c\\u0441\\u044f \\u0437 \\u041f\\u041a"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0414\\u0430\\u043b\\u044c\\u043d\\u0456\\u0441\\u0442\\u044c \\u043f\\u0440\\u044f\\u043c\\u043e\\u0433\\u043e \\u043f\\u043e\\u0441\\u0442\\u0440\\u0456\\u043b\\u0443 \\u043f\\u043e \\u0433\\u0440\\u0443\\u0434\\u043d\\u0456\\u0439 \\u0444\\u0456\\u0433\\u0443\\u0440\\u0456 \\u0437 \\u041f\\u041a\\u0422"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0411\\u043e\\u0439\\u043e\\u0432\\u0430 \\u0448\\u0432\\u0438\\u0434\\u043a\\u043e\\u0441\\u0442\\u0440\\u0456\\u043b\\u044c\\u043d\\u0456\\u0441\\u0442\\u044c \\u0437 \\u041f\\u041a"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0414\\u0430\\u043b\\u044c\\u043d\\u0456\\u0441\\u0442\\u044c \\u043f\\u0440\\u044f\\u043c\\u043e\\u0433\\u043e \\u043f\\u043e\\u0441\\u0442\\u0440\\u0456\\u043b\\u0443 \\u043f\\u043e \\u0433\\u0440\\u0443\\u0434\\u043d\\u0456\\u0439 \\u0444\\u0456\\u0433\\u0443\\u0440\\u0456 \\u0437 \\u0421\\u0412\\u0414"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0414\\u0430\\u043b\\u044c\\u043d\\u0456\\u0441\\u0442\\u044c \\u043f\\u0440\\u044f\\u043c\\u043e\\u0433\\u043e \\u043f\\u043e\\u0441\\u0442\\u0440\\u0456\\u043b\\u0443 \\u043f\\u043e \\u0444\\u0456\\u0433\\u0443\\u0440\\u0456, \\u0449\\u043e \\u0440\\u0443\\u0445\\u0430\\u0454\\u0442\\u044c\\u0441\\u044f \\u0437 \\u0421\\u0412\\u0414"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041c\\u0430\\u0441\\u0430 \\u0421\\u0412\\u0414"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0421\\u0430\\u043c\\u043e\\u043b\\u0456\\u043a\\u0432\\u0456\\u0434\\u0430\\u0446\\u0456\\u044f \\u043f\\u0456\\u0434\\u0440\\u0438\\u0432\\u0430\\u0447\\u0430 \\u0433\\u0440\\u0430\\u043d\\u0430\\u0442\\u0438 \\u041f\\u0413-26"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0414\\u0430\\u043b\\u044c\\u043d\\u0456\\u0441\\u0442\\u044c \\u0434\\u043e \\u043c\\u0456\\u0448\\u0435\\u043d\\u0456 \\u043f\\u0440\\u0438 \\u0432\\u0438\\u043a\\u043e\\u043d\\u0430\\u043d\\u043d\\u0456 1\\u0412\\u041d\\u0421 \\u0437 \\u041f\\u041c"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041c\\u0430\\u0441\\u0430 \\u043a\\u0443\\u043b\\u0435\\u043c\\u0435\\u0442\\u0430 \\u041f\\u041a\\u0422"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041d\\u043e\\u0441\\u0438\\u043c\\u0438\\u0439 \\u0431\\u043e\\u0454\\u043a\\u043e\\u043c\\u043f\\u043b\\u0435\\u043a\\u0442 \\u0413\\u041f-25"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041d\\u0430 \\u044f\\u043a\\u0443 \\u0432\\u0438\\u0441\\u043e\\u0442\\u0443 \\u201c\\u043f\\u0456\\u0434\\u0441\\u0442\\u0440\\u0438\\u0431\\u0443\\u0454\\u201d \\u0433\\u0440\\u0430\\u043d\\u0430\\u0442\\u0430 \\u0412\\u041e\\u0413 - 25\\u041f"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041a\\u0430\\u043b\\u0456\\u0431\\u0440 \\u0433\\u0440\\u0430\\u043d\\u0430\\u0442\\u0438 \\u0412\\u041e\\u0413-25\\u041f"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041f\\u043e\\u0447\\u0430\\u0442\\u043a\\u043e\\u0432\\u0430 \\u0448\\u0432\\u0438\\u0434\\u043a\\u0456\\u0441\\u0442\\u044c \\u0433\\u0440\\u0430\\u043d\\u0430\\u0442\\u0438 \\u0420\\u041f\\u0413-22"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041f\\u043e\\u0447\\u0430\\u0442\\u043a\\u043e\\u0432\\u0430 \\u0448\\u0432\\u0438\\u0434\\u043a\\u0456\\u0441\\u0442\\u044c \\u0433\\u0440\\u0430\\u043d\\u0430\\u0442\\u0438 \\u0420\\u041f\\u0413-26"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0414\\u043e\\u0432\\u0436\\u0438\\u043d\\u0430 \\u0432 \\u043f\\u043e\\u0445\\u0456\\u0434\\u043d\\u043e\\u043c\\u0443 \\u043f\\u043e\\u043b\\u043e\\u0436\\u0435\\u043d\\u043d\\u0456 \\u0420\\u041f\\u0413-22"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0421\\u0435\\u0440\\u0436\\u0430\\u043d\\u0442\\u0438 \\u0441\\u0442\\u0440\\u043e\\u043a\\u043e\\u0432\\u043e\\u0457 \\u0441\\u043b\\u0443\\u0436\\u0431\\u0438, \\u044f\\u043a\\u0456 \\u043e\\u0431\\u0456\\u0439\\u043c\\u0430\\u044e\\u0442\\u044c \\u043f\\u043e\\u0441\\u0430\\u0434\\u0443 \\u0441\\u0442\\u0430\\u0440\\u0448\\u0438\\u043d\\u0438 \\u0440\\u043e\\u0442\\u0438 \\u0440\\u043e\\u0437\\u043c\\u0456\\u0449\\u0443\\u044e\\u0442\\u044c\\u0441\\u044f"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u042f\\u043a\\u0449\\u043e \\u043f\\u0456\\u0434\\u043b\\u043e\\u0433\\u0430 \\u043d\\u0435 \\u043d\\u0430\\u0442\\u0438\\u0440\\u0430\\u0454\\u0442\\u044c\\u0441\\u044f \\u043c\\u0430\\u0441\\u0442\\u0438\\u043a\\u043e\\u044e, \\u0457\\u0457 \\u043c\\u0438\\u044e\\u0442\\u044c \\u043d\\u0435 \\u043c\\u0435\\u043d\\u0448\\u0435 \\u043d\\u0456\\u0436"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0412\\u0437\\u0438\\u043c\\u043a\\u0443 \\u0432 \\u0436\\u0438\\u0442\\u043b\\u043e\\u0432\\u0438\\u0445 \\u043f\\u0440\\u0438\\u043c\\u0456\\u0449\\u0435\\u043d\\u043d\\u044f\\u0445 \\u043f\\u0456\\u0434\\u0442\\u0440\\u0438\\u043c\\u0443\\u0454\\u0442\\u044c\\u0441\\u044f \\u0442\\u0435\\u043c\\u043f\\u0435\\u0440\\u0430\\u0442\\u0443\\u0440\\u0430 \\u043d\\u0435 \\u043d\\u0438\\u0436\\u0447\\u0435"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041a\\u043e\\u043b\\u0438 \\u043f\\u043e\\u043c\\u0456\\u0447\\u043d\\u0438\\u043a \\u043d\\u0430\\u0447\\u0430\\u043b\\u044c\\u043d\\u0438\\u043a\\u0430 \\u0432\\u0430\\u0440\\u0442\\u0438 \\u043f\\u0440\\u043e\\u0432\\u043e\\u0434\\u0438\\u0442\\u044c \\u0431\\u043e\\u0439\\u043e\\u0432\\u0438\\u0439 \\u0440\\u043e\\u0437\\u043f\\u043e\\u0434\\u0456\\u043b \\u043e\\u0441\\u043e\\u0431\\u043e\\u0432\\u043e\\u0433\\u043e \\u0441\\u043a\\u043b\\u0430\\u0434\\u0443 \\u0432\\u0430\\u0440\\u0442\\u0438 \\u0442\\u0430 \\u0441\\u0442\\u0430\\u0432\\u0438\\u0442\\u044c \\u0437\\u0430\\u0432\\u0434\\u0430\\u043d\\u043d\\u044f"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041d\\u0456\\u0445\\u0442\\u043e \\u0437\\u0456 \\u0441\\u043a\\u043b\\u0430\\u0434\\u0443 \\u0432\\u0430\\u0440\\u0442\\u0438 \\u043d\\u0435 \\u043c\\u043e\\u0436\\u0435 \\u0437\\u0430\\u043b\\u0438\\u0448\\u0430\\u0442\\u0438 \\u0432\\u0430\\u0440\\u0442\\u043e\\u0432\\u0435 \\u043f\\u0440\\u0438\\u043c\\u0456\\u0449\\u0435\\u043d\\u043d\\u044f"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u042f\\u043a\\u0449\\u043e \\u0432\\u0430\\u0440\\u0442\\u0430 \\u0440\\u043e\\u0437\\u0442\\u0430\\u0448\\u043e\\u0432\\u0430\\u043d\\u0430 \\u043d\\u0430 \\u0442\\u0435\\u0440\\u0438\\u0442\\u043e\\u0440\\u0456\\u0457 \\u0432\\u0456\\u0439\\u0441\\u044c\\u043a\\u043e\\u0432\\u043e\\u0457 \\u0447\\u0430\\u0441\\u0442\\u0438\\u043d\\u0438, \\u043f\\u043e\\u0441\\u0442\\u0430\\u0447\\u0430\\u043d\\u043d\\u044f \\u0457\\u0436\\u0456 \\u043e\\u0440\\u0433\\u0430\\u043d\\u0456\\u0437\\u043e\\u0432\\u0443\\u0454\\u0442\\u044c\\u0441\\u044f"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "440 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "670 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "640 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "420 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "440 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "640 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "150 \\u043f/\\u0445\\u0432."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "200 \\u043f/\\u0445\\u0432."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "250 \\u043f/\\u0445\\u0432."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "420 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "450 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "430 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "650 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "640 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "670 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "4,2 \\u043a\\u0433"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "4 \\u043a\\u0433"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "4,3 \\u043a\\u0433"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "3,5-6,5 \\u0441"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "4,5-6,5 \\u0441"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "3,5-8 \\u0441"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "50 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "25 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "20 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "9 \\u043a\\u0433"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "9,5 \\u043a\\u0433"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "10,5 \\u043a\\u0433"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "12 \\u043f\\u043e\\u0441\\u0442\\u0440"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "10 \\u043f\\u043e\\u0441\\u0442\\u0440."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "15 \\u043f\\u043e\\u0441\\u0442\\u0440."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "20-50 \\u0441\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "50-100 \\u0441\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "50-150\\u0441\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "30 \\u043c\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "35 \\u043c\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "40 \\u043c\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "120 \\u043c/\\u0441"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "130 \\u043c/\\u0441"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "133 \\u043c/\\u0441"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "133 \\u043c/\\u0441"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "144 \\u043c/\\u0441"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "155 \\u043c/\\u0441"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "750 \\u043c\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "755 \\u043c\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "760 \\u043c\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043f\\u043e\\u0431\\u043b\\u0438\\u0437\\u0443 \\u0440\\u043e\\u0437\\u0442\\u0430\\u0448\\u0443\\u0432\\u0430\\u043d\\u043d\\u044f \\u0432\\u0456\\u0439\\u0441\\u044c\\u043a\\u043e\\u0432\\u043e\\u0457 \\u0447\\u0430\\u0441\\u0442\\u0438\\u043d\\u0438"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0432 \\u043e\\u043a\\u0440\\u0435\\u043c\\u043e\\u043c\\u0443 \\u043f\\u0440\\u0438\\u043c\\u0456\\u0449\\u0435\\u043d\\u043d\\u0456 (\\u043a\\u0456\\u043c\\u043d\\u0430\\u0442\\u0456) \\u043a\\u0430\\u0437\\u0430\\u0440\\u043c\\u0438"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043d\\u0430 \\u043a\\u0432\\u0430\\u0440\\u0442\\u0438\\u0440\\u0430\\u0445 \\u043f\\u043e\\u0437\\u0430 \\u0440\\u043e\\u0437\\u0442\\u0430\\u0448\\u0443\\u0432\\u0430\\u043d\\u043d\\u044f\\u043c \\u0432\\u0456\\u0439\\u0441\\u044c\\u043a\\u043e\\u0432\\u043e\\u0457 \\u0447\\u0430\\u0441\\u0442\\u0438\\u043d\\u0438"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043e\\u0434\\u0438\\u043d \\u0440\\u0430\\u0437 \\u043d\\u0430 \\u0442\\u0438\\u0436\\u0434\\u0435\\u043d\\u044c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0434\\u0432\\u0430 \\u0440\\u0430\\u0437\\u0430 \\u043d\\u0430 \\u0442\\u0438\\u0436\\u0434\\u0435\\u043d\\u044c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043e\\u0434\\u0438\\u043d \\u0440\\u0430\\u0437 \\u043d\\u0430 \\u0434\\u0435\\u043d\\u044c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "+18\\u00b0 \\u0421"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "+20\\u00b0 \\u0421"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "+22\\u00b0 \\u0421"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0434\\u043e \\u0432\\u0456\\u0434\\u043f\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u043d\\u044f \\u043f\\u0435\\u0440\\u0448\\u043e\\u0457 \\u0437\\u043c\\u0456\\u043d\\u0438 \\u043d\\u0430 \\u043f\\u043e\\u0441\\u0442\\u0438"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043f\\u0456\\u0441\\u043b\\u044f \\u0442\\u043e\\u0433\\u043e, \\u044f\\u043a \\u043f\\u0435\\u0440\\u0448\\u0430 \\u0437\\u043c\\u0456\\u043d\\u0430 \\u043f\\u0456\\u0434\\u0435 \\u043d\\u0430 \\u043f\\u043e\\u0441\\u0442\\u0438"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043f\\u0456\\u0441\\u043b\\u044f \\u0442\\u043e\\u0433\\u043e, \\u044f\\u043a \\u043f\\u0435\\u0440\\u0448\\u0430 \\u0437\\u043c\\u0456\\u043d\\u0430 \\u043f\\u0440\\u0438\\u0439\\u0434\\u0435 \\u0437 \\u043f\\u043e\\u0441\\u0442\\u0456\\u0432"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0431\\u0435\\u0437 \\u0434\\u043e\\u0437\\u0432\\u043e\\u043b\\u0443 \\u043a\\u043e\\u043c\\u0430\\u043d\\u0434\\u0438\\u0440\\u0430 \\u0447\\u0430\\u0441\\u0442\\u0438\\u043d\\u0438"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0431\\u0435\\u0437 \\u0434\\u043e\\u0437\\u0432\\u043e\\u043b\\u0443 \\u0440\\u043e\\u0437\\u0432\\u0456\\u0434\\u043d\\u043e\\u0433\\u043e"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0431\\u0435\\u0437 \\u0434\\u043e\\u0437\\u0432\\u043e\\u043b\\u0443 \\u043d\\u0430\\u0447\\u0430\\u043b\\u044c\\u043d\\u0438\\u043a\\u0430 \\u0432\\u0430\\u0440\\u0442\\u0438."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0447\\u0435\\u0440\\u0433\\u043e\\u0432\\u0438\\u043c \\u0432\\u0456\\u0439\\u0441\\u044c\\u043a\\u043e\\u0432\\u043e\\u0457 \\u0447\\u0430\\u0441\\u0442\\u0438\\u043d\\u0438"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0437\\u0430 \\u0440\\u043e\\u0437\\u043f\\u043e\\u0440\\u044f\\u0434\\u0436\\u0435\\u043d\\u043d\\u044f\\u043c \\u043a\\u043e\\u043c\\u0430\\u043d\\u0434\\u0438\\u0440\\u0430 \\u0447\\u0430\\u0441\\u0442\\u0438\\u043d\\u0438, \\u0432\\u0456\\u0434 \\u044f\\u043a\\u043e\\u0457 \\u0432\\u043e\\u043d\\u0430 \\u0432\\u0456\\u0434\\u043d\\u0430\\u0440\\u044f\\u0434\\u0436\\u0435\\u043d\\u0430, \\u0430\\u0431\\u043e \\u0447\\u0435\\u0440\\u0433\\u043e\\u0432\\u043e\\u0433\\u043e \\u0432\\u0456\\u0439\\u0441\\u044c\\u043a\\u043e\\u0432\\u043e\\u0457 \\u0447\\u0430\\u0441\\u0442\\u0438\\u043d\\u0438"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043d\\u0430\\u0447\\u0430\\u043b\\u044c\\u043d\\u0438\\u043a\\u043e\\u043c \\u0432\\u0430\\u0440\\u0442\\u0438"}}]	13	1
393	2019-04-03 23:33:13.69929+03	22	Білет 10	1	[{"added": {}}]	13	1
394	2019-04-03 23:33:19.16038+03	23	Білет 17	1	[{"added": {}}]	13	1
395	2019-04-03 23:33:24.521995+03	24	Білет 24	1	[{"added": {}}]	13	1
396	2019-04-03 23:33:30.354716+03	25	Білет 31	1	[{"added": {}}]	13	1
397	2019-04-03 23:34:05.211538+03	19	Білет 17	3		13	1
398	2019-04-03 23:34:43.734461+03	25	Білет 31	3		13	1
399	2019-04-03 23:34:43.752878+03	24	Білет 24	3		13	1
400	2019-04-03 23:35:58.569547+03	609	Дальність прямого пострілу по фігурі, що рухається з ПК	3		9	1
401	2019-04-03 23:35:58.582289+03	608	Дальність прямого пострілу по грудній фігурі з ПКТ	3		9	1
402	2019-04-03 23:35:58.590533+03	607	Бойова швидкострільність з ПК	3		9	1
403	2019-04-03 23:35:58.598964+03	606	Дальність прямого пострілу по грудній фігурі з СВД	3		9	1
404	2019-04-03 23:35:58.607241+03	605	Дальність прямого пострілу по фігурі, що рухається з СВД	3		9	1
405	2019-04-03 23:35:58.615556+03	604	Маса СВД	3		9	1
406	2019-04-03 23:35:58.62394+03	603	Самоліквідація підривача гранати ПГ-26	3		9	1
407	2019-04-03 23:35:58.632329+03	602	Дальність до мішені при виконанні 1ВНС з ПМ	3		9	1
408	2019-04-03 23:35:58.640581+03	601	Маса кулемета ПКТ	3		9	1
409	2019-04-03 23:35:58.64888+03	600	Носимий боєкомплект ГП-25	3		9	1
410	2019-04-03 23:35:58.65743+03	599	На яку висоту “підстрибує” граната ВОГ - 25П	3		9	1
411	2019-04-03 23:35:58.665906+03	598	Калібр гранати ВОГ-25П	3		9	1
412	2019-04-03 23:35:58.674214+03	597	Початкова швидкість гранати РПГ-22	3		9	1
413	2019-04-03 23:35:58.682518+03	596	Початкова швидкість гранати РПГ-26	3		9	1
414	2019-04-03 23:35:58.690764+03	595	Довжина в похідному положенні РПГ-22	3		9	1
415	2019-04-03 23:35:58.699359+03	594	Сержанти строкової служби, які обіймають посаду старшини роти розміщуються	3		9	1
416	2019-04-03 23:35:58.707497+03	593	Якщо підлога не натирається мастикою, її миють не менше ніж	3		9	1
417	2019-04-03 23:35:58.71594+03	592	Взимку в житлових приміщеннях підтримується температура не нижче	3		9	1
418	2019-04-03 23:35:58.724178+03	591	Коли помічник начальника варти проводить бойовий розподіл особового складу варти та ставить завдання	3		9	1
419	2019-04-03 23:35:58.73288+03	590	Ніхто зі складу варти не може залишати вартове приміщення	3		9	1
420	2019-04-03 23:35:58.740892+03	589	Якщо варта розташована на території військової частини, постачання їжі організовується	3		9	1
421	2019-04-03 23:36:05.581205+03	630	Дальність прямого пострілу по фігурі, що рухається з ПК	3		9	1
422	2019-04-03 23:36:05.598942+03	629	Дальність прямого пострілу по грудній фігурі з ПКТ	3		9	1
423	2019-04-03 23:36:05.607139+03	628	Бойова швидкострільність з ПК	3		9	1
424	2019-04-03 23:36:05.615445+03	627	Дальність прямого пострілу по грудній фігурі з СВД	3		9	1
425	2019-04-03 23:36:05.62382+03	626	Дальність прямого пострілу по фігурі, що рухається з СВД	3		9	1
426	2019-04-03 23:36:05.63203+03	625	Маса СВД	3		9	1
427	2019-04-03 23:36:05.640605+03	624	Самоліквідація підривача гранати ПГ-26	3		9	1
428	2019-04-03 23:36:05.648816+03	623	Дальність до мішені при виконанні 1ВНС з ПМ	3		9	1
429	2019-04-03 23:36:05.657538+03	622	Маса кулемета ПКТ	3		9	1
430	2019-04-03 23:36:05.6655+03	621	Носимий боєкомплект ГП-25	3		9	1
431	2019-04-03 23:36:05.673888+03	620	На яку висоту “підстрибує” граната ВОГ - 25П	3		9	1
432	2019-04-03 23:36:05.682158+03	619	Калібр гранати ВОГ-25П	3		9	1
433	2019-04-03 23:36:05.690615+03	618	Початкова швидкість гранати РПГ-22	3		9	1
434	2019-04-03 23:36:05.698912+03	617	Початкова швидкість гранати РПГ-26	3		9	1
435	2019-04-03 23:36:05.707504+03	616	Довжина в похідному положенні РПГ-22	3		9	1
436	2019-04-03 23:36:05.715562+03	615	Сержанти строкової служби, які обіймають посаду старшини роти розміщуються	3		9	1
437	2019-04-03 23:36:05.7249+03	614	Якщо підлога не натирається мастикою, її миють не менше ніж	3		9	1
610	2019-04-03 23:54:01.998753+03	880	Бойова швидкострільність з ПК	3		9	1
449	2019-04-03 23:37:39.401697+03	707	Дальність до мішені при виконанні 1ВНС з ПМ	3		9	1
450	2019-04-03 23:37:39.410045+03	706	Маса кулемета ПКТ	3		9	1
451	2019-04-03 23:37:39.418422+03	705	Носимий боєкомплект ГП-25	3		9	1
452	2019-04-03 23:37:39.426692+03	704	На яку висоту “підстрибує” граната ВОГ - 25П	3		9	1
453	2019-04-03 23:37:39.434954+03	703	Калібр гранати ВОГ-25П	3		9	1
454	2019-04-03 23:37:39.443389+03	702	Початкова швидкість гранати РПГ-22	3		9	1
455	2019-04-03 23:37:39.451639+03	701	Початкова швидкість гранати РПГ-26	3		9	1
456	2019-04-03 23:37:39.460137+03	700	Довжина в похідному положенні РПГ-22	3		9	1
457	2019-04-03 23:37:39.468279+03	699	Сержанти строкової служби, які обіймають посаду старшини роти розміщуються	3		9	1
458	2019-04-03 23:37:39.476735+03	698	Якщо підлога не натирається мастикою, її миють не менше ніж	3		9	1
459	2019-04-03 23:37:39.484993+03	697	Взимку в житлових приміщеннях підтримується температура не нижче	3		9	1
460	2019-04-03 23:37:39.493313+03	696	Коли помічник начальника варти проводить бойовий розподіл особового складу варти та ставить завдання	3		9	1
461	2019-04-03 23:37:39.501592+03	695	Ніхто зі складу варти не може залишати вартове приміщення	3		9	1
462	2019-04-03 23:37:39.510032+03	694	Якщо варта розташована на території військової частини, постачання їжі організовується	3		9	1
463	2019-04-03 23:38:02.679819+03	733	Бойова швидкострільність з ПК	3		9	1
464	2019-04-03 23:38:02.708447+03	718	Взимку в житлових приміщеннях підтримується температура не нижче	3		9	1
465	2019-04-03 23:38:02.716713+03	728	Дальність до мішені при виконанні 1ВНС з ПМ	3		9	1
466	2019-04-03 23:38:02.725068+03	734	Дальність прямого пострілу по грудній фігурі з ПКТ	3		9	1
467	2019-04-03 23:38:02.733321+03	732	Дальність прямого пострілу по грудній фігурі з СВД	3		9	1
468	2019-04-03 23:38:02.741762+03	735	Дальність прямого пострілу по фігурі, що рухається з ПК	3		9	1
469	2019-04-03 23:38:02.750073+03	731	Дальність прямого пострілу по фігурі, що рухається з СВД	3		9	1
470	2019-04-03 23:38:02.75831+03	721	Довжина в похідному положенні РПГ-22	3		9	1
471	2019-04-03 23:38:02.766795+03	724	Калібр гранати ВОГ-25П	3		9	1
472	2019-04-03 23:38:02.775133+03	717	Коли помічник начальника варти проводить бойовий розподіл особового складу варти та ставить завдання	3		9	1
473	2019-04-03 23:38:02.783498+03	727	Маса кулемета ПКТ	3		9	1
474	2019-04-03 23:38:02.79187+03	730	Маса СВД	3		9	1
475	2019-04-03 23:38:02.800199+03	725	На яку висоту “підстрибує” граната ВОГ - 25П	3		9	1
476	2019-04-03 23:38:02.808532+03	716	Ніхто зі складу варти не може залишати вартове приміщення	3		9	1
477	2019-04-03 23:38:02.817075+03	726	Носимий боєкомплект ГП-25	3		9	1
478	2019-04-03 23:38:02.8254+03	723	Початкова швидкість гранати РПГ-22	3		9	1
479	2019-04-03 23:38:02.833786+03	722	Початкова швидкість гранати РПГ-26	3		9	1
480	2019-04-03 23:38:02.842074+03	729	Самоліквідація підривача гранати ПГ-26	3		9	1
481	2019-04-03 23:38:02.850475+03	720	Сержанти строкової служби, які обіймають посаду старшини роти розміщуються	3		9	1
482	2019-04-03 23:38:02.858694+03	715	Якщо варта розташована на території військової частини, постачання їжі організовується	3		9	1
483	2019-04-03 23:38:02.867173+03	719	Якщо підлога не натирається мастикою, її миють не менше ніж	3		9	1
484	2019-04-03 23:38:09.682008+03	654	Бойова швидкострільність з ПК	3		9	1
485	2019-04-03 23:38:09.69176+03	669	Взимку в житлових приміщеннях підтримується температура не нижче	3		9	1
486	2019-04-03 23:38:09.700002+03	659	Дальність до мішені при виконанні 1ВНС з ПМ	3		9	1
487	2019-04-03 23:38:09.708559+03	653	Дальність прямого пострілу по грудній фігурі з ПКТ	3		9	1
488	2019-04-03 23:38:09.71675+03	655	Дальність прямого пострілу по грудній фігурі з СВД	3		9	1
489	2019-04-03 23:38:09.725052+03	652	Дальність прямого пострілу по фігурі, що рухається з ПК	3		9	1
490	2019-04-03 23:38:09.733392+03	656	Дальність прямого пострілу по фігурі, що рухається з СВД	3		9	1
491	2019-04-03 23:38:09.741703+03	666	Довжина в похідному положенні РПГ-22	3		9	1
492	2019-04-03 23:38:09.750074+03	663	Калібр гранати ВОГ-25П	3		9	1
493	2019-04-03 23:38:09.758411+03	670	Коли помічник начальника варти проводить бойовий розподіл особового складу варти та ставить завдання	3		9	1
494	2019-04-03 23:38:09.766784+03	660	Маса кулемета ПКТ	3		9	1
495	2019-04-03 23:38:09.775106+03	657	Маса СВД	3		9	1
496	2019-04-03 23:38:09.783497+03	662	На яку висоту “підстрибує” граната ВОГ - 25П	3		9	1
497	2019-04-03 23:38:09.791744+03	671	Ніхто зі складу варти не може залишати вартове приміщення	3		9	1
498	2019-04-03 23:38:09.800031+03	661	Носимий боєкомплект ГП-25	3		9	1
499	2019-04-03 23:38:09.808442+03	664	Початкова швидкість гранати РПГ-22	3		9	1
500	2019-04-03 23:38:09.816746+03	665	Початкова швидкість гранати РПГ-26	3		9	1
501	2019-04-03 23:38:09.825078+03	658	Самоліквідація підривача гранати ПГ-26	3		9	1
502	2019-04-03 23:38:09.833388+03	667	Сержанти строкової служби, які обіймають посаду старшини роти розміщуються	3		9	1
503	2019-04-03 23:38:09.841659+03	672	Якщо варта розташована на території військової частини, постачання їжі організовується	3		9	1
504	2019-04-03 23:38:09.850189+03	668	Якщо підлога не натирається мастикою, її миють не менше ніж	3		9	1
505	2019-04-03 23:38:18.638026+03	649	Бойова швидкострільність з ПК	3		9	1
506	2019-04-03 23:38:18.657998+03	634	Взимку в житлових приміщеннях підтримується температура не нижче	3		9	1
507	2019-04-03 23:38:18.666259+03	644	Дальність до мішені при виконанні 1ВНС з ПМ	3		9	1
508	2019-04-03 23:38:18.674536+03	650	Дальність прямого пострілу по грудній фігурі з ПКТ	3		9	1
509	2019-04-03 23:38:18.682897+03	648	Дальність прямого пострілу по грудній фігурі з СВД	3		9	1
510	2019-04-03 23:38:18.691197+03	651	Дальність прямого пострілу по фігурі, що рухається з ПК	3		9	1
511	2019-04-03 23:38:18.699679+03	647	Дальність прямого пострілу по фігурі, що рухається з СВД	3		9	1
512	2019-04-03 23:38:18.707989+03	637	Довжина в похідному положенні РПГ-22	3		9	1
513	2019-04-03 23:38:18.716399+03	640	Калібр гранати ВОГ-25П	3		9	1
514	2019-04-03 23:38:18.724746+03	633	Коли помічник начальника варти проводить бойовий розподіл особового складу варти та ставить завдання	3		9	1
515	2019-04-03 23:38:18.732895+03	643	Маса кулемета ПКТ	3		9	1
516	2019-04-03 23:38:18.74118+03	646	Маса СВД	3		9	1
517	2019-04-03 23:38:18.74953+03	641	На яку висоту “підстрибує” граната ВОГ - 25П	3		9	1
518	2019-04-03 23:38:18.757913+03	632	Ніхто зі складу варти не може залишати вартове приміщення	3		9	1
519	2019-04-03 23:38:18.766448+03	642	Носимий боєкомплект ГП-25	3		9	1
520	2019-04-03 23:38:18.77465+03	639	Початкова швидкість гранати РПГ-22	3		9	1
521	2019-04-03 23:38:18.782935+03	638	Початкова швидкість гранати РПГ-26	3		9	1
522	2019-04-03 23:38:18.791286+03	645	Самоліквідація підривача гранати ПГ-26	3		9	1
523	2019-04-03 23:38:18.79975+03	636	Сержанти строкової служби, які обіймають посаду старшини роти розміщуються	3		9	1
524	2019-04-03 23:38:18.807882+03	631	Якщо варта розташована на території військової частини, постачання їжі організовується	3		9	1
525	2019-04-03 23:38:18.816287+03	635	Якщо підлога не натирається мастикою, її миють не менше ніж	3		9	1
526	2019-04-03 23:38:25.257144+03	691	Бойова швидкострільність з ПК	3		9	1
527	2019-04-03 23:38:25.274524+03	676	Взимку в житлових приміщеннях підтримується температура не нижче	3		9	1
528	2019-04-03 23:38:25.282883+03	686	Дальність до мішені при виконанні 1ВНС з ПМ	3		9	1
529	2019-04-03 23:38:25.291216+03	692	Дальність прямого пострілу по грудній фігурі з ПКТ	3		9	1
530	2019-04-03 23:38:25.299454+03	690	Дальність прямого пострілу по грудній фігурі з СВД	3		9	1
531	2019-04-03 23:38:25.307784+03	693	Дальність прямого пострілу по фігурі, що рухається з ПК	3		9	1
532	2019-04-03 23:38:25.316159+03	689	Дальність прямого пострілу по фігурі, що рухається з СВД	3		9	1
533	2019-04-03 23:38:25.324606+03	679	Довжина в похідному положенні РПГ-22	3		9	1
534	2019-04-03 23:38:25.332861+03	682	Калібр гранати ВОГ-25П	3		9	1
535	2019-04-03 23:38:25.341138+03	675	Коли помічник начальника варти проводить бойовий розподіл особового складу варти та ставить завдання	3		9	1
536	2019-04-03 23:38:25.349501+03	685	Маса кулемета ПКТ	3		9	1
537	2019-04-03 23:38:25.357857+03	688	Маса СВД	3		9	1
538	2019-04-03 23:38:25.366185+03	683	На яку висоту “підстрибує” граната ВОГ - 25П	3		9	1
539	2019-04-03 23:38:25.37453+03	674	Ніхто зі складу варти не може залишати вартове приміщення	3		9	1
540	2019-04-03 23:38:25.382856+03	684	Носимий боєкомплект ГП-25	3		9	1
541	2019-04-03 23:38:25.391275+03	681	Початкова швидкість гранати РПГ-22	3		9	1
542	2019-04-03 23:38:25.399448+03	680	Початкова швидкість гранати РПГ-26	3		9	1
543	2019-04-03 23:38:25.407955+03	687	Самоліквідація підривача гранати ПГ-26	3		9	1
544	2019-04-03 23:38:25.416212+03	678	Сержанти строкової служби, які обіймають посаду старшини роти розміщуються	3		9	1
545	2019-04-03 23:38:25.4246+03	673	Якщо варта розташована на території військової частини, постачання їжі організовується	3		9	1
546	2019-04-03 23:38:25.432846+03	677	Якщо підлога не натирається мастикою, її миють не менше ніж	3		9	1
547	2019-04-03 23:52:16.091593+03	838	Бойова швидкострільність з ПК	3		9	1
548	2019-04-03 23:52:16.101303+03	754	Бойова швидкострільність з ПК	3		9	1
549	2019-04-03 23:52:16.109629+03	823	Взимку в житлових приміщеннях підтримується температура не нижче	3		9	1
550	2019-04-03 23:52:16.118255+03	739	Взимку в житлових приміщеннях підтримується температура не нижче	3		9	1
551	2019-04-03 23:52:16.126746+03	833	Дальність до мішені при виконанні 1ВНС з ПМ	3		9	1
552	2019-04-03 23:52:16.135042+03	749	Дальність до мішені при виконанні 1ВНС з ПМ	3		9	1
553	2019-04-03 23:52:16.143424+03	839	Дальність прямого пострілу по грудній фігурі з ПКТ	3		9	1
554	2019-04-03 23:52:16.151668+03	755	Дальність прямого пострілу по грудній фігурі з ПКТ	3		9	1
555	2019-04-03 23:52:16.160018+03	837	Дальність прямого пострілу по грудній фігурі з СВД	3		9	1
556	2019-04-03 23:52:16.168408+03	753	Дальність прямого пострілу по грудній фігурі з СВД	3		9	1
557	2019-04-03 23:52:16.176674+03	840	Дальність прямого пострілу по фігурі, що рухається з ПК	3		9	1
558	2019-04-03 23:52:16.1851+03	756	Дальність прямого пострілу по фігурі, що рухається з ПК	3		9	1
559	2019-04-03 23:52:16.193391+03	836	Дальність прямого пострілу по фігурі, що рухається з СВД	3		9	1
560	2019-04-03 23:52:16.201807+03	752	Дальність прямого пострілу по фігурі, що рухається з СВД	3		9	1
561	2019-04-03 23:52:16.210125+03	826	Довжина в похідному положенні РПГ-22	3		9	1
562	2019-04-03 23:52:16.218407+03	742	Довжина в похідному положенні РПГ-22	3		9	1
563	2019-04-03 23:52:16.226783+03	829	Калібр гранати ВОГ-25П	3		9	1
564	2019-04-03 23:52:16.235009+03	745	Калібр гранати ВОГ-25П	3		9	1
565	2019-04-03 23:52:16.243459+03	822	Коли помічник начальника варти проводить бойовий розподіл особового складу варти та ставить завдання	3		9	1
566	2019-04-03 23:52:16.251715+03	738	Коли помічник начальника варти проводить бойовий розподіл особового складу варти та ставить завдання	3		9	1
567	2019-04-03 23:52:16.260175+03	832	Маса кулемета ПКТ	3		9	1
568	2019-04-03 23:52:16.268498+03	748	Маса кулемета ПКТ	3		9	1
569	2019-04-03 23:52:16.276755+03	835	Маса СВД	3		9	1
570	2019-04-03 23:52:16.2851+03	751	Маса СВД	3		9	1
571	2019-04-03 23:52:16.293433+03	830	На яку висоту “підстрибує” граната ВОГ - 25П	3		9	1
572	2019-04-03 23:52:16.301795+03	746	На яку висоту “підстрибує” граната ВОГ - 25П	3		9	1
573	2019-04-03 23:52:16.310098+03	821	Ніхто зі складу варти не може залишати вартове приміщення	3		9	1
574	2019-04-03 23:52:16.318346+03	737	Ніхто зі складу варти не може залишати вартове приміщення	3		9	1
575	2019-04-03 23:52:16.32732+03	831	Носимий боєкомплект ГП-25	3		9	1
576	2019-04-03 23:52:16.33506+03	747	Носимий боєкомплект ГП-25	3		9	1
577	2019-04-03 23:52:16.343472+03	828	Початкова швидкість гранати РПГ-22	3		9	1
578	2019-04-03 23:52:16.351728+03	744	Початкова швидкість гранати РПГ-22	3		9	1
579	2019-04-03 23:52:16.360196+03	827	Початкова швидкість гранати РПГ-26	3		9	1
580	2019-04-03 23:52:16.368442+03	743	Початкова швидкість гранати РПГ-26	3		9	1
581	2019-04-03 23:52:16.376725+03	834	Самоліквідація підривача гранати ПГ-26	3		9	1
582	2019-04-03 23:52:16.385073+03	750	Самоліквідація підривача гранати ПГ-26	3		9	1
583	2019-04-03 23:52:16.393674+03	825	Сержанти строкової служби, які обіймають посаду старшини роти розміщуються	3		9	1
584	2019-04-03 23:52:16.401661+03	741	Сержанти строкової служби, які обіймають посаду старшини роти розміщуються	3		9	1
585	2019-04-03 23:52:16.410107+03	820	Якщо варта розташована на території військової частини, постачання їжі організовується	3		9	1
586	2019-04-03 23:52:16.418422+03	736	Якщо варта розташована на території військової частини, постачання їжі організовується	3		9	1
587	2019-04-03 23:52:16.426801+03	824	Якщо підлога не натирається мастикою, її миють не менше ніж	3		9	1
588	2019-04-03 23:52:16.435074+03	740	Якщо підлога не натирається мастикою, її миють не менше ніж	3		9	1
589	2019-04-03 23:53:34.800909+03	859	Бойова швидкострільність з ПК	3		9	1
590	2019-04-03 23:53:34.814294+03	844	Взимку в житлових приміщеннях підтримується температура не нижче	3		9	1
591	2019-04-03 23:53:34.822531+03	854	Дальність до мішені при виконанні 1ВНС з ПМ	3		9	1
592	2019-04-03 23:53:34.830878+03	860	Дальність прямого пострілу по грудній фігурі з ПКТ	3		9	1
593	2019-04-03 23:53:34.839238+03	858	Дальність прямого пострілу по грудній фігурі з СВД	3		9	1
594	2019-04-03 23:53:34.847575+03	861	Дальність прямого пострілу по фігурі, що рухається з ПК	3		9	1
595	2019-04-03 23:53:34.855873+03	857	Дальність прямого пострілу по фігурі, що рухається з СВД	3		9	1
596	2019-04-03 23:53:34.864271+03	847	Довжина в похідному положенні РПГ-22	3		9	1
597	2019-04-03 23:53:34.872608+03	850	Калібр гранати ВОГ-25П	3		9	1
598	2019-04-03 23:53:34.881092+03	843	Коли помічник начальника варти проводить бойовий розподіл особового складу варти та ставить завдання	3		9	1
599	2019-04-03 23:53:34.889407+03	853	Маса кулемета ПКТ	3		9	1
600	2019-04-03 23:53:34.89784+03	856	Маса СВД	3		9	1
601	2019-04-03 23:53:34.906055+03	851	На яку висоту “підстрибує” граната ВОГ - 25П	3		9	1
602	2019-04-03 23:53:34.914886+03	842	Ніхто зі складу варти не може залишати вартове приміщення	3		9	1
603	2019-04-03 23:53:34.922654+03	852	Носимий боєкомплект ГП-25	3		9	1
604	2019-04-03 23:53:34.931156+03	849	Початкова швидкість гранати РПГ-22	3		9	1
605	2019-04-03 23:53:34.939393+03	848	Початкова швидкість гранати РПГ-26	3		9	1
606	2019-04-03 23:53:34.947762+03	855	Самоліквідація підривача гранати ПГ-26	3		9	1
607	2019-04-03 23:53:34.956059+03	846	Сержанти строкової служби, які обіймають посаду старшини роти розміщуються	3		9	1
608	2019-04-03 23:53:34.964552+03	841	Якщо варта розташована на території військової частини, постачання їжі організовується	3		9	1
609	2019-04-03 23:53:34.972729+03	845	Якщо підлога не натирається мастикою, її миють не менше ніж	3		9	1
611	2019-04-03 23:54:02.021514+03	865	Взимку в житлових приміщеннях підтримується температура не нижче	3		9	1
612	2019-04-03 23:54:02.038092+03	875	Дальність до мішені при виконанні 1ВНС з ПМ	3		9	1
613	2019-04-03 23:54:02.046408+03	881	Дальність прямого пострілу по грудній фігурі з ПКТ	3		9	1
614	2019-04-03 23:54:02.054717+03	879	Дальність прямого пострілу по грудній фігурі з СВД	3		9	1
615	2019-04-03 23:54:02.06529+03	882	Дальність прямого пострілу по фігурі, що рухається з ПК	3		9	1
616	2019-04-03 23:54:02.071396+03	878	Дальність прямого пострілу по фігурі, що рухається з СВД	3		9	1
617	2019-04-03 23:54:02.079876+03	868	Довжина в похідному положенні РПГ-22	3		9	1
618	2019-04-03 23:54:02.088198+03	871	Калібр гранати ВОГ-25П	3		9	1
619	2019-04-03 23:54:02.096542+03	864	Коли помічник начальника варти проводить бойовий розподіл особового складу варти та ставить завдання	3		9	1
620	2019-04-03 23:54:02.104877+03	874	Маса кулемета ПКТ	3		9	1
621	2019-04-03 23:54:02.11312+03	877	Маса СВД	3		9	1
622	2019-04-03 23:54:02.121512+03	872	На яку висоту “підстрибує” граната ВОГ - 25П	3		9	1
623	2019-04-03 23:54:02.129863+03	863	Ніхто зі складу варти не може залишати вартове приміщення	3		9	1
624	2019-04-03 23:54:02.138208+03	873	Носимий боєкомплект ГП-25	3		9	1
625	2019-04-03 23:54:02.14656+03	870	Початкова швидкість гранати РПГ-22	3		9	1
626	2019-04-03 23:54:02.155338+03	869	Початкова швидкість гранати РПГ-26	3		9	1
627	2019-04-03 23:54:02.162969+03	876	Самоліквідація підривача гранати ПГ-26	3		9	1
628	2019-04-03 23:54:02.171458+03	867	Сержанти строкової служби, які обіймають посаду старшини роти розміщуються	3		9	1
629	2019-04-03 23:54:02.179471+03	862	Якщо варта розташована на території військової частини, постачання їжі організовується	3		9	1
630	2019-04-03 23:54:02.187959+03	866	Якщо підлога не натирається мастикою, її миють не менше ніж	3		9	1
631	2019-04-03 23:57:33.731569+03	903	Дальність прямого пострілу по фігурі, що рухається з ПК	3		9	1
632	2019-04-03 23:57:33.809664+03	902	Дальність прямого пострілу по грудній фігурі з ПКТ	3		9	1
633	2019-04-03 23:57:33.818073+03	901	Бойова швидкострільність з ПК	3		9	1
634	2019-04-03 23:57:33.826373+03	900	Дальність прямого пострілу по грудній фігурі з СВД	3		9	1
635	2019-04-03 23:57:33.834693+03	899	Дальність прямого пострілу по фігурі, що рухається з СВД	3		9	1
636	2019-04-03 23:57:33.842979+03	898	Маса СВД	3		9	1
637	2019-04-03 23:57:33.851323+03	897	Самоліквідація підривача гранати ПГ-26	3		9	1
638	2019-04-03 23:57:33.859647+03	896	Дальність до мішені при виконанні 1ВНС з ПМ	3		9	1
639	2019-04-03 23:57:33.867984+03	895	Маса кулемета ПКТ	3		9	1
640	2019-04-03 23:57:33.876344+03	894	Носимий боєкомплект ГП-25	3		9	1
641	2019-04-03 23:57:33.884673+03	893	На яку висоту “підстрибує” граната ВОГ - 25П	3		9	1
642	2019-04-03 23:57:33.893012+03	892	Калібр гранати ВОГ-25П	3		9	1
643	2019-04-03 23:57:33.901289+03	891	Початкова швидкість гранати РПГ-22	3		9	1
644	2019-04-03 23:57:33.909621+03	890	Початкова швидкість гранати РПГ-26	3		9	1
645	2019-04-03 23:57:33.917999+03	889	Довжина в похідному положенні РПГ-22	3		9	1
646	2019-04-03 23:57:33.92633+03	888	Сержанти строкової служби, які обіймають посаду старшини роти розміщуються	3		9	1
647	2019-04-03 23:57:33.9347+03	887	Якщо підлога не натирається мастикою, її миють не менше ніж	3		9	1
648	2019-04-03 23:57:33.943006+03	886	Взимку в житлових приміщеннях підтримується температура не нижче	3		9	1
649	2019-04-03 23:57:33.951382+03	885	Коли помічник начальника варти проводить бойовий розподіл особового складу варти та ставить завдання	3		9	1
650	2019-04-03 23:57:33.959706+03	884	Ніхто зі складу варти не може залишати вартове приміщення	3		9	1
651	2019-04-03 23:57:33.968059+03	883	Якщо варта розташована на території військової частини, постачання їжі організовується	3		9	1
652	2019-04-04 00:01:09.885798+03	924	Дальність прямого пострілу по фігурі, що рухається з ПК	3		9	1
653	2019-04-04 00:01:09.897633+03	923	Дальність прямого пострілу по грудній фігурі з ПКТ	3		9	1
654	2019-04-04 00:01:09.905917+03	922	Бойова швидкострільність з ПК	3		9	1
655	2019-04-04 00:01:09.914279+03	921	Дальність прямого пострілу по грудній фігурі з СВД	3		9	1
656	2019-04-04 00:01:09.922866+03	920	Дальність прямого пострілу по фігурі, що рухається з СВД	3		9	1
657	2019-04-04 00:01:09.931231+03	919	Маса СВД	3		9	1
658	2019-04-04 00:01:09.939547+03	918	Самоліквідація підривача гранати ПГ-26	3		9	1
659	2019-04-04 00:01:09.947904+03	917	Дальність до мішені при виконанні 1ВНС з ПМ	3		9	1
660	2019-04-04 00:01:09.956224+03	916	Маса кулемета ПКТ	3		9	1
661	2019-04-04 00:01:09.964557+03	915	Носимий боєкомплект ГП-25	3		9	1
662	2019-04-04 00:01:09.972843+03	914	На яку висоту “підстрибує” граната ВОГ - 25П	3		9	1
663	2019-04-04 00:01:09.98124+03	913	Калібр гранати ВОГ-25П	3		9	1
664	2019-04-04 00:01:09.989469+03	912	Початкова швидкість гранати РПГ-22	3		9	1
665	2019-04-04 00:01:09.998103+03	911	Початкова швидкість гранати РПГ-26	3		9	1
666	2019-04-04 00:01:10.006237+03	910	Довжина в похідному положенні РПГ-22	3		9	1
667	2019-04-04 00:01:10.014603+03	909	Сержанти строкової служби, які обіймають посаду старшини роти розміщуються	3		9	1
668	2019-04-04 00:01:10.022898+03	908	Якщо підлога не натирається мастикою, її миють не менше ніж	3		9	1
669	2019-04-04 00:01:10.031221+03	907	Взимку в житлових приміщеннях підтримується температура не нижче	3		9	1
670	2019-04-04 00:01:10.039546+03	906	Коли помічник начальника варти проводить бойовий розподіл особового складу варти та ставить завдання	3		9	1
671	2019-04-04 00:01:10.047951+03	905	Ніхто зі складу варти не може залишати вартове приміщення	3		9	1
672	2019-04-04 00:01:10.056253+03	904	Якщо варта розташована на території військової частини, постачання їжі організовується	3		9	1
673	2019-04-04 00:04:39.562758+03	945	Дальність прямого пострілу по фігурі, що рухається з ПК	3		9	1
674	2019-04-04 00:04:39.586275+03	944	Дальність прямого пострілу по грудній фігурі з ПКТ	3		9	1
675	2019-04-04 00:04:39.594536+03	943	Бойова швидкострільність з ПК	3		9	1
676	2019-04-04 00:04:39.602819+03	942	Дальність прямого пострілу по грудній фігурі з СВД	3		9	1
677	2019-04-04 00:04:39.611191+03	941	Дальність прямого пострілу по фігурі, що рухається з СВД	3		9	1
678	2019-04-04 00:04:39.619572+03	940	Маса СВД	3		9	1
679	2019-04-04 00:04:39.627928+03	939	Самоліквідація підривача гранати ПГ-26	3		9	1
680	2019-04-04 00:04:39.636199+03	938	Дальність до мішені при виконанні 1ВНС з ПМ	3		9	1
681	2019-04-04 00:04:39.644583+03	937	Маса кулемета ПКТ	3		9	1
682	2019-04-04 00:04:39.653027+03	936	Носимий боєкомплект ГП-25	3		9	1
683	2019-04-04 00:04:39.661517+03	935	На яку висоту “підстрибує” граната ВОГ - 25П	3		9	1
684	2019-04-04 00:04:39.669881+03	934	Калібр гранати ВОГ-25П	3		9	1
685	2019-04-04 00:04:39.678397+03	933	Початкова швидкість гранати РПГ-22	3		9	1
686	2019-04-04 00:04:39.76694+03	932	Початкова швидкість гранати РПГ-26	3		9	1
687	2019-04-04 00:04:39.79485+03	931	Довжина в похідному положенні РПГ-22	3		9	1
688	2019-04-04 00:04:39.803251+03	930	Сержанти строкової служби, які обіймають посаду старшини роти розміщуються	3		9	1
689	2019-04-04 00:04:39.81149+03	929	Якщо підлога не натирається мастикою, її миють не менше ніж	3		9	1
690	2019-04-04 00:04:39.820392+03	928	Взимку в житлових приміщеннях підтримується температура не нижче	3		9	1
691	2019-04-04 00:04:39.828222+03	927	Коли помічник начальника варти проводить бойовий розподіл особового складу варти та ставить завдання	3		9	1
692	2019-04-04 00:04:39.836506+03	926	Ніхто зі складу варти не може залишати вартове приміщення	3		9	1
693	2019-04-04 00:04:39.844815+03	925	Якщо варта розташована на території військової частини, постачання їжі організовується	3		9	1
694	2019-04-04 00:07:12.812528+03	987	Дальність прямого пострілу по фігурі, що рухається з ПК	3		9	1
695	2019-04-04 00:07:12.836402+03	986	Дальність прямого пострілу по грудній фігурі з ПКТ	3		9	1
696	2019-04-04 00:07:12.844662+03	985	Бойова швидкострільність з ПК	3		9	1
697	2019-04-04 00:07:12.852997+03	984	Дальність прямого пострілу по грудній фігурі з СВД	3		9	1
698	2019-04-04 00:07:12.861262+03	983	Дальність прямого пострілу по фігурі, що рухається з СВД	3		9	1
699	2019-04-04 00:07:12.869672+03	982	Маса СВД	3		9	1
700	2019-04-04 00:07:12.877914+03	981	Самоліквідація підривача гранати ПГ-26	3		9	1
701	2019-04-04 00:07:12.886378+03	980	Дальність до мішені при виконанні 1ВНС з ПМ	3		9	1
702	2019-04-04 00:07:12.894583+03	979	Маса кулемета ПКТ	3		9	1
703	2019-04-04 00:07:12.902948+03	978	Носимий боєкомплект ГП-25	3		9	1
704	2019-04-04 00:07:12.911166+03	977	На яку висоту “підстрибує” граната ВОГ - 25П	3		9	1
705	2019-04-04 00:07:12.919627+03	976	Калібр гранати ВОГ-25П	3		9	1
706	2019-04-04 00:07:12.927904+03	975	Початкова швидкість гранати РПГ-22	3		9	1
707	2019-04-04 00:07:12.93642+03	974	Початкова швидкість гранати РПГ-26	3		9	1
708	2019-04-04 00:07:12.944553+03	973	Довжина в похідному положенні РПГ-22	3		9	1
709	2019-04-04 00:07:12.952897+03	972	Сержанти строкової служби, які обіймають посаду старшини роти розміщуються	3		9	1
710	2019-04-04 00:07:12.96137+03	971	Якщо підлога не натирається мастикою, її миють не менше ніж	3		9	1
711	2019-04-04 00:07:12.969619+03	970	Взимку в житлових приміщеннях підтримується температура не нижче	3		9	1
712	2019-04-04 00:07:12.978026+03	969	Коли помічник начальника варти проводить бойовий розподіл особового складу варти та ставить завдання	3		9	1
713	2019-04-04 00:07:12.986288+03	968	Ніхто зі складу варти не може залишати вартове приміщення	3		9	1
714	2019-04-04 00:07:12.994605+03	967	Якщо варта розташована на території військової частини, постачання їжі організовується	3		9	1
715	2019-04-04 00:07:13.003054+03	966	Дальність прямого пострілу по фігурі, що рухається з ПК	3		9	1
716	2019-04-04 00:07:13.011274+03	965	Дальність прямого пострілу по грудній фігурі з ПКТ	3		9	1
717	2019-04-04 00:07:13.028034+03	964	Бойова швидкострільність з ПК	3		9	1
718	2019-04-04 00:07:13.036376+03	963	Дальність прямого пострілу по грудній фігурі з СВД	3		9	1
719	2019-04-04 00:07:13.044617+03	962	Дальність прямого пострілу по фігурі, що рухається з СВД	3		9	1
720	2019-04-04 00:07:13.053017+03	961	Маса СВД	3		9	1
721	2019-04-04 00:07:13.061268+03	960	Самоліквідація підривача гранати ПГ-26	3		9	1
722	2019-04-04 00:07:13.069698+03	959	Дальність до мішені при виконанні 1ВНС з ПМ	3		9	1
723	2019-04-04 00:07:13.077996+03	958	Маса кулемета ПКТ	3		9	1
724	2019-04-04 00:07:13.086412+03	957	Носимий боєкомплект ГП-25	3		9	1
725	2019-04-04 00:07:13.094688+03	956	На яку висоту “підстрибує” граната ВОГ - 25П	3		9	1
726	2019-04-04 00:07:13.103067+03	955	Калібр гранати ВОГ-25П	3		9	1
727	2019-04-04 00:07:13.111344+03	954	Початкова швидкість гранати РПГ-22	3		9	1
728	2019-04-04 00:07:13.120141+03	953	Початкова швидкість гранати РПГ-26	3		9	1
729	2019-04-04 00:07:13.12802+03	952	Довжина в похідному положенні РПГ-22	3		9	1
730	2019-04-04 00:07:13.136438+03	951	Сержанти строкової служби, які обіймають посаду старшини роти розміщуються	3		9	1
731	2019-04-04 00:07:13.144685+03	950	Якщо підлога не натирається мастикою, її миють не менше ніж	3		9	1
732	2019-04-04 00:07:13.153154+03	949	Взимку в житлових приміщеннях підтримується температура не нижче	3		9	1
733	2019-04-04 00:07:13.161422+03	948	Коли помічник начальника варти проводить бойовий розподіл особового складу варти та ставить завдання	3		9	1
734	2019-04-04 00:07:13.169718+03	947	Ніхто зі складу варти не може залишати вартове приміщення	3		9	1
735	2019-04-04 00:07:13.177994+03	946	Якщо варта розташована на території військової частини, постачання їжі організовується	3		9	1
736	2019-04-04 00:08:43.937398+03	1008	Дальність прямого пострілу по фігурі, що рухається з ПК	3		9	1
737	2019-04-04 00:08:43.947686+03	1007	Дальність прямого пострілу по грудній фігурі з ПКТ	3		9	1
738	2019-04-04 00:08:43.955933+03	1006	Бойова швидкострільність з ПК	3		9	1
739	2019-04-04 00:08:43.964347+03	1005	Дальність прямого пострілу по грудній фігурі з СВД	3		9	1
740	2019-04-04 00:08:43.972608+03	1004	Дальність прямого пострілу по фігурі, що рухається з СВД	3		9	1
741	2019-04-04 00:08:43.981012+03	1003	Маса СВД	3		9	1
742	2019-04-04 00:08:43.989391+03	1002	Самоліквідація підривача гранати ПГ-26	3		9	1
743	2019-04-04 00:08:43.99767+03	1001	Дальність до мішені при виконанні 1ВНС з ПМ	3		9	1
744	2019-04-04 00:08:44.006009+03	1000	Маса кулемета ПКТ	3		9	1
745	2019-04-04 00:08:44.014381+03	999	Носимий боєкомплект ГП-25	3		9	1
746	2019-04-04 00:08:44.022626+03	998	На яку висоту “підстрибує” граната ВОГ - 25П	3		9	1
747	2019-04-04 00:08:44.031021+03	997	Калібр гранати ВОГ-25П	3		9	1
748	2019-04-04 00:08:44.039508+03	996	Початкова швидкість гранати РПГ-22	3		9	1
749	2019-04-04 00:08:44.04781+03	995	Початкова швидкість гранати РПГ-26	3		9	1
750	2019-04-04 00:08:44.056539+03	994	Довжина в похідному положенні РПГ-22	3		9	1
751	2019-04-04 00:08:44.064799+03	993	Сержанти строкової служби, які обіймають посаду старшини роти розміщуються	3		9	1
752	2019-04-04 00:08:44.073271+03	992	Якщо підлога не натирається мастикою, її миють не менше ніж	3		9	1
753	2019-04-04 00:08:44.081305+03	991	Взимку в житлових приміщеннях підтримується температура не нижче	3		9	1
754	2019-04-04 00:08:44.089764+03	990	Коли помічник начальника варти проводить бойовий розподіл особового складу варти та ставить завдання	3		9	1
755	2019-04-04 00:08:44.098021+03	989	Ніхто зі складу варти не може залишати вартове приміщення	3		9	1
756	2019-04-04 00:08:44.106517+03	988	Якщо варта розташована на території військової частини, постачання їжі організовується	3		9	1
757	2019-04-04 00:09:55.554355+03	1029	Дальність прямого пострілу по фігурі, що рухається з ПК	3		9	1
758	2019-04-04 00:09:55.570277+03	1028	Дальність прямого пострілу по грудній фігурі з ПКТ	3		9	1
759	2019-04-04 00:09:55.578524+03	1027	Бойова швидкострільність з ПК	3		9	1
760	2019-04-04 00:09:55.586843+03	1026	Дальність прямого пострілу по грудній фігурі з СВД	3		9	1
761	2019-04-04 00:09:55.595152+03	1025	Дальність прямого пострілу по фігурі, що рухається з СВД	3		9	1
762	2019-04-04 00:09:55.603468+03	1024	Маса СВД	3		9	1
763	2019-04-04 00:09:55.611857+03	1023	Самоліквідація підривача гранати ПГ-26	3		9	1
764	2019-04-04 00:09:55.620081+03	1022	Дальність до мішені при виконанні 1ВНС з ПМ	3		9	1
765	2019-04-04 00:09:55.628493+03	1021	Маса кулемета ПКТ	3		9	1
766	2019-04-04 00:09:55.636918+03	1020	Носимий боєкомплект ГП-25	3		9	1
767	2019-04-04 00:09:55.645346+03	1019	На яку висоту “підстрибує” граната ВОГ - 25П	3		9	1
768	2019-04-04 00:09:55.653653+03	1018	Калібр гранати ВОГ-25П	3		9	1
769	2019-04-04 00:09:55.670333+03	1017	Початкова швидкість гранати РПГ-22	3		9	1
770	2019-04-04 00:09:55.678694+03	1016	Початкова швидкість гранати РПГ-26	3		9	1
771	2019-04-04 00:09:55.68693+03	1015	Довжина в похідному положенні РПГ-22	3		9	1
772	2019-04-04 00:09:55.695399+03	1014	Сержанти строкової служби, які обіймають посаду старшини роти розміщуються	3		9	1
773	2019-04-04 00:09:55.703661+03	1013	Якщо підлога не натирається мастикою, її миють не менше ніж	3		9	1
774	2019-04-04 00:09:55.711998+03	1012	Взимку в житлових приміщеннях підтримується температура не нижче	3		9	1
775	2019-04-04 00:09:55.720317+03	1011	Коли помічник начальника варти проводить бойовий розподіл особового складу варти та ставить завдання	3		9	1
776	2019-04-04 00:09:55.728717+03	1010	Ніхто зі складу варти не може залишати вартове приміщення	3		9	1
777	2019-04-04 00:09:55.736962+03	1009	Якщо варта розташована на території військової частини, постачання їжі організовується	3		9	1
778	2019-04-04 00:11:24.897542+03	1050	Дальність прямого пострілу по фігурі, що рухається з ПК	3		9	1
779	2019-04-04 00:11:24.923456+03	1049	Дальність прямого пострілу по грудній фігурі з ПКТ	3		9	1
780	2019-04-04 00:11:24.931718+03	1048	Бойова швидкострільність з ПК	3		9	1
781	2019-04-04 00:11:24.940077+03	1047	Дальність прямого пострілу по грудній фігурі з СВД	3		9	1
782	2019-04-04 00:11:24.94842+03	1046	Дальність прямого пострілу по фігурі, що рухається з СВД	3		9	1
783	2019-04-04 00:11:24.956959+03	1045	Маса СВД	3		9	1
784	2019-04-04 00:11:24.965538+03	1044	Самоліквідація підривача гранати ПГ-26	3		9	1
785	2019-04-04 00:11:24.973727+03	1043	Дальність до мішені при виконанні 1ВНС з ПМ	3		9	1
786	2019-04-04 00:11:24.982148+03	1042	Маса кулемета ПКТ	3		9	1
787	2019-04-04 00:11:24.990456+03	1041	Носимий боєкомплект ГП-25	3		9	1
788	2019-04-04 00:11:24.998791+03	1040	На яку висоту “підстрибує” граната ВОГ - 25П	3		9	1
789	2019-04-04 00:11:25.007085+03	1039	Калібр гранати ВОГ-25П	3		9	1
790	2019-04-04 00:11:25.015338+03	1038	Початкова швидкість гранати РПГ-22	3		9	1
791	2019-04-04 00:11:25.023767+03	1037	Початкова швидкість гранати РПГ-26	3		9	1
792	2019-04-04 00:11:25.032248+03	1036	Довжина в похідному положенні РПГ-22	3		9	1
793	2019-04-04 00:11:25.040423+03	1035	Сержанти строкової служби, які обіймають посаду старшини роти розміщуються	3		9	1
794	2019-04-04 00:11:25.048709+03	1034	Якщо підлога не натирається мастикою, її миють не менше ніж	3		9	1
795	2019-04-04 00:11:25.057177+03	1033	Взимку в житлових приміщеннях підтримується температура не нижче	3		9	1
796	2019-04-04 00:11:25.065397+03	1032	Коли помічник начальника варти проводить бойовий розподіл особового складу варти та ставить завдання	3		9	1
797	2019-04-04 00:11:25.073766+03	1031	Ніхто зі складу варти не може залишати вартове приміщення	3		9	1
798	2019-04-04 00:11:25.082077+03	1030	Якщо варта розташована на території військової частини, постачання їжі організовується	3		9	1
799	2019-04-04 00:14:24.607551+03	26	Білет 4	1	[{"added": {}}]	13	1
800	2019-04-04 00:15:23.446045+03	27	Білет 11	1	[{"added": {}}]	13	1
801	2019-04-04 00:15:34.176028+03	28	Білет 18	1	[{"added": {}}]	13	1
802	2019-04-04 00:15:40.011859+03	29	Білет 25	1	[{"added": {}}]	13	1
803	2019-04-04 00:15:52.59561+03	30	Білет 32	1	[{"added": {}}]	13	1
804	2019-04-04 00:16:06.403236+03	31	Білет 5	1	[{"added": {}}]	13	1
805	2019-04-04 00:16:11.896118+03	32	Білет 6	1	[{"added": {}}]	13	1
806	2019-04-04 00:16:18.987847+03	33	Білет 7	1	[{"added": {}}]	13	1
807	2019-04-04 00:29:27.544244+03	26	Білет 4	2	[{"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041f\\u043e\\u0447\\u0430\\u0442\\u043a\\u043e\\u0432\\u0430 \\u0448\\u0432\\u0438\\u0434\\u043a\\u0456\\u0441\\u0442\\u044c \\u043a\\u0443\\u043b\\u0456 \\u0437 \\u041f\\u041a"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041f\\u043e\\u0447\\u0430\\u0442\\u043a\\u043e\\u0432\\u0430 \\u0448\\u0432\\u0438\\u0434\\u043a\\u0456\\u0441\\u0442\\u044c \\u043a\\u0443\\u043b\\u0456 \\u0437 \\u041f\\u041a\\u0422"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041c\\u0430\\u0441\\u0430 \\u043f\\u0430\\u0442\\u0440\\u043e\\u043d\\u0430 \\u0434\\u043e \\u041f\\u041a"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041f\\u043e\\u0447\\u0430\\u0442\\u043a\\u043e\\u0432\\u0430 \\u0448\\u0432\\u0438\\u0434\\u043a\\u0456\\u0441\\u0442\\u044c \\u043a\\u0443\\u043b\\u0456 \\u0437 \\u0421\\u0412\\u0414"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0411\\u043e\\u0439\\u043e\\u0432\\u0430 \\u0448\\u0432\\u0438\\u0434\\u043a\\u043e\\u0441\\u0442\\u0440\\u0456\\u043b\\u044c\\u043d\\u0456\\u0441\\u0442\\u044c \\u0437 \\u0421\\u0412\\u0414"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0404\\u043c\\u043d\\u0456\\u0441\\u0442\\u044c \\u043c\\u0430\\u0433\\u0430\\u0437\\u0438\\u043d\\u0443 \\u0421\\u0412\\u0414"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041f\\u0440\\u0438\\u0446\\u0456\\u043b\\u044c\\u043d\\u0430 \\u0434\\u0430\\u043b\\u044c\\u043d\\u0456\\u0441\\u0442\\u044c \\u0437 \\u041f\\u041a\\u0422"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u042f\\u043a\\u0430 \\u043a\\u0456\\u043b\\u044c\\u043a\\u0456\\u0441\\u0442\\u044c \\u0431\\u043e\\u0454\\u043f\\u0440\\u0438\\u043f\\u0430\\u0441\\u0456\\u0432 \\u0432\\u0438\\u043a\\u043e\\u0440\\u0438\\u0441\\u0442\\u043e\\u0432\\u0443\\u0454\\u0442\\u044c\\u0441\\u044f \\u043f\\u0440\\u0438 \\u0432\\u0438\\u043a\\u043e\\u043d\\u0430\\u043d\\u043d\\u0456 1\\u0412\\u041d\\u0421 \\u0437 \\u041f\\u041c"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041a\\u0430\\u043b\\u0456\\u0431\\u0440 \\u0413\\u041f-25"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041c\\u0430\\u0441\\u0430 \\u0437\\u0430\\u0440\\u044f\\u0434\\u0443 \\u0412\\u0412 \\u0433\\u0440\\u0430\\u043d\\u0430\\u0442\\u0438 \\u0412\\u041e\\u0413-25"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0417\\u043e\\u043d\\u0430 \\u0441\\u0443\\u0446\\u0456\\u043b\\u044c\\u043d\\u043e\\u0433\\u043e \\u0443\\u0440\\u0430\\u0436\\u0435\\u043d\\u043d\\u044f \\u043e\\u0441\\u043a\\u043e\\u043b\\u043a\\u0430\\u043c\\u0438 \\u0433\\u0440\\u0430\\u043d\\u0430\\u0442\\u0438 \\u0412\\u041e\\u0413-25"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041f\\u043e\\u0447\\u0430\\u0442\\u043a\\u043e\\u0432\\u0430 \\u0448\\u0432\\u0438\\u0434\\u043a\\u0456\\u0441\\u0442\\u044c \\u043f\\u043e\\u043b\\u044c\\u043e\\u0442\\u0443 \\u0433\\u0440\\u0430\\u043d\\u0430\\u0442\\u0438 \\u0412\\u041e\\u0413-25"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0414\\u043e\\u0432\\u0436\\u0438\\u043d\\u0430 \\u0432 \\u0431\\u043e\\u0439\\u043e\\u0432\\u043e\\u043c\\u0443 \\u043f\\u043e\\u043b\\u043e\\u0436\\u0435\\u043d\\u043d\\u0456 \\u0420\\u041f\\u0413-22"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0414\\u043e\\u0432\\u0436\\u0438\\u043d\\u0430 \\u0432 \\u043f\\u043e\\u0445\\u0456\\u0434\\u043d\\u043e\\u043c\\u0443 \\u0456 \\u0431\\u043e\\u0439\\u043e\\u0432\\u043e\\u043c\\u0443 \\u043f\\u043e\\u043b\\u043e\\u0436\\u0435\\u043d\\u043d\\u0456 \\u0420\\u041f\\u0413-26"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041c\\u0430\\u0441\\u0430 \\u0420\\u041f\\u0413-22"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0412\\u0441\\u0456 \\u043e\\u043f\\u0438\\u0441\\u0438, \\u0449\\u043e \\u0437\\u043d\\u0430\\u0445\\u043e\\u0434\\u044f\\u0442\\u044c\\u0441\\u044f \\u0432 \\u043a\\u0456\\u043c\\u043d\\u0430\\u0442\\u0456 \\u0434\\u043b\\u044f \\u0437\\u0431\\u0435\\u0440\\u0456\\u0433\\u0430\\u043d\\u043d\\u044f \\u0437\\u0431\\u0440\\u043e\\u0457 \\u0443 \\u0441\\u0442\\u0430\\u0432\\u043d\\u0438\\u0446\\u044f\\u0445, \\u0448\\u0430\\u0444\\u0430\\u0445 \\u0456 \\u044f\\u0449\\u0438\\u043a\\u0430\\u0445, \\u043f\\u0456\\u0434\\u043f\\u0438\\u0441\\u0443\\u044e\\u0442\\u044c\\u0441\\u044f"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041d\\u0430 \\u0433\\u043e\\u0440\\u0438\\u0449\\u0430\\u0445, \\u0443 \\u0432\\u0456\\u0434\\u0434\\u0430\\u043b\\u0435\\u043d\\u0438\\u0445 \\u0432\\u0456\\u0434 \\u0434\\u0438\\u043c\\u0430\\u0440\\u0456\\u0432 \\u043c\\u0456\\u0441\\u0446\\u044f\\u0445, \\u0434\\u043e\\u0437\\u0432\\u043e\\u043b\\u044f\\u0454\\u0442\\u044c\\u0441\\u044f \\u0437\\u0431\\u0435\\u0440\\u0456\\u0433\\u0430\\u0442\\u0438"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0422\\u0435\\u0440\\u043c\\u043e\\u043c\\u0435\\u0442\\u0440\\u0438 \\u0432\\u0438\\u0432\\u0456\\u0448\\u0443\\u044e\\u0442\\u044c\\u0441\\u044f \\u0443 \\u043f\\u0440\\u0438\\u043c\\u0456\\u0449\\u0435\\u043d\\u043d\\u044f\\u0445 \\u043d\\u0430 \\u0432\\u043d\\u0443\\u0442\\u0440\\u0456\\u0448\\u043d\\u0456\\u0445 \\u0441\\u0442\\u0456\\u043d\\u0430\\u0445, \\u043f\\u043e\\u0434\\u0430\\u043b\\u0456 \\u0432\\u0456\\u0434 \\u043f\\u0435\\u0447\\u0435\\u0439 \\u0442\\u0430 \\u043d\\u0430\\u0433\\u0440\\u0456\\u0432\\u0430\\u043b\\u044c\\u043d\\u0438\\u0445 \\u043f\\u0440\\u0438\\u0441\\u0442\\u0440\\u043e\\u0457\\u0432 \\u043d\\u0430 \\u0432\\u0438\\u0441\\u043e\\u0442\\u0456"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0414\\u0435 \\u0456\\u0434\\u0435 \\u0440\\u043e\\u0437\\u0432\\u0456\\u0434\\u043d\\u0438\\u0439 \\u043f\\u0456\\u0434 \\u0447\\u0430\\u0441 \\u043f\\u0440\\u044f\\u043c\\u0443\\u0432\\u0430\\u043d\\u043d\\u044f \\u0437\\u043c\\u0456\\u043d \\u043d\\u0430 \\u043f\\u043e\\u0441\\u0442\\u0438 \\u0442\\u0430 \\u0437 \\u043f\\u043e\\u0441\\u0442\\u0456\\u0432"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0414\\u043e\\u0437\\u0432\\u043e\\u043b\\u044f\\u0454\\u0442\\u044c\\u0441\\u044f \\u043d\\u0430\\u0447\\u0430\\u043b\\u044c\\u043d\\u0438\\u043a\\u043e\\u0432\\u0456 \\u0432\\u0430\\u0440\\u0442\\u0438 \\u0432\\u0456\\u0434\\u043f\\u043e\\u0447\\u0438\\u0432\\u0430\\u0442\\u0438 \\u043b\\u0435\\u0436\\u0430\\u0447\\u0438 (\\u0441\\u043f\\u0430\\u0442\\u0438), \\u043d\\u0435 \\u0437\\u043d\\u0456\\u043c\\u0430\\u044e\\u0447\\u0438 \\u0441\\u043f\\u043e\\u0440\\u044f\\u0434\\u0436\\u0435\\u043d\\u043d\\u044f \\u0442\\u0430 \\u043d\\u0435 \\u0440\\u043e\\u0437\\u0434\\u044f\\u0433\\u0430\\u044e\\u0447\\u0438\\u0441\\u044c"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0423 \\u0432\\u0430\\u0440\\u0442\\u043e\\u0432\\u043e\\u043c\\u0443 \\u043f\\u0440\\u0438\\u043c\\u0456\\u0449\\u0435\\u043d\\u043d\\u044f \\u0443 \\u0445\\u043e\\u043b\\u043e\\u0434\\u043d\\u0438\\u0439 \\u043f\\u0435\\u0440\\u0456\\u043e\\u0434 \\u0442\\u0435\\u043c\\u043f\\u0435\\u0440\\u0430\\u0442\\u0443\\u0440\\u0430 \\u043f\\u043e\\u0432\\u0456\\u0442\\u0440\\u044f \\u043f\\u0456\\u0434\\u0442\\u0440\\u0438\\u043c\\u0443\\u0454\\u0442\\u044c\\u0441\\u044f \\u043d\\u0435 \\u043d\\u0438\\u0436\\u0447\\u0435"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "825 \\u043c/\\u0441"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "800 \\u043c/\\u0441"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "850 \\u043c/\\u0441"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "825 \\u043c/\\u0441"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "855 \\u043c/\\u0441"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "850 \\u043c/\\u0441"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "20 \\u0433\\u0440."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "21 \\u0433\\u0440."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "21,8 \\u0433\\u0440."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "810 \\u043c/\\u0441"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "830 \\u043c/\\u0441"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "850 \\u043c/\\u0441"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "50 \\u043f/\\u0445\\u0432."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "20 \\u043f/\\u0445\\u0432."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "30 \\u043f/\\u0445\\u0432."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "30 \\u043f\\u0430\\u0442\\u0440."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "10 \\u043f\\u0430\\u0442\\u0440."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "15 \\u043f\\u0430\\u0442\\u0440."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "800\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "1000\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "1500\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "5 \\u043f\\u0430\\u0442\\u0440."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "3 \\u043f\\u0430\\u0442\\u0440."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "7 \\u043f\\u0430\\u0442\\u0440."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "30 \\u043c\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "40 \\u043c\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0412 - 37 \\u043c\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "40 \\u0433\\u0440."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "48 \\u0433\\u0440\\t."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "52 \\u0433\\u0440."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0434\\u043e 7 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0434\\u043e 10 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0434\\u043e 12 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "72 \\u043c/\\u0441"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "75 \\u043c/\\u0441"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "76 \\u043c/\\u0441"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "755 \\u043c\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "800 \\u043c\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "850 \\u043c\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "770 \\u043c\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "755 \\u043c\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "850 \\u043c\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "2,2 \\u043a\\u0433"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "3 \\u043a\\u0433"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "2,7 \\u043a\\u0433"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0441\\u0442\\u0430\\u0440\\u0448\\u0438\\u043d\\u043e\\u044e \\u0440\\u043e\\u0442\\u0438"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043a\\u043e\\u043c\\u0430\\u043d\\u0434\\u0438\\u0440\\u043e\\u043c \\u0440\\u043e\\u0442\\u0438"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043a\\u043e\\u043c\\u0430\\u043d\\u0434\\u0438\\u0440\\u043e\\u043c \\u0431\\u0430\\u0442\\u0430\\u043b\\u044c\\u0439\\u043e\\u043d\\u0443"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0437\\u0438\\u043c\\u043e\\u0432\\u0456 \\u0432\\u0456\\u043a\\u043e\\u043d\\u043d\\u0456 \\u0440\\u0430\\u043c\\u0438"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0437\\u0438\\u043c\\u043e\\u0432\\u0456 \\u0432\\u0456\\u043a\\u043e\\u043d\\u043d\\u0456 \\u0440\\u0430\\u043c\\u0438 \\u0442\\u0430 \\u0434\\u0432\\u0435\\u0440\\u0456."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043d\\u0456\\u0447\\u043e\\u0433\\u043e \\u043d\\u0435 \\u0434\\u043e\\u0437\\u0432\\u043e\\u043b\\u044f\\u0454\\u0442\\u044c\\u0441\\u044f \\u0437\\u0431\\u0435\\u0440\\u0456\\u0433\\u0430\\u0442\\u0438, \\u0443 \\u043f\\u0440\\u043e\\u0442\\u0438\\u043f\\u043e\\u0436\\u0435\\u0436\\u043d\\u043e\\u043c\\u0443 \\u0441\\u0442\\u0430\\u043d\\u0456"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "1.2 \\u043c\\u0435\\u0442\\u0440\\u0430 \\u0432\\u0456\\u0434 \\u043f\\u0456\\u0434\\u043b\\u043e\\u0433\\u0438"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "1.25 \\u043c\\u0435\\u0442\\u0440\\u0430 \\u0432\\u0456\\u0434 \\u043f\\u0456\\u0434\\u043b\\u043e\\u0433\\u0438"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "1.5 \\u043c\\u0435\\u0442\\u0440\\u0430 \\u0432\\u0456\\u0434 \\u043f\\u0456\\u0434\\u043b\\u043e\\u0433\\u0438"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0456\\u0434\\u0435 \\u043b\\u0456\\u0432\\u043e\\u0440\\u0443\\u0447 \\u043a\\u043e\\u043b\\u043e\\u043d\\u0438"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0456\\u0434\\u0435 \\u043f\\u0440\\u0430\\u0432\\u043e\\u0440\\u0443\\u0447 \\u043a\\u043e\\u043b\\u043e\\u043d\\u0438"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0456\\u0434\\u0435 \\u043d\\u0430 \\u0447\\u043e\\u043b\\u0456 \\u043a\\u043e\\u043b\\u043e\\u043d\\u0438"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043d\\u0435 \\u0431\\u0456\\u043b\\u044c\\u0448\\u0435 2 \\u0433\\u043e\\u0434\\u0438\\u043d \\u0443 \\u0434\\u0435\\u043d\\u043d\\u0438\\u0439 \\u0447\\u0430\\u0441 \\u0442\\u0430 2 \\u0433\\u043e\\u0434\\u0438\\u043d \\u0443 \\u043d\\u043e\\u0447\\u043d\\u0438\\u0439 \\u0447\\u0430\\u0441"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0431\\u0456\\u043b\\u044c\\u0448\\u0435 4 \\u0433\\u043e\\u0434\\u0438\\u043d \\u0443 \\u043d\\u0456\\u0447\\u043d\\u0438\\u0439 \\u0447\\u0430\\u0441"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043d\\u0435 \\u0431\\u0456\\u043b\\u044c\\u0448\\u0435 4 \\u0433\\u043e\\u0434\\u0438\\u043d \\u0443 \\u0434\\u0435\\u043d\\u043d\\u0438\\u0439 \\u0447\\u0430\\u0441"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "+18\\u00b0 \\u0421"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "+20\\u00b0 \\u0421"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "+22\\u00b0 \\u0421"}}]	13	1
808	2019-04-04 00:54:18.019229+03	31	Білет 5	2	[{"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041d\\u0430\\u0439\\u043c\\u0435\\u043d\\u0448\\u0430 \\u0454\\u043c\\u043d\\u0456\\u0441\\u0442\\u044c \\u043a\\u0443\\u043b\\u0435\\u043c\\u0435\\u0442\\u043d\\u043e\\u0457 \\u0441\\u0442\\u0440\\u0456\\u0447\\u043a\\u0438 \\u0434\\u043e \\u041f\\u041a"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041c\\u0430\\u0441\\u0430 \\u043a\\u0443\\u043b\\u0435\\u043c\\u0435\\u0442\\u0430 \\u041f\\u041a:"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041c\\u0430\\u0441\\u0430 \\u043a\\u0443\\u043b\\u0435\\u043c\\u0435\\u0442\\u0430 \\u041f\\u041a\\u0422"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041d\\u043e\\u0441\\u0438\\u043c\\u0438\\u0439 \\u0431\\u043e\\u0454\\u043a\\u043e\\u043c\\u043f\\u043b\\u0435\\u043a\\u0442 \\u0421\\u0412\\u0414"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041a\\u0440\\u0430\\u0442\\u043d\\u0456\\u0441\\u0442\\u044c (\\u0437\\u0431\\u0456\\u043b\\u044c\\u0448\\u0435\\u043d\\u043d\\u044f) \\u043e\\u043f\\u0442\\u0438\\u0447\\u043d\\u043e\\u0433\\u043e \\u043f\\u0440\\u0438\\u0446\\u0456\\u043b\\u0443 \\u0421\\u0412\\u0414"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041f\\u043e\\u043b\\u0435 \\u0437\\u043e\\u0440\\u0443 \\u043e\\u043f\\u0442\\u0438\\u0447\\u043d\\u043e\\u0433\\u043e \\u043f\\u0440\\u0438\\u0446\\u0456\\u043b\\u0443 \\u0421\\u0412\\u0414"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0411\\u043e\\u0439\\u043e\\u0432\\u0430 \\u0448\\u0432\\u0438\\u0434\\u043a\\u043e\\u0441\\u0442\\u0440\\u0456\\u043b\\u044c\\u043d\\u0456\\u0441\\u0442\\u044c \\u0437 \\u041f\\u041a"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u042f\\u043a \\u043d\\u0430\\u0437\\u0438\\u0432\\u0430\\u0454\\u0442\\u044c\\u0441\\u044f 1\\u0412\\u041d\\u0421 \\u0437 \\u041f\\u041c \\u0437\\u0433\\u0456\\u0434\\u043d\\u043e \\u041a\\u0421 \\u0421\\u0417 \\u0456 \\u0411\\u041c \\u0421\\u0412 - 16"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041c\\u0430\\u0441\\u0430 \\u0413\\u041f - 25"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0427\\u0430\\u0441 \\u0441\\u043f\\u0440\\u0430\\u0446\\u044e\\u0432\\u0430\\u043d\\u043d\\u044f \\u0441\\u0430\\u043c\\u043e\\u043b\\u0456\\u043a\\u0432\\u0456\\u0434\\u0430\\u0442\\u043e\\u0440\\u0430 \\u0433\\u0440\\u0430\\u043d\\u0430\\u0442\\u0438 \\u0412\\u041e\\u0413-25"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041c\\u0430\\u0441\\u0430 \\u0433\\u0440\\u0430\\u043d\\u0430\\u0442\\u0438 \\u201c\\u0413\\u0432\\u043e\\u0437\\u0434\\u044c\\u201d"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u042f\\u043a\\u0430 \\u0433\\u0440\\u0430\\u043d\\u0430\\u0442\\u0430 \\u043c\\u0430\\u0454 \\u043a\\u0430\\u043f\\u0441\\u0443\\u043b\\u044c-\\u0437\\u0430\\u043f\\u0430\\u043b\\u044e\\u0432\\u0430\\u0447 \\u043b\\u0456\\u043b\\u043e\\u0432\\u043e\\u0433\\u043e \\u043a\\u043e\\u043b\\u044c\\u043e\\u0440\\u0443"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041c\\u0430\\u0441\\u0430 \\u0420\\u041f\\u0413-26"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0427\\u0430\\u0441 \\u043f\\u0435\\u0440\\u0435\\u0432\\u043e\\u0434\\u0443 \\u041f\\u0423 \\u0437 \\u043f\\u043e\\u0445\\u0456\\u0434\\u043d\\u043e\\u0433\\u043e \\u043f\\u043e\\u043b\\u043e\\u0436\\u0435\\u043d\\u043d\\u044f \\u0432 \\u0431\\u043e\\u0439\\u043e\\u0432\\u0435 \\u0420\\u041f\\u0413-22"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0411\\u0440\\u043e\\u043d\\u0435\\u0431\\u0456\\u0439\\u043d\\u0456\\u0441\\u0442\\u044c \\u0420\\u041f\\u0413-22"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0417\\u0430\\u043f\\u0430\\u0441\\u043d\\u0456 \\u0441\\u0442\\u0432\\u043e\\u043b\\u0438 \\u0434\\u043e \\u043a\\u0443\\u043b\\u0435\\u043c\\u0435\\u0442\\u0456\\u0432 \\u0437\\u0431\\u0435\\u0440\\u0456\\u0433\\u0430\\u044e\\u0442\\u044c\\u0441\\u044f"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0422\\u0443\\u0430\\u043b\\u0435\\u0442\\u0438 \\u043e\\u0431\\u043b\\u0430\\u0434\\u043d\\u0443\\u044e\\u0442\\u044c\\u0441\\u044f \\u0437 \\u0440\\u043e\\u0437\\u0440\\u0430\\u0445\\u0443\\u043d\\u043a\\u0443 \\u043e\\u0434\\u043d\\u0430 \\u043a\\u0430\\u0431\\u0456\\u043d\\u0430 \\u0437 \\u0443\\u043d\\u0456\\u0442\\u0430\\u0437\\u043e\\u043c (\\u043e\\u0447\\u043a\\u043e\\u043c) \\u0442\\u0430 \\u043e\\u0434\\u0438\\u043d \\u043f\\u0456\\u0441\\u0443\\u0430\\u0440 \\u043d\\u0430"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0415\\u043b\\u0435\\u043a\\u0442\\u0440\\u0438\\u0447\\u043d\\u0435 \\u043e\\u0441\\u0432\\u0456\\u0442\\u043b\\u0435\\u043d\\u043d\\u044f \\u0432 \\u0440\\u0430\\u0439\\u043e\\u043d\\u0456 \\u0440\\u043e\\u0437\\u0442\\u0430\\u0448\\u0443\\u0432\\u0430\\u043d\\u043d\\u044f \\u0432\\u0456\\u0439\\u0441\\u044c\\u043a\\u043e\\u0432\\u043e\\u0457 \\u0447\\u0430\\u0441\\u0442\\u0438\\u043d\\u0438"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0414\\u0435 \\u0456\\u0434\\u0435 \\u0440\\u043e\\u0437\\u0432\\u0456\\u0434\\u043d\\u0438\\u0439 \\u043f\\u043e\\u043f\\u0435\\u0440\\u0435\\u0434\\u043d\\u044c\\u043e\\u0457 \\u0432\\u0430\\u0440\\u0442\\u0438 \\u043f\\u043e \\u0432\\u0456\\u0434\\u043d\\u043e\\u0448\\u0435\\u043d\\u043d\\u044e \\u0434\\u043e \\u0440\\u043e\\u0437\\u0432\\u0456\\u0434\\u043d\\u043e\\u0433\\u043e \\u043d\\u043e\\u0432\\u043e\\u0457 \\u0432\\u0430\\u0440\\u0442\\u0438 \\u043f\\u0440\\u0438 \\u043f\\u0440\\u044f\\u043c\\u0443\\u0432\\u0430\\u043d\\u043d\\u0456 \\u043d\\u0430 \\u043f\\u043e\\u0441\\u0442\\u0438"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0414\\u043e\\u0437\\u0432\\u043e\\u043b\\u044f\\u0454\\u0442\\u044c\\u0441\\u044f \\u043f\\u043e\\u043c\\u0456\\u0447\\u043d\\u0438\\u043a\\u043e\\u0432\\u0456 \\u043d\\u0430\\u0447\\u0430\\u043b\\u044c\\u043d\\u0438\\u043a\\u0430 \\u0432\\u0430\\u0440\\u0442\\u0438 \\u0432\\u0456\\u0434\\u043f\\u043e\\u0447\\u0438\\u0432\\u0430\\u0442\\u0438 \\u043b\\u0435\\u0436\\u0430\\u0447\\u0438 (\\u0441\\u043f\\u0430\\u0442\\u0438), \\u043d\\u0435 \\u0437\\u043d\\u0456\\u043c\\u0430\\u044e\\u0447\\u0438 \\u0441\\u043f\\u043e\\u0440\\u044f\\u0434\\u0436\\u0435\\u043d\\u043d\\u044f \\u0442\\u0430 \\u043d\\u0435 \\u0440\\u043e\\u0437\\u0434\\u044f\\u0433\\u0430\\u044e\\u0447\\u0438\\u0441\\u044c"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0412 \\u0432\\u0430\\u0440\\u0442\\u043e\\u0432\\u043e\\u043c\\u0443 \\u043f\\u0440\\u0438\\u043c\\u0456\\u0449\\u0435\\u043d\\u043d\\u0456 \\u0443 \\u043a\\u0456\\u043c\\u043d\\u0430\\u0442\\u0456 \\u0432\\u0456\\u0434\\u043f\\u043e\\u0447\\u0438\\u043d\\u043a\\u0443 \\u043c\\u0430\\u0454 \\u0431\\u0443\\u0442\\u0438"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "50 \\u043f\\u0430\\u0442\\u0440."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "100 \\u043f\\u0430\\u0442\\u0440."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "150 \\u043f\\u0430\\u0442\\u0440."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "9 \\u043a\\u0433"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "9,5 \\u043a\\u0433"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "10 \\u043a\\u0433"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "9 \\u043a\\u0433"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "9,5 \\u043a\\u0433"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "10,5 \\u043a\\u0433"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "30 \\u043f\\u0430\\u0442\\u0440."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "45 \\u043f\\u0430\\u0442\\u0440."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "50 \\u043f\\u0430\\u0442\\u0440."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "3,5\\u0445"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "4\\u0445"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "4,5\\u0445"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "6 \\u0433\\u0440\\u0430\\u0434."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "7 \\u0433\\u0440\\u0430\\u0434."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "5 \\u0433\\u0440\\u0430\\u0434."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "150 \\u043f/\\u0445\\u0432."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "200 \\u043f/\\u0445\\u0432."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "250 \\u043f/\\u0445\\u0432."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u041a\\u04214.16.1.1"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u041a\\u04212.01.1.1"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u041a\\u04212.12.1.1"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "1,5 \\u043a\\u0433"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "1,3 \\u043a\\u0433"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "2 \\u043a\\u0433"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "15-20 \\u0441"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "10-15 \\u0441"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "14-19 \\u0441"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "150 \\u0433\\u0440."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "170 \\u0433\\u0440."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "225 \\u0433\\u0440."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0412\\u0424\\u0413-25"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0412\\u041e\\u0413-25\\u041f"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0412\\u041e\\u0413-25"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "3 \\u043a\\u0433"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "2,9 \\u043a\\u0433"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "2,7 \\u043a\\u0433"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "8-10 \\u0441"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "10-12 \\u0441"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "6-8 \\u0441"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "250 \\u043c\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "200 \\u043c\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "220 \\u043c\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0443 \\u0441\\u0442\\u0430\\u0432\\u043d\\u0438\\u0446\\u044f\\u0445"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0432 \\u043c\\u0435\\u0442\\u0430\\u043b\\u0435\\u0432\\u0438\\u0445 \\u0437\\u0430\\u043c\\u043a\\u043d\\u0435\\u043d\\u0438\\u0445 \\u0448\\u0430\\u0444\\u0430\\u0445 \\u0430\\u0431\\u043e \\u044f\\u0449\\u0438\\u043a\\u0430\\u0445"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043d\\u0430 \\u0441\\u043a\\u043b\\u0430\\u0434\\u0430\\u0445"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "10-12 \\u043e\\u0441\\u0456\\u0431"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "12-14 \\u043e\\u0441\\u0456\\u0431"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "8-10 \\u043e\\u0441\\u0456\\u0431"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0412\\u0438\\u043c\\u0438\\u043a\\u0430\\u0454\\u0442\\u044c\\u0441\\u044f \\u043d\\u0430 \\u043d\\u0456\\u0447 \\u0434\\u043b\\u044f \\u0441\\u0432\\u0456\\u0442\\u043b\\u043e\\u043c\\u0430\\u0441\\u043a\\u0443\\u0432\\u0430\\u043d\\u043d\\u044f"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043d\\u0430 \\u043d\\u0456\\u0447 \\u043d\\u0435 \\u0432\\u0438\\u043c\\u0438\\u043a\\u0430\\u0454\\u0442\\u044c\\u0441\\u044f \\u0456 \\u043f\\u0456\\u0434\\u0442\\u0440\\u0438\\u043c\\u0443\\u0454\\u0442\\u044c\\u0441\\u044f \\u0443 \\u0447\\u0435\\u0440\\u0433\\u043e\\u0432\\u043e\\u043c\\u0443 \\u0440\\u0435\\u0436\\u0438\\u043c\\u0456"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043d\\u0430 \\u043d\\u0456\\u0447 \\u0432\\u043c\\u0438\\u043a\\u0430\\u0454\\u0442\\u044c\\u0441\\u044f \\u0441\\u0438\\u043d\\u0435 \\u0447\\u0435\\u0440\\u0433\\u043e\\u0432\\u0435 \\u043e\\u0441\\u0432\\u0456\\u0442\\u043b\\u0435\\u043d\\u043d\\u044f"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043f\\u043e\\u0440\\u0443\\u0447 \\u0456 \\u0437\\u043b\\u0456\\u0432\\u0430"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0456\\u0434\\u0435 \\u043d\\u0430 \\u0447\\u043e\\u043b\\u0456 \\u043a\\u043e\\u043b\\u043e\\u043d\\u0438"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043f\\u043e\\u0440\\u0443\\u0447 \\u0456 \\u043f\\u0440\\u0430\\u0432\\u043e\\u0440\\u0443\\u0447"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043d\\u0435 \\u0431\\u0456\\u043b\\u044c\\u0448\\u0435 4 \\u0433\\u043e\\u0434\\u0438\\u043d \\u0437 \\u0434\\u043e\\u0437\\u0432\\u043e\\u043b\\u0443 \\u043d\\u0430\\u0447\\u0430\\u043b\\u044c\\u043d\\u0438\\u043a\\u0430 \\u0432\\u0430\\u0440\\u0442\\u0438"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043d\\u0435 \\u0431\\u0456\\u043b\\u044c\\u0448\\u0435 4 \\u0433\\u043e\\u0434\\u0438\\u043d \\u0443 \\u043d\\u0456\\u0447\\u043d\\u0438\\u0439 \\u0447\\u0430\\u0441"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043d\\u0435 \\u0431\\u0456\\u043b\\u044c\\u0448\\u0435 2 \\u0433\\u043e\\u0434\\u0438\\u043d \\u0443 \\u0434\\u0435\\u043d\\u043d\\u0438\\u0439 \\u0447\\u0430\\u0441 \\u0442\\u0430 2 \\u0433\\u043e\\u0434\\u0438\\u043d \\u0443 \\u043d\\u0456\\u0447\\u043d\\u0438\\u0439 \\u0447\\u0430\\u0441"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043f\\u043e\\u0441\\u0442\\u0456\\u0439\\u043d\\u043e \\u0432\\u0438\\u043a\\u043b\\u044e\\u0447\\u0435\\u043d\\u0435 \\u043e\\u0441\\u0432\\u0456\\u0442\\u043b\\u0435\\u043d\\u043d\\u044f"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043f\\u043e\\u0441\\u0442\\u0456\\u0439\\u043d\\u0435 \\u0442\\u0435\\u043c\\u043d\\u043e - \\u0441\\u0438\\u043d\\u0454  \\u043e\\u0441\\u0432\\u0456\\u0442\\u043b\\u0435\\u043d\\u043d\\u044f"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043f\\u043e\\u0441\\u0442\\u0456\\u0439\\u043d\\u0435 \\u043e\\u0441\\u0432\\u0456\\u0442\\u043b\\u0435\\u043d\\u043d\\u044f."}}]	13	1
809	2019-04-04 01:03:13.654283+03	32	Білет 6	2	[{"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u042f\\u043a\\u0438\\u0439 \\u043a\\u043e\\u043b\\u0456\\u0440 \\u043c\\u0430\\u0454 \\u0442\\u0440\\u0430\\u0441\\u0443\\u044e\\u0447\\u0430 \\u043a\\u0443\\u043b\\u044f"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0414\\u0430\\u043b\\u044c\\u043d\\u0456\\u0441\\u0442\\u044c \\u0434\\u043e \\u043c\\u0456\\u0448\\u0435\\u043d\\u0456 \\u043f\\u0440\\u0438 \\u043f\\u0435\\u0440\\u0435\\u0432\\u0456\\u0440\\u0446\\u0456 \\u0431\\u043e\\u044e \\u041f\\u041a"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041a\\u0456\\u043b\\u044c\\u043a\\u0456\\u0441\\u0442\\u044c \\u043f\\u0430\\u0442\\u0440\\u043e\\u043d\\u0456\\u0432 \\u0434\\u043b\\u044f \\u043f\\u0435\\u0440\\u0435\\u0432\\u0456\\u0440\\u043a\\u0438 \\u0431\\u043e\\u044e \\u043e\\u0434\\u0438\\u043d\\u043e\\u0447\\u043d\\u0438\\u043c\\u0438 \\u043f\\u043e\\u0441\\u0442\\u0440\\u0456\\u043b\\u0430\\u043c\\u0438 \\u0437 \\u041f\\u041a"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041c\\u0430\\u0441\\u0430 \\u043e\\u043f\\u0442\\u0438\\u0447\\u043d\\u043e\\u0433\\u043e \\u043f\\u0440\\u0438\\u0446\\u0456\\u043b\\u0443 \\u0421\\u0412\\u0414"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0414\\u0430\\u043b\\u044c\\u043d\\u0456\\u0441\\u0442\\u044c \\u0434\\u043e \\u043c\\u0456\\u0448\\u0435\\u043d\\u0456 \\u043f\\u0440\\u0438 \\u043f\\u0435\\u0440\\u0435\\u0432\\u0456\\u0440\\u0446\\u0456 \\u0431\\u043e\\u044e \\u0437 \\u0421\\u0412\\u0414"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0417 \\u044f\\u043a\\u0438\\u043c \\u043f\\u0440\\u0438\\u0446\\u0456\\u043b\\u043e\\u043c \\u043f\\u0440\\u043e\\u0432\\u043e\\u0434\\u0438\\u0442\\u044c\\u0441\\u044f \\u043f\\u0435\\u0440\\u0435\\u0432\\u0456\\u0440\\u043a\\u0430 \\u0431\\u043e\\u044e \\u0421\\u0412\\u0414"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041a\\u0430\\u043b\\u0456\\u0431\\u0440 \\u0433\\u0432\\u0438\\u043d\\u0442\\u0456\\u0432\\u043a\\u0438 \\u0421\\u0412\\u0414"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0427\\u0430\\u0441 \\u043d\\u0430 \\u0432\\u0438\\u043a\\u043e\\u043d\\u0430\\u043d\\u043d\\u044f 1\\u0412\\u041d\\u0421 \\u0437 \\u041f\\u041c"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041a\\u0430\\u043b\\u0456\\u0431\\u0440 \\u0420\\u041f\\u0413-22"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0427\\u0430\\u0441 \\u0430\\u043a\\u0442\\u0438\\u0432\\u043d\\u043e\\u0433\\u043e \\u0433\\u0430\\u0437\\u043e\\u0432\\u0438\\u0434\\u0456\\u043b\\u0435\\u043d\\u043d\\u044f \\u0433\\u0440\\u0430\\u043d\\u0430\\u0442\\u0438 \\u201c\\u0413\\u0432\\u043e\\u0437\\u0434\\u044c\\u201d"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u042f\\u043a\\u0430 \\u0433\\u0440\\u0430\\u043d\\u0430\\u0442\\u0430 \\u043d\\u0430\\u043f\\u043e\\u0432\\u043d\\u0435\\u043d\\u0430 \\u043f\\u043e\\u0434\\u0440\\u0430\\u0437\\u043d\\u044e\\u044e\\u0447\\u0438\\u043c \\u0433\\u0430\\u0437\\u043e\\u043c"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041f\\u0440\\u0438 \\u044f\\u043a\\u0438\\u0439 \\u043d\\u0430\\u0432\\u043e\\u0434\\u0446\\u0456 \\u0441\\u0442\\u0440\\u0456\\u043b\\u044c\\u0431\\u0430 \\u0437 \\u0413\\u041f-25 \\u043f\\u0440\\u043e\\u0432\\u043e\\u0434\\u0438\\u0442\\u044c\\u0441\\u044f \\u0437 \\u0443\\u043f\\u043e\\u0440\\u043e\\u043c \\u043f\\u0440\\u0438\\u043a\\u043b\\u0430\\u0434\\u0430 \\u0430\\u0432\\u0442\\u043e\\u043c\\u0430\\u0442\\u0430 \\u0432 \\u0433\\u0440\\u0443\\u043d\\u0442"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0411\\u0440\\u043e\\u043d\\u0435\\u0431\\u0456\\u0439\\u043d\\u0456\\u0441\\u0442\\u044c \\u0420\\u041f\\u0413-26"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u042f\\u043a\\u043e\\u0457 \\u0434\\u0456\\u0457 \\u0433\\u0440\\u0430\\u043d\\u0430\\u0442\\u0430 \\u0432 \\u0420\\u041f\\u0413-22"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0414\\u0438\\u0441\\u0442\\u0430\\u043d\\u0446\\u0456\\u044f \\u0434\\u0430\\u043b\\u044c\\u043d\\u044c\\u043e\\u0433\\u043e \\u0432\\u0437\\u0432\\u0435\\u0434\\u0435\\u043d\\u043d\\u044f \\u043f\\u0456\\u0434\\u0440\\u0438\\u0432\\u0430\\u0447\\u0430 \\u0433\\u0440\\u0430\\u043d\\u0430\\u0442\\u0438 \\u041f\\u0413-26"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041e\\u0441\\u043e\\u0431\\u0438\\u0441\\u0442\\u0430 \\u0437\\u0431\\u0440\\u043e\\u044f \\u043e\\u0444\\u0456\\u0446\\u0435\\u0440\\u0456\\u0432 \\u0442\\u0430 \\u043f\\u0440\\u0430\\u043f\\u043e\\u0440\\u0449\\u0438\\u043a\\u0456\\u0432 \\u0431\\u0430\\u0442\\u0430\\u043b\\u044c\\u0439\\u043e\\u043d\\u0443 \\u0456 \\u043f\\u0430\\u0442\\u0440\\u043e\\u043d\\u0438 \\u0434\\u043e \\u043d\\u0435\\u0457 \\u0437\\u0431\\u0435\\u0440\\u0456\\u0433\\u0430\\u044e\\u0442\\u044c\\u0441\\u044f"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0417\\u043e\\u0432\\u043d\\u0456\\u0448\\u043d\\u0456 \\u0442\\u0443\\u0430\\u043b\\u0435\\u0442\\u0438 \\u0432\\u043b\\u0430\\u0448\\u0442\\u043e\\u0432\\u0443\\u044e\\u0442\\u044c\\u0441\\u044f \\u0437 \\u0432\\u043e\\u0434\\u043e\\u043d\\u0435\\u043f\\u0440\\u043e\\u043d\\u0438\\u043a\\u043d\\u0438\\u043c\\u0438 \\u0432\\u0438\\u0433\\u0440\\u0456\\u0431\\u043d\\u0438\\u043c\\u0438 \\u044f\\u043c\\u0430\\u043c\\u0438 \\u0432\\u0456\\u0434 \\u0436\\u0438\\u0442\\u043b\\u043e\\u0432\\u0438\\u0445 \\u043f\\u0440\\u0438\\u043c\\u0456\\u0449\\u0435\\u043d\\u044c, \\u0457\\u0434\\u0430\\u043b\\u0435\\u043d\\u044c \\u0456 \\u043f\\u0435\\u043a\\u0430\\u0440\\u0435\\u043d\\u044c"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0417 \\u043c\\u0435\\u00ad\\u0442\\u043e\\u044e \\u043e\\u0446\\u0456\\u043d\\u043a\\u0438 \\u0444\\u0456\\u0437\\u0438\\u0447\\u043d\\u043e\\u0433\\u043e \\u0440\\u043e\\u0437\\u0432\\u0438\\u0442\\u043a\\u0443, \\u0441\\u0442\\u0430\\u043d\\u0443 \\u0437\\u0434\\u043e\\u0440\\u043e\\u0432\\u2019\\u044f \\u043f\\u043e\\u0433\\u043b\\u0438\\u0431\\u043b\\u0435\\u043d\\u0456 \\u043c\\u0435\\u0434\\u0438\\u0447\\u043d\\u0456 \\u043e\\u0431\\u0441\\u0442\\u0435\\u0436\\u0435\\u043d\\u043d\\u044f \\u0432\\u0456\\u0439\\u0441\\u044c\\u043a\\u043e\\u0432\\u043e\\u0441\\u043b\\u0443\\u0436\\u0431\\u043e\\u0432\\u0446\\u0456\\u0432 \\u0441\\u0442\\u0440\\u043e\\u043a\\u043e\\u0432\\u043e\\u0457 \\u0441\\u043b\\u0443\\u0436\\u0431\\u0438 \\u0437\\u0434\\u0456\\u0439\\u0441\\u043d\\u044e\\u044e\\u0442\\u044c\\u0441\\u044f  \\u0456 \\u043f\\u0440\\u043e\\u0432\\u043e\\u00ad\\u0434\\u044f\\u0442\\u044c\\u0441\\u044f"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041f\\u0440\\u0438\\u0431\\u0443\\u0432\\u0448\\u0438 \\u0434\\u043e \\u043f\\u0456\\u0434\\u0440\\u043e\\u0437\\u0434\\u0456\\u043b\\u0443 \\u043f\\u0456\\u0441\\u043b\\u044f \\u0437\\u043c\\u0456\\u043d\\u0438, \\u043d\\u0430\\u0447\\u0430\\u043b\\u044c\\u043d\\u0438\\u043a \\u0432\\u0430\\u0440\\u0442\\u0438 \\u0432\\u0438\\u0448\\u0438\\u043a\\u043e\\u0432\\u0443\\u0454 \\u043e\\u0441\\u043e\\u0431\\u043e\\u0432\\u0438\\u0439 \\u0441\\u043a\\u043b\\u0430\\u0434 \\u0456 \\u0434\\u043e\\u043f\\u043e\\u0432\\u0456\\u0434\\u0430\\u0454 \\u043f\\u0440\\u043e \\u0432\\u0438\\u043a\\u043e\\u043d\\u0430\\u043d\\u043d\\u044f \\u0437\\u0430\\u0432\\u0434\\u0430\\u043d\\u043d\\u044f"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0414\\u043e\\u0437\\u0432\\u043e\\u043b\\u044f\\u0454\\u0442\\u044c\\u0441\\u044f \\u0440\\u043e\\u0437\\u0432\\u0456\\u0434\\u043d\\u0438\\u043c, \\u0432\\u0438\\u0432\\u0456\\u0434\\u043d\\u0438\\u043c \\u0456 \\u0432\\u043e\\u0434\\u0456\\u044f\\u043c \\u0442\\u0440\\u0430\\u043d\\u0441\\u043f\\u043e\\u0440\\u0442\\u043d\\u0438\\u0445 \\u0437\\u0430\\u0441\\u043e\\u0431\\u0456\\u0432 \\u0432\\u0456\\u0434\\u043f\\u043e\\u0447\\u0438\\u0432\\u0430\\u0442\\u0438 \\u043b\\u0435\\u0436\\u0430\\u0447\\u0438 (\\u0441\\u043f\\u0430\\u0442\\u0438), \\u043d\\u0435 \\u0437\\u043d\\u0456\\u043c\\u0430\\u044e\\u0447\\u0438 \\u0441\\u043f\\u043e\\u0440\\u044f\\u0434\\u0436\\u0435\\u043d\\u043d\\u044f \\u0442\\u0430 \\u043d\\u0435 \\u0440\\u043e\\u0437\\u0434\\u044f\\u0433\\u0430\\u044e\\u0447\\u0438\\u0441\\u044c"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041e\\u0441\\u043e\\u0431\\u0438, \\u044f\\u043a\\u0456 \\u043f\\u0435\\u0440\\u0435\\u0432\\u0456\\u0440\\u044f\\u044e\\u0442\\u044c \\u043d\\u0435\\u0441\\u0435\\u043d\\u043d\\u044f \\u0441\\u043b\\u0443\\u0436\\u0431\\u0438 \\u0447\\u0430\\u0442\\u043e\\u0432\\u0438\\u043c\\u0438, \\u0441\\u0443\\u043f\\u0440\\u043e\\u0432\\u043e\\u0434\\u0436\\u0443\\u044e\\u0442\\u044c\\u0441\\u044f \\u0434\\u043e \\u043f\\u043e\\u0441\\u0442\\u0456\\u0432"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0436\\u043e\\u0432\\u0442\\u0438\\u0439"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0437\\u0435\\u043b\\u0435\\u043d\\u0438\\u0439"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0441\\u0440\\u0456\\u0431\\u043b\\u044f\\u0441\\u0442\\u0438\\u0439"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "100 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "150 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "50 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "3 \\u043f\\u0430\\u0442\\u0440."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "4 \\u043f\\u0430\\u0442\\u0440."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "10 \\u043f\\u0430\\u0442\\u0440."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "550 \\u0433\\u0440."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "580 \\u0433\\u0440."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "600 \\u0433\\u0440."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "150 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "100 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "200 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "3"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043f\\u043e\\u0441\\u0442\\u0456\\u0439\\u043d\\u0438\\u0439 (\\u041f)"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "1"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "5,45 \\u043c\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "9 \\u043c\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "7,62 \\u043c\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043d\\u0435\\u043e\\u0431\\u043c\\u0435\\u0436\\u0435\\u043d\\u0438\\u0439"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "3 \\u0445\\u0432."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "5 \\u0445\\u0432."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "40 \\u043c\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "73 \\u043c\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "64 \\u043c\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0434\\u043e 15 \\u0441"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0434\\u043e 10 \\u0441"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0434\\u043e 12 \\u0441"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0412\\u041e\\u0413-25\\u041c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u201c\\u0413\\u0432\\u043e\\u0437\\u0434\\u044c\\u201d"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u201c\\u041f\\u043e\\u0434\\u043a\\u0438\\u0434\\u044b\\u0448\\u201d"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043f\\u0440\\u044f\\u043c\\u0456\\u0439"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043d\\u0435 \\u043f\\u0440\\u044f\\u043c\\u0456\\u0439"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043f\\u043e\\u043b\\u0443\\u043f\\u0440\\u044f\\u043c\\u0456\\u0439"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "220 \\u043c\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "250 \\u043c\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "200 \\u043c\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043e\\u0441\\u043a\\u043e\\u043b\\u043a\\u043e\\u0432\\u043e\\u0457"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0444\\u0443\\u0433\\u0430\\u0441\\u043d\\u043e\\u0457"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043a\\u0443\\u043c\\u0443\\u043b\\u044f\\u0442\\u0438\\u0432\\u043d\\u043e\\u0457"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "5-15 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "3,5-10,5 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "2,5-15 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0443 \\u0447\\u0435\\u0440\\u0433\\u043e\\u0432\\u043e\\u0433\\u043e \\u0447\\u0430\\u0441\\u0442\\u0438\\u043d\\u0438 \\u0432 \\u043c\\u0435\\u0442\\u0430\\u043b\\u0435\\u0432\\u0456\\u0439 \\u0437\\u0430\\u043c\\u043a\\u043d\\u0435\\u043d\\u0456\\u0439 \\u0448\\u0430\\u0444\\u0456 \\u0440\\u0430\\u0437\\u043e\\u043c \\u0437 \\u043f\\u0456\\u0441\\u0442\\u043e\\u043b\\u0435\\u0442\\u0430\\u043c\\u0438 \\u043e\\u0444\\u0456\\u0446\\u0435\\u0440\\u0456\\u0432 \\u0456 \\u043f\\u0440\\u0430\\u043f\\u043e\\u0440\\u0449\\u0438\\u043a\\u0456\\u0432 \\u0448\\u0442\\u0430\\u0431\\u0443, \\u0430\\u043b\\u0435 \\u0432 \\u043e\\u043a\\u0440\\u0435\\u043c\\u043e\\u043c\\u0443 \\u043c\\u0435\\u0442\\u0430\\u043b\\u0435\\u0432\\u043e\\u043c\\u0443 \\u0437\\u0430\\u043c\\u043a\\u043d\\u0435\\u043d\\u043e\\u043c\\u0443 \\u044f\\u0449\\u0438\\u043a\\u0443"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0443 \\u0447\\u0435\\u0440\\u0433\\u043e\\u0432\\u043e\\u0433\\u043e \\u043f\\u043e \\u0440\\u043e\\u0442\\u0456 \\u0432 \\u043e\\u043a\\u0440\\u0435\\u043c\\u043e\\u043c\\u0443 \\u043c\\u0435\\u0442\\u0430\\u043b\\u0435\\u0432\\u043e\\u043c\\u0443 \\u0437\\u0430\\u043c\\u043a\\u043d\\u0435\\u043d\\u043e\\u043c\\u0443 \\u044f\\u0449\\u0438\\u043a\\u0443"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0443 \\u0447\\u0435\\u0440\\u0433\\u043e\\u0432\\u043e\\u0433\\u043e \\u0447\\u0430\\u0441\\u0442\\u0438\\u043d\\u0438 \\u0432 \\u043c\\u0435\\u0442\\u0430\\u043b\\u0435\\u0432\\u0456\\u0439 \\u0437\\u0430\\u043c\\u043a\\u043d\\u0435\\u043d\\u0456\\u0439 \\u0448\\u0430\\u0444\\u0456, \\u0430\\u043b\\u0435 \\u043e\\u043a\\u0440\\u0435\\u043c\\u043e \\u0432\\u0456\\u0434 \\u043f\\u0456\\u0441\\u0442\\u043e\\u043b\\u0435\\u0442\\u0456\\u0432 \\u043e\\u0444\\u0456\\u0446\\u0435\\u0440\\u0456\\u0432 \\u0456 \\u043f\\u0440\\u0430\\u043f\\u043e\\u0440\\u0449\\u0438\\u043a\\u0456\\u0432 \\u0448\\u0442\\u0430\\u0431\\u0443"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043d\\u0430 \\u0432\\u0456\\u0434\\u0441\\u0442\\u0430\\u043d\\u0456 100 \\u043c\\u0435\\u0442\\u0440\\u0456\\u0432"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043d\\u0430 \\u0432\\u0456\\u0434\\u0441\\u0442\\u0430\\u043d\\u0456 150 \\u043c\\u0435\\u0442\\u0440\\u0456\\u0432"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043d\\u0435 \\u0431\\u043b\\u0438\\u0436\\u0447\\u0435 100 \\u043c\\u0435\\u0442\\u0440\\u0456\\u0432"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0440\\u0430\\u0437 \\u043d\\u0430 \\u0440\\u0456\\u043a"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0434\\u0432\\u0456\\u0447\\u0456 \\u043d\\u0430 \\u0440\\u0456\\u043a \\u043f\\u0435\\u0440\\u0435\\u0434 \\u043f\\u043e\\u0447\\u0430\\u0442\\u043a\\u043e\\u043c  \\u0432\\u0435\\u0441\\u043d\\u044f\\u043d\\u043e\\u0433\\u043e \\u0442\\u0430 \\u043e\\u0441\\u0456\\u043d\\u043d\\u044c\\u043e\\u0433\\u043e \\u043f\\u0435\\u0440\\u0456\\u043e\\u0434\\u0456\\u0432 \\u043d\\u0430\\u0432\\u0447\\u0430\\u043d\\u043d\\u044f"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0434\\u0432\\u0456\\u0447\\u0456 \\u043d\\u0430 \\u0440\\u0456\\u043a \\u043f\\u0435\\u0440\\u0435\\u0434 \\u043f\\u043e\\u0447\\u0430\\u0442\\u043a\\u043e\\u043c \\u0437\\u0438\\u043c\\u043e\\u0432\\u043e\\u0433\\u043e \\u0456 \\u043b\\u0456\\u0442\\u043d\\u044c\\u043e\\u0433\\u043e \\u043f\\u0435\\u0440\\u0456\\u043e\\u0434\\u0456\\u0432 \\u043d\\u0430\\u0432\\u0447\\u0430\\u043d\\u043d\\u044f"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0441\\u0442\\u0430\\u0440\\u0448\\u0438\\u043d\\u0456 \\u0440\\u043e\\u0442\\u0438"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043a\\u043e\\u043c\\u0430\\u043d\\u0434\\u0438\\u0440\\u043e\\u0432\\u0456 \\u043f\\u0456\\u0434\\u0440\\u043e\\u0437\\u0434\\u0456\\u043b\\u0443"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043a\\u043e\\u043c\\u0430\\u043d\\u0434\\u0438\\u0440\\u043e\\u0432\\u0456 \\u0432\\u0437\\u0432\\u043e\\u0434\\u0443"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0443 \\u0432\\u0456\\u043b\\u044c\\u043d\\u0438\\u0439 \\u0447\\u0430\\u0441"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0443 \\u0432\\u0456\\u043b\\u044c\\u043d\\u0438\\u0439 \\u0447\\u0430\\u0441 \\u0437 \\u0434\\u043e\\u0437\\u0432\\u043e\\u043b\\u0443 \\u043f\\u043e\\u043c\\u0456\\u0447\\u043d\\u0438\\u043a\\u0430 \\u0432\\u0430\\u0440\\u0442\\u0438"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0443 \\u0432\\u0456\\u043b\\u044c\\u043d\\u0438\\u0439 \\u0447\\u0430\\u0441 \\u0437 \\u0434\\u043e\\u0437\\u0432\\u043e\\u043b\\u0443 \\u043d\\u0430\\u0447\\u0430\\u043b\\u044c\\u043d\\u0438\\u043a\\u0430 \\u0432\\u0430\\u0440\\u0442\\u0438"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043d\\u0430\\u0447\\u0430\\u043b\\u044c\\u043d\\u0438\\u043a\\u043e\\u043c \\u0432\\u0430\\u0440\\u0442\\u0438, \\u0439\\u043e\\u0433\\u043e \\u043f\\u043e\\u043c\\u0456\\u0447\\u043d\\u0438\\u043a\\u043e\\u043c \\u0430\\u0431\\u043e \\u0441\\u0432\\u043e\\u0457\\u043c \\u0440\\u043e\\u0437\\u0432\\u0456\\u0434\\u043d\\u0438\\u043c \\u0437 \\u043e\\u0434\\u043d\\u0438\\u043c-\\u0434\\u0432\\u043e\\u043c\\u0430 \\u043e\\u0437\\u0431\\u0440\\u043e\\u0454\\u043d\\u0438\\u043c\\u0438 \\u0432\\u0430\\u0440\\u0442\\u043e\\u0432\\u0438\\u043c\\u0438"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043d\\u0430\\u0447\\u0430\\u043b\\u044c\\u043d\\u0438\\u043a\\u043e\\u043c \\u0432\\u0430\\u0440\\u0442\\u0438 \\u0430\\u0431\\u043e \\u0439\\u043e\\u0433\\u043e \\u043f\\u043e\\u043c\\u0456\\u0447\\u043d\\u0438\\u043a\\u043e\\u043c \\u0437 \\u043e\\u0434\\u043d\\u0438\\u043c-\\u0434\\u0432\\u043e\\u043c\\u0430 \\u043e\\u0437\\u0431\\u0440\\u043e\\u0454\\u043d\\u0438\\u043c\\u0438 \\u0432\\u0430\\u0440\\u0442\\u043e\\u0432\\u0438\\u043c\\u0438"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043d\\u0430\\u0447\\u0430\\u043b\\u044c\\u043d\\u0438\\u043a\\u043e\\u043c \\u0432\\u0430\\u0440\\u0442\\u0438 \\u0437 \\u043e\\u0434\\u043d\\u0438\\u043c-\\u0434\\u0432\\u043e\\u043c\\u0430 \\u043e\\u0437\\u0431\\u0440\\u043e\\u0454\\u043d\\u0438\\u043c\\u0438 \\u0432\\u0430\\u0440\\u0442\\u043e\\u0432\\u0438\\u043c\\u0438"}}]	13	1
810	2019-04-04 01:11:26.549123+03	33	Білет 7	2	[{"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0417 \\u044f\\u043a\\u0438\\u043c \\u043f\\u0440\\u0438\\u0446\\u0456\\u043b\\u043e\\u043c \\u043f\\u0440\\u043e\\u0432\\u043e\\u0434\\u0438\\u0442\\u044c\\u0441\\u044f \\u043f\\u0435\\u0440\\u0435\\u0432\\u0456\\u0440\\u043a\\u0430 \\u0431\\u043e\\u044e \\u041f\\u041a"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041d\\u0430 \\u0441\\u043a\\u0456\\u043b\\u044c\\u043a\\u0438 \\u0437\\u043c\\u0456\\u043d\\u044e\\u0454\\u0442\\u044c\\u0441\\u044f \\u043f\\u043e\\u043b\\u043e\\u0436\\u0435\\u043d\\u043d\\u044f \\u0421\\u0422\\u0412 \\u043f\\u043e \\u0432\\u0438\\u0441\\u043e\\u0442\\u0456 \\u043f\\u0440\\u0438 \\u043f\\u043e\\u0432\\u043d\\u043e\\u043c\\u0443 \\u043e\\u0431\\u0435\\u0440\\u0442\\u0456 \\u043c\\u0443\\u0448\\u043a\\u0438 \\u043f\\u0440\\u0438 \\u0441\\u0442\\u0440\\u0456\\u043b\\u044c\\u0431\\u0456 \\u0437 \\u041f\\u041a"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041d\\u043e\\u0441\\u0438\\u043c\\u0438\\u0439 \\u0431\\u043e\\u0454\\u043a\\u043e\\u043c\\u043f\\u043b\\u0435\\u043a\\u0442 \\u0434\\u043b\\u044f \\u041f\\u041a\\u041c"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041a\\u0443\\u0447\\u043d\\u0456\\u0441\\u0442\\u044c \\u0431\\u043e\\u044e \\u0437 \\u0421\\u0412\\u0414 \\u0432\\u0438\\u0437\\u043d\\u0430\\u0454\\u0442\\u044c\\u0441\\u044f \\u043d\\u043e\\u0440\\u043c\\u0430\\u043b\\u044c\\u043d\\u043e\\u044e, \\u044f\\u043a\\u0449\\u043e \\u0432\\u0441\\u0456 4 \\u043f\\u0440\\u043e\\u0431\\u043e\\u0457\\u043d\\u0438 \\u0432\\u043c\\u0456\\u0449\\u0443\\u044e\\u0442\\u044c\\u0441\\u044f \\u0432 \\u043a\\u043e\\u043b\\u043e \\u0434\\u0456\\u0430\\u043c\\u0435\\u0442\\u0440\\u043e\\u043c"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041a\\u0456\\u043b\\u044c\\u043a\\u0456\\u0441\\u0442\\u044c \\u043f\\u0430\\u0442\\u0440\\u043e\\u043d\\u0456\\u0432 \\u0434\\u043b\\u044f \\u043f\\u0435\\u0440\\u0435\\u0432\\u0456\\u0440\\u043a\\u0438 \\u0431\\u043e\\u044e \\u0421\\u0412\\u0414"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041f\\u0440\\u0438 \\u043f\\u0435\\u0440\\u0435\\u043c\\u0456\\u0449\\u0435\\u043d\\u043d\\u0456 \\u0437\\u0430\\u043f\\u043e\\u0431\\u0456\\u0436\\u043d\\u0438\\u043a\\u0430 \\u043c\\u0443\\u0448\\u043a\\u0438 \\u0432 \\u0421\\u0412\\u0414 \\u0432 \\u0431\\u0456\\u043a \\u043d\\u0430 1 \\u043c\\u043c \\u0456 \\u043f\\u0440\\u0438 \\u0432\\u043a\\u0440\\u0443\\u0447\\u0443\\u0432\\u0430\\u043d\\u043d\\u0456 (\\u0432\\u0438\\u043a\\u0440\\u0443\\u0447\\u0443\\u0432\\u0430\\u043d\\u043d\\u0456) \\u043c\\u0443\\u0448\\u043a\\u0438 \\u043d\\u0430 \\u043e\\u0434\\u0438\\u043d \\u043f\\u043e\\u0432\\u043d\\u0438\\u0439 \\u043e\\u0431\\u0435\\u0440\\u0442 \\u0421\\u0422\\u0412 \\u0437\\u043c\\u0456\\u0449\\u0443\\u0454\\u0442\\u044c\\u0441\\u044f \\u043d\\u0430"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041f\\u043e\\u0447\\u0430\\u0442\\u043a\\u043e\\u0432\\u0430 \\u0448\\u0432\\u0438\\u0434\\u043a\\u0456\\u0441\\u0442\\u044c \\u043a\\u0443\\u043b\\u0456 \\u0437 \\u0421\\u0412\\u0414"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0427\\u0430\\u0441 \\u043d\\u0430 \\u0432\\u0438\\u043a\\u043e\\u043d\\u0430\\u043d\\u043d\\u044f \\u0432\\u043f\\u0440\\u0430\\u0432\\u0438 \\u041a\\u04212.12.1.1"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041f\\u0440\\u0438\\u0446\\u0456\\u043b\\u044c\\u043d\\u0430 \\u0434\\u0430\\u043b\\u044c\\u043d\\u0456\\u0441\\u0442\\u044c \\u0420\\u041f\\u0413-26"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041a\\u0440\\u0430\\u0442\\u043d\\u0456\\u0441\\u0442\\u044c (\\u0437\\u0431\\u0456\\u043b\\u044c\\u0448\\u0435\\u043d\\u043d\\u044f) \\u043f\\u0440\\u0438\\u0446\\u0456\\u043b\\u0443 \\u041d\\u0421\\u041f\\u0423"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0414\\u0430\\u043b\\u044c\\u043d\\u0456\\u0441\\u0442\\u044c \\u0432\\u0438\\u044f\\u0432\\u043b\\u0435\\u043d\\u043d\\u044f \\u0442\\u0430\\u043d\\u043a\\u0456\\u0432 \\u0432 \\u041d\\u0421\\u041f\\u0423"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041c\\u0430\\u0441\\u0430 \\u041d\\u0421\\u041f\\u0423 \\u0432 \\u0431\\u043e\\u0439\\u043e\\u0432\\u043e\\u043c\\u0443 \\u043f\\u043e\\u043b\\u043e\\u0436\\u0435\\u043d\\u043d\\u0456"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u042f\\u043a\\u043e\\u0457 \\u0434\\u0456\\u0457 \\u0433\\u0440\\u0430\\u043d\\u0430\\u0442\\u0430 \\u0432 \\u0420\\u041f\\u0413-26"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0414\\u0438\\u0441\\u0442\\u0430\\u043d\\u0446\\u0456\\u044f \\u0434\\u0430\\u043b\\u044c\\u043d\\u044c\\u043e\\u0433\\u043e \\u0432\\u0437\\u0432\\u0435\\u0434\\u0435\\u043d\\u043d\\u044f \\u043f\\u0456\\u0434\\u0440\\u0438\\u0432\\u0430\\u0447\\u0430 \\u0433\\u0440\\u0430\\u043d\\u0430\\u0442\\u0438 \\u041f\\u0413-22"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0421\\u0430\\u043c\\u043e\\u043b\\u0456\\u043a\\u0432\\u0456\\u0434\\u0430\\u0446\\u0456\\u044f \\u043f\\u0456\\u0434\\u0440\\u0438\\u0432\\u0430\\u0447\\u0430 \\u0433\\u0440\\u0430\\u043d\\u0430\\u0442\\u0438 \\u041f\\u0413-22"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0411\\u043e\\u0454\\u043f\\u0440\\u0438\\u043f\\u0430\\u0441\\u0438 \\u043e\\u0441\\u043e\\u0431\\u043e\\u0432\\u043e\\u043c\\u0443 \\u0441\\u043a\\u043b\\u0430\\u0434\\u043e\\u0432\\u0456 \\u0432\\u0430\\u0440\\u0442\\u0438 \\u0432\\u0438\\u0434\\u0430\\u0454\\u0442\\u044c\\u0441\\u044f"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041f\\u043e\\u0447\\u0430\\u0442\\u043e\\u043a \\u0456 \\u043a\\u0456\\u043d\\u0435\\u0446\\u044c \\u043e\\u043f\\u0430\\u043b\\u044e\\u0432\\u0430\\u043b\\u044c\\u043d\\u043e\\u0433\\u043e \\u043f\\u0435\\u0440\\u0456\\u043e\\u0434\\u0443 \\u0432 \\u0432\\u0456\\u0439\\u0441\\u044c\\u043a\\u043e\\u0432\\u043e\\u0457 \\u0447\\u0430\\u0441\\u0442\\u0438\\u043d\\u0456"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0421\\u0442\\u0430\\u0446\\u0456\\u043e\\u043d\\u0430\\u0440\\u043d\\u0435 \\u043b\\u0456\\u043a\\u0443\\u0432\\u0430\\u043d\\u043d\\u044f \\u0445\\u0432\\u043e\\u0440\\u0438\\u0445 \\u0443 \\u043c\\u0435\\u0434\\u0438\\u0447\\u043d\\u043e\\u043c\\u0443 \\u043f\\u0443\\u043d\\u043a\\u0442\\u0456 \\u0432\\u0456\\u0439\\u0441\\u044c\\u043a\\u043e\\u0432\\u043e\\u0457 \\u0447\\u0430\\u0441\\u0442\\u0438\\u043d\\u0438 \\u043f\\u0440\\u043e\\u0432\\u043e\\u00ad\\u0434\\u0438\\u0442\\u044c\\u0441\\u044f"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0412\\u0430\\u0440\\u0442\\u043e\\u0432\\u0456, \\u044f\\u043a\\u0456 \\u043e\\u0445\\u043e\\u0440\\u043e\\u043d\\u044f\\u043b\\u0438 \\u043e\\u0431'\\u0454\\u043a\\u0442\\u0438 \\u0442\\u0456\\u043b\\u044c\\u043a\\u0438 \\u0432\\u043d\\u043e\\u0447\\u0456, \\u043f\\u0456\\u0441\\u043b\\u044f \\u0437\\u0430\\u043a\\u0456\\u043d\\u0447\\u0435\\u043d\\u043d\\u044f \\u0441\\u0442\\u0440\\u043e\\u043a\\u0443 \\u043e\\u0445\\u043e\\u0440\\u043e\\u043d\\u0438 \\u043e\\u0431'\\u0454\\u043a\\u0442\\u0456\\u0432 \\u0437\\u0434\\u0430\\u044e\\u0442\\u044c \\u0431\\u043e\\u0454\\u043f\\u0440\\u0438\\u043f\\u0430\\u0441\\u0438"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u0414\\u043e\\u0437\\u0432\\u043e\\u043b\\u044f\\u0454\\u0442\\u044c\\u0441\\u044f \\u0432\\u0430\\u0440\\u0442\\u043e\\u0432\\u0438\\u043c \\u0442\\u0440\\u0438\\u0437\\u043c\\u0456\\u043d\\u043d\\u0438\\u0445 \\u043f\\u043e\\u0441\\u0442\\u0456\\u0432 \\u0432\\u0456\\u0434\\u043f\\u043e\\u0447\\u0438\\u0432\\u0430\\u0442\\u0438 \\u043b\\u0435\\u0436\\u0430\\u0447\\u0438 (\\u0441\\u043f\\u0430\\u0442\\u0438), \\u043d\\u0435 \\u0437\\u043d\\u0456\\u043c\\u0430\\u044e\\u0447\\u0438 \\u0441\\u043f\\u043e\\u0440\\u044f\\u0434\\u0436\\u0435\\u043d\\u043d\\u044f \\u0442\\u0430 \\u043d\\u0435 \\u0440\\u043e\\u0437\\u0434\\u044f\\u0433\\u0430\\u044e\\u0447\\u0438\\u0441\\u044c"}}, {"added": {"name": "\\u041f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f", "object": "\\u041f\\u0456\\u0434 \\u0447\\u0430\\u0441 \\u043f\\u0435\\u0440\\u0435\\u0432\\u0456\\u0440\\u043a\\u0438 \\u043d\\u0435\\u0441\\u0435\\u043d\\u043d\\u044f \\u0441\\u043b\\u0443\\u0436\\u0431\\u0438 \\u0447\\u0430\\u0442\\u043e\\u0432\\u0438\\u043c\\u0438 \\u0439\\u043e\\u043c\\u0443 \\u043c\\u043e\\u0436\\u0443\\u0442\\u044c \\u0440\\u043e\\u0431\\u0438\\u0442\\u0438 \\u0437\\u0430\\u0443\\u0432\\u0430\\u0436\\u0435\\u043d\\u043d\\u044f"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043f\\u043e\\u0441\\u0442\\u0456\\u0439\\u043d\\u0438\\u0439 (\\u041f)"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "1"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "3"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043d\\u0430 20 \\u0441\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043d\\u0430 12 \\u0441\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043d\\u0430 15 \\u0441\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "650 \\u043f\\u0430\\u0442\\u0440."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "600 \\u043f\\u0430\\u0442\\u0440."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "700 \\u043f\\u0430\\u0442\\u0440."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "15 \\u0441\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "10 \\u0441\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "8 \\u0441\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "3 \\u043f\\u0430\\u0442\\u0440."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "4 \\u043f\\u0430\\u0442\\u0440."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "5 \\u043f\\u0430\\u0442\\u0440."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "12 \\u0441\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "16 \\u0441\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "15 \\u0441\\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "810 \\u043c/\\u0441"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "830 \\u043c/\\u0441"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "850 \\u043c/\\u0441"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043d\\u0435\\u043e\\u0431\\u043c\\u0435\\u0436\\u0435\\u043d\\u0438\\u0439"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "3 \\u0445\\u0432."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "5 \\u0445\\u0432."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "300 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "250 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "200 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "7\\u0445"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "3,5\\u0445"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "4\\u0445"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "600 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "500 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "400 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "2 \\u043a\\u0433"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "2,2 \\u043a\\u0433"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "1,5 \\u043a\\u0433"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043a\\u0443\\u043c\\u0443\\u043b\\u044f\\u0442\\u0438\\u0432\\u043d\\u043e\\u0457"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043e\\u0441\\u043a\\u043e\\u043b\\u043a\\u043e\\u0432\\u043e\\u0457"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0444\\u0443\\u0433\\u0430\\u0441\\u043d\\u043e\\u0457"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "3-10 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "2,5-15 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "5-15 \\u043c"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "4-6 \\u0441"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "3,5-6,5 \\u0441"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "4,5 - 6,5 \\u0441"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043f\\u0456\\u0434 \\u043e\\u0441\\u043e\\u0431\\u0438\\u0441\\u0442\\u0443 \\u0440\\u043e\\u0437\\u043f\\u0438\\u0441\\u043a\\u0443 \\u0432 \\u043a\\u043d\\u0438\\u0437\\u0456 \\u0432\\u0438\\u0434\\u0430\\u0447\\u0456 \\u0437\\u0431\\u0440\\u043e\\u0457 \\u0442\\u0430 \\u0431\\u043e\\u0454\\u043f\\u0440\\u0438\\u043f\\u0430\\u0441\\u0456\\u0432,"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043f\\u0456\\u0434 \\u043f\\u0456\\u0434\\u043f\\u0438\\u0441 \\u043f\\u043e\\u043c\\u0456\\u0447\\u043d\\u0438\\u043a\\u0430 \\u043d\\u0430\\u0447\\u0430\\u043b\\u044c\\u043d\\u0438\\u043a\\u0430 \\u0432\\u0430\\u0440\\u0442\\u0438 \\u0432 \\u043a\\u043d\\u0438\\u0437\\u0456 \\u0432\\u0438\\u0434\\u0430\\u0447\\u0456 \\u0437\\u0431\\u0440\\u043e\\u0457 \\u0442\\u0430 \\u0431\\u043e\\u0454\\u043f\\u0440\\u0438\\u043f\\u0430\\u0441\\u0456\\u0432"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043f\\u0456\\u0434 \\u043f\\u0456\\u0434\\u043f\\u0438\\u0441 \\u043d\\u0430\\u0447\\u0430\\u043b\\u044c\\u043d\\u0438\\u043a\\u0430 \\u0432\\u0430\\u0440\\u0442\\u0438 \\u0432 \\u043a\\u043d\\u0438\\u0437\\u0456 \\u0432\\u0438\\u0434\\u0430\\u0447\\u0456 \\u0437\\u0431\\u0440\\u043e\\u0457 \\u0442\\u0430 \\u0431\\u043e\\u0454\\u043f\\u0440\\u0438\\u043f\\u0430\\u0441\\u0456\\u0432."}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043e\\u0433\\u043e\\u043b\\u043e\\u0448\\u0443\\u0454\\u0442\\u044c\\u0441\\u044f \\u043d\\u0430\\u043a\\u0430\\u0437\\u043e\\u043c \\u043a\\u043e\\u043c\\u0430\\u043d\\u0434\\u0438\\u0440\\u0430 \\u0447\\u0430\\u0441\\u0442\\u0438\\u043d\\u0438"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043e\\u0433\\u043e\\u043b\\u043e\\u0448\\u0443\\u0454\\u0442\\u044c\\u0441\\u044f \\u043d\\u0430\\u043a\\u0430\\u0437\\u043e\\u043c \\u043d\\u0430\\u0447\\u0430\\u043b\\u044c\\u043d\\u0438\\u043a\\u0430 \\u0433\\u0430\\u0440\\u043d\\u0456\\u0437\\u043e\\u043d\\u0443"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0432\\u0456\\u0434\\u0431\\u0443\\u0432\\u0430\\u0454\\u0442\\u044c\\u0441\\u044f \\u0437 15 \\u0436\\u043e\\u0432\\u0442\\u043d\\u044f \\u043f\\u043e 15 \\u043a\\u0432\\u0456\\u0442\\u043d\\u044f"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "14-\\u0434\\u0435\\u043d\\u043d\\u0435"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "15-\\u0434\\u0435\\u043d\\u043d\\u0435"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043d\\u0435 \\u0431\\u0456\\u043b\\u044c\\u0448\\u0435 21 \\u0434\\u043d\\u044f"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043d\\u0430\\u0447\\u0430\\u043b\\u044c\\u043d\\u0438\\u043a\\u043e\\u0432\\u0456 \\u0432\\u0430\\u0440\\u0442\\u0438"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0440\\u043e\\u0437\\u0432\\u0456\\u0434\\u043d\\u043e\\u043c\\u0443"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u0437\\u0430\\u0441\\u0442\\u0443\\u043f\\u043d\\u0438\\u043a\\u0443 \\u043d\\u0430\\u0447\\u0430\\u043b\\u044c\\u043d\\u0438\\u043a\\u043e\\u0432\\u0456 \\u0432\\u0430\\u0440\\u0442\\u0438"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043f\\u0435\\u0440\\u0435\\u0434 \\u0437\\u0430\\u0441\\u0442\\u0443\\u043f\\u0430\\u043d\\u043d\\u044f\\u043c \\u043d\\u0430 \\u043f\\u043e\\u0441\\u0442\\u0438 (\\u043f\\u0456\\u0441\\u043b\\u044f \\u0442\\u043e\\u0433\\u043e, \\u044f\\u043a \\u043f\\u043e\\u0432\\u0435\\u0440\\u043d\\u0435\\u0442\\u044c\\u0441\\u044f \\u0437\\u043c\\u0456\\u043d\\u0430 \\u0437 \\u043f\\u043e\\u0441\\u0442\\u0456\\u0432 \\u0442\\u0430 \\u0431\\u0443\\u0434\\u0435 \\u043f\\u0440\\u043e\\u0432\\u0435\\u0434\\u0435\\u043d\\u043e \\u0443 \\u0432\\u0430\\u0440\\u0442\\u0456 \\u0431\\u043e\\u0439\\u043e\\u0432\\u0438\\u0439 \\u0440\\u043e\\u0437\\u043f\\u043e\\u0434\\u0456\\u043b)"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043f\\u0456\\u0441\\u043b\\u044f \\u043f\\u043e\\u0432\\u0435\\u0440\\u043d\\u0435\\u043d\\u043d\\u044f \\u0437 \\u043f\\u043e\\u0441\\u0442\\u0456\\u0432 (\\u043f\\u0456\\u0441\\u043b\\u044f \\u0442\\u043e\\u0433\\u043e, \\u044f\\u043a \\u043f\\u043e\\u0432\\u0435\\u0440\\u043d\\u0435\\u0442\\u044c\\u0441\\u044f \\u0437\\u043c\\u0456\\u043d\\u0430 \\u0437 \\u043f\\u043e\\u0441\\u0442\\u0456\\u0432 \\u0442\\u0430 \\u0431\\u0443\\u0434\\u0435 \\u043f\\u0440\\u043e\\u0432\\u0435\\u0434\\u0435\\u043d\\u043e \\u0443 \\u0432\\u0430\\u0440\\u0442\\u0456 \\u0431\\u043e\\u0439\\u043e\\u0432\\u0438\\u0439 \\u0440\\u043e\\u0437\\u043f\\u043e\\u0434\\u0456\\u043b)"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043f\\u043e \\u0440\\u043e\\u0437\\u043f\\u043e\\u0440\\u044f\\u0434\\u0436\\u0435\\u043d\\u043d\\u044e \\u043d\\u0430\\u0447\\u0430\\u043b\\u044c\\u043d\\u0438\\u043a\\u0430 \\u0432\\u0430\\u0440\\u0442\\u0438 \\u0432 \\u0431\\u0443\\u0434\\u044c-\\u044f\\u043a\\u0438\\u0439 \\u0447\\u0430\\u0441"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043e\\u0441\\u043e\\u0431\\u0438, \\u044f\\u043a\\u0438\\u043c \\u0447\\u0430\\u0442\\u043e\\u0432\\u0456 \\u043f\\u0456\\u0434\\u043f\\u043e\\u0440\\u044f\\u0434\\u043a\\u043e\\u0432\\u0430\\u043d\\u0456"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043e\\u0441\\u043e\\u0431\\u0438, \\u044f\\u043a\\u0438\\u043c \\u0447\\u0430\\u0442\\u043e\\u0432\\u0456 \\u043f\\u0456\\u0434\\u043f\\u043e\\u0440\\u044f\\u0434\\u043a\\u043e\\u0432\\u0430\\u043d\\u0456 \\u0442\\u0430 \\u043e\\u0441\\u043e\\u0431\\u0438, \\u044f\\u043a\\u0456 \\u043f\\u0440\\u0438\\u0431\\u0443\\u043b\\u0438 \\u0434\\u043b\\u044f \\u043f\\u0435\\u0440\\u0435\\u0432\\u0456\\u0440\\u043a\\u0438 \\u0432\\u0430\\u0440\\u0442 \\u0456\\u0437 \\u0448\\u0442\\u0430\\u0431\\u0456\\u0432 \\u0432\\u0438\\u0449\\u043e\\u0433\\u043e \\u0440\\u0456\\u0432\\u043d\\u044f"}}, {"added": {"name": "\\u0412\\u0456\\u0434\\u043f\\u043e\\u0432\\u0456\\u0434\\u044c", "object": "\\u043e\\u0441\\u043e\\u0431\\u0438, \\u044f\\u043a\\u0438\\u043c \\u0447\\u0430\\u0442\\u043e\\u0432\\u0456 \\u043f\\u0456\\u0434\\u043f\\u043e\\u0440\\u044f\\u0434\\u043a\\u043e\\u0432\\u0430\\u043d\\u0456, \\u0442\\u0430 \\u0432\\u0456\\u0439\\u0441\\u044c\\u043a\\u043e\\u0432\\u0438\\u0439 \\u043a\\u043e\\u043c\\u0435\\u043d\\u0434\\u0430\\u043d\\u0442 \\u0433\\u0430\\u0440\\u043d\\u0456\\u0437\\u043e\\u043d\\u0443"}}]	13	1
811	2019-04-04 01:15:46.982812+03	34	Білет 12	1	[{"added": {}}]	13	1
812	2019-04-04 01:15:54.172477+03	35	Білет 19	1	[{"added": {}}]	13	1
813	2019-04-04 01:16:00.542584+03	36	Білет 26	1	[{"added": {}}]	13	1
814	2019-04-04 01:16:04.55614+03	37	Білет 33	1	[{"added": {}}]	13	1
815	2019-04-04 01:18:03.337692+03	38	Білет 13	1	[{"added": {}}]	13	1
816	2019-04-04 01:18:08.546597+03	39	Білет 20	1	[{"added": {}}]	13	1
817	2019-04-04 01:18:13.276912+03	40	Білет 27	1	[{"added": {}}]	13	1
818	2019-04-04 01:18:20.30646+03	41	Білет 34	1	[{"added": {}}]	13	1
819	2019-04-04 01:20:32.645429+03	42	Білет 14	1	[{"added": {}}]	13	1
820	2019-04-04 01:20:37.457966+03	43	Білет 21	1	[{"added": {}}]	13	1
821	2019-04-04 01:20:45.066237+03	44	Білет 28	1	[{"added": {}}]	13	1
822	2019-04-04 01:20:50.245242+03	45	Білет 35	1	[{"added": {}}]	13	1
823	2019-04-04 21:44:38.958712+03	1	111	1	[{"added": {}}]	20	1
824	2019-04-04 21:48:47.291372+03	1	Контрольна №1:\n Оцінка - \n	3		16	1
825	2019-04-04 21:48:55.511857+03	1	Контрольна №1 Лемешко Борис Борисович 2019-04-04 18:48:24.696719+00:00	3		11	1
826	2019-04-04 21:55:53.787744+03	2	Контрольна №1:\n Оцінка - 0\n	3		16	1
827	2019-04-04 21:56:02.199407+03	2	Контрольна №1 Лемешко Борис Борисович 2019-04-04 18:52:25.572561+00:00	3		11	1
828	2019-04-04 21:57:53.153034+03	3	Контрольна №1:\n Оцінка - 0\n	3		16	1
829	2019-04-04 21:58:01.402491+03	3	Контрольна №1 Лемешко Борис Борисович 2019-04-04 18:56:22.747649+00:00	3		11	1
830	2019-04-04 22:00:28.99425+03	4	Контрольна №1:\n Оцінка - 0\n	3		16	1
831	2019-04-04 22:00:35.161806+03	4	Контрольна №1 Лемешко Борис Борисович 2019-04-04 18:59:42.965211+00:00	3		11	1
832	2019-04-04 22:03:01.095346+03	5	Контрольна №1:\n Оцінка - 0\n	3		16	1
833	2019-04-04 22:03:10.207559+03	5	Контрольна №1 Лемешко Борис Борисович 2019-04-04 19:00:51.277108+00:00	3		11	1
834	2019-04-04 22:06:15.073931+03	6	Контрольна №1:\n Оцінка - 0\n	3		16	1
835	2019-04-04 22:06:23.757362+03	6	Контрольна №1 Лемешко Борис Борисович 2019-04-04 19:05:45.805233+00:00	3		11	1
836	2019-04-04 22:08:21.124831+03	7	Контрольна №1 Лемешко Борис Борисович 2019-04-04 19:07:51.651874+00:00	3		11	1
837	2019-04-04 22:08:30.278868+03	7	Контрольна №1:\n Оцінка - 4\n	3		16	1
838	2019-04-04 23:32:07.621421+03	4	Дяденко Дядя дядькович	3		17	1
839	2019-04-04 23:32:07.632054+03	3	Василенко Пєтя Васильович	3		17	1
840	2019-04-04 23:32:07.640408+03	2	Лемешко Борис Борисович	3		17	1
841	2019-04-04 23:32:07.648701+03	1	Юраш Антон Павлович	3		17	1
842	2019-04-04 23:32:34.521985+03	1	111	3		20	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: zvp_user
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	quiz_app	access
8	quiz_app	answer
9	quiz_app	question
10	quiz_app	quiz
11	quiz_app	result
12	quiz_app	startingquiz
13	quiz_app	ticket
14	control_panel	department
15	control_panel	discipline
16	control_panel	mark
17	control_panel	student
18	control_panel	teacher
19	control_panel	teacherrank
20	control_panel	troop
21	control_panel	presence
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: zvp_user
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-04-03 21:23:45.097015+03
2	auth	0001_initial	2019-04-03 21:23:47.039154+03
3	admin	0001_initial	2019-04-03 21:23:47.187076+03
4	admin	0002_logentry_remove_auto_add	2019-04-03 21:23:47.201072+03
5	admin	0003_logentry_add_action_flag_choices	2019-04-03 21:23:47.24441+03
6	contenttypes	0002_remove_content_type_name	2019-04-03 21:23:47.270352+03
7	auth	0002_alter_permission_name_max_length	2019-04-03 21:23:47.404411+03
8	auth	0003_alter_user_email_max_length	2019-04-03 21:23:47.438127+03
9	auth	0004_alter_user_username_opts	2019-04-03 21:23:47.461298+03
10	auth	0005_alter_user_last_login_null	2019-04-03 21:23:47.487263+03
11	auth	0006_require_contenttypes_0002	2019-04-03 21:23:47.495736+03
12	auth	0007_alter_validators_add_error_messages	2019-04-03 21:23:47.514317+03
13	auth	0008_alter_user_username_max_length	2019-04-03 21:23:47.580182+03
14	auth	0009_alter_user_last_name_max_length	2019-04-03 21:23:47.621797+03
15	control_panel	0001_initial	2019-04-03 21:23:48.299003+03
16	quiz_app	0001_initial	2019-04-03 21:23:49.300172+03
17	quiz_app	0002_auto_20190327_1431	2019-04-03 21:23:49.348086+03
18	quiz_app	0003_quiz_quiz_type	2019-04-03 21:23:49.483464+03
19	control_panel	0002_auto_20190326_1734	2019-04-03 21:23:49.799918+03
20	control_panel	0003_student_troop_commander	2019-04-03 21:23:49.967146+03
21	control_panel	0004_presence	2019-04-03 21:23:50.116529+03
22	sessions	0001_initial	2019-04-03 21:23:50.249807+03
23	control_panel	0005_remove_teacher_user	2019-04-04 22:09:19.513847+03
24	control_panel	0006_auto_20190404_1910	2019-04-04 22:10:11.075609+03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: zvp_user
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
fat8s09wq7d16y2azpho6kkun6a1y4y0	ZmYwZmU1M2RkZmUzMjkwMDk4ZDUxMjM3YTI0NDAyYWUwN2NmYjI4NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYjZhYTBhZjY5MzAxMDZlNDMxNDhlZmE5ODcyM2U0ZmFhNmY4OTkwIn0=	2019-04-18 21:44:21.211128+03
4hbeksfohcbd9jcpgyhyu53cqtqulgyk	Mjc2MTIxMDUyMDdiZGI5NTg4N2M0MTI0NjAyNWQ1Y2QzYzkxZjM5Yjp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlOThhZmUzNmEyYTE3OGRhOGNmYzM1OTQ3OGI4NTE1NWY3NTNkYzIyIn0=	2019-04-18 21:47:21.452598+03
\.


--
-- Data for Name: quiz_app_startingquiz; Type: TABLE DATA; Schema: public; Owner: zvp_user
--

COPY public.quiz_app_startingquiz (id, "endTestTime", quiz_id, student_id) FROM stdin;
\.


--
-- Data for Name: tickets; Type: TABLE DATA; Schema: public; Owner: zvp_user
--

COPY public.tickets (id, title, quiz_id) FROM stdin;
1	Білет 1	1
9	Білет 8	1
10	Білет 15	1
11	Білет 22	1
12	Білет 29	1
13	Білет 2	1
14	Білет 9	1
15	Білет 16	1
16	Білет 23	1
17	Білет 30	1
20	Білет 24	1
21	Білет 31	1
18	Білет 3	1
22	Білет 10	1
23	Білет 17	1
27	Білет 11	1
28	Білет 18	1
29	Білет 25	1
30	Білет 32	1
26	Білет 4	1
31	Білет 5	1
32	Білет 6	1
33	Білет 7	1
34	Білет 12	1
35	Білет 19	1
36	Білет 26	1
37	Білет 33	1
38	Білет 13	1
39	Білет 20	1
40	Білет 27	1
41	Білет 34	1
42	Білет 14	1
43	Білет 21	1
44	Білет 28	1
45	Білет 35	1
\.


--
-- Name: Departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zvp_user
--

SELECT pg_catalog.setval('public."Departments_id_seq"', 1, false);


--
-- Name: Disciplines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zvp_user
--

SELECT pg_catalog.setval('public."Disciplines_id_seq"', 1, true);


--
-- Name: Marks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zvp_user
--

SELECT pg_catalog.setval('public."Marks_id_seq"', 8, true);


--
-- Name: Questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zvp_user
--

SELECT pg_catalog.setval('public."Questions_id_seq"', 1491, true);


--
-- Name: Quizzes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zvp_user
--

SELECT pg_catalog.setval('public."Quizzes_id_seq"', 1, true);


--
-- Name: Results_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zvp_user
--

SELECT pg_catalog.setval('public."Results_id_seq"', 8, true);


--
-- Name: Students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zvp_user
--

SELECT pg_catalog.setval('public."Students_id_seq"', 4, true);


--
-- Name: Teacher's ranks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zvp_user
--

SELECT pg_catalog.setval('public."Teacher''s ranks_id_seq"', 1, false);


--
-- Name: Teachers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zvp_user
--

SELECT pg_catalog.setval('public."Teachers_id_seq"', 1, false);


--
-- Name: Troops_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zvp_user
--

SELECT pg_catalog.setval('public."Troops_id_seq"', 1, true);


--
-- Name: accesses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zvp_user
--

SELECT pg_catalog.setval('public.accesses_id_seq', 16, true);


--
-- Name: answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zvp_user
--

SELECT pg_catalog.setval('public.answers_id_seq', 4534, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zvp_user
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zvp_user
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zvp_user
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 84, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zvp_user
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zvp_user
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 5, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zvp_user
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: control_panel_presence_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zvp_user
--

SELECT pg_catalog.setval('public.control_panel_presence_id_seq', 4, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zvp_user
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 842, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zvp_user
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 21, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zvp_user
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 24, true);


--
-- Name: quiz_app_startingquiz_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zvp_user
--

SELECT pg_catalog.setval('public.quiz_app_startingquiz_id_seq', 9, true);


--
-- Name: tickets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zvp_user
--

SELECT pg_catalog.setval('public.tickets_id_seq', 45, true);


--
-- Name: Departments Departments_pkey; Type: CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public."Departments"
    ADD CONSTRAINT "Departments_pkey" PRIMARY KEY (id);


--
-- Name: Disciplines Disciplines_pkey; Type: CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public."Disciplines"
    ADD CONSTRAINT "Disciplines_pkey" PRIMARY KEY (id);


--
-- Name: Marks Marks_pkey; Type: CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public."Marks"
    ADD CONSTRAINT "Marks_pkey" PRIMARY KEY (id);


--
-- Name: Marks Marks_student_id_discipline_id_quiz_id_fda79626_uniq; Type: CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public."Marks"
    ADD CONSTRAINT "Marks_student_id_discipline_id_quiz_id_fda79626_uniq" UNIQUE (student_id, discipline_id, quiz_id);


--
-- Name: Questions Questions_pkey; Type: CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public."Questions"
    ADD CONSTRAINT "Questions_pkey" PRIMARY KEY (id);


--
-- Name: Quizzes Quizzes_pkey; Type: CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public."Quizzes"
    ADD CONSTRAINT "Quizzes_pkey" PRIMARY KEY (id);


--
-- Name: Results Results_pkey; Type: CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public."Results"
    ADD CONSTRAINT "Results_pkey" PRIMARY KEY (id);


--
-- Name: Students Students_pkey; Type: CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_pkey" PRIMARY KEY (id);


--
-- Name: Students Students_user_id_key; Type: CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_user_id_key" UNIQUE (user_id);


--
-- Name: Teacher's ranks Teacher's ranks_pkey; Type: CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public."Teacher's ranks"
    ADD CONSTRAINT "Teacher's ranks_pkey" PRIMARY KEY (id);


--
-- Name: Teacher's ranks Teacher's ranks_teacher_rank_key; Type: CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public."Teacher's ranks"
    ADD CONSTRAINT "Teacher's ranks_teacher_rank_key" UNIQUE (teacher_rank);


--
-- Name: Teachers Teachers_pkey; Type: CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_pkey" PRIMARY KEY (id);


--
-- Name: Troops Troops_pkey; Type: CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public."Troops"
    ADD CONSTRAINT "Troops_pkey" PRIMARY KEY (id);


--
-- Name: accesses accesses_pkey; Type: CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.accesses
    ADD CONSTRAINT accesses_pkey PRIMARY KEY (id);


--
-- Name: answers answers_pkey; Type: CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT answers_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: control_panel_presence control_panel_presence_pkey; Type: CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.control_panel_presence
    ADD CONSTRAINT control_panel_presence_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: quiz_app_startingquiz quiz_app_startingquiz_pkey; Type: CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.quiz_app_startingquiz
    ADD CONSTRAINT quiz_app_startingquiz_pkey PRIMARY KEY (id);


--
-- Name: tickets tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (id);


--
-- Name: Departments_department_head_id_ca97c34c; Type: INDEX; Schema: public; Owner: zvp_user
--

CREATE INDEX "Departments_department_head_id_ca97c34c" ON public."Departments" USING btree (department_head_id);


--
-- Name: Departments_department_head_rank_id_dee5d75d; Type: INDEX; Schema: public; Owner: zvp_user
--

CREATE INDEX "Departments_department_head_rank_id_dee5d75d" ON public."Departments" USING btree (department_head_rank_id);


--
-- Name: Disciplines_discipline_department_name_id_cdbdde5b; Type: INDEX; Schema: public; Owner: zvp_user
--

CREATE INDEX "Disciplines_discipline_department_name_id_cdbdde5b" ON public."Disciplines" USING btree (discipline_department_name_id);


--
-- Name: Marks_discipline_id_ef685ac6; Type: INDEX; Schema: public; Owner: zvp_user
--

CREATE INDEX "Marks_discipline_id_ef685ac6" ON public."Marks" USING btree (discipline_id);


--
-- Name: Marks_quiz_id_5c0ed030; Type: INDEX; Schema: public; Owner: zvp_user
--

CREATE INDEX "Marks_quiz_id_5c0ed030" ON public."Marks" USING btree (quiz_id);


--
-- Name: Marks_student_id_f9631477; Type: INDEX; Schema: public; Owner: zvp_user
--

CREATE INDEX "Marks_student_id_f9631477" ON public."Marks" USING btree (student_id);


--
-- Name: Questions_question_ticket_id_2c0c113c; Type: INDEX; Schema: public; Owner: zvp_user
--

CREATE INDEX "Questions_question_ticket_id_2c0c113c" ON public."Questions" USING btree (question_ticket_id);


--
-- Name: Quizzes_quiz_discipline_id_079833db; Type: INDEX; Schema: public; Owner: zvp_user
--

CREATE INDEX "Quizzes_quiz_discipline_id_079833db" ON public."Quizzes" USING btree (quiz_discipline_id);


--
-- Name: Results_student_id_d9907bd6; Type: INDEX; Schema: public; Owner: zvp_user
--

CREATE INDEX "Results_student_id_d9907bd6" ON public."Results" USING btree (student_id);


--
-- Name: Results_test_id_61ee0435; Type: INDEX; Schema: public; Owner: zvp_user
--

CREATE INDEX "Results_test_id_61ee0435" ON public."Results" USING btree (test_id);


--
-- Name: Results_ticket_id_61721985; Type: INDEX; Schema: public; Owner: zvp_user
--

CREATE INDEX "Results_ticket_id_61721985" ON public."Results" USING btree (ticket_id);


--
-- Name: Students_student_troop_id_b99ca4e9; Type: INDEX; Schema: public; Owner: zvp_user
--

CREATE INDEX "Students_student_troop_id_b99ca4e9" ON public."Students" USING btree (student_troop_id);


--
-- Name: Teacher's ranks_teacher_rank_07dc28b6_like; Type: INDEX; Schema: public; Owner: zvp_user
--

CREATE INDEX "Teacher's ranks_teacher_rank_07dc28b6_like" ON public."Teacher's ranks" USING btree (teacher_rank varchar_pattern_ops);


--
-- Name: Teachers_teacher_department_id_cf518499; Type: INDEX; Schema: public; Owner: zvp_user
--

CREATE INDEX "Teachers_teacher_department_id_cf518499" ON public."Teachers" USING btree (teacher_department_id);


--
-- Name: Teachers_teacher_rank_id_3805b702; Type: INDEX; Schema: public; Owner: zvp_user
--

CREATE INDEX "Teachers_teacher_rank_id_3805b702" ON public."Teachers" USING btree (teacher_rank_id);


--
-- Name: Troops_troop_department_id_6acec2bf; Type: INDEX; Schema: public; Owner: zvp_user
--

CREATE INDEX "Troops_troop_department_id_6acec2bf" ON public."Troops" USING btree (troop_department_id);


--
-- Name: Troops_troop_head_id_6973ccda; Type: INDEX; Schema: public; Owner: zvp_user
--

CREATE INDEX "Troops_troop_head_id_6973ccda" ON public."Troops" USING btree (troop_head_id);


--
-- Name: Troops_troop_head_rank_id_c44d2e69; Type: INDEX; Schema: public; Owner: zvp_user
--

CREATE INDEX "Troops_troop_head_rank_id_c44d2e69" ON public."Troops" USING btree (troop_head_rank_id);


--
-- Name: accesses_quiz_id_0caa5edf; Type: INDEX; Schema: public; Owner: zvp_user
--

CREATE INDEX accesses_quiz_id_0caa5edf ON public.accesses USING btree (quiz_id);


--
-- Name: accesses_student_id_9e66ae6a; Type: INDEX; Schema: public; Owner: zvp_user
--

CREATE INDEX accesses_student_id_9e66ae6a ON public.accesses USING btree (student_id);


--
-- Name: answers_question_id_1c8a95ab; Type: INDEX; Schema: public; Owner: zvp_user
--

CREATE INDEX answers_question_id_1c8a95ab ON public.answers USING btree (question_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: zvp_user
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: zvp_user
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: zvp_user
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: zvp_user
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: zvp_user
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: zvp_user
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: zvp_user
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: zvp_user
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: zvp_user
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: control_panel_presence_quiz_id_da86aad7; Type: INDEX; Schema: public; Owner: zvp_user
--

CREATE INDEX control_panel_presence_quiz_id_da86aad7 ON public.control_panel_presence USING btree (quiz_id);


--
-- Name: control_panel_presence_student_id_f3933eaf; Type: INDEX; Schema: public; Owner: zvp_user
--

CREATE INDEX control_panel_presence_student_id_f3933eaf ON public.control_panel_presence USING btree (student_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: zvp_user
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: zvp_user
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: zvp_user
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: zvp_user
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: quiz_app_startingquiz_quiz_id_f18fab7e; Type: INDEX; Schema: public; Owner: zvp_user
--

CREATE INDEX quiz_app_startingquiz_quiz_id_f18fab7e ON public.quiz_app_startingquiz USING btree (quiz_id);


--
-- Name: quiz_app_startingquiz_student_id_1cb380b2; Type: INDEX; Schema: public; Owner: zvp_user
--

CREATE INDEX quiz_app_startingquiz_student_id_1cb380b2 ON public.quiz_app_startingquiz USING btree (student_id);


--
-- Name: tickets_quiz_id_aa322b5f; Type: INDEX; Schema: public; Owner: zvp_user
--

CREATE INDEX tickets_quiz_id_aa322b5f ON public.tickets USING btree (quiz_id);


--
-- Name: Departments Departments_department_head_id_ca97c34c_fk_Teachers_id; Type: FK CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public."Departments"
    ADD CONSTRAINT "Departments_department_head_id_ca97c34c_fk_Teachers_id" FOREIGN KEY (department_head_id) REFERENCES public."Teachers"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Departments Departments_department_head_rank_dee5d75d_fk_Teacher's; Type: FK CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public."Departments"
    ADD CONSTRAINT "Departments_department_head_rank_dee5d75d_fk_Teacher's" FOREIGN KEY (department_head_rank_id) REFERENCES public."Teacher's ranks"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Disciplines Disciplines_discipline_departmen_cdbdde5b_fk_Departmen; Type: FK CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public."Disciplines"
    ADD CONSTRAINT "Disciplines_discipline_departmen_cdbdde5b_fk_Departmen" FOREIGN KEY (discipline_department_name_id) REFERENCES public."Departments"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Marks Marks_discipline_id_ef685ac6_fk_Disciplines_id; Type: FK CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public."Marks"
    ADD CONSTRAINT "Marks_discipline_id_ef685ac6_fk_Disciplines_id" FOREIGN KEY (discipline_id) REFERENCES public."Disciplines"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Marks Marks_quiz_id_5c0ed030_fk_Quizzes_id; Type: FK CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public."Marks"
    ADD CONSTRAINT "Marks_quiz_id_5c0ed030_fk_Quizzes_id" FOREIGN KEY (quiz_id) REFERENCES public."Quizzes"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Marks Marks_student_id_f9631477_fk_Students_id; Type: FK CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public."Marks"
    ADD CONSTRAINT "Marks_student_id_f9631477_fk_Students_id" FOREIGN KEY (student_id) REFERENCES public."Students"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Questions Questions_question_ticket_id_2c0c113c_fk_tickets_id; Type: FK CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public."Questions"
    ADD CONSTRAINT "Questions_question_ticket_id_2c0c113c_fk_tickets_id" FOREIGN KEY (question_ticket_id) REFERENCES public.tickets(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Quizzes Quizzes_quiz_discipline_id_079833db_fk_Disciplines_id; Type: FK CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public."Quizzes"
    ADD CONSTRAINT "Quizzes_quiz_discipline_id_079833db_fk_Disciplines_id" FOREIGN KEY (quiz_discipline_id) REFERENCES public."Disciplines"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Results Results_student_id_d9907bd6_fk_Students_id; Type: FK CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public."Results"
    ADD CONSTRAINT "Results_student_id_d9907bd6_fk_Students_id" FOREIGN KEY (student_id) REFERENCES public."Students"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Results Results_test_id_61ee0435_fk_Quizzes_id; Type: FK CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public."Results"
    ADD CONSTRAINT "Results_test_id_61ee0435_fk_Quizzes_id" FOREIGN KEY (test_id) REFERENCES public."Quizzes"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Results Results_ticket_id_61721985_fk_tickets_id; Type: FK CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public."Results"
    ADD CONSTRAINT "Results_ticket_id_61721985_fk_tickets_id" FOREIGN KEY (ticket_id) REFERENCES public.tickets(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Students Students_student_troop_id_b99ca4e9_fk_Troops_id; Type: FK CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_student_troop_id_b99ca4e9_fk_Troops_id" FOREIGN KEY (student_troop_id) REFERENCES public."Troops"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Students Students_user_id_a8e9425b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_user_id_a8e9425b_fk_auth_user_id" FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Teachers Teachers_teacher_department_id_cf518499_fk_Departments_id; Type: FK CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_teacher_department_id_cf518499_fk_Departments_id" FOREIGN KEY (teacher_department_id) REFERENCES public."Departments"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Teachers Teachers_teacher_rank_id_3805b702_fk_Teacher's ranks_id; Type: FK CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_teacher_rank_id_3805b702_fk_Teacher's ranks_id" FOREIGN KEY (teacher_rank_id) REFERENCES public."Teacher's ranks"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Troops Troops_troop_department_id_6acec2bf_fk_Departments_id; Type: FK CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public."Troops"
    ADD CONSTRAINT "Troops_troop_department_id_6acec2bf_fk_Departments_id" FOREIGN KEY (troop_department_id) REFERENCES public."Departments"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Troops Troops_troop_head_id_6973ccda_fk_Teachers_id; Type: FK CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public."Troops"
    ADD CONSTRAINT "Troops_troop_head_id_6973ccda_fk_Teachers_id" FOREIGN KEY (troop_head_id) REFERENCES public."Teachers"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Troops Troops_troop_head_rank_id_c44d2e69_fk_Teacher's ranks_id; Type: FK CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public."Troops"
    ADD CONSTRAINT "Troops_troop_head_rank_id_c44d2e69_fk_Teacher's ranks_id" FOREIGN KEY (troop_head_rank_id) REFERENCES public."Teacher's ranks"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accesses accesses_quiz_id_0caa5edf_fk_Quizzes_id; Type: FK CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.accesses
    ADD CONSTRAINT "accesses_quiz_id_0caa5edf_fk_Quizzes_id" FOREIGN KEY (quiz_id) REFERENCES public."Quizzes"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accesses accesses_student_id_9e66ae6a_fk_Students_id; Type: FK CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.accesses
    ADD CONSTRAINT "accesses_student_id_9e66ae6a_fk_Students_id" FOREIGN KEY (student_id) REFERENCES public."Students"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: answers answers_question_id_1c8a95ab_fk_Questions_id; Type: FK CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT "answers_question_id_1c8a95ab_fk_Questions_id" FOREIGN KEY (question_id) REFERENCES public."Questions"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: control_panel_presence control_panel_presence_quiz_id_da86aad7_fk_Quizzes_id; Type: FK CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.control_panel_presence
    ADD CONSTRAINT "control_panel_presence_quiz_id_da86aad7_fk_Quizzes_id" FOREIGN KEY (quiz_id) REFERENCES public."Quizzes"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: control_panel_presence control_panel_presence_student_id_f3933eaf_fk_Students_id; Type: FK CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.control_panel_presence
    ADD CONSTRAINT "control_panel_presence_student_id_f3933eaf_fk_Students_id" FOREIGN KEY (student_id) REFERENCES public."Students"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: quiz_app_startingquiz quiz_app_startingquiz_quiz_id_f18fab7e_fk_Quizzes_id; Type: FK CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.quiz_app_startingquiz
    ADD CONSTRAINT "quiz_app_startingquiz_quiz_id_f18fab7e_fk_Quizzes_id" FOREIGN KEY (quiz_id) REFERENCES public."Quizzes"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: quiz_app_startingquiz quiz_app_startingquiz_student_id_1cb380b2_fk_Students_id; Type: FK CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.quiz_app_startingquiz
    ADD CONSTRAINT "quiz_app_startingquiz_student_id_1cb380b2_fk_Students_id" FOREIGN KEY (student_id) REFERENCES public."Students"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tickets tickets_quiz_id_aa322b5f_fk_Quizzes_id; Type: FK CONSTRAINT; Schema: public; Owner: zvp_user
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT "tickets_quiz_id_aa322b5f_fk_Quizzes_id" FOREIGN KEY (quiz_id) REFERENCES public."Quizzes"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

