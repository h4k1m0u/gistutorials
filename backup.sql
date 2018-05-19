--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

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


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: articles_article; Type: TABLE; Schema: public; Owner: hakim
--

CREATE TABLE articles_article (
    id integer NOT NULL,
    text text NOT NULL,
    title character varying(140) NOT NULL,
    slug character varying(50) NOT NULL,
    date timestamp with time zone NOT NULL,
    published boolean NOT NULL,
    category_id integer,
    member_id integer,
    image character varying(100) NOT NULL
);


ALTER TABLE articles_article OWNER TO hakim;

--
-- Name: articles_article_id_seq; Type: SEQUENCE; Schema: public; Owner: hakim
--

CREATE SEQUENCE articles_article_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE articles_article_id_seq OWNER TO hakim;

--
-- Name: articles_article_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hakim
--

ALTER SEQUENCE articles_article_id_seq OWNED BY articles_article.id;


--
-- Name: articles_article_tags; Type: TABLE; Schema: public; Owner: hakim
--

CREATE TABLE articles_article_tags (
    id integer NOT NULL,
    article_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE articles_article_tags OWNER TO hakim;

--
-- Name: articles_article_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: hakim
--

CREATE SEQUENCE articles_article_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE articles_article_tags_id_seq OWNER TO hakim;

--
-- Name: articles_article_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hakim
--

ALTER SEQUENCE articles_article_tags_id_seq OWNED BY articles_article_tags.id;


--
-- Name: articles_category; Type: TABLE; Schema: public; Owner: hakim
--

CREATE TABLE articles_category (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    slug character varying(50) NOT NULL
);


ALTER TABLE articles_category OWNER TO hakim;

--
-- Name: articles_category_id_seq; Type: SEQUENCE; Schema: public; Owner: hakim
--

CREATE SEQUENCE articles_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE articles_category_id_seq OWNER TO hakim;

--
-- Name: articles_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hakim
--

ALTER SEQUENCE articles_category_id_seq OWNED BY articles_category.id;


--
-- Name: articles_tag; Type: TABLE; Schema: public; Owner: hakim
--

CREATE TABLE articles_tag (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    slug character varying(50) NOT NULL
);


ALTER TABLE articles_tag OWNER TO hakim;

--
-- Name: articles_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: hakim
--

CREATE SEQUENCE articles_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE articles_tag_id_seq OWNER TO hakim;

--
-- Name: articles_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hakim
--

ALTER SEQUENCE articles_tag_id_seq OWNED BY articles_tag.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: hakim
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO hakim;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: hakim
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO hakim;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hakim
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: hakim
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO hakim;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: hakim
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO hakim;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hakim
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: hakim
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO hakim;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: hakim
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO hakim;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hakim
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: hakim
--

CREATE TABLE auth_user (
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


ALTER TABLE auth_user OWNER TO hakim;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: hakim
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO hakim;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: hakim
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO hakim;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hakim
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: hakim
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO hakim;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hakim
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: hakim
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO hakim;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: hakim
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO hakim;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hakim
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: hakim
--

CREATE TABLE authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE authtoken_token OWNER TO hakim;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: hakim
--

CREATE TABLE django_admin_log (
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


ALTER TABLE django_admin_log OWNER TO hakim;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: hakim
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO hakim;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hakim
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: hakim
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO hakim;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: hakim
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO hakim;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hakim
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: hakim
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO hakim;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: hakim
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO hakim;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hakim
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: hakim
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO hakim;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: hakim
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE django_site OWNER TO hakim;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: hakim
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_site_id_seq OWNER TO hakim;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hakim
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: expenses_expense; Type: TABLE; Schema: public; Owner: hakim
--

CREATE TABLE expenses_expense (
    id integer NOT NULL,
    date date NOT NULL,
    amount numeric(5,2) NOT NULL,
    description character varying(20) NOT NULL,
    user_id integer
);


ALTER TABLE expenses_expense OWNER TO hakim;

--
-- Name: expenses_expense_id_seq; Type: SEQUENCE; Schema: public; Owner: hakim
--

CREATE SEQUENCE expenses_expense_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE expenses_expense_id_seq OWNER TO hakim;

--
-- Name: expenses_expense_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hakim
--

ALTER SEQUENCE expenses_expense_id_seq OWNED BY expenses_expense.id;


--
-- Name: members_member; Type: TABLE; Schema: public; Owner: hakim
--

CREATE TABLE members_member (
    id integer NOT NULL,
    slug character varying(50) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE members_member OWNER TO hakim;

--
-- Name: members_member_id_seq; Type: SEQUENCE; Schema: public; Owner: hakim
--

CREATE SEQUENCE members_member_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE members_member_id_seq OWNER TO hakim;

--
-- Name: members_member_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hakim
--

ALTER SEQUENCE members_member_id_seq OWNED BY members_member.id;


--
-- Name: places_city; Type: TABLE; Schema: public; Owner: hakim
--

CREATE TABLE places_city (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    geometry geometry(Point,4326) NOT NULL,
    slug character varying(50) NOT NULL
);


ALTER TABLE places_city OWNER TO hakim;

--
-- Name: places_city_id_seq; Type: SEQUENCE; Schema: public; Owner: hakim
--

CREATE SEQUENCE places_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE places_city_id_seq OWNER TO hakim;

--
-- Name: places_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hakim
--

ALTER SEQUENCE places_city_id_seq OWNED BY places_city.id;


--
-- Name: quotes_author; Type: TABLE; Schema: public; Owner: hakim
--

CREATE TABLE quotes_author (
    id integer NOT NULL,
    slug character varying(50) NOT NULL,
    firstname character varying(50) NOT NULL,
    lastname character varying(50) NOT NULL
);


ALTER TABLE quotes_author OWNER TO hakim;

--
-- Name: quotes_author_id_seq; Type: SEQUENCE; Schema: public; Owner: hakim
--

CREATE SEQUENCE quotes_author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE quotes_author_id_seq OWNER TO hakim;

--
-- Name: quotes_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hakim
--

ALTER SEQUENCE quotes_author_id_seq OWNED BY quotes_author.id;


--
-- Name: quotes_book; Type: TABLE; Schema: public; Owner: hakim
--

CREATE TABLE quotes_book (
    id integer NOT NULL,
    title character varying(200) NOT NULL,
    isbn character varying(10) NOT NULL,
    author_id integer,
    slug character varying(50) NOT NULL
);


ALTER TABLE quotes_book OWNER TO hakim;

--
-- Name: quotes_book_id_seq; Type: SEQUENCE; Schema: public; Owner: hakim
--

CREATE SEQUENCE quotes_book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE quotes_book_id_seq OWNER TO hakim;

--
-- Name: quotes_book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hakim
--

ALTER SEQUENCE quotes_book_id_seq OWNED BY quotes_book.id;


--
-- Name: quotes_category; Type: TABLE; Schema: public; Owner: hakim
--

CREATE TABLE quotes_category (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    slug character varying(50) NOT NULL,
    image character varying(100) NOT NULL
);


ALTER TABLE quotes_category OWNER TO hakim;

--
-- Name: quotes_category_id_seq; Type: SEQUENCE; Schema: public; Owner: hakim
--

CREATE SEQUENCE quotes_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE quotes_category_id_seq OWNER TO hakim;

--
-- Name: quotes_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hakim
--

ALTER SEQUENCE quotes_category_id_seq OWNED BY quotes_category.id;


--
-- Name: quotes_quote; Type: TABLE; Schema: public; Owner: hakim
--

CREATE TABLE quotes_quote (
    id integer NOT NULL,
    text character varying(1000) NOT NULL,
    date timestamp with time zone NOT NULL,
    book_id integer,
    author_id integer,
    slug character varying(50) NOT NULL,
    category_id integer,
    published boolean NOT NULL,
    member_id integer
);


ALTER TABLE quotes_quote OWNER TO hakim;

--
-- Name: quotes_quote_id_seq; Type: SEQUENCE; Schema: public; Owner: hakim
--

CREATE SEQUENCE quotes_quote_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE quotes_quote_id_seq OWNER TO hakim;

--
-- Name: quotes_quote_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hakim
--

ALTER SEQUENCE quotes_quote_id_seq OWNED BY quotes_quote.id;


--
-- Name: quotes_quote_tags; Type: TABLE; Schema: public; Owner: hakim
--

CREATE TABLE quotes_quote_tags (
    id integer NOT NULL,
    quote_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE quotes_quote_tags OWNER TO hakim;

--
-- Name: quotes_quote_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: hakim
--

CREATE SEQUENCE quotes_quote_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE quotes_quote_tags_id_seq OWNER TO hakim;

--
-- Name: quotes_quote_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hakim
--

ALTER SEQUENCE quotes_quote_tags_id_seq OWNED BY quotes_quote_tags.id;


--
-- Name: quotes_tag; Type: TABLE; Schema: public; Owner: hakim
--

CREATE TABLE quotes_tag (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    slug character varying(50) NOT NULL
);


ALTER TABLE quotes_tag OWNER TO hakim;

--
-- Name: quotes_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: hakim
--

CREATE SEQUENCE quotes_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE quotes_tag_id_seq OWNER TO hakim;

--
-- Name: quotes_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hakim
--

ALTER SEQUENCE quotes_tag_id_seq OWNED BY quotes_tag.id;


--
-- Name: social_auth_association; Type: TABLE; Schema: public; Owner: hakim
--

CREATE TABLE social_auth_association (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    handle character varying(255) NOT NULL,
    secret character varying(255) NOT NULL,
    issued integer NOT NULL,
    lifetime integer NOT NULL,
    assoc_type character varying(64) NOT NULL
);


ALTER TABLE social_auth_association OWNER TO hakim;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE; Schema: public; Owner: hakim
--

CREATE SEQUENCE social_auth_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE social_auth_association_id_seq OWNER TO hakim;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hakim
--

ALTER SEQUENCE social_auth_association_id_seq OWNED BY social_auth_association.id;


--
-- Name: social_auth_code; Type: TABLE; Schema: public; Owner: hakim
--

CREATE TABLE social_auth_code (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    code character varying(32) NOT NULL,
    verified boolean NOT NULL,
    "timestamp" timestamp with time zone NOT NULL
);


ALTER TABLE social_auth_code OWNER TO hakim;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE; Schema: public; Owner: hakim
--

CREATE SEQUENCE social_auth_code_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE social_auth_code_id_seq OWNER TO hakim;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hakim
--

ALTER SEQUENCE social_auth_code_id_seq OWNED BY social_auth_code.id;


--
-- Name: social_auth_nonce; Type: TABLE; Schema: public; Owner: hakim
--

CREATE TABLE social_auth_nonce (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    "timestamp" integer NOT NULL,
    salt character varying(65) NOT NULL
);


ALTER TABLE social_auth_nonce OWNER TO hakim;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE; Schema: public; Owner: hakim
--

CREATE SEQUENCE social_auth_nonce_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE social_auth_nonce_id_seq OWNER TO hakim;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hakim
--

ALTER SEQUENCE social_auth_nonce_id_seq OWNED BY social_auth_nonce.id;


--
-- Name: social_auth_partial; Type: TABLE; Schema: public; Owner: hakim
--

CREATE TABLE social_auth_partial (
    id integer NOT NULL,
    token character varying(32) NOT NULL,
    next_step smallint NOT NULL,
    backend character varying(32) NOT NULL,
    data text NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    CONSTRAINT social_auth_partial_next_step_check CHECK ((next_step >= 0))
);


ALTER TABLE social_auth_partial OWNER TO hakim;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE; Schema: public; Owner: hakim
--

CREATE SEQUENCE social_auth_partial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE social_auth_partial_id_seq OWNER TO hakim;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hakim
--

ALTER SEQUENCE social_auth_partial_id_seq OWNED BY social_auth_partial.id;


--
-- Name: social_auth_usersocialauth; Type: TABLE; Schema: public; Owner: hakim
--

CREATE TABLE social_auth_usersocialauth (
    id integer NOT NULL,
    provider character varying(32) NOT NULL,
    uid character varying(255) NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE social_auth_usersocialauth OWNER TO hakim;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE; Schema: public; Owner: hakim
--

CREATE SEQUENCE social_auth_usersocialauth_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE social_auth_usersocialauth_id_seq OWNER TO hakim;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hakim
--

ALTER SEQUENCE social_auth_usersocialauth_id_seq OWNED BY social_auth_usersocialauth.id;


--
-- Name: articles_article id; Type: DEFAULT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY articles_article ALTER COLUMN id SET DEFAULT nextval('articles_article_id_seq'::regclass);


--
-- Name: articles_article_tags id; Type: DEFAULT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY articles_article_tags ALTER COLUMN id SET DEFAULT nextval('articles_article_tags_id_seq'::regclass);


--
-- Name: articles_category id; Type: DEFAULT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY articles_category ALTER COLUMN id SET DEFAULT nextval('articles_category_id_seq'::regclass);


--
-- Name: articles_tag id; Type: DEFAULT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY articles_tag ALTER COLUMN id SET DEFAULT nextval('articles_tag_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: expenses_expense id; Type: DEFAULT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY expenses_expense ALTER COLUMN id SET DEFAULT nextval('expenses_expense_id_seq'::regclass);


--
-- Name: members_member id; Type: DEFAULT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY members_member ALTER COLUMN id SET DEFAULT nextval('members_member_id_seq'::regclass);


--
-- Name: places_city id; Type: DEFAULT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY places_city ALTER COLUMN id SET DEFAULT nextval('places_city_id_seq'::regclass);


--
-- Name: quotes_author id; Type: DEFAULT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY quotes_author ALTER COLUMN id SET DEFAULT nextval('quotes_author_id_seq'::regclass);


--
-- Name: quotes_book id; Type: DEFAULT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY quotes_book ALTER COLUMN id SET DEFAULT nextval('quotes_book_id_seq'::regclass);


--
-- Name: quotes_category id; Type: DEFAULT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY quotes_category ALTER COLUMN id SET DEFAULT nextval('quotes_category_id_seq'::regclass);


--
-- Name: quotes_quote id; Type: DEFAULT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY quotes_quote ALTER COLUMN id SET DEFAULT nextval('quotes_quote_id_seq'::regclass);


--
-- Name: quotes_quote_tags id; Type: DEFAULT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY quotes_quote_tags ALTER COLUMN id SET DEFAULT nextval('quotes_quote_tags_id_seq'::regclass);


--
-- Name: quotes_tag id; Type: DEFAULT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY quotes_tag ALTER COLUMN id SET DEFAULT nextval('quotes_tag_id_seq'::regclass);


--
-- Name: social_auth_association id; Type: DEFAULT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY social_auth_association ALTER COLUMN id SET DEFAULT nextval('social_auth_association_id_seq'::regclass);


--
-- Name: social_auth_code id; Type: DEFAULT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY social_auth_code ALTER COLUMN id SET DEFAULT nextval('social_auth_code_id_seq'::regclass);


--
-- Name: social_auth_nonce id; Type: DEFAULT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY social_auth_nonce ALTER COLUMN id SET DEFAULT nextval('social_auth_nonce_id_seq'::regclass);


--
-- Name: social_auth_partial id; Type: DEFAULT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY social_auth_partial ALTER COLUMN id SET DEFAULT nextval('social_auth_partial_id_seq'::regclass);


--
-- Name: social_auth_usersocialauth id; Type: DEFAULT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY social_auth_usersocialauth ALTER COLUMN id SET DEFAULT nextval('social_auth_usersocialauth_id_seq'::regclass);


--
-- Data for Name: articles_article; Type: TABLE DATA; Schema: public; Owner: hakim
--

COPY articles_article (id, text, title, slug, date, published, category_id, member_id, image) FROM stdin;
9	<p>The case-study is the <a href="https://en.wikipedia.org/wiki/Bay_of_Gibraltar" target="_blank">Bay of Gibraltar</a> which is a British Overseas Territory located geographically south of Spain. I got the <a href="https://en.wikipedia.org/wiki/Sentinel-2" target="_blank">Sentinel-2</a> multispectral optical image from the <a href="https://scihub.copernicus.eu/dhus" target="_blank">Sentinel Hub</a>, and took a subset around the area-of-interest with <a href="http://step.esa.int/main/toolboxes/snap/" target="_blank">SNAP</a>.</p>\r\n\r\n<p>The Near-Infrared band (NIR) in the studied Sentinel-2 image is quite adequate to <a href="http://verkehrsforschung.dlr.de/en/news/near-infrared-detection-water-surfaces-flooding-scenarios" target="_blank">detect water</a>. Band 8 is the NIR band in Sentinel-2 products and has a 10m resolution. This band is known to absorb water well. Therefore, we propose to discriminate water from land by clustering this band into two classes using the K-means clustering. From this <a href="http://www.gistutorials.com/media/geo/kmeans-b8.tif" target="_blank">link</a> you can download the subset of the NIR band available in the GeoTiff format, which was processed in the example below.</p>\r\n\r\n<p><img alt="" src="http://www.gistutorials.com/media/images/kmeans-input.png" /></p>\r\n\r\n<p><a href="https://en.wikipedia.org/wiki/K-means_clustering" target="_blank">K-means</a> clustering is one of the most basic <a href="https://en.wikipedia.org/wiki/Unsupervised_learning" target="_blank">unsupervised classification algorithms</a> out there. By unsupervised it means that this classifier doesn&rsquo;t require a training dataset that was labelled beforehand.</p>\r\n\r\n<p>In a nutshell K-means in its initial implementation works as explained in this <a href="http://bigdata-madesimple.com/possibly-the-simplest-way-to-explain-k-means-algorithm/" target="_blank">blog post</a>:<br />\r\n- The K-means algorithms starts by initializing randomly as much centroids as the number of clusters we want to eventually obtain.<br />\r\n- Each point in the dataset is assigned to the cluster whose centroid is the closest (e.g. Euclidean distance).<br />\r\n- At the end of every iteration, the centroid in each cluster is updated to the average of the points classified in that cluster.<br />\r\n- The stopping condition is when the clusters aren&rsquo;t changed.</p>\r\n\r\n<p>There is no need to worry about implementing K-means in this tutorial, since we are going to use <a href="http://scikit-learn.org" target="_blank">Scikit-learn</a> which includes many <a href="https://en.wikipedia.org/wiki/Machine_learning" target="_blank">machine learning</a> algorithms, among them the <a href="http://scikit-learn.org/stable/modules/generated/sklearn.cluster.KMeans.html" target="_blank">K-means clustering</a>.</p>\r\n\r\n<p>Before getting into the heart of the matter, we need to import <a href="https://pypi.python.org/pypi/GDAL/" target="_blank">GDAL</a> and the clustering module from Scikit-learn:</p>\r\n\r\n<pre>\r\n<code class="language-python">from sklearn import cluster\r\nfrom osgeo import gdal</code></pre>\r\n\r\n<p>First off, the satellite image is read with GDAL python wrapper, and from it we extract the band we are interested in classifying:</p>\r\n\r\n<pre>\r\n<code class="language-python">dataset = gdal.Open(filename)\r\nband = dataset.GetRasterBand(1)</code></pre>\r\n\r\n<p>Python-gdal makes our lives much easier by reading the data into a <a href="http://www.numpy.org/" target="_blank">NumPy</a> array which facilitate performing different array operations on it. This will prove useful later when Scikit-learn comes into play to classify the Numpy array:</p>\r\n\r\n<pre>\r\n<code class="language-python">img = band.ReadAsArray()</code></pre>\r\n\r\n<p>The classification is performed on the pixel level (i.e. each pixel represents a statistical individual to classify). So prior to the clustering, we first need to preprocess the dataset by <a href="https://docs.scipy.org/doc/numpy/reference/generated/numpy.reshape.html" target="_blank">reshaping</a> the input image from its original 2D dimensions (&ldquo;width x height&rdquo;) to a vector of individuals ([[x1] [x2]&hellip;.[xn]] where xi is the intensity of each pixel):</p>\r\n\r\n<pre>\r\n<code class="language-python">X = img.reshape((-1, 1))</code></pre>\r\n\r\n<p>Afterwards, we initialize the classifier by providing the number of clusters as input, and we fit it to the preprocessed dataset to cluster it (no training is needed as explained above):</p>\r\n\r\n<pre>\r\n<code class="language-python">k_means = cluster.KMeans(n_clusters=2)\r\n_ = k_means.fit(X)</code></pre>\r\n\r\n<p>The classified image can retrieved from the labels that were assigned to each pixel. However this labels array is shaped as a vector and need to be reshaped as an image (width x height):</p>\r\n\r\n<pre>\r\n<code class="language-python">X_clustered = k_means.labels_\r\nX_clustered = X_clustered.reshape(img.shape)</code></pre>\r\n\r\n<p>We return to GDAL to save the image as a GeoTiff. Similarly to when the original NIR image was opened, we start by creating a dataset with the same dimensions as the input image. Then we save the clustered image array as an individual band in it:</p>\r\n\r\n<pre>\r\n<code class="language-python">driver = gdal.GetDriverByName('GTiff')\r\nx_size = arr.shape[1]\r\ny_size = arr.shape[0]\r\ndataset = driver.Create(filename, x_size, y_size, eType=gdal.GDT_Float32)\r\n_ = dataset.GetRasterBand(1).WriteArray(X_clustered)</code></pre>\r\n\r\n<p><img alt="" src="http://www.gistutorials.com/media/images/kmeans-result.png" /></p>	Clustering a satellite image with Scikit-learn	clustering-a-satellite-image-with-scikit-learn	2018-02-18 22:15:39.785464+00	t	\N	1	images/kmeans-result.png
7	<p style="margin-left:0cm; margin-right:0cm">Google Earth Engine (<a href="https://earthengine.google.com/" target="_blank">GEE</a>), for those who don&rsquo;t know it, is a platform that allows to process satellite imagery directly on the cloud. It includes a Javascript IDE (text editor + interpreter), as well as a vast archive of images acquired by satellites like: Sentinel-1, Sentinel-2, and Landsat-8, among others.</p>\r\n\r\n<p style="margin-left:0cm; margin-right:0cm">To sign up to GEE, a Gmail account is necessary. All that needs to be done is to go to <a href="https://earthengine.google.com/signup/" style="color:#0563c1; text-decoration:underline">sign-up</a>, and sign up to have access to GEE. Once the application is accepted an email like the following should be received:</p>\r\n\r\n<p style="margin-left:0cm; margin-right:0cm"><img alt="Welcome to Google Earth Engine" src="http://www.gistutorials.com/media/images/gee-acceptation.png" /></p>\r\n\r\n<p style="margin-left:0cm; margin-right:0cm">The satellite image we&rsquo;re going to use in this tutorial are stored directly on the cloud. However, GEE gives you the possibility to upload your own images from the assets tab situated at the left-hand side of the editor (only the GeoTiff format is supported for the time being).</p>\r\n\r\n<p style="margin-left:0cm; margin-right:0cm">A basic knowledge of Javascript is needed to get the hang of the code written in the GEE editor (one doesn&rsquo;t need to be an expert in JS to understand the GEE functions, though). Plus, both the GEE API and JS can be learned at the same time. A good starting point are the <a href="https://developers.google.com/earth-engine/tutorials" style="color:#0563c1; text-decoration:underline">official tutorials</a> provided on the GEE website and the <a href="https://developers.google.com/earth-engine/api_docs" style="color:#0563c1; text-decoration:underline">API</a>. Another great resource to get help online is the Google Earth Engine Developers <a href="https://groups.google.com/forum/#!forum/google-earth-engine-developers" style="color:#0563c1; text-decoration:underline">google group</a>.</p>\r\n\r\n<p style="margin-left:0cm; margin-right:0cm">Now, let&rsquo;s get into the fun stuff. To get started, we will load and display a Sentinel-2 optical image from the archive using dates and coordinates filters. A quick way to consult the documentation for each function that will be used in this tutorial is to look for it in the docs tab.</p>\r\n\r\n<p style="margin-left:0cm; margin-right:0cm">First, we need to load the archive of Sentinel-2 images (the var keyword is used to declare a new variable in Javascript):</p>\r\n\r\n<pre>\r\n<code class="language-javascript">var s2 = ee.ImageCollection('COPERNICUS/S2');</code></pre>\r\n\r\n<p style="margin-left:0cm; margin-right:0cm">After that, we will filter the previous ImageCollection by date. We also restrict the same collection only to images intersecting the geocoordinates (37&deg;N, 3&deg;E), which correspond to a point in the Mediterranean Sea (North of Algiers, capital of Algeria):</p>\r\n\r\n<pre>\r\n<code class="language-javascript">var collection = s2.filterDate('2017-12-20', '2018-01-07').filterBounds(ee.Geometry.Point([3, 37]));</code></pre>\r\n\r\n<p style="margin-left:0cm; margin-right:0cm">We will pick from the filtered collection the image containing the least cloud-cover, by sorting the collection in an ascending order according to this property and saving the first image in a separate variable:</p>\r\n\r\n<pre>\r\n<code class="language-javascript">var image = ee.Image(collection.sort('CLOUDY_PIXEL_PERCENTAGE').first());</code></pre>\r\n\r\n<p style="margin-left:0cm; margin-right:0cm">If you wonder where the cloud-cover property came from, you can use the print() function to print any variable similarly to how console.log() is used in Javascript. Print(collection) will show in the Console tab the bands and the properties of the images in the collection.</p>\r\n\r\n<p style="margin-left:0cm; margin-right:0cm">Finally, we will show the image on the map situated below the editor. The view was zoomed on the (37&deg;N, 3&deg;E) geocoordinates, and then the image was added in a separate layer. We provide the bands to display as an array, where B4, B3, B2 correspond to the red, green, and blue bands in Sentinel-2 products, respectively. Also the max and mix values given as input serve to equalize the histogram of the image (i.e. to avoid having images that are too dark or too bright). You can get a feeling for the values to use as min/max by displaying the image as it is (i.e. without equalization), and checking the values for some pixels in each band from the Inspector tab:</p>\r\n\r\n<pre>\r\n<code class="language-javascript">Map.addLayer(image, {bands: ['B4', 'B3', 'B2'], min: 0, max: 1500});</code></pre>\r\n\r\n<p style="margin-left:0cm; margin-right:0cm">The resulting image can be seen below:</p>\r\n\r\n<p style="margin-left:0cm; margin-right:0cm"><img alt="Visualization of a Sentinel-2 image on Google Earth Engine" src="http://gistutorials.com/media/images/gee-results.png" /></p>	Getting started with Google Earth Engine	getting-started-with-google-earth-engine	2018-01-07 18:23:50.570104+00	t	\N	1	images/gee-results.png
8	<p>The case study of this tutorial is the city of Algiers (Algeria&#39;s capital), like for the <a href="http://www.gistutorials.com/article/7" target="_blank">first tutorial</a> about Google Earth Engine. Actually, it&#39;s the only copy I&#39;ve kept before <a href="https://mapzen.com/blog/shutdown/" target="_blank">Mapzen</a> has turned off its API in February 2018, so I have no other alternative dataset as far as this tutorial is concerned.</p>\r\n\r\n<p>The two GeoJSON files required to run the example in this tutorials can be downloaded from <a href="http://www.gistutorials.com/media/geo/admin.geojson">admin</a> and <a href="http://www.gistutorials.com/media/geo/places.geojson">places</a>. The administrative boundaries represent a vector shapefile of the city borders, while the places file consist of a Pandas Dataframe containing the districts/neighborhoods/towns belonging to the studied city (with columns such as the name of the district/town, its population, its geographical coordinates).</p>\r\n\r\n<p>Regarding the libraries we&rsquo;ll make use of, <a href="http://geopandas.org/" target="_blank">GeoPandas</a> allows to read and process geospatial data, whereas <a href="https://matplotlib.org/" target="_blank">Matplotlib</a> serves to plot it. GeoPandas rely on the same rationale as the <a href="https://pypi.python.org/pypi/GDAL" target="_blank">python-gdal</a> wrapper, but instead of reading geospatial images and returning NumPy arrays it returns Pandas Series and DataFrames, which makes manipulating this type of data even more easier by providing access to the <a href="https://pandas.pydata.org/pandas-docs/stable/api.html" target="_blank">Pandas API</a> of functions.</p>\r\n\r\n<p>We&rsquo;ll need to initially import geopandas and matplotlib:</p>\r\n\r\n<pre>\r\n<code class="language-python">import geopandas as gpd\r\nimport matplotlib.pyplot as plt</code></pre>\r\n\r\n<p>If geopandas and matplotlib are not already in the system, they can be installed with a simple pip install:</p>\r\n\r\n<pre>\r\n<code class="language-bash">pip install geopandas matplotlib</code></pre>\r\n\r\n<p>matplotlib needs to show its graphics inline (i.e. in the same notebook if you&#39;re using <a href="http://jupyter.org/" target="_blank">Jupyter notebook</a>):</p>\r\n\r\n<pre>\r\n<code class="language-python">%matplotlib inline</code></pre>\r\n\r\n<p>We also need to resize the figure drawn by matplotlib to 20in by 10in, otherwise it will be too tiny to show the towns names clealy:</p>\r\n\r\n<pre>\r\n<code class="language-python">plt.rcParams['figure.figsize'] = (20, 10)</code></pre>\r\n\r\n<p>Then, we go ahead and load our two GeoJSON files:</p>\r\n\r\n<pre>\r\n<code class="language-python">df_places = gpd.read_file('algiers_algeria_expanded_places.geojson')\r\ndf_admin = gpd.read_file('algiers_algeria_expanded_admin.geojson')</code></pre>\r\n\r\n<p>For the city&rsquo;s boundaries polygon, it&rsquo;s straightforwardly plotted without any processing whatsoever:</p>\r\n\r\n<pre>\r\n<code class="language-python">ax = df_admin.plot(color='blue')</code></pre>\r\n\r\n<p>Note that we kept a copy of the variable returned by the plot, because we intend in what follows to annotate the resulting polygon with the town names. We&rsquo;ll go through all the entries in the places DataFrame and plot (ax.annotate(...)) the name of the town at the geographic location set by the &lsquo;geometry&rsquo; column. To keep it simple, we limit ourselves to the towns labels having a population greater than 10,000:</p>\r\n\r\n<pre>\r\n<code class="language-python">for idx, row in df_places.iterrows():\r\n    if row['population'] &gt; 10000:\r\n        coordinates = row['geometry'].coords.xy\r\n        x, y = coordinates[0][0], coordinates[1][0]\r\n        ax.annotate(row['name'], xy=(x, y), xytext=(x, y))</code></pre>\r\n\r\n<p>We close the tutorial by plotting the towns locations (represented below by red/white tiny circles) over the polygon. The arguments given to the <a href="http://geopandas.readthedocs.io/en/latest/reference.html?highlight=plot#geopandas.GeoDataFrame.plot" target="_blank">plot()</a> method deserve further explanations. &#39;OrRd&#39; is the name of a matplotlib <a href="https://matplotlib.org/users/colormaps.html" target="_blank">colormap</a> which is basically a gradient going from the white color (lower values) to the red color (higher values). The column that decides how saturated in red is the point we draw is the population column. The <a href="https://en.wikipedia.org/wiki/Choropleth_map" target="_blank">choropleth</a> classification scheme that gave the most satisfying results is the <a href="https://en.wikipedia.org/wiki/Quantile" target="_blank">Quantile</a> scheme. Note that <a href="http://pysal.readthedocs.io/en/latest/index.html" target="_blank">PySAL</a> is required to make use of this scheme (pip install pysal):</p>\r\n\r\n<pre>\r\n<code class="language-python">df_places.plot(ax=ax, column='population', scheme='quantiles', cmap='OrRd') </code></pre>\r\n\r\n<p>The obtained map can be seen below:</p>\r\n\r\n<p><img alt="" src="http://www.gistutorials.com/media/images/geopandas-results.png" /></p>\r\n\r\n<h3>Further reading</h3>\r\n\r\n<p>This tutorial was inspired by <a href="http://michelleful.github.io/code-blog/2015/04/24/sgmap/" target="_blank">another tutorial</a> in this same context. In the mentioned blog post, the aim is more ambitious as the author proposed to classify Singapore roads by their linguistic origin (Malay, English, and Chinese). You&rsquo;re highly encouraged to check out that series of tutorials.</p>	Plot a GeoJSON map using GeoPandas	plot-a-geojson-map-using-geopandas	2018-02-04 12:39:51.492384+00	t	\N	1	images/geopandas-results.png
10	<p>To avoid making this tutorial too long to read and follow, I&rsquo;ve preferred to split it into three parts:</p>\r\n\r\n<p>1. Create a GIS database with PostgreSQL and PostGIS (this tutorial).<br />\r\n2. <a href="http://www.gistutorials.com/article/11" target="_blank">Develop a GIS webapp with GeoDjango</a>.<br />\r\n3. <a href="http://www.gistutorials.com/article/12" target="_blank">Showing a map on the Django admin</a>.</p>\r\n\r\n<p>In the following I&rsquo;m going to demonstrate how I&rsquo;ve installed PostgreSQL (on both Windows and Arch Linux) and created a new geospatial database with PostGIS.</p>\r\n\r\n<h3>On Windows</h3>\r\n\r\n<p>The installation of PostgreSQL and the configuration of PostGIS is quite straightforward, compared to how it&#39;s done on Arch Linux (in the next section).</p>\r\n\r\n<p>The link to the latest version of PostgreSQL (version 10 as of when this tutorial was posted) can be found on the <a href="https://www.postgresql.org/download/windows/" target="_blank">official website</a>, and can be downloaded from <a href="https://www.enterprisedb.com/downloads/postgres-postgresql-downloads" target="_blank">EntrepriseDB&rsquo;s website</a>.</p>\r\n\r\n<p>At the end of the installation, you&rsquo;ll be asked whether you want to use the stack builder to install additional tools:</p>\r\n\r\n<p><img alt="" src="http://www.gistutorials.com/media/images/windows-postgresql-installation.png" /></p>\r\n\r\n<p>And that&rsquo;s when we&rsquo;ll install <a href="https://postgis.net/" target="_blank">PostGIS</a> which is the de facto geospatial extension for PostgreSQL:</p>\r\n\r\n<p><img alt="" src="http://www.gistutorials.com/media/images/windows-postgis-installation.png" /></p>\r\n\r\n<p>During the installation of PostGIS, there is a possibility to create a geo-database without having to do it from the command-line like for Arch Linux. All you have to do is to make sure the checkbox &quot;Create a spatial database&quot; below is checked. I&rsquo;ve called the database &quot;&lt;my-database&gt;&quot; in what follows:</p>\r\n\r\n<p><img alt="" src="http://www.gistutorials.com/media/images/windows-geo-database.png" /></p>\r\n\r\n<p>To have access to the PostgreSQL command-line client (psql) later, we need to add the path to it in PostgresSQL&rsquo;s folder to the Path system variable. For me the path that was added is &quot;C:\\Program Files\\PostgreSQL\\10\\bin&quot; (don&rsquo;t forget the semi-colon to separate between the different paths):</p>\r\n\r\n<p><img alt="" src="http://www.gistutorials.com/media/images/windows-environment-variables.png" /></p>\r\n\r\n<h3>On Arch Linux</h3>\r\n\r\n<p>More details can be found on <a href="https://wiki.archlinux.org/index.php/PostgreSQL" target="_blank">PostgreSQL&rsquo;s page on Arch Linux website</a>. In a nutshell, we install PostgreSQL, PostGIS and PgAdmin (GUI administration tool):</p>\r\n\r\n<pre>\r\n<code class="language-bash">pacman -S postgresql postgis pgadmin4</code></pre>\r\n\r\n<p>Then, the database must be initialized, as this is not automatic like on Windows:</p>\r\n\r\n<pre>\r\n<code class="language-bash">initdb --locale $LANG -E UTF8 -D '/var/lib/postgres/data'</code></pre>\r\n\r\n<p>And the PostgreSQL service has to be started and enabled to run on boot:</p>\r\n\r\n<pre>\r\n<code class="language-bash">systemctl start postgresql.service\r\nsystemctl enable postgresql.service</code></pre>\r\n\r\n<h3>For both</h3>\r\n\r\n<p>Regardless of whether you&rsquo;re on Windows or Linux, the next procedure to create a user with SQL from the command-line will be the same. So, you need to run the PostgreSQL client from the command-line. Note that we are connecting to the database server using the &quot;postgres&quot; user, which was created automatically during the installation of PostgreSQL:</p>\r\n\r\n<pre>\r\n<code class="language-bash">psql -U postgres</code></pre>\r\n\r\n<p>Create the database user that will be used by Django to access the database:</p>\r\n\r\n<pre>\r\n<code class="language-sql">CREATE USER &lt;my-user&gt; WITH PASSWORD ‘&lt;my-password&gt;’; </code></pre>\r\n\r\n<p>On Windows, the database already exists but needs to be owned by the new user just created, so that he can have all the privileges when accessing it later from Django. This will be the last instruction required on Windows; the rest of the tutorial will focus on Arch Linux:</p>\r\n\r\n<pre>\r\n<code class="language-sql">ALTER DATABASE &lt;my-database&gt; OWNER TO &lt;my-user&gt;;</code></pre>\r\n\r\n<p>On Arch Linux, we need to create a GIS database (as has already been done on Windows but &lsquo;manually&rsquo;) and specify the previous user as its owner:</p>\r\n\r\n<pre>\r\n<code class="language-sql">CREATE DATABASE &lt;my-database&gt; OWNER &lt;username&gt;;</code></pre>\r\n\r\n<p>Always on Arch Linux, we exit the psql prompt with &quot;\\q&quot;, and connect to this new database with the newly-created user:</p>\r\n\r\n<pre>\r\n<code class="language-bash">psql -U postgres &lt;database&gt;</code></pre>\r\n\r\n<p>Then, we enable the PostGIS extension on this database on Arch Linux:</p>\r\n\r\n<pre>\r\n<code class="language-sql">CREATE EXTENSION postgis;</code></pre>\r\n\r\n<p>Now that the GIS database is created with its user, we can consider this part of the tutorial done. In the next step, we will see how to develop a <a href="http://www.gistutorials.com/article/11" target="_blank">GIS web app with GeoDjango</a> that connects to the database that has been created.</p>	Displaying a map in a Django Webapp (1/3): Creating a GIS database with PostgreSQL and PostGIS	displaying-maps-in-a-django-webapp	2018-02-25 19:47:34.659568+00	t	\N	1	images/windows-postgis-installation.png
11	<p>We will use the geo-database configured in the <a href="http://www.gistutorials.com/article/10" target="_blank">previous tutorial</a>, fill one of its table with world cities geocoordinates, and show these cities eventually on a map in the Django web app that will be configured in this tutorial.</p>\r\n\r\n<h3>Create a new Django project</h3>\r\n\r\n<p>Install <a href="https://www.djangoproject.com/" target="_blank">Django</a> (v2 is the latest version) using the Python package manager <a href="https://en.wikipedia.org/wiki/Pip_(package_manager)" target="_blank">pip</a>:</p>\r\n\r\n<pre>\r\n<code class="language-bash">pip install django</code></pre>\r\n\r\n<p>Another python package that must be installed is the PostgreSQL adapter for python, <a href="https://wiki.postgresql.org/wiki/Psycopg" target="_blank">Psycopg</a>:</p>\r\n\r\n<pre>\r\n<code class="language-bash">pip install psycopg2</code></pre>\r\n\r\n<p>For the purpose of this tutorial, we&rsquo;ll go briefly through the steps necessary to create a new Django project with a single app. A more comprehensive tutorial dedicated to creating a <a href="https://docs.djangoproject.com/en/2.0/intro/tutorial01/" target="_blank">poll application</a> with Django can be found on the official website, and constitutes a good starting point to get started with Django.</p>\r\n\r\n<p>Create a new directory and generate a new project inside of it. Let&rsquo;s call our project &quot;world&quot;:</p>\r\n\r\n<pre>\r\n<code class="language-bash">cd world\r\ndjango-admin startproject world .</code></pre>\r\n\r\n<p>Afterwards, we need to configure Django to have access to the database we created using the user added in the <a href="http://www.gistutorials.com/article/10" target="_blank">first part</a> of this tutorial. To do so, in your project folder open the file &lsquo;world/settings.py` and add the following (don&rsquo;t forget to set the database name and the user/password accordingly):</p>\r\n\r\n<pre>\r\n<code class="language-python">DATABASES = {\r\n    'default': {\r\n        'ENGINE': 'django.contrib.gis.db.backends.postgis',\r\n        'NAME': '&lt;database&gt;',\r\n        'USER': '&lt;database-user&gt;',\r\n        'PASSWORD': '',\r\n        'HOST': 'localhost',\r\n        'PORT': '',\r\n    }\r\n}</code></pre>\r\n\r\n<p>If the database has been configured correctly, you can now run the server from the command-line:</p>\r\n\r\n<pre>\r\n<code class="language-bash">python manage.py runserver</code></pre>\r\n\r\n<p>And you should see a webpage similar to the one below if you go to &quot;localhost:8000&quot; in your browser:</p>\r\n\r\n<p><img alt="" src="http://www.gistutorials.com/media/images/geodjango-initial-app.png" /></p>\r\n\r\n<h3>Create a new Django app</h3>\r\n\r\n<p><a href="https://docs.djangoproject.com/en/2.0/ref/contrib/gis/" target="_blank">GeoDjango</a> is a module included with Django that adds support to Geospatial data. One important feature of the GeoDjango module we will need in this tutorial are geospatial fields in Django models. However, GeoDjango needs to be enabled first in our project by adding it to the list of installed apps in &quot;world/settings.py&quot;:</p>\r\n\r\n<pre>\r\n<code class="language-python">INSTALLED_APPS = [\r\n    'django.contrib.gis',\r\n    '...'\r\n]</code></pre>\r\n\r\n<p>Next, we create a single app in our project. We&#39;ve called this app &quot;cities&quot; since it will represent the list of cities we will copy from the vector file to the database later:</p>\r\n\r\n<pre>\r\n<code class="language-python">python manage.py startapp cities</code></pre>\r\n\r\n<p>And add this app the list of apps in &quot;world/settings.py&quot;, as we did for GeoDjango:</p>\r\n\r\n<pre>\r\n<code class="language-python">INSTALLED_APPS = [\r\n    'django.contrib.gis',\r\n    'cities.apps.CitiesConfig',\r\n]</code></pre>\r\n\r\n<p>In this app, we create a model which represents an abstraction of the database table, by adding the code below to &quot;cities/models.py&quot;. This model has two fields representing the name and the coordinates of the cities respectively. The meta class modifies the formatting in the Django admin backend by telling it to sort the cities by name and to set the plural of the word &lsquo;city&rsquo; to &quot;cities&quot; (not &quot;citys&quot; as we would get by default):</p>\r\n\r\n<pre>\r\n<code class="language-python">from django.db import models\r\nfrom django.contrib.gis.db import models as geomodels\r\n\r\n\r\nclass City(models.Model):\r\n    name = models.CharField(max_length=100, blank=False)\r\n    geometry = geomodels.PointField()\r\n\r\n    class Meta:\r\n        # order of drop-down list items\r\n        ordering = ('name',)\r\n\r\n        # plural form in admin view\r\n        verbose_name_plural = 'cities'</code></pre>\r\n\r\n<p>From this model a database table can generated with the commands below. Note that the second command will also create Django&rsquo;s admin module tables that will store the users credentials among others:</p>\r\n\r\n<pre>\r\n<code class="language-bash">python manage.py makemigrations cities\r\npython manage.py migrate</code></pre>\r\n\r\n<p>We can verify the creation of the database table with PgAdmin4.</p>\r\n\r\n<p><img alt="" src="http://www.gistutorials.com/media/images/geodjango-initial-table.png" /></p>\r\n\r\n<h3>Convert shapefile to PostGIS table</h3>\r\n\r\n<p>The vector shapefile of interest in this tutorial is a map of the <a href="http://www.naturalearthdata.com/downloads/10m-cultural-vectors/" target="_blank">world cities</a> that can be also downloaded from this <a href="http://www.gistutorials.com/media/geo/cities.zip">link</a>. This shapefile can be opened and visualized with QGIS. This is what it should look like if it is superimposed on Google maps (over 7000 cities all over the world):</p>\r\n\r\n<p><img alt="" src="http://www.gistutorials.com/media/images/geodjango-qgis.png" /></p>\r\n\r\n<p>We will need to initially convert this vector shapefile to the PostGIS format of our database table (i.e. basically fill the table with the shapefile content), so we can access it later from the Django&rsquo;s admin section (localhost:8000/admin) and from the front-end (localhost:8000/cities).</p>\r\n\r\n<p>We must install the GDAL commands which if on Windows are included with QGIS. After installing <a href="https://qgis.org" target="_blank">QGIS</a> the commands we will need can be found in the <a href="https://trac.osgeo.org/osgeo4w/" target="_blank">OSGeo4W</a> Shell, which was installed with QGIS as well. On Arch Linux, this can be done differently by installing GDAL from the terminal:</p>\r\n\r\n<pre>\r\n<code class="language-bash">pacman -s gdal</code></pre>\r\n\r\n<p>On Windows, to avoid having a GDALException later regarding a missing EPSG csv file, we&#39;re going to be proactive and add a system environment variable called &quot;GDAL_DATA&quot; having as a value: &quot;C:\\Program Files\\QGIS 2.18\\share\\gdal&quot;.</p>\r\n\r\n<p>The conversion from the .shp format to the PostGIS table is carried out with a single command. Don&rsquo;t forget to provide the database name, the database user and password, as well as the database table name that can be retrieved using the PostgreSQL GUI client, pgAdmin4. The -append option ensures that we&rsquo;re adding to the existing table generated from the previous Django model, instead of creating the database table from scratch:</p>\r\n\r\n<pre>\r\n<code class="language-bash">ogr2ogr -f "PostgreSQL" PG:"dbname=&lt;dbname&gt; user=&lt;db-user&gt; password=&lt;db-pass&gt;" &lt;shapefile&gt; -nln &lt;tablename&gt; -append</code></pre>\r\n\r\n<p>We can verify that the database table has been correctly filled with the cities names and geocoordinates in PgAdmin4:</p>\r\n\r\n<p><img alt="" src="http://www.gistutorials.com/media/images/geodjango-filled-table.png" /></p>\r\n\r\n<h3>Configure URL routes</h3>\r\n\r\n<p>Url routes have to be set-up so that the cities app can be accessed from the browser. We thus open &quot;world/urls&quot;, and add the url to the new app in the urlpatterns list:</p>\r\n\r\n<pre>\r\n<code class="language-python">from django.conf.urls import url, include\r\nfrom django.contrib import admin\r\n\r\n\r\nurlpatterns = [\r\n    url(r'^cities/', include('cities.urls')),\r\n    url('admin/', admin.site.urls),\r\n]</code></pre>\r\n\r\n<p>All it does is to redirect any url that starts with &quot;cities&quot; to the urls file in the cities app. So what we have left to do is to create this file &quot;cities/urls.py&quot;:</p>\r\n\r\n<pre>\r\n<code class="language-python">from django.conf.urls import url\r\nfrom . import views\r\n\r\n\r\napp_name = 'cities'\r\n\r\nurlpatterns = [\r\n    # city detail view\r\n    url(r'^city/(?P&lt;pk&gt;[0-9]+)$',\r\n        views.CitiesDetailView.as_view(), name='city-detail'),\r\n]</code></pre>\r\n\r\n<h3>Show cities on a map</h3>\r\n\r\n<p>In the following we&rsquo;ll display on the browser the cities that we copied inside the database table. <a href="http://django-leaflet.readthedocs.io" target="_blank">Django-leaflet</a> is based on <a href="http://leafletjs.com/" target="_blank">leaflet</a> and is installed the same way as any python module. We&rsquo;re going to make use of Django-leaflet to display maps on our Django web app:</p>\r\n\r\n<pre>\r\n<code class="language-python">pip install django-leaflet</code></pre>\r\n\r\n<p>This app needs to be registered among the list of installed apps in &quot;world/settings.py&quot;:</p>\r\n\r\n<pre>\r\n<code class="language-python">INSTALLED_APPS = [\r\n    'leaflet',\r\n    'django.contrib.gis',\r\n    'cities.apps.CitiesConfig',\r\n]</code></pre>\r\n\r\n<p>The url route added in the last part of the previous section forwards any request under the form &quot;cities/&lt;number&gt;&quot; to the CitiesDetailView class. This class is added to &quot;cities/views.py&quot;:</p>\r\n\r\n<pre>\r\n<code class="language-python">from django.views.generic import DetailView\r\nfrom .models import City\r\n\r\n\r\nclass CitiesDetailView(DetailView):\r\n    """\r\n        City detail view.\r\n    """\r\n    template_name = 'cities/city-detail.html'\r\n    model = City</code></pre>\r\n\r\n<p>The generic class we&rsquo;re inheriting from (django.views.generic.DetailView) already implements the detail view for a single city. We therefore just need to provide the template path and the model to render. The template for this detail page will be located in &quot;templates/cities/city-detail.html&quot;. Its content can be found below, where we followed the examples on <a href="http://django-leaflet.readthedocs.io/en/latest/installation.html" target="_blank">Django-leaflet docs</a>. The only part that deserves a small explanation is in the javascript block, where we&rsquo;re putting a marker with leaflet at the coordinates of the city in question:</p>\r\n\r\n<pre>\r\n<code class="language-html">{% load leaflet_tags %}\r\n{% leaflet_css %}\r\n{% leaflet_js %}\r\n\r\n&lt;div&gt;\r\n    &lt;h1&gt;{{ city.name }}&lt;/h1&gt;\r\n    {% leaflet_map "main" callback="map_init" %}\r\n&lt;/div&gt;\r\n\r\n&lt;script type="text/javascript"&gt;\r\n    function map_init(map, options) {\r\n        // get point lat and lon\r\n        var lon = "{{ city.geometry.x }}";\r\n        var lat = "{{ city.geometry.y }}";\r\n\r\n        // zoom to point &amp; add it to map\r\n        map.setView([lat, lon], 12);\r\n        L.marker([lat, lon]).addTo(map);\r\n    }\r\n&lt;/script&gt;</code></pre>\r\n\r\n<p>Now that both the view, the url route and the template have been configured if you browse to http://localhost:8000/cities/city/7223 for example, you should see a map of the city of San Francesco:</p>\r\n\r\n<p><img alt="" src="http://www.gistutorials.com/media/images/geodjango-front-city.png" /></p>\r\n\r\n<p>This tutorial has been relatively long. The next one in the series, which is actually the <a href="http://www.gistutorials.com/article/12" target="_blank">last one</a>, will cover how to display maps on the Django admin page using Leaflet as always.</p>\r\n\r\n<h3>GEOS error on Windows</h3>\r\n\r\n<p>On Windows, when I browse to the url just created (e.g. localhost:8000/cities/city/1), Django started complaining about the GEOS library which couldn&rsquo;t be found. To fix it, just open the settings.py and add at the end the path to this library (libgeos_c.dll), which is located inside the PostgreSQL folder:</p>\r\n\r\n<pre>\r\n<code class="language-python">GEOS_LIBRARY_PATH = 'C:/Program Files/PostgreSQL/10/bin/libgeos_c.dll'</code></pre>\r\n\r\n<p>In the last part of this tutorial we&#39;ll see how to <a href="http://www.gistutorials.com/article/12" target="_blank">visualize the map on the Django Admin section</a>.</p>	Displaying a map in a Django Webapp (2/3): Develop a GIS webapp with GeoDjango	develop-a-gis-webapp-with-geodjango	2018-02-25 20:33:10.954212+00	t	\N	1	images/geodjango-front-city.png
12	<p>We need to configure the Django&rsquo;s admin section to be able to visualize the cities table entries there (see the <a href="http://www.gistutorials.com/article/11" target="_blank">previous tutorial</a>). First of all, we will need to create a superuser that can be used to login to localhost:8000/admin:</p>\r\n\r\n<pre>\r\n<code class="language-python">python manage.py createsuperuser</code></pre>\r\n\r\n<p>Then, we edit the content of &quot;cities/admin.py&quot; the same way it was done on the <a href="http://django-leaflet.readthedocs.io/en/latest/widget.html" target="_blank">leaflet docs</a>. In the piece of code below, we&rsquo;re overriding the class LeafletGeoAdmin to get annotated <a href="https://www.openstreetmap.org" target="_blank">OpenStreetMap</a> in the backend. Eventually, the app is registered on the admin section on the last line of this file.</p>\r\n\r\n<pre>\r\n<code class="language-python">from django.contrib.gis import admin\r\nfrom .models import City\r\nfrom leaflet.admin import LeafletGeoAdmin\r\n\r\n\r\nclass CityAdmin(LeafletGeoAdmin):\r\n    # fields to show in admin listview\r\n    list_display = ('name', 'geometry')\r\n\r\n\r\n# register models in the admin site\r\nadmin.site.register(City, CityAdmin)</code></pre>\r\n\r\n<p>Each city can be visualized on the Django backend by browsing to &quot;localhost:8000/admin/cities/city/&lt;id&gt;&quot;:</p>\r\n\r\n<p><img alt="" src="http://www.gistutorials.com/media/images/django-admin-city.png" /></p>	Displaying a map in a Django Webapp (3/3): Showing a map on the Django admin	showing-a-map-on-the-django-admin	2018-02-25 21:40:51.731348+00	t	\N	1	images/django-admin-city.png
13	<p>This tutorial requires that a Django project has already been set-up with a PostGIS database. If you&#39;re not sure about the steps needed to configure Django to serve geospatial data, <a href="http://www.gistutorials.com/article/10" target="_blank">this tutorial</a> is a nice way to get started.</p>\r\n\r\n<p>In this tutorial, we will see how to polygonize a raster image using <a href="https://github.com/mapbox/rasterio" target="_blank">rasterio</a> to turn it into a vector. This vector can be subsequently either saved on the disk with <a href="https://github.com/Toblerity/Fiona" target="_blank">Fiona</a> or on the PostGIS database using <a href="https://www.djangoproject.com/" target="_blank">Django</a> (as will be done in this tutorial). We can then visualize the produced polygons one by one on the Django admin page.</p>\r\n\r\n<p>Rasterio basically relies on <a href="http://www.gdal.org/" target="_blank">GDAL</a> and offers the same functionalities found in the <a href="https://pcjericks.github.io/py-gdalogr-cookbook/" target="_blank">python-GDAL</a> wrapper, but with a more pythonic syntax, and hopefully fixes or at least avoids the common issues encountered with GDAL.</p>\r\n\r\n<p>Rasterio can be installed in Linux with a pip:</p>\r\n\r\n<pre>\r\n<code class="language-python">pip install rasterio</code></pre>\r\n\r\n<p>However if on Windows, you need to install it with gdal from the wheel files built by Christoph Gohlke and available <a href="https://www.lfd.uci.edu/%7Egohlke/pythonlibs/" target="_blank">here</a>.</p>\r\n\r\n<p>The GeoTiff image we will polygonize is a subset of a binary <a href="http://www.gistutorials.com/media/geo/flood-map.tif" target="_blank">flood map</a> I&#39;ve produced. It shows the town of Tewkesbury in South-West England which was <a href="https://en.wikipedia.org/wiki/2007_United_Kingdom_floods" target="_blank">flooded in 2007</a>.</p>\r\n\r\n<p>I&#39;m going to assume in what follows that a Django app (let&#39;s call it &quot;maps&quot;) has already been created and configured in &quot;&lt;project&gt;/settings.py&quot;. You can check out <a href="http://www.gistutorials.com/article/11" target="_blank">this tutorial</a> if you&#39;re not sure how to proceed. Inside the &quot;maps&quot; app, we will add the code below to &quot;maps/models.py&quot; that will result in the creation of a database table called &quot;maps_flood&quot; later:</p>\r\n\r\n<pre>\r\n<code class="language-python">from django.db import models\r\nfrom django.contrib.gis.db import models as geomodels\r\n\r\n\r\nclass Flood(models.Model):\r\n    geometry = geomodels.PolygonField()</code></pre>\r\n\r\n<p>The database table that will be generated after executing the next two shell commands will contain a single geometry column (besides the id obviously), corresponding to the PolygonField in the model class above:</p>\r\n\r\n<pre>\r\n<code class="language-bash">python manage.py makemigrations maps\r\npython manage.py migrate</code></pre>\r\n\r\n<p>Now we&#39;ll move on to the &quot;maps/views.py&quot; file where the actual vectorization of the raster is carried out. We begin by importing the libraries needed:</p>\r\n\r\n<pre>\r\n<code class="language-python">import rasterio\r\nfrom rasterio.features import shapes\r\nfrom shapely.geometry import shape\r\nfrom .models import Flood\r\nfrom django.contrib.gis.geos import GEOSGeometry\r\nfrom django.http import HttpResponse</code></pre>\r\n\r\n<p>Then, we create a view function that we&#39;ll call &quot;vectorize()&quot; and which gets as an argument the http request. The code that we&#39;ll explain below (reading the raster image &amp; vectorizing it) will go inside this function:</p>\r\n\r\n<pre>\r\n<code class="language-python">def vectorize(request):\r\n    pass</code></pre>\r\n\r\n<p>We read the <a href="http://www.gistutorials.com/media/geo/flood-map.tif" target="_blank">GeoTiff image</a> by passing the path to it as an argument to rasterio.open(). The raster variable below contains the <a href="http://www.numpy.org/" target="_blank">NumPy</a> array image, while we keep copies of the projection in the <a href="https://en.wikipedia.org/wiki/Spatial_reference_system" target="_blank">crs</a> variable and the geocoordinates of the upper-left corner of the image in the transform variable. The crs and the transform variables will prove useful later to get a georeferenced vector. We&#39;ll actually need during the insertion in the database table the <a href="http://www.epsg.org/" target="_blank">EPSG</a>, which can be extracted from the crs dictionary in a quite straightforward way:</p>\r\n\r\n<pre>\r\n<code class="language-python">with rasterio.open("&lt;absolute_path_to_image&gt;") as dataset:\r\n    raster = dataset.read(1)\r\n    crs = dataset.crs\r\n    transform = dataset.transform\r\n    epsg = crs['init'].lstrip('epsg:')</code></pre>\r\n\r\n<p>The polygonization of the raster comes next and deserves a thorough explanation. In the following for loop, we&#39;re going through the pair of polygons, values returned by rasterio.features.shapes(). As mentioned above I&#39;ve passed the transform variable to this function, in order to keep the same georeferencing of the input raster in the resulting vector. We also give as input to this function, besides the raster to polygonize, the same raster but as a boolean mask, so that the polygonization algorithm isn&#39;t performed on the zero pixels in the raster.</p>\r\n\r\n<p>Enough with the loop header. The for loop contains a single instruction which creates a polygon entry in the &quot;maps_flood&quot; database table in every iteration. We give as input to the create method the polygon object in the standard projection <a href="https://en.wikipedia.org/wiki/World_Geodetic_System" target="_blank">EPSG:4326</a> (the default one). The geometry argument accepts a GEOSGeometry object, which itself received as an input the polygon in the <a href="https://en.wikipedia.org/wiki/Well-known_text" target="_blank">WKT format</a> (hence the trick below):</p>\r\n\r\n<pre>\r\n<code class="language-python">for polygon, value in shapes(raster, mask=raster.astype(bool), transform=transform):\r\n    Flood.objects.create(geometry=GEOSGeometry(shape(polygon).wkt, srid=epsg))</code></pre>\r\n\r\n<p>We close the view function by returning an http response having as a content an h1 html tag, to show the user on the browser that the vectorization process is done:</p>\r\n\r\n<pre>\r\n<code class="language-python">def vectorize(request):\r\n    …\r\n    return HttpResponse('&lt;h1&gt;Vectorization done&lt;/h1&gt;')</code></pre>\r\n\r\n<p>Afterwards, just like in the <a href="http://www.gistutorials.com/article/11" target="_blank">previous tutorial</a> we make the view created browsable by adding this code to &quot;&lt;project&gt;/urls.py&quot;:</p>\r\n\r\n<pre>\r\n<code class="language-python">from django.contrib import admin\r\nfrom django.urls import path\r\nfrom django.conf.urls import url, include\r\n\r\n\r\nurlpatterns = [\r\n    url(r'', include('maps.urls')),\r\n    path('admin/', admin.site.urls),\r\n]</code></pre>\r\n\r\n<p>And this other piece of code to &quot;maps/urls.py&quot;, to make the view function created above accessible from &quot;localhost:8000/&quot;:</p>\r\n\r\n<pre>\r\n<code class="language-python">from django.conf.urls import url\r\nfrom . import views\r\n\r\n\r\napp_name = 'maps'\r\n\r\nurlpatterns = [\r\n    url(r'^$', views.vectorize, name='flood-vectorize'),\r\n]</code></pre>\r\n\r\n<p>If you browse to localhost:8000 the vectorization of the raster should be carried out and the obtained polygons should be saved in the PostGIS database. Note that this operations might take a few seconds, because polygonizing a raster and saving each polygon created to the database can be resource-intensive, especially if the number of polygons is important (429 resulting polygons in my case). The result can be visualized by going to the Django Admin section (localhost:8000/admin). <a href="https://github.com/makinacorpus/django-leaflet" target="_blank">Django-leaflet</a> is needed to visualize the blue polygon on the map below on the admin section. As before <a href="http://www.gistutorials.com/article/11" target="_blank">this tutorial</a> can come in handy to set it up:</p>\r\n\r\n<p><img alt="" src="http://www.gistutorials.com/media/images/polygonize-admin-polygon.png" /></p>\r\n\r\n<p>In a future tutorial, I will show how we can display all the polygons on a <a href="https://www.mapbox.com/" target="_blank">Mapbox map</a> in this same Django web app.</p>	Display a polygonized raster in a Django Webapp (1/2): Polygonize a raster and save polygons to the database	polygonize-a-raster-with-rasterio-and-save-it-in-a	2018-03-11 11:08:36.62581+00	t	\N	1	images/polygonize-admin-polygon.png
14	<p>This tutorial is a follow up to a <a href="http://www.gistutorials.com/article/13" target="_blank">previous tutorial</a> in which we saw how to polygonize a raster with <a href="https://github.com/mapbox/rasterio" target="_blank">rasterio</a>, and save the polygons produced to a <a href="https://postgis.net/" target="_blank">PostGIS</a> database associated with a <a href="https://www.djangoproject.com/" target="_blank">Django</a> webapp we have developed. In this tutorial, we&#39;ll simply display the polygons created with <a href="https://www.mapbox.com/" target="_blank">Mapbox</a> on a front-end Django template.</p>\r\n\r\n<p>First things first, we begin by adding the route to the Django view we&#39;ll create later to&quot;&lt;my-app&gt;/urls.py&quot;. The Django app was called &quot;maps&quot; in the <a href="http://www.gistutorials.com/article/13" target="_blank">previous tutorial</a>:</p>\r\n\r\n<pre>\r\n<code class="language-python">urlpatterns = [\r\n    url(r'^$', views.list, name='polygons-list'),\r\n]</code></pre>\r\n\r\n<p>After that, we create a view function in &quot;&lt;my-app&gt;/views.py&quot; called &quot;list()&quot;. You might&#39;ve noticed that the second parameter we passed to the url route is a reference to this view function. The view function gets the HttpRequest as a parameter and returns as an HttpResponse the template to show when the user browses to the route above:</p>\r\n\r\n<pre>\r\n<code class="language-python">def list(request):\r\n    pass</code></pre>\r\n\r\n<p>Inside this view function, we&#39;re going to do a query to get all the polygons that were saved in the &quot;Flood&quot; database table in the <a href="http://www.gistutorials.com/article/13" target="_blank">previous tutorial</a>. I found out that Mapbox accepts as an argument a string variable formatted as <a href="http://geojson.org/" target="_blank">GeoJSON</a>. To put our variable in the correct format, below I&#39;m going through all the geometry entries in the database table to eventually add them to a Multi-Polygon variable. In the last line of the code below, we&#39;re telling the view to render the template (&quot;maps/flood-list.html&quot;), to which we&#39;re passing the Multi-Polygon:</p>\r\n\r\n<pre>\r\n<code class="language-python">def list(request):\r\n    extents = Extent.objects.all()\r\n    geometries = [extent.geometry for extent in extents]\r\n    multipolygon = MultiPolygon(geometries)\r\n\r\n    return render(request, 'maps/flood-list.html', {\r\n        'multipolygon': multipolygon.geojson\r\n    })</code></pre>\r\n\r\n<p>Don&#39;t forget to import at the top of the view.py file all the functions we&#39;ve utilized above:</p>\r\n\r\n<pre>\r\n<code class="language-python">from .models import Flood\r\nfrom django.contrib.gis.geos import MultiPolygon\r\nfrom django.shortcuts import render</code></pre>\r\n\r\n<p>We move on to the template file we create inside the Django app folder, precisely in &quot;maps/templates/maps/flood-list.html&quot;. Inside the template we need to first and foremost load Mapbox&#39;s CSS and JS files which are hosted online on the official website:</p>\r\n\r\n<pre>\r\n<code class="language-html">&lt;link href='https://api.tiles.mapbox.com/mapbox-gl-js/v0.44.1/mapbox-gl.css' rel='stylesheet' /&gt;\r\n&lt;script src='https://api.tiles.mapbox.com/mapbox-gl-js/v0.44.1/mapbox-gl.js'&gt;&lt;/script&gt;</code></pre>\r\n\r\n<p>The HTML/JS code that comes afterwards is large but don&#39;t be intimidated, it&#39;s quite easy to grasp. The HTML consists simply of a div identified in the JS with its id (&quot;map&quot;) which will receive subsequently the map.</p>\r\n\r\n<pre>\r\n<code class="language-html">&lt;div id='map' style='width: 800px; height: 500px;'&gt;&lt;/div&gt;</code></pre>\r\n\r\n<p>As for the JS code, it&#39;s required of the user (you) to have an account on <a href="https://www.mapbox.com/" target="_blank">Mapbox</a>. After signing up, you should receive a token that you use to set the value of the variable &quot;mapboxgl.accessToken&quot;. Afterwards, we parse as a geojson the value of the Multi-Polygon we passed from the view. Note that it&#39;s also marked as safe to avoid that the geojson code is sanitized.</p>\r\n\r\n<p>In the second-to-last chunk of code inside the script tags, we&#39;re rendering the <a href="https://www.openstreetmap.org" target="_blank">OpenStreetMap</a> centered around our AOI, identified by its geocoordinates. And finally we add the multi-polygon on a separate geojson layer, colored in a slightly transparent blue color:</p>\r\n\r\n<pre>\r\n<code class="language-html">&lt;script&gt;\r\n    // mapbox token\r\n    mapboxgl.accessToken = '&lt;token&gt;';\r\n\r\n    // parse passed multipolygon geojson string\r\n    var multipolygon = JSON.parse('{{ multipolygon | safe }}');\r\n\r\n    // show map\r\n    var map = new mapboxgl.Map({\r\n        container: 'map',\r\n        style: 'mapbox://styles/mapbox/streets-v9',\r\n        center: [-2.1580, 51.9923],\r\n        zoom: 12\r\n    });\r\n\r\n    // show geojson multipolygon on mapbox\r\n    map.on('load', function () {\r\n        map.addLayer({\r\n            'id': '0',\r\n            'type': 'fill',\r\n            'source': {\r\n                'type': 'geojson',\r\n                'data': multipolygon\r\n            },\r\n            'paint': {\r\n                'fill-color': '#00f',\r\n                'fill-opacity': 0.8\r\n            }\r\n        });\r\n    });\r\n&lt;/script&gt;</code></pre>\r\n\r\n<p>If you go to &quot;localhost:8000&quot; in your browser, you should see something that looks like this:</p>\r\n\r\n<p><img alt="" src="http://www.gistutorials.com/media/images/mapbox-show-polygons.png" /></p>	Display a polygonized raster in a Django Webapp (2/2): Show the polygons in a Mapbox	display-polygonized-raster-in-a-django-webapp-22-s	2018-03-24 20:22:45.131926+00	t	\N	1	images/mapbox-show-polygons.png
\.


--
-- Data for Name: articles_article_tags; Type: TABLE DATA; Schema: public; Owner: hakim
--

COPY articles_article_tags (id, article_id, tag_id) FROM stdin;
7	7	5
9	8	8
10	8	7
11	9	9
12	9	10
13	10	11
14	10	12
15	10	13
16	10	14
17	11	11
18	11	12
19	11	13
20	11	14
21	12	11
22	12	12
23	12	13
24	12	14
25	13	12
26	13	14
27	13	15
28	14	8
29	14	16
30	14	12
31	14	14
\.


--
-- Data for Name: articles_category; Type: TABLE DATA; Schema: public; Owner: hakim
--

COPY articles_category (id, name, slug) FROM stdin;
\.


--
-- Data for Name: articles_tag; Type: TABLE DATA; Schema: public; Owner: hakim
--

COPY articles_tag (id, name, slug) FROM stdin;
5	Google Earth Engine	google-earth-engine
7	GeoPandas	geopandas
8	GeoJSON	geojson
9	Scikit-learn	scikit-learn
10	GDAL	gdal
11	PostgreSQL	postgresql
12	PostGIS	postgis
13	Leaflet	leaflet
14	Django	django
15	Rasterio	rasterio
16	Mapbox	mapbox
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: hakim
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: hakim
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: hakim
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add user	2	add_user
5	Can change user	2	change_user
6	Can delete user	2	delete_user
7	Can add permission	3	add_permission
8	Can change permission	3	change_permission
9	Can delete permission	3	delete_permission
10	Can add group	4	add_group
11	Can change group	4	change_group
12	Can delete group	4	delete_group
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add book	7	add_book
20	Can change book	7	change_book
21	Can delete book	7	delete_book
22	Can add quote	8	add_quote
23	Can change quote	8	change_quote
24	Can delete quote	8	delete_quote
25	Can add author	9	add_author
26	Can change author	9	change_author
27	Can delete author	9	delete_author
34	Can add category	12	add_category
35	Can change category	12	change_category
36	Can delete category	12	delete_category
37	Can add tag	13	add_tag
38	Can change tag	13	change_tag
39	Can delete tag	13	delete_tag
43	Can add site	15	add_site
44	Can change site	15	change_site
45	Can delete site	15	delete_site
46	Can add member	16	add_member
47	Can change member	16	change_member
48	Can delete member	16	delete_member
49	Can add category	17	add_category
50	Can change category	17	change_category
51	Can delete category	17	delete_category
52	Can add article	18	add_article
53	Can change article	18	change_article
54	Can delete article	18	delete_article
55	Can add tag	19	add_tag
56	Can change tag	19	change_tag
57	Can delete tag	19	delete_tag
58	Can add nonce	20	add_nonce
59	Can change nonce	20	change_nonce
60	Can delete nonce	20	delete_nonce
61	Can add code	21	add_code
62	Can change code	21	change_code
63	Can delete code	21	delete_code
64	Can add user social auth	22	add_usersocialauth
65	Can change user social auth	22	change_usersocialauth
66	Can delete user social auth	22	delete_usersocialauth
67	Can add association	23	add_association
68	Can change association	23	change_association
69	Can delete association	23	delete_association
70	Can add partial	24	add_partial
71	Can change partial	24	change_partial
72	Can delete partial	24	delete_partial
73	Can add expense	25	add_expense
74	Can change expense	25	change_expense
75	Can delete expense	25	delete_expense
76	Can add Token	26	add_token
77	Can change Token	26	change_token
78	Can delete Token	26	delete_token
79	Can add city	27	add_city
80	Can change city	27	change_city
81	Can delete city	27	delete_city
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: hakim
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
18	!qgwLo9GUNT9MsMDvjcQg0B7pwDjK9jvDtJqoN4RF	2017-08-10 15:00:29.475624+00	f	h4k1m0u	Benoudjit	Hakim		f	t	2017-08-06 23:37:24.637073+00
19	!19451Y1riMocQ3xQU5knDRHfY9DPMp8mkcx2V1sK	2017-08-10 15:00:40.335101+00	f	h.benoudjit	Hakim	Benoudjit	h.benoudjit@gmail.com	f	t	2017-08-06 23:37:29.422482+00
20	!0peRmJlXVYANbWvH0LXd0RAbKs7c0LzBPEYp44PR	2017-08-12 23:24:30.840866+00	f	HakimBenoudjit	Hakim	Benoudjit		f	t	2017-08-12 23:24:30.819248+00
1	pbkdf2_sha256$100000$Do7Ez2WCVsI5$R0CwU/zQ8DBhouSZSIAZChXZJyBuWj4fPuR0Q25UJr0=	2018-04-07 20:31:08.360714+00	t	hakim	Benoudjit	Hakim	a.benoudjit@surrey.ac.uk	t	t	2017-02-05 00:59:43+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: hakim
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: hakim
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: hakim
--

COPY authtoken_token (key, created, user_id) FROM stdin;
522f10966b6c6b2e1a7321183d73cbd0314800b4	2018-01-13 00:13:31.194553+00	1
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: hakim
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2017-02-06 23:30:24.765409+00	1	Book object	1	[{"added": {}}]	7	1
2	2017-02-06 23:30:29.053977+00	2	Book object	1	[{"added": {}}]	7	1
3	2017-02-06 23:30:34.198043+00	3	Book object	1	[{"added": {}}]	7	1
4	2017-02-06 23:50:51.742732+00	1	quote1	1	[{"added": {}}]	8	1
5	2017-02-06 23:50:57.512618+00	2	quote2	1	[{"added": {}}]	8	1
6	2017-02-06 23:51:02.37254+00	3	quote3	1	[{"added": {}}]	8	1
7	2017-02-07 22:35:42.521758+00	1	quote1	2	[]	8	1
8	2017-02-07 22:43:25.63372+00	1	quote1	2	[]	8	1
9	2017-02-07 22:54:13.370046+00	1	quote1	2	[{"changed": {"fields": ["book"]}}]	8	1
10	2017-02-07 23:37:12.349577+00	1	Max Weber	1	[{"added": {}}]	9	1
11	2017-02-07 23:37:54.605794+00	2	Viktor E. Frankl	1	[{"added": {}}]	9	1
12	2017-02-07 23:39:08.581642+00	3	Stephen R. Covey	1	[{"added": {}}]	9	1
13	2017-02-07 23:39:42.212811+00	4	Niall Ferguson	1	[{"added": {}}]	9	1
14	2017-02-07 23:40:31.63214+00	5	Richard Denny	1	[{"added": {}}]	9	1
15	2017-02-07 23:49:46.842281+00	1	The Protestant ethic and the spirit of capitalism	2	[{"changed": {"fields": ["title", "isbn", "author"]}}]	7	1
16	2017-02-07 23:50:16.392356+00	2	Man's search for ultimate meaning	2	[{"changed": {"fields": ["title", "isbn", "author"]}}]	7	1
17	2017-02-07 23:51:13.543881+00	3	The 7 habits of highly effective people	2	[{"changed": {"fields": ["title", "isbn", "author"]}}]	7	1
18	2017-02-07 23:51:44.205337+00	4	The house of Rothschild : money's prophets, 1798-1848	1	[{"added": {}}]	7	1
19	2017-02-07 23:54:52.638914+00	6	Robert Peston	1	[{"added": {}}]	9	1
20	2017-02-07 23:55:15.583733+00	5	Who runs Britain?	1	[{"added": {}}]	7	1
21	2017-02-07 23:56:21.94291+00	7	Benjamin Franklin	1	[{"added": {}}]	9	1
22	2017-02-07 23:57:27.80818+00	1	He that idly loses five shillings’ worth of time, loses five shillings, and might as prudently throw five shillings into the sea.	2	[{"changed": {"fields": ["text", "book", "author"]}}]	8	1
23	2017-02-08 00:04:05.881283+00	8	Blaise Pascal	1	[{"added": {}}]	9	1
24	2017-02-08 00:11:15.053231+00	2	The heart has its reasons which reason knows not of.	2	[{"changed": {"fields": ["text", "author"]}}]	8	1
25	2017-02-08 00:19:21.535334+00	9	Johann Wolfgang von Goethe	1	[{"added": {}}]	9	1
26	2017-02-08 00:20:56.814698+00	3	Treat a man as he is, and he will remain as he is; treat a man as he can and should be, and he will become as he can and should be.	2	[{"changed": {"fields": ["text", "author"]}}]	8	1
27	2017-02-08 00:22:23.039296+00	10	Lao Tzu	1	[{"added": {}}]	9	1
28	2017-02-08 00:22:52.458735+00	4	A thousand mile journey begins with the first step.	1	[{"added": {}}]	8	1
29	2017-02-08 00:29:24.891279+00	5	To act and not to be acted upon.	1	[{"added": {}}]	8	1
30	2017-02-08 00:30:32.756606+00	6	Satisfied needs do not motivate.	1	[{"added": {}}]	8	1
31	2017-02-08 00:33:31.580552+00	11	James Mayer de Rothschild	1	[{"added": {}}]	9	1
32	2017-02-08 00:34:18.669939+00	7	The honest and upright man will always value a man of similar character.	1	[{"added": {}}]	8	1
33	2017-02-08 00:34:42.512643+00	12	Nathan Mayer Rothschild	1	[{"added": {}}]	9	1
34	2017-02-08 00:36:54.716099+00	8	stick to your brewery, and you may be the great brewer of London. But be a brewer, and a banker, and a merchant, and a manufacturer, and you will soon be in the Gazette.	1	[{"added": {}}]	8	1
35	2017-02-08 00:37:08.895629+00	8	Stick to your brewery, and you may be the great brewer of London. But be a brewer, and a banker, and a merchant, and a manufacturer, and you will soon be in the Gazette.	2	[{"changed": {"fields": ["text"]}}]	8	1
36	2017-02-08 00:37:48.659204+00	13	Mayer Amschel Rothschild	1	[{"added": {}}]	9	1
37	2017-02-08 00:38:30.722891+00	9	If you can't make yourself loved, make yourself feared.	1	[{"added": {}}]	8	1
38	2017-02-08 00:46:00.166289+00	14	Plutarch	1	[{"added": {}}]	9	1
39	2017-02-08 00:46:07.883429+00	10	A bundle of arrows could not be broken, but the individual arrows could.	1	[{"added": {}}]	8	1
40	2017-02-08 00:46:54.138448+00	15	Heinrich Heine	1	[{"added": {}}]	9	1
41	2017-02-08 00:47:38.302804+00	11	Money is round and rolls away, but education endures.	1	[{"added": {}}]	8	1
42	2017-02-08 00:50:34.785233+00	16	Karl Marx	1	[{"added": {}}]	9	1
43	2017-02-08 00:50:57.342834+00	12	History repeats itself, first as tragedy, then as farce.	1	[{"added": {}}]	8	1
44	2017-02-08 00:53:57.329611+00	17	Earl Nightingale	1	[{"added": {}}]	9	1
45	2017-02-08 00:55:31.579337+00	6	Selling to win	1	[{"added": {}}]	7	1
46	2017-02-08 00:55:37.757299+00	13	We become what we think about.	1	[{"added": {}}]	8	1
47	2017-02-08 00:56:30.623148+00	18	Andrew Carnegie	1	[{"added": {}}]	9	1
48	2017-02-08 00:57:46.963386+00	14	Give me a man of average ability but a burning desire and I will give you a winner in return every time.	1	[{"added": {}}]	8	1
49	2017-02-08 01:01:38.765192+00	19	Dennis Waitley	1	[{"added": {}}]	9	1
50	2017-02-08 01:05:18.452708+00	15	The winners in life think constantly in terms of I can, I will and I am. Losers on the other hand concentrate their waking thoughts on what they should have done or what they can't do.	1	[{"added": {}}]	8	1
51	2017-02-08 01:06:03.75454+00	20	Mary Kay Ash	1	[{"added": {}}]	9	1
52	2017-02-08 01:09:04.419476+00	16	There are those in this world who make things happen. There are those in this world who watch things happen. And there are those who wonder what happened!	1	[{"added": {}}]	8	1
53	2017-02-08 01:10:03.318921+00	21	John Galsworthy	1	[{"added": {}}]	9	1
54	2017-02-08 01:10:13.236723+00	17	If you do not think about the future, you cannot have one.	1	[{"added": {}}]	8	1
55	2017-02-08 01:13:15.375638+00	22	Seneca	1	[{"added": {}}]	9	1
56	2017-02-08 01:13:19.257196+00	18	Luck is what happens when preparation meets opportunity.	1	[{"added": {}}]	8	1
57	2017-02-08 01:14:14.672628+00	23	Thomas Edison	1	[{"added": {}}]	9	1
58	2017-02-08 01:15:43.091213+00	19	I haven't failed 500 times, I have just found 500 ways it doesn't work.	1	[{"added": {}}]	8	1
59	2017-02-08 01:16:45.08438+00	24	Mia Hamm	1	[{"added": {}}]	9	1
60	2017-02-08 01:16:47.338449+00	20	Success breeds success.	1	[{"added": {}}]	8	1
61	2017-02-08 01:17:44.883837+00	21	You cannot fail until you throw the towel in.	1	[{"added": {}}]	8	1
62	2017-02-08 01:18:53.115342+00	22	A 'No' is only a 'No, not today'.	1	[{"added": {}}]	8	1
63	2017-02-08 01:19:54.208628+00	25	John Bytheway	1	[{"added": {}}]	9	1
64	2017-02-08 01:19:58.309391+00	23	Success by the inch is a cinch but by the yard it is hard.	1	[{"added": {}}]	8	1
65	2017-02-08 01:21:02.252731+00	24	If it works, don't fix it.	1	[{"added": {}}]	8	1
66	2017-02-08 01:21:57.320824+00	26	Gerald Ronson	1	[{"added": {}}]	9	1
67	2017-02-08 01:21:59.650587+00	25	There is no substitute for hard work. Don't talk about it, do it.	1	[{"added": {}}]	8	1
68	2017-02-08 01:25:27.281084+00	27	Oscar Wilde	1	[{"added": {}}]	9	1
69	2017-02-08 01:25:41.67988+00	26	Experience is the hardest kind of teacher. It gives you the test first and the lesson afterwards.	1	[{"added": {}}]	8	1
70	2017-02-08 01:26:49.481651+00	28	Warren Buffett	1	[{"added": {}}]	9	1
71	2017-02-08 01:27:13.058576+00	27	The greatest investment anyone can make is in oneself.	1	[{"added": {}}]	8	1
72	2017-02-08 01:29:34.403045+00	29	Allan Leighton	1	[{"added": {}}]	9	1
73	2017-02-08 01:35:22.896975+00	28	Every day we [business leaders] metaphorically decide what the 'animals' want. We don't talk to the animals enough, we don't ask the animals enough questions, and we don't listen to the animals enough	1	[{"added": {}}]	8	1
74	2017-02-08 01:35:43.034314+00	30	Forrest Gump	1	[{"added": {}}]	9	1
75	2017-02-08 01:37:20.295683+00	29	If you go to the zoo, always take something to feed the animals, even if the signs say 'Do not feed the animals.' It wasn't the animals that put them signs up.	1	[{"added": {}}]	8	1
76	2017-02-11 23:21:05.88853+00	30	When the student is ready the teacher will appear.	1	[{"added": {}}]	8	1
77	2017-02-11 23:25:12.344759+00	31	William Cowper	1	[{"added": {}}]	9	1
78	2017-02-11 23:25:39.430429+00	31	Variety is the spice of life.	1	[{"added": {}}]	8	1
79	2017-02-11 23:31:57.802802+00	32	Practice makes perfect.	1	[{"added": {}}]	8	1
80	2017-02-11 23:34:31.578607+00	32	Joe Studwell	1	[{"added": {}}]	9	1
81	2017-02-11 23:34:37.417944+00	7	How Asia works : success and failure in the world's most dynamic region	1	[{"added": {}}]	7	1
82	2017-02-11 23:38:21.978847+00	33	Geography is not destiny in development.	1	[{"added": {}}]	8	1
83	2017-02-12 12:37:54.509729+00	33	Mark Twain	1	[{"added": {}}]	9	1
84	2017-02-12 12:45:36.099538+00	34	The man who does not read has no advantage over the man who cannot read.	1	[{"added": {}}]	8	1
85	2017-02-12 12:46:56.606571+00	34	George Santayana	1	[{"added": {}}]	9	1
86	2017-02-12 12:47:09.580703+00	35	Those who cannot remember the past are condemned to repeat it.	1	[{"added": {}}]	8	1
87	2017-02-12 12:49:10.109174+00	35	Abraham Lincoln	1	[{"added": {}}]	9	1
88	2017-02-12 12:49:14.956242+00	36	You can fool all the people some of the time, and some of the people all the time, but you cannot fool all the people all the time.	1	[{"added": {}}]	8	1
89	2017-02-12 13:12:27.405392+00	36	Len Deighton	1	[{"added": {}}]	9	1
90	2017-02-12 13:12:37.156491+00	8	Spy line	1	[{"added": {}}]	7	1
91	2017-02-12 13:13:47.175744+00	37	The outcome names the deed.	1	[{"added": {}}]	8	1
92	2017-02-12 14:15:40.519465+00	38	Reactive people are often affected by their physical environment. If the weather is good, they feel good. If it isn’t, it affects their attitude and their performance. Proactive people can carry their	1	[{"added": {}}]	8	1
93	2017-02-19 02:58:36.577246+00	1	He that idly loses five shillings’ worth of time, loses five shillings, and might as prudently throw five shillings into the sea.	2	[{"changed": {"fields": ["slug"]}}]	8	1
94	2017-02-19 02:58:41.185933+00	2	The heart has its reasons which reason knows not of.	2	[{"changed": {"fields": ["slug"]}}]	8	1
95	2017-02-19 02:58:46.708925+00	3	Treat a man as he is, and he will remain as he is; treat a man as he can and should be, and he will become as he can and should be.	2	[{"changed": {"fields": ["slug"]}}]	8	1
96	2017-02-19 02:58:52.136028+00	4	A thousand mile journey begins with the first step.	2	[{"changed": {"fields": ["slug"]}}]	8	1
97	2017-02-19 02:58:56.59407+00	5	To act and not to be acted upon.	2	[{"changed": {"fields": ["slug"]}}]	8	1
98	2017-02-19 02:59:01.940755+00	6	Satisfied needs do not motivate.	2	[{"changed": {"fields": ["slug"]}}]	8	1
99	2017-02-19 02:59:06.129358+00	7	The honest and upright man will always value a man of similar character.	2	[{"changed": {"fields": ["slug"]}}]	8	1
100	2017-02-19 02:59:11.579424+00	8	Stick to your brewery, and you may be the great brewer of London. But be a brewer, and a banker, and a merchant, and a manufacturer, and you will soon be in the Gazette.	2	[{"changed": {"fields": ["slug"]}}]	8	1
101	2017-02-19 02:59:20.343613+00	7	The honest and upright man will always value a man of similar character.	2	[]	8	1
102	2017-02-19 02:59:24.308512+00	8	Stick to your brewery, and you may be the great brewer of London. But be a brewer, and a banker, and a merchant, and a manufacturer, and you will soon be in the Gazette.	2	[]	8	1
103	2017-02-19 02:59:29.645016+00	9	If you can't make yourself loved, make yourself feared.	2	[{"changed": {"fields": ["slug"]}}]	8	1
104	2017-02-19 02:59:34.234087+00	10	A bundle of arrows could not be broken, but the individual arrows could.	2	[{"changed": {"fields": ["slug"]}}]	8	1
105	2017-02-19 02:59:38.410591+00	10	A bundle of arrows could not be broken, but the individual arrows could.	2	[]	8	1
106	2017-02-19 02:59:44.09134+00	38	Reactive people are often affected by their physical environment. If the weather is good, they feel good. If it isn’t, it affects their attitude and their performance. Proactive people can carry their	2	[{"changed": {"fields": ["slug"]}}]	8	1
107	2017-02-19 02:59:48.527206+00	37	The outcome names the deed.	2	[{"changed": {"fields": ["slug"]}}]	8	1
108	2017-02-19 02:59:53.240916+00	36	You can fool all the people some of the time, and some of the people all the time, but you cannot fool all the people all the time.	2	[{"changed": {"fields": ["slug"]}}]	8	1
109	2017-02-19 02:59:57.117832+00	14	Give me a man of average ability but a burning desire and I will give you a winner in return every time.	2	[{"changed": {"fields": ["slug"]}}]	8	1
110	2017-02-19 03:00:01.048094+00	18	Luck is what happens when preparation meets opportunity.	2	[{"changed": {"fields": ["slug"]}}]	8	1
111	2017-02-19 03:00:04.689655+00	15	The winners in life think constantly in terms of I can, I will and I am. Losers on the other hand concentrate their waking thoughts on what they should have done or what they can't do.	2	[{"changed": {"fields": ["slug"]}}]	8	1
112	2017-02-19 03:00:08.782635+00	12	History repeats itself, first as tragedy, then as farce.	2	[{"changed": {"fields": ["slug"]}}]	8	1
113	2017-02-19 03:00:12.784547+00	26	Experience is the hardest kind of teacher. It gives you the test first and the lesson afterwards.	2	[{"changed": {"fields": ["slug"]}}]	8	1
114	2017-02-19 03:00:17.089265+00	28	Every day we [business leaders] metaphorically decide what the 'animals' want. We don't talk to the animals enough, we don't ask the animals enough questions, and we don't listen to the animals enough	2	[{"changed": {"fields": ["slug"]}}]	8	1
115	2017-02-19 03:00:21.555028+00	23	Success by the inch is a cinch but by the yard it is hard.	2	[{"changed": {"fields": ["slug"]}}]	8	1
116	2017-02-19 03:00:25.631294+00	15	The winners in life think constantly in terms of I can, I will and I am. Losers on the other hand concentrate their waking thoughts on what they should have done or what they can't do.	2	[]	8	1
117	2017-02-19 03:00:29.882006+00	30	When the student is ready the teacher will appear.	2	[{"changed": {"fields": ["slug"]}}]	8	1
315	2017-02-25 00:26:49.106442+00	27	Preparation	1	[{"added": {}}]	13	1
118	2017-02-19 03:00:33.640991+00	14	Give me a man of average ability but a burning desire and I will give you a winner in return every time.	2	[]	8	1
119	2017-02-19 03:00:38.288177+00	34	The man who does not read has no advantage over the man who cannot read.	2	[{"changed": {"fields": ["slug"]}}]	8	1
120	2017-02-19 03:00:42.574133+00	31	Variety is the spice of life.	2	[{"changed": {"fields": ["slug"]}}]	8	1
121	2017-02-19 03:00:46.108878+00	27	The greatest investment anyone can make is in oneself.	2	[{"changed": {"fields": ["slug"]}}]	8	1
122	2017-02-19 03:00:50.041889+00	24	If it works, don't fix it.	2	[{"changed": {"fields": ["slug"]}}]	8	1
123	2017-02-19 03:00:56.704721+00	32	Practice makes perfect.	2	[{"changed": {"fields": ["slug"]}}]	8	1
124	2017-02-19 03:01:04.767955+00	22	A 'No' is only a 'No, not today'.	2	[{"changed": {"fields": ["slug"]}}]	8	1
125	2017-02-19 03:01:34.213488+00	20	Success breeds success.	2	[{"changed": {"fields": ["slug"]}}]	8	1
126	2017-02-19 03:01:38.604233+00	23	Success by the inch is a cinch but by the yard it is hard.	2	[]	8	1
127	2017-02-19 03:01:42.986373+00	27	The greatest investment anyone can make is in oneself.	2	[]	8	1
128	2017-02-19 03:01:47.031789+00	25	There is no substitute for hard work. Don't talk about it, do it.	2	[{"changed": {"fields": ["slug"]}}]	8	1
129	2017-02-19 03:01:52.009406+00	13	We become what we think about.	2	[{"changed": {"fields": ["slug"]}}]	8	1
130	2017-02-19 03:01:56.909929+00	2	The heart has its reasons which reason knows not of.	2	[]	8	1
131	2017-02-19 03:02:29.494886+00	35	Those who cannot remember the past are condemned to repeat it.	2	[{"changed": {"fields": ["slug"]}}]	8	1
132	2017-02-19 03:02:54.002649+00	33	Geography is not destiny in development.	2	[{"changed": {"fields": ["slug"]}}]	8	1
133	2017-02-19 03:03:10.260554+00	29	If you go to the zoo, always take something to feed the animals, even if the signs say 'Do not feed the animals.' It wasn't the animals that put them signs up.	2	[{"changed": {"fields": ["slug"]}}]	8	1
134	2017-02-19 03:03:25.333152+00	17	If you do not think about the future, you cannot have one.	2	[{"changed": {"fields": ["slug"]}}]	8	1
135	2017-02-19 03:03:38.768716+00	21	You cannot fail until you throw the towel in.	2	[{"changed": {"fields": ["slug"]}}]	8	1
136	2017-02-19 03:03:50.444669+00	19	I haven't failed 500 times, I have just found 500 ways it doesn't work.	2	[{"changed": {"fields": ["slug"]}}]	8	1
137	2017-02-19 03:04:02.096356+00	16	There are those in this world who make things happen. There are those in this world who watch things happen. And there are those who wonder what happened!	2	[{"changed": {"fields": ["slug"]}}]	8	1
138	2017-02-19 03:04:13.283601+00	11	Money is round and rolls away, but education endures.	2	[{"changed": {"fields": ["slug"]}}]	8	1
139	2017-02-19 16:00:43.073879+00	1	Economy	1	[{"added": {}}]	12	1
140	2017-02-19 16:00:44.591124+00	1	He that idly loses five shillings’ worth of time, loses five shillings, and might as prudently throw five shillings into the sea.	2	[{"changed": {"fields": ["category"]}}]	8	1
141	2017-02-19 16:00:55.256664+00	2	History	1	[{"added": {}}]	12	1
142	2017-02-19 16:00:56.586375+00	12	History repeats itself, first as tragedy, then as farce.	2	[{"changed": {"fields": ["category"]}}]	8	1
143	2017-02-19 16:01:59.880394+00	3	Self-help	1	[{"added": {}}]	12	1
144	2017-02-19 16:02:01.622961+00	21	You cannot fail until you throw the towel in.	2	[{"changed": {"fields": ["category"]}}]	8	1
145	2017-02-19 16:02:31.036227+00	4	Negotiation	1	[{"added": {}}]	12	1
146	2017-02-19 16:02:33.617222+00	22	A 'No' is only a 'No, not today'.	2	[{"changed": {"fields": ["category"]}}]	8	1
147	2017-02-19 16:02:44.229992+00	33	Geography is not destiny in development.	2	[{"changed": {"fields": ["category"]}}]	8	1
148	2017-02-19 16:03:33.515155+00	5	Politics	1	[{"added": {}}]	12	1
149	2017-02-19 16:03:42.286056+00	36	You can fool all the people some of the time, and some of the people all the time, but you cannot fool all the people all the time.	2	[{"changed": {"fields": ["category"]}}]	8	1
150	2017-02-19 16:03:56.817927+00	6	Marketing	1	[{"added": {}}]	12	1
151	2017-02-19 16:03:58.615475+00	28	Every day we [business leaders] metaphorically decide what the 'animals' want. We don't talk to the animals enough, we don't ask the animals enough questions, and we don't listen to the animals enough	2	[{"changed": {"fields": ["category"]}}]	8	1
152	2017-02-19 16:05:16.92584+00	26	Experience is the hardest kind of teacher. It gives you the test first and the lesson afterwards.	2	[{"changed": {"fields": ["category"]}}]	8	1
153	2017-02-19 16:05:32.59057+00	17	If you do not think about the future, you cannot have one.	2	[{"changed": {"fields": ["category"]}}]	8	1
154	2017-02-19 16:05:43.292276+00	38	Reactive people are often affected by their physical environment. If the weather is good, they feel good. If it isn’t, it affects their attitude and their performance. Proactive people can carry their	2	[{"changed": {"fields": ["category"]}}]	8	1
155	2017-02-19 16:05:50.623054+00	25	There is no substitute for hard work. Don't talk about it, do it.	2	[{"changed": {"fields": ["category"]}}]	8	1
156	2017-02-19 16:05:57.147094+00	5	To act and not to be acted upon.	2	[{"changed": {"fields": ["category"]}}]	8	1
157	2017-02-19 16:06:15.696173+00	13	We become what we think about.	2	[{"changed": {"fields": ["category"]}}]	8	1
158	2017-02-19 16:07:23.369624+00	7	Inspirational	1	[{"added": {}}]	12	1
159	2017-02-19 16:07:24.61396+00	4	A thousand mile journey begins with the first step.	2	[{"changed": {"fields": ["category"]}}]	8	1
160	2017-02-19 16:07:47.12187+00	8	Business	1	[{"added": {}}]	12	1
161	2017-02-19 16:07:48.4758+00	14	Give me a man of average ability but a burning desire and I will give you a winner in return every time.	2	[{"changed": {"fields": ["category"]}}]	8	1
162	2017-02-19 16:07:55.017443+00	24	If it works, don't fix it.	2	[{"changed": {"fields": ["category"]}}]	8	1
163	2017-02-19 16:08:01.198438+00	9	If you can't make yourself loved, make yourself feared.	2	[{"changed": {"fields": ["category"]}}]	8	1
164	2017-02-19 16:08:23.821315+00	6	Satisfied needs do not motivate.	2	[{"changed": {"fields": ["category"]}}]	8	1
165	2017-02-19 16:08:51.444964+00	9	Creativity	1	[{"added": {}}]	12	1
166	2017-02-19 16:08:53.052476+00	16	There are those in this world who make things happen. There are those in this world who watch things happen. And there are those who wonder what happened!	2	[{"changed": {"fields": ["category"]}}]	8	1
167	2017-02-19 16:09:07.309067+00	32	Practice makes perfect.	2	[{"changed": {"fields": ["category"]}}]	8	1
168	2017-02-19 16:09:18.488107+00	10	Education	1	[{"added": {}}]	12	1
169	2017-02-19 16:09:19.479503+00	11	Money is round and rolls away, but education endures.	2	[{"changed": {"fields": ["category"]}}]	8	1
170	2017-02-19 16:09:30.654712+00	18	Luck is what happens when preparation meets opportunity.	2	[{"changed": {"fields": ["category"]}}]	8	1
171	2017-02-19 16:09:38.053646+00	19	I haven't failed 500 times, I have just found 500 ways it doesn't work.	2	[{"changed": {"fields": ["category"]}}]	8	1
172	2017-02-19 16:09:45.624839+00	29	If you go to the zoo, always take something to feed the animals, even if the signs say 'Do not feed the animals.' It wasn't the animals that put them signs up.	2	[{"changed": {"fields": ["category"]}}]	8	1
173	2017-02-19 16:09:53.172348+00	8	Stick to your brewery, and you may be the great brewer of London. But be a brewer, and a banker, and a merchant, and a manufacturer, and you will soon be in the Gazette.	2	[{"changed": {"fields": ["category"]}}]	8	1
174	2017-02-19 16:09:59.974955+00	7	The honest and upright man will always value a man of similar character.	2	[{"changed": {"fields": ["category"]}}]	8	1
175	2017-02-19 16:10:15.848469+00	30	When the student is ready the teacher will appear.	2	[{"changed": {"fields": ["category"]}}]	8	1
176	2017-02-19 16:10:29.686059+00	15	The winners in life think constantly in terms of I can, I will and I am. Losers on the other hand concentrate their waking thoughts on what they should have done or what they can't do.	2	[{"changed": {"fields": ["category"]}}]	8	1
177	2017-02-19 16:10:46.830153+00	35	Those who cannot remember the past are condemned to repeat it.	2	[{"changed": {"fields": ["category"]}}]	8	1
178	2017-02-19 16:10:55.689171+00	20	Success breeds success.	2	[{"changed": {"fields": ["category"]}}]	8	1
179	2017-02-19 16:11:06.235625+00	34	The man who does not read has no advantage over the man who cannot read.	2	[{"changed": {"fields": ["category"]}}]	8	1
180	2017-02-19 16:11:16.912258+00	27	The greatest investment anyone can make is in oneself.	2	[{"changed": {"fields": ["category"]}}]	8	1
181	2017-02-19 16:11:48.986627+00	11	Spirituality	1	[{"added": {}}]	12	1
182	2017-02-19 16:11:51.313223+00	2	The heart has its reasons which reason knows not of.	2	[{"changed": {"fields": ["category"]}}]	8	1
183	2017-02-19 16:12:06.001501+00	23	Success by the inch is a cinch but by the yard it is hard.	2	[{"changed": {"fields": ["category"]}}]	8	1
184	2017-02-19 16:12:50.866739+00	12	Philosophy	1	[{"added": {}}]	12	1
185	2017-02-19 16:12:53.728674+00	37	The outcome names the deed.	2	[{"changed": {"fields": ["category"]}}]	8	1
186	2017-02-19 16:13:08.478415+00	31	Variety is the spice of life.	2	[{"changed": {"fields": ["category"]}}]	8	1
187	2017-02-19 16:13:19.258033+00	3	Treat a man as he is, and he will remain as he is; treat a man as he can and should be, and he will become as he can and should be.	2	[{"changed": {"fields": ["category"]}}]	8	1
188	2017-02-19 16:13:36.354712+00	10	A bundle of arrows could not be broken, but the individual arrows could.	2	[{"changed": {"fields": ["category"]}}]	8	1
189	2017-02-19 16:58:45.878517+00	37	Gwendolyn Willow Wilson	1	[{"added": {}}]	9	1
190	2017-02-19 16:59:05.49101+00	9	Ms. Marvel, Vol. 2: Generation Why	1	[{"added": {}}]	7	1
191	2017-02-19 16:59:28.678996+00	30	When the student is ready the teacher will appear.	2	[{"changed": {"fields": ["book"]}}]	8	1
192	2017-02-19 17:08:33.870188+00	38	Paulo Coelho	1	[{"added": {}}]	9	1
193	2017-02-19 17:09:48.684105+00	13	Life	1	[{"added": {}}]	12	1
194	2017-02-19 17:10:07.865544+00	39	If everybody loves you, something is wrong. Find at least one enemy to keep you alert.	1	[{"added": {}}]	8	1
195	2017-02-19 17:13:47.829904+00	39	Jim Rohn	1	[{"added": {}}]	9	1
196	2017-02-19 17:14:04.03035+00	13	Social life	2	[{"changed": {"fields": ["title"]}}]	12	1
197	2017-02-19 17:14:12.701043+00	40	You are the average of the five people you spend the most time with.	1	[{"added": {}}]	8	1
198	2017-02-19 19:35:47.167007+00	7	How Asia works : success and failure in the world's most dynamic region	2	[{"changed": {"fields": ["slug"]}}]	7	1
199	2017-02-19 19:35:51.612777+00	2	Man's search for ultimate meaning	2	[{"changed": {"fields": ["slug"]}}]	7	1
200	2017-02-19 19:35:54.981679+00	9	Ms. Marvel, Vol. 2: Generation Why	2	[{"changed": {"fields": ["slug"]}}]	7	1
201	2017-02-19 19:36:00.959163+00	6	Selling to win	2	[{"changed": {"fields": ["slug"]}}]	7	1
202	2017-02-19 19:36:04.988961+00	8	Spy line	2	[{"changed": {"fields": ["slug"]}}]	7	1
203	2017-02-19 19:36:09.307291+00	8	Spy line	2	[]	7	1
204	2017-02-19 19:36:12.630378+00	3	The 7 habits of highly effective people	2	[{"changed": {"fields": ["slug"]}}]	7	1
205	2017-02-19 19:36:15.666346+00	4	The house of Rothschild : money's prophets, 1798-1848	2	[{"changed": {"fields": ["slug"]}}]	7	1
206	2017-02-19 19:36:19.201923+00	1	The Protestant ethic and the spirit of capitalism	2	[{"changed": {"fields": ["slug"]}}]	7	1
207	2017-02-19 19:36:22.130961+00	5	Who runs Britain?	2	[{"changed": {"fields": ["slug"]}}]	7	1
208	2017-02-19 19:36:25.480636+00	4	The house of Rothschild : money's prophets, 1798-1848	2	[]	7	1
209	2017-02-19 19:38:26.36854+00	8	Business	2	[{"changed": {"fields": ["slug"]}}]	12	1
210	2017-02-19 19:38:32.515402+00	9	Creativity	2	[{"changed": {"fields": ["slug"]}}]	12	1
211	2017-02-19 19:38:36.499127+00	1	Economy	2	[{"changed": {"fields": ["slug"]}}]	12	1
212	2017-02-19 19:38:39.794395+00	10	Education	2	[{"changed": {"fields": ["slug"]}}]	12	1
213	2017-02-19 19:38:42.84249+00	10	Education	2	[]	12	1
214	2017-02-19 19:38:46.079203+00	2	History	2	[{"changed": {"fields": ["slug"]}}]	12	1
215	2017-02-19 19:38:48.954875+00	7	Inspirational	2	[{"changed": {"fields": ["slug"]}}]	12	1
216	2017-02-19 19:38:52.320521+00	6	Marketing	2	[{"changed": {"fields": ["slug"]}}]	12	1
217	2017-02-19 19:38:55.487933+00	4	Negotiation	2	[{"changed": {"fields": ["slug"]}}]	12	1
218	2017-02-19 19:38:58.297312+00	12	Philosophy	2	[{"changed": {"fields": ["slug"]}}]	12	1
219	2017-02-19 19:39:01.703327+00	5	Politics	2	[{"changed": {"fields": ["slug"]}}]	12	1
220	2017-02-19 19:39:04.993501+00	3	Self-help	2	[{"changed": {"fields": ["slug"]}}]	12	1
221	2017-02-19 19:39:08.545729+00	13	Social life	2	[{"changed": {"fields": ["slug"]}}]	12	1
222	2017-02-19 19:39:11.421869+00	11	Spirituality	2	[{"changed": {"fields": ["slug"]}}]	12	1
223	2017-02-20 20:20:32.181993+00	35	Abraham Lincoln	2	[{"changed": {"fields": ["slug"]}}]	9	1
224	2017-02-20 20:20:37.016156+00	29	Allan Leighton	2	[{"changed": {"fields": ["slug"]}}]	9	1
225	2017-02-20 20:20:40.507419+00	18	Andrew Carnegie	2	[{"changed": {"fields": ["slug"]}}]	9	1
226	2017-02-20 20:20:43.626662+00	7	Benjamin Franklin	2	[{"changed": {"fields": ["slug"]}}]	9	1
227	2017-02-20 20:20:46.817299+00	8	Blaise Pascal	2	[{"changed": {"fields": ["slug"]}}]	9	1
228	2017-02-20 20:20:51.359583+00	19	Dennis Waitley	2	[{"changed": {"fields": ["slug"]}}]	9	1
229	2017-02-20 20:20:54.945732+00	19	Dennis Waitley	2	[]	9	1
230	2017-02-20 20:20:59.129855+00	17	Earl Nightingale	2	[{"changed": {"fields": ["slug"]}}]	9	1
231	2017-02-20 20:21:04.623725+00	30	Forrest Gump	2	[{"changed": {"fields": ["slug"]}}]	9	1
232	2017-02-20 20:21:08.584173+00	34	George Santayana	2	[{"changed": {"fields": ["slug"]}}]	9	1
233	2017-02-20 20:21:13.304254+00	31	William Cowper	2	[{"changed": {"fields": ["slug"]}}]	9	1
234	2017-02-20 20:21:17.503904+00	28	Warren Buffett	2	[{"changed": {"fields": ["slug"]}}]	9	1
235	2017-02-20 20:21:21.298492+00	4	Niall Ferguson	2	[{"changed": {"fields": ["slug"]}}]	9	1
236	2017-02-20 20:21:25.072953+00	20	Mary Kay Ash	2	[{"changed": {"fields": ["slug"]}}]	9	1
237	2017-02-20 20:21:28.377662+00	39	Jim Rohn	2	[{"changed": {"fields": ["slug"]}}]	9	1
238	2017-02-20 20:21:31.621826+00	15	Heinrich Heine	2	[{"changed": {"fields": ["slug"]}}]	9	1
239	2017-02-20 20:21:34.712413+00	32	Joe Studwell	2	[{"changed": {"fields": ["slug"]}}]	9	1
240	2017-02-20 20:21:38.206994+00	9	Johann Wolfgang von Goethe	2	[{"changed": {"fields": ["slug"]}}]	9	1
241	2017-02-20 20:21:41.54417+00	25	John Bytheway	2	[{"changed": {"fields": ["slug"]}}]	9	1
242	2017-02-20 20:21:44.863521+00	21	John Galsworthy	2	[{"changed": {"fields": ["slug"]}}]	9	1
243	2017-02-20 20:21:48.833975+00	24	Mia Hamm	2	[{"changed": {"fields": ["slug"]}}]	9	1
244	2017-02-20 20:21:52.064679+00	13	Mayer Amschel Rothschild	2	[{"changed": {"fields": ["slug"]}}]	9	1
245	2017-02-20 20:21:55.732579+00	4	Niall Ferguson	2	[]	9	1
246	2017-02-20 20:21:59.043353+00	27	Oscar Wilde	2	[{"changed": {"fields": ["slug"]}}]	9	1
247	2017-02-20 20:22:04.554345+00	38	Paulo Coelho	2	[{"changed": {"fields": ["slug"]}}]	9	1
248	2017-02-20 20:22:09.153873+00	14	Plutarch	2	[{"changed": {"fields": ["slug"]}}]	9	1
249	2017-02-20 20:22:14.192522+00	5	Richard Denny	2	[{"changed": {"fields": ["slug"]}}]	9	1
250	2017-02-20 20:22:20.277881+00	5	Richard Denny	2	[]	9	1
251	2017-02-20 20:22:25.400619+00	6	Robert Peston	2	[{"changed": {"fields": ["slug"]}}]	9	1
252	2017-02-20 20:22:30.632081+00	22	Seneca	2	[{"changed": {"fields": ["slug"]}}]	9	1
253	2017-02-20 20:22:35.688053+00	3	Stephen R. Covey	2	[{"changed": {"fields": ["slug"]}}]	9	1
254	2017-02-20 20:22:40.012601+00	23	Thomas Edison	2	[{"changed": {"fields": ["slug"]}}]	9	1
255	2017-02-20 20:22:44.414846+00	2	Viktor E. Frankl	2	[{"changed": {"fields": ["slug"]}}]	9	1
256	2017-02-20 20:22:48.07079+00	28	Warren Buffett	2	[]	9	1
257	2017-02-20 20:23:01.568759+00	37	Gwendolyn Willow Wilson	2	[{"changed": {"fields": ["slug"]}}]	9	1
258	2017-02-20 20:23:14.824578+00	36	Len Deighton	2	[{"changed": {"fields": ["slug"]}}]	9	1
259	2017-02-20 20:23:23.280273+00	33	Mark Twain	2	[{"changed": {"fields": ["slug"]}}]	9	1
260	2017-02-20 20:23:35.89658+00	26	Gerald Ronson	2	[{"changed": {"fields": ["slug"]}}]	9	1
261	2017-02-20 20:23:45.03326+00	16	Karl Marx	2	[{"changed": {"fields": ["slug"]}}]	9	1
262	2017-02-20 20:23:57.329743+00	1	Max Weber	2	[{"changed": {"fields": ["slug"]}}]	9	1
263	2017-02-20 20:24:07.573682+00	10	Lao Tzu	2	[{"changed": {"fields": ["slug"]}}]	9	1
264	2017-02-20 20:24:16.608027+00	11	James Mayer de Rothschild	2	[{"changed": {"fields": ["slug"]}}]	9	1
265	2017-02-20 20:24:27.665889+00	12	Nathan Mayer Rothschild	2	[{"changed": {"fields": ["slug"]}}]	9	1
266	2017-02-24 23:45:36.81775+00	1	Geography	1	[{"added": {}}]	13	1
267	2017-02-24 23:45:47.751332+00	2	Development	1	[{"added": {}}]	13	1
268	2017-02-24 23:45:51.844178+00	33	Geography is not destiny in development.	2	[]	8	1
269	2017-02-24 23:46:35.278877+00	32	Practice makes perfect.	2	[]	8	1
270	2017-02-24 23:47:04.283417+00	3	Practice	1	[{"added": {}}]	13	1
271	2017-02-24 23:47:09.784346+00	32	Practice makes perfect.	2	[]	8	1
272	2017-02-24 23:47:17.505786+00	32	Practice makes perfect.	2	[]	8	1
273	2017-02-24 23:47:27.59546+00	4	Success	1	[{"added": {}}]	13	1
274	2017-02-24 23:47:29.337727+00	20	Success breeds success.	2	[]	8	1
275	2017-02-24 23:48:02.638852+00	5	Pragmatism	1	[{"added": {}}]	13	1
276	2017-02-24 23:48:04.298607+00	37	The outcome names the deed.	2	[]	8	1
277	2017-02-24 23:48:31.173242+00	6	History	1	[{"added": {}}]	13	1
278	2017-02-24 23:48:32.919202+00	12	History repeats itself, first as tragedy, then as farce.	2	[]	8	1
279	2017-02-24 23:48:52.65551+00	7	Life	1	[{"added": {}}]	13	1
280	2017-02-24 23:49:04.781595+00	8	Variety	1	[{"added": {}}]	13	1
281	2017-02-24 23:49:06.20431+00	31	Variety is the spice of life.	2	[]	8	1
282	2017-02-24 23:49:31.931102+00	9	Education	1	[{"added": {}}]	13	1
283	2017-02-24 23:49:32.924679+00	30	When the student is ready the teacher will appear.	2	[]	8	1
284	2017-02-24 23:49:50.916875+00	10	Negotiation	1	[{"added": {}}]	13	1
285	2017-02-24 23:49:52.467368+00	22	A 'No' is only a 'No, not today'.	2	[]	8	1
286	2017-02-24 23:50:25.593137+00	11	Journey	1	[{"added": {}}]	13	1
287	2017-02-24 23:50:27.241071+00	4	A thousand mile journey begins with the first step.	2	[]	8	1
288	2017-02-24 23:50:34.252238+00	32	Practice makes perfect.	2	[]	8	1
289	2017-02-24 23:50:56.519862+00	12	Efficiency	1	[{"added": {}}]	13	1
290	2017-02-24 23:50:57.743749+00	24	If it works, don't fix it.	2	[]	8	1
291	2017-02-24 23:51:13.137384+00	13	Love	1	[{"added": {}}]	13	1
292	2017-02-24 23:51:18.59622+00	14	Fear	1	[{"added": {}}]	13	1
293	2017-02-24 23:51:21.718093+00	9	If you can't make yourself loved, make yourself feared.	2	[]	8	1
294	2017-02-24 23:51:40.910413+00	15	Satisfaction	1	[{"added": {}}]	13	1
295	2017-02-24 23:52:15.333835+00	16	Need	1	[{"added": {}}]	13	1
296	2017-02-24 23:52:24.766267+00	17	Motivation	1	[{"added": {}}]	13	1
297	2017-02-24 23:52:28.207876+00	6	Satisfied needs do not motivate.	2	[]	8	1
298	2017-02-24 23:52:46.771533+00	18	Business	1	[{"added": {}}]	13	1
299	2017-02-24 23:52:50.679308+00	22	A 'No' is only a 'No, not today'.	2	[]	8	1
300	2017-02-24 23:53:20.869651+00	19	Time management	1	[{"added": {}}]	13	1
301	2017-02-24 23:53:32.638413+00	20	Money	1	[{"added": {}}]	13	1
302	2017-02-24 23:53:35.67099+00	1	He that idly loses five shillings’ worth of time, loses five shillings, and might as prudently throw five shillings into the sea.	2	[]	8	1
303	2017-02-24 23:54:25.320071+00	21	Experience	1	[{"added": {}}]	13	1
304	2017-02-24 23:54:33.928181+00	26	Experience is the hardest kind of teacher. It gives you the test first and the lesson afterwards.	2	[]	8	1
305	2017-02-24 23:54:59.104006+00	11	Money is round and rolls away, but education endures.	2	[]	8	1
306	2017-02-24 23:55:21.034311+00	22	Investment	1	[{"added": {}}]	13	1
307	2017-02-24 23:55:43.519581+00	27	The greatest investment anyone can make is in oneself.	2	[]	8	1
308	2017-02-25 00:23:44.095504+00	23	Perfection	1	[{"added": {}}]	13	1
309	2017-02-25 00:23:45.344699+00	32	Practice makes perfect.	2	[]	8	1
310	2017-02-25 00:26:10.308909+00	24	Honesty	1	[{"added": {}}]	13	1
311	2017-02-25 00:26:12.383352+00	7	The honest and upright man will always value a man of similar character.	2	[]	8	1
312	2017-02-25 00:26:22.831358+00	25	Reading	1	[{"added": {}}]	13	1
313	2017-02-25 00:26:24.737196+00	34	The man who does not read has no advantage over the man who cannot read.	2	[]	8	1
314	2017-02-25 00:26:43.158598+00	26	Luck	1	[{"added": {}}]	13	1
316	2017-02-25 00:26:57.808813+00	28	Opportunity	1	[{"added": {}}]	13	1
317	2017-02-25 00:27:05.105776+00	18	Luck is what happens when preparation meets opportunity.	2	[]	8	1
318	2017-02-25 00:27:18.593072+00	29	Religion	1	[{"added": {}}]	13	1
319	2017-02-25 00:27:24.976608+00	30	Faith	1	[{"added": {}}]	13	1
320	2017-02-25 00:27:26.917823+00	2	The heart has its reasons which reason knows not of.	2	[]	8	1
321	2017-02-25 00:55:44.459119+00	35	Those who cannot remember the past are condemned to repeat it.	2	[]	8	1
322	2017-02-26 12:29:38.741017+00	31	Politics	1	[{"added": {}}]	13	1
323	2017-02-26 12:29:46.130036+00	32	Elections	1	[{"added": {}}]	13	1
324	2017-02-26 12:29:47.18777+00	36	You can fool all the people some of the time, and some of the people all the time, but you cannot fool all the people all the time.	2	[]	8	1
325	2017-02-26 18:57:44.485942+00	39		2	[{"changed": {"fields": ["name", "firstname", "lastname"]}}]	9	1
326	2017-02-26 18:59:11.943032+00	1		2	[{"changed": {"fields": ["name", "firstname", "lastname"]}}]	9	1
327	2017-02-26 18:59:29.680514+00	2		2	[{"changed": {"fields": ["name", "firstname", "lastname"]}}]	9	1
328	2017-02-26 18:59:48.033953+00	3		2	[{"changed": {"fields": ["name", "firstname", "lastname"]}}]	9	1
329	2017-02-26 18:59:57.688173+00	38		2	[{"changed": {"fields": ["name", "firstname", "lastname"]}}]	9	1
330	2017-02-26 19:00:05.780962+00	36		2	[{"changed": {"fields": ["name", "firstname", "lastname"]}}]	9	1
331	2017-02-26 19:00:16.933788+00	33		2	[{"changed": {"fields": ["name", "firstname", "lastname"]}}]	9	1
332	2017-02-26 19:00:27.085073+00	34		2	[{"changed": {"fields": ["name", "firstname", "lastname"]}}]	9	1
333	2017-02-26 19:00:39.510163+00	37		2	[{"changed": {"fields": ["name", "firstname", "lastname"]}}]	9	1
334	2017-02-26 19:00:47.398514+00	31		2	[{"changed": {"fields": ["name", "firstname", "lastname"]}}]	9	1
335	2017-02-26 19:00:57.098754+00	29		2	[{"changed": {"fields": ["name", "firstname", "lastname"]}}]	9	1
336	2017-02-26 19:01:04.991165+00	32		2	[{"changed": {"fields": ["name", "firstname", "lastname"]}}]	9	1
337	2017-02-26 19:01:14.232774+00	30		2	[{"changed": {"fields": ["name", "firstname", "lastname"]}}]	9	1
338	2017-02-26 19:01:24.856148+00	28		2	[{"changed": {"fields": ["name", "firstname", "lastname"]}}]	9	1
339	2017-02-26 19:01:34.510243+00	25		2	[{"changed": {"fields": ["name", "firstname", "lastname"]}}]	9	1
340	2017-02-26 19:01:43.023468+00	27		2	[{"changed": {"fields": ["name", "firstname", "lastname"]}}]	9	1
341	2017-02-26 19:01:50.703077+00	26		2	[{"changed": {"fields": ["name", "firstname", "lastname"]}}]	9	1
342	2017-02-26 19:01:58.854615+00	23		2	[{"changed": {"fields": ["name", "firstname", "lastname"]}}]	9	1
343	2017-02-26 19:02:08.669683+00	4		2	[{"changed": {"fields": ["name", "firstname", "lastname"]}}]	9	1
344	2017-02-26 19:02:16.390019+00	22		2	[{"changed": {"fields": ["name", "lastname"]}}]	9	1
345	2017-02-26 19:02:26.975948+00	20		2	[{"changed": {"fields": ["name", "firstname", "lastname"]}}]	9	1
346	2017-02-26 19:02:35.903541+00	18		2	[{"changed": {"fields": ["name", "firstname", "lastname"]}}]	9	1
347	2017-02-26 19:02:40.474203+00	22		2	[]	9	1
348	2017-02-26 19:02:48.317083+00	24		2	[{"changed": {"fields": ["name", "firstname", "lastname"]}}]	9	1
349	2017-02-26 19:02:56.519092+00	17		2	[{"changed": {"fields": ["name", "firstname", "lastname"]}}]	9	1
350	2017-02-26 19:03:03.406148+00	14		2	[{"changed": {"fields": ["name", "lastname"]}}]	9	1
351	2017-02-26 19:03:11.175387+00	12		2	[{"changed": {"fields": ["name", "firstname", "lastname"]}}]	9	1
352	2017-02-26 19:03:20.533246+00	13		2	[{"changed": {"fields": ["name", "firstname", "lastname"]}}]	9	1
353	2017-02-26 19:03:30.966299+00	10		2	[{"changed": {"fields": ["name", "firstname", "lastname"]}}]	9	1
354	2017-02-26 19:03:42.39977+00	8		2	[{"changed": {"fields": ["name", "firstname", "lastname"]}}]	9	1
355	2017-02-26 19:03:49.791828+00	7		2	[{"changed": {"fields": ["name", "firstname", "lastname"]}}]	9	1
356	2017-02-26 19:03:58.952665+00	16		2	[{"changed": {"fields": ["name", "firstname", "lastname"]}}]	9	1
357	2017-02-26 19:04:08.856326+00	9		2	[{"changed": {"fields": ["name", "firstname", "lastname"]}}]	9	1
358	2017-02-26 19:04:29.903074+00	5		2	[{"changed": {"fields": ["name", "firstname", "lastname"]}}]	9	1
359	2017-02-26 19:04:40.23442+00	11		2	[{"changed": {"fields": ["name", "firstname", "lastname"]}}]	9	1
360	2017-02-26 19:04:49.585073+00	6		2	[{"changed": {"fields": ["name", "firstname", "lastname"]}}]	9	1
361	2017-02-26 19:04:58.37677+00	15		2	[{"changed": {"fields": ["name", "firstname", "lastname"]}}]	9	1
362	2017-02-26 19:05:07.64222+00	19		2	[{"changed": {"fields": ["name", "firstname", "lastname"]}}]	9	1
363	2017-02-26 19:05:15.628795+00	21		2	[{"changed": {"fields": ["name", "firstname", "lastname"]}}]	9	1
364	2017-02-26 19:05:24.76005+00	35		2	[{"changed": {"fields": ["name", "firstname", "lastname"]}}]	9	1
365	2017-03-10 17:40:44.561633+00	41	All mankind is divided into three classes: those that are immovable, those that are movable, and those that move.	1	[{"added": {}}]	8	1
366	2017-03-10 17:46:31.544388+00	33	Negativity	1	[{"added": {}}]	13	1
367	2017-03-10 17:46:38.903319+00	42	Don't complain about things you're not willing to change.	1	[{"added": {}}]	8	1
368	2017-03-10 20:29:03.083672+00	40	Michael Lipton	1	[{"added": {}}]	9	1
369	2017-03-10 20:29:22.787331+00	34	Agriculture	1	[{"added": {}}]	13	1
370	2017-03-10 20:29:27.711357+00	35	Industry	1	[{"added": {}}]	13	1
371	2017-03-10 20:29:36.371162+00	43	If you wish for industrialization, prepare to develop agriculture.	1	[{"added": {}}]	8	1
372	2017-03-10 20:31:03.441308+00	41	Masayuki Kondo	1	[{"added": {}}]	9	1
373	2017-03-10 20:31:24.830899+00	44	The main context for industrial technology development is firms, not public institutions.	1	[{"added": {}}]	8	1
374	2017-03-10 20:33:19.983196+00	45	Developing countries are not just little ships blown about on the developmental ocean by the winds of rich states.	1	[{"added": {}}]	8	1
375	2017-03-10 20:34:06.007723+00	36	Trade	1	[{"added": {}}]	13	1
376	2017-03-10 20:34:33.885135+00	46	Genuine free trade in services would require free movement of labour around the world, so that any service could be performed where it was required.	1	[{"added": {}}]	8	1
377	2017-03-10 20:35:19.20322+00	42	Meiji Charter Oath 1868 	1	[{"added": {}}]	9	1
378	2017-03-10 20:35:34.84826+00	47	Knowledge shall be sought throughout the world so as to strengthen the foundation of imperial rule.	1	[{"added": {}}]	8	1
379	2017-03-10 20:36:38.909212+00	37	Inspirational	1	[{"added": {}}]	13	1
380	2017-03-10 20:36:52.131271+00	48	It is better to fail trying than never to try at all.	1	[{"added": {}}]	8	1
381	2017-03-10 20:38:30.929845+00	43	Hyundai quality control manager 	1	[{"added": {}}]	9	1
621	2017-04-17 12:11:54.371841+00	91	Rolf Potts	1	[{"added": {}}]	9	1
382	2017-03-10 20:38:36.05735+00	49	The secret of technological progress is 'not repeating the same mistake' over a very long period of time.	1	[{"added": {}}]	8	1
383	2017-03-10 20:39:08.493374+00	50	Genius is the crystallisation of perseverance.	1	[{"added": {}}]	8	1
384	2017-03-10 20:39:55.776741+00	51	The most basic prerequisites of infant industry policy are: export discipline and sanctions for failure.	1	[{"added": {}}]	8	1
385	2017-03-10 20:40:27.485683+00	52	The rich world cannot be expected to save poor countries from bad politicians.	1	[{"added": {}}]	8	1
386	2017-03-10 20:40:47.664267+00	53	When countries think they have discovered the mythological 'secret' of wealth creation and stop adjusting, they become vulnerable. (e.g. Japan).	1	[{"added": {}}]	8	1
387	2017-03-10 20:41:15.389427+00	54	It is the quality of governance and policy-making that determine a country's prospect.	1	[{"added": {}}]	8	1
388	2017-03-10 20:43:01.829482+00	55	To act on the basis that what worked for everybody else cannot work for you is - to adapt Friedrich List's metaphor - like kicking away the ladder of progress yourself from below.	1	[{"added": {}}]	8	1
389	2017-03-10 20:46:15.802601+00	44	Carmine Gallo	1	[{"added": {}}]	9	1
390	2017-03-10 20:46:27.285388+00	10	Talk Like TED: The 9 Public Speaking Secrets of the World's Top Minds	1	[{"added": {}}]	7	1
391	2017-03-10 20:48:36.063475+00	14	Presentation	1	[{"added": {}}]	12	1
392	2017-03-10 20:50:42.591304+00	45	Oliver Uberti	1	[{"added": {}}]	9	1
393	2017-03-10 20:50:48.992131+00	56	Every superhero has an origin story. So do you. Don't follow someone else's. Create your own masterpiece.	1	[{"added": {}}]	8	1
394	2017-03-10 20:51:56.411201+00	38	Presentation	1	[{"added": {}}]	13	1
395	2017-03-10 20:52:05.046052+00	57	If you can't explain your product or idea in 140 characters, keep working at it until you can.	1	[{"added": {}}]	8	1
396	2017-03-10 20:53:10.28088+00	39	Creativity	1	[{"added": {}}]	13	1
397	2017-03-10 20:53:17.362267+00	58	Great innovators apply ideas from fields other than their own.	1	[{"added": {}}]	8	1
398	2017-03-10 20:54:12.447652+00	46	Amy Cuddy	1	[{"added": {}}]	9	1
399	2017-03-10 20:54:17.628186+00	59	Don't fake it till you make it. Fake it till you become it.	1	[{"added": {}}]	8	1
400	2017-03-10 20:54:43.069803+00	47	Ken Robinson	1	[{"added": {}}]	9	1
401	2017-03-10 20:54:50.900877+00	60	Schools kill creativity.	1	[{"added": {}}]	8	1
402	2017-03-10 20:55:18.686908+00	48	Howard Schultz	1	[{"added": {}}]	9	1
403	2017-03-10 20:55:51.798414+00	61	When you're surrounded by people who share a collective passion around a common purpose, anything is possible.	1	[{"added": {}}]	8	1
404	2017-03-10 20:56:35.844536+00	49	Steve Jobs	1	[{"added": {}}]	9	1
405	2017-03-10 20:56:45.731613+00	62	Your time is limited, so don't waste it living someone else's life. Don't be trapped by dogma - which is living with the results of other people's thinking. Don't let the noise of other's opinions dro	1	[{"added": {}}]	8	1
406	2017-03-10 20:57:34.229359+00	15	Initiative	1	[{"added": {}}]	12	1
407	2017-03-10 20:57:41.90628+00	63	Many people will not head down the street until all the lights are green. That is why they don't go anywhere.	1	[{"added": {}}]	8	1
408	2017-03-10 20:58:19.789733+00	64	Ideas are the currency of the 21st century.	1	[{"added": {}}]	8	1
409	2017-03-10 20:58:40.706968+00	65	Passion is contagious.	1	[{"added": {}}]	8	1
410	2017-03-10 20:59:15.582777+00	50	Bryan Stevenson	1	[{"added": {}}]	9	1
411	2017-03-10 20:59:25.937714+00	16	Identity	1	[{"added": {}}]	12	1
412	2017-03-10 20:59:38.690023+00	40	Identity	1	[{"added": {}}]	13	1
413	2017-03-10 20:59:39.90021+00	66	There is power in identity. When we create the right kind of identity, we can say things to the world around us that they don’t actually believe makes sense. We can get them to do things that they don	1	[{"added": {}}]	8	1
414	2017-03-10 21:00:19.641319+00	67	If you're not prepared to be wrong, you'll never come up with anything original.	1	[{"added": {}}]	8	1
415	2017-03-10 21:00:58.772513+00	51	Adam Spencer	1	[{"added": {}}]	9	1
416	2017-03-10 21:01:30.739177+00	17	Mathematics	1	[{"added": {}}]	12	1
417	2017-03-10 21:01:38.307654+00	41	Numbers	1	[{"added": {}}]	13	1
418	2017-03-10 21:01:44.157467+00	42	Music	1	[{"added": {}}]	13	1
419	2017-03-10 21:01:49.532618+00	68	Numbers are the musical notes with which the symphony of the universe is written.	1	[{"added": {}}]	8	1
420	2017-03-10 21:02:16.61363+00	52	Matthew May	1	[{"added": {}}]	9	1
421	2017-03-10 21:02:33.695531+00	43	Constraints	1	[{"added": {}}]	13	1
422	2017-03-10 21:02:46.606927+00	69	Creativity thrives under intelligent constraints.	1	[{"added": {}}]	8	1
423	2017-03-10 21:03:23.767224+00	53	Albert Einstein	1	[{"added": {}}]	9	1
424	2017-03-10 21:03:50.124666+00	70	If you can't explain it simply, you don't understand it well enough.	1	[{"added": {}}]	8	1
425	2017-03-10 21:04:27.30172+00	54	Leonardo da Vinci	1	[{"added": {}}]	9	1
426	2017-03-10 21:04:38.1695+00	44	Simplicity	1	[{"added": {}}]	13	1
427	2017-03-10 21:04:47.719681+00	71	Simplicity is the ultimate sophistication.	1	[{"added": {}}]	8	1
428	2017-03-10 21:05:18.907075+00	55	Maya Angelou	1	[{"added": {}}]	9	1
429	2017-03-10 21:05:49.977372+00	45	Feelings	1	[{"added": {}}]	13	1
430	2017-03-10 21:05:57.259355+00	72	People will forget what you said, people will forget what you did, but people will never forget how you made them feel.	1	[{"added": {}}]	8	1
431	2017-03-10 21:06:23.86299+00	56	Wael Ghonim	1	[{"added": {}}]	9	1
432	2017-03-10 21:06:41.508545+00	73	The power of the people is so much stronger than the people in power.	1	[{"added": {}}]	8	1
433	2017-03-10 21:07:01.289045+00	57	Francis Ford Coppola	1	[{"added": {}}]	9	1
434	2017-03-10 21:07:12.355566+00	74	You have to really be courageous about your instincts and your ideas. Otherwise you'll just knuckle under, and things that might have been memorable will be lost.	1	[{"added": {}}]	8	1
435	2017-03-10 21:07:47.117239+00	58	Ernst Friedrich Schumacher	1	[{"added": {}}]	9	1
436	2017-03-10 21:08:12.174585+00	75	Any intelligent fool can make things bigger, more complex. It takes a touch of genius and a lot of courage to move in the opposite direction.	1	[{"added": {}}]	8	1
437	2017-03-10 21:10:44.169799+00	59	Robert Kiyosaki	1	[{"added": {}}]	9	1
438	2017-03-10 21:11:04.994118+00	11	Rich Dad's Cashflow Quadrant	1	[{"added": {}}]	7	1
439	2017-03-10 21:11:54.398898+00	76	Never ask an insurance salesman if you need insurance.	1	[{"added": {}}]	8	1
440	2017-03-10 21:12:16.296544+00	77	Wall Street is the only place that people ride to in a Rolls Royce, to get advice from those who take the subway.	1	[{"added": {}}]	8	1
441	2017-03-10 21:12:41.610032+00	60	Ray Kroc	1	[{"added": {}}]	9	1
442	2017-03-10 21:12:46.622893+00	78	My business is not hamburgers. My business is real estate.	1	[{"added": {}}]	8	1
443	2017-03-10 21:13:25.415705+00	79	There is too much education altogether, especially in American schools.	1	[{"added": {}}]	8	1
444	2017-03-10 21:14:05.704045+00	80	I have never let my schooling interfere with my education.	1	[{"added": {}}]	8	1
445	2017-03-10 21:14:34.697767+00	61	Galileo 	1	[{"added": {}}]	9	1
446	2017-03-10 21:14:55.000583+00	81	You cannot teach a person anything, you can only help him find it within himself.	1	[{"added": {}}]	8	1
447	2017-03-10 22:24:36.822663+00	62	Henry Louis Mencken	1	[{"added": {}}]	9	1
448	2017-03-10 22:24:51.805956+00	82	School days, I believe, are the unhappiest in the whole span of human existence. They are full of dull, unintelligible tasks, new and unpleasant ordinances, and brutal violations of common sense and c	1	[{"added": {}}]	8	1
449	2017-03-10 22:25:39.444179+00	63	Norman Douglas	1	[{"added": {}}]	9	1
450	2017-03-10 22:25:57.59838+00	83	Education is the state-controlled manufacture of echoes.	1	[{"added": {}}]	8	1
451	2017-03-10 22:26:34.701933+00	64	John Updike	1	[{"added": {}}]	9	1
452	2017-03-10 22:26:43.652005+00	84	The founding fathers, in their wisdom, decided that children were an unnatural strain on their parents. So they provided jails called schools, equipped with tortures called an education.	1	[{"added": {}}]	8	1
453	2017-03-10 22:27:21.376842+00	65	Winston Churchill	1	[{"added": {}}]	9	1
454	2017-03-10 22:27:31.594033+00	85	Personally, I am always ready to learn, although I do not always like being taught.	1	[{"added": {}}]	8	1
455	2017-03-10 22:28:59.316454+00	66	Rich dad	1	[{"added": {}}]	9	1
456	2017-03-10 22:29:11.140928+00	18	Personal finance	1	[{"added": {}}]	12	1
457	2017-03-10 22:29:20.697017+00	46	Finance	1	[{"added": {}}]	13	1
458	2017-03-10 22:29:24.711051+00	86	Instead of living below your means, focus on expanding your means.	1	[{"added": {}}]	8	1
459	2017-03-10 22:30:05.758527+00	87	More money will not solve the problem, if cash-flow management is the problem.	1	[{"added": {}}]	8	1
460	2017-03-10 22:31:36.337261+00	19	Problem-solving	1	[{"added": {}}]	12	1
461	2017-03-10 22:31:39.234421+00	88	Inside every problem lies an opportunity, and inside every disappointment lies a priceless gem of wisdom.	1	[{"added": {}}]	8	1
462	2017-03-10 22:32:42.020675+00	89	Giants often trip and fall, but worms don't, because all they do is dig and crawl.	1	[{"added": {}}]	8	1
463	2017-03-10 22:33:15.818727+00	67	Eric Hoffer	1	[{"added": {}}]	9	1
464	2017-03-10 22:33:36.723848+00	90	In times of change learners inherit the earth, while the learned find themselves beautifully equipped to deal with a world that no longer exists.	1	[{"added": {}}]	8	1
465	2017-03-10 22:35:12.721673+00	91	What we say to ourselves become our reality.	1	[{"added": {}}]	8	1
466	2017-03-10 22:35:52.58743+00	92	People think that working hard for money and then buying things that make them look rich will make them rich. In most cases it doesn't. It only makes them more tired.	1	[{"added": {}}]	8	1
467	2017-03-10 22:36:45.31427+00	93	Your profit is made when you buy, not when you sell.	1	[{"added": {}}]	8	1
468	2017-03-10 22:37:27.137009+00	94	If you take on risk and debt, make sure you get paid for it.	1	[{"added": {}}]	8	1
469	2017-03-10 22:38:42.799589+00	95	If you're in a poker game and after 20 minutes you don't know who the patsy is, then you're the patsy.	1	[{"added": {}}]	8	1
470	2017-03-10 22:39:22.109472+00	96	If you do what everyone else does, you'll wind up having what everyone has.	1	[{"added": {}}]	8	1
471	2017-03-10 22:40:12.165099+00	97	Action always beats inaction. If you take action and make a mistake, at least you have learned something. Ultimately, the way we learn is by making mistakes.	1	[{"added": {}}]	8	1
472	2017-03-10 22:40:41.928063+00	98	People who write down their goals are more likely to achieve them.	1	[{"added": {}}]	8	1
473	2017-03-10 22:41:11.89119+00	99	You've got to walk before you can run.	1	[{"added": {}}]	8	1
474	2017-03-10 22:43:23.515186+00	100	Bankers love debtors because debtors make the bank rich.	1	[{"added": {}}]	8	1
475	2017-03-10 22:46:55.72805+00	101	The more people you're indebted to, the poorer you are. And the more people you have indebted to you, the wealthier you are. That's the game.	1	[{"added": {}}]	8	1
476	2017-03-10 22:49:48.385316+00	102	It's not how much money you make, but how much money you keep, how hard it works for you, and how many generations you keep it for.	1	[{"added": {}}]	8	1
477	2017-03-10 22:50:44.401945+00	103	An asset puts money in my pocket. A liability takes money out of my pocket.	1	[{"added": {}}]	8	1
478	2017-03-10 22:51:20.065118+00	104	What you think of me is none of my business. What is most important is what I think about myself.	1	[{"added": {}}]	8	1
479	2017-03-10 22:52:44.459102+00	20	Leadership	1	[{"added": {}}]	12	1
480	2017-03-10 22:53:02.316158+00	47	Leadership	1	[{"added": {}}]	13	1
481	2017-03-10 22:53:06.139868+00	105	Managers often see their subordinates as inferiors. Leaders must direct people who are often smarter.	1	[{"added": {}}]	8	1
482	2017-03-10 22:53:41.946208+00	106	The only difference between a rich person and a poor person is what they do in their spare time.	1	[{"added": {}}]	8	1
483	2017-03-10 22:55:00.988626+00	48	Real estate	1	[{"added": {}}]	13	1
484	2017-03-10 22:55:09.557877+00	107	Your home is not an asset, but a liability.	1	[{"added": {}}]	8	1
485	2017-03-10 22:56:04.933063+00	68	Henry Ford	1	[{"added": {}}]	9	1
486	2017-03-10 22:56:22.770395+00	49	Thinking	1	[{"added": {}}]	13	1
487	2017-03-10 22:56:36.584164+00	21	Thinking	1	[{"added": {}}]	12	1
488	2017-03-10 22:56:51.410475+00	108	Thinking is the hardest work there is. That is why so few people engage in it.	1	[{"added": {}}]	8	1
489	2017-03-10 22:58:01.835685+00	22	Life	1	[{"added": {}}]	12	1
490	2017-03-10 22:58:09.970909+00	109	You can't teach an old dog new tricks.	1	[{"added": {}}]	8	1
491	2017-03-10 22:58:43.8037+00	110	Most addictions are attempts to find happiness in people's souls.	1	[{"added": {}}]	8	1
492	2017-03-10 22:59:18.578049+00	111	You can never have true freedom without financial freedom.	1	[{"added": {}}]	8	1
493	2017-03-10 23:01:46.536216+00	112	Success is a poor teacher. We learn the most about ourselves when we fail, so don't be afraid of failing. Failing is part of the process of success. You can't have success without failure.	1	[{"added": {}}]	8	1
494	2017-03-10 23:03:24.026368+00	113	If you want to be a leader of people, then you need to be a master of words.	1	[{"added": {}}]	8	1
495	2017-03-10 23:07:09.611796+00	69	Nhat Hanh	1	[{"added": {}}]	9	1
496	2017-03-10 23:07:20.464839+00	114	The path is the goal.	1	[{"added": {}}]	8	1
497	2017-03-10 23:08:03.546846+00	115	The definition of wealth is the number of days you can survive without physically working and still maintain your standard of living.	1	[{"added": {}}]	8	1
498	2017-03-10 23:09:12.811735+00	70	Hollywood celebrity	1	[{"added": {}}]	9	1
499	2017-03-10 23:09:26.398291+00	23	Investment	1	[{"added": {}}]	12	1
500	2017-03-10 23:09:31.162247+00	116	It's not return on the investment that I worry about. It's the return of the investment	1	[{"added": {}}]	8	1
623	2017-04-17 12:13:15.695408+00	92	Mike Maples	1	[{"added": {}}]	9	1
501	2017-03-10 23:10:06.214749+00	117	People who take risks change the world. Few people ever get rich without taking risks.	1	[{"added": {}}]	8	1
502	2017-03-10 23:10:50.427672+00	118	Your boss's job is not to make you rich. Your boss's job is to make sure you get your paycheck. It's your job to become rich if you want to.	1	[{"added": {}}]	8	1
503	2017-03-10 23:11:25.471515+00	119	If you want to get rich, you need to learn how to take risks. Learn to be an investor.	1	[{"added": {}}]	8	1
504	2017-03-16 23:46:47.298349+00	2	rabah	3		2	1
505	2017-03-18 01:58:22.935715+00	120	test hakim to delete	3		8	1
506	2017-03-18 20:12:47.39299+00	119	If you want to get rich, you need to learn how to take risks. Learn to be an investor.	2	[{"changed": {"fields": ["published"]}}]	8	1
507	2017-03-18 20:13:18.867958+00	119	If you want to get rich, you need to learn how to take risks. Learn to be an investor.	2	[{"changed": {"fields": ["published"]}}]	8	1
508	2017-03-18 20:13:32.872232+00	119	If you want to get rich, you need to learn how to take risks. Learn to be an investor.	2	[{"changed": {"fields": ["published"]}}]	8	1
509	2017-03-18 20:13:40.383032+00	119	If you want to get rich, you need to learn how to take risks. Learn to be an investor.	2	[{"changed": {"fields": ["published"]}}]	8	1
510	2017-03-18 20:14:58.618342+00	121	test hakim to delete	2	[{"changed": {"fields": ["published"]}}]	8	1
511	2017-03-18 20:15:13.938704+00	121	test hakim to delete	3		8	1
512	2017-03-19 00:54:51.118265+00	122	test rabah to delete	2	[{"changed": {"fields": ["published"]}}]	8	1
513	2017-03-19 00:56:37.978261+00	3	Rabah	2	[{"changed": {"fields": ["password"]}}]	2	1
514	2017-03-19 00:57:26.202585+00	3	rabah	2	[{"changed": {"fields": ["username"]}}]	2	1
515	2017-03-19 01:12:15.855807+00	123	test rabah tags	3		8	1
516	2017-03-19 01:12:15.861474+00	124	test rabah tags 2	3		8	1
517	2017-03-19 01:12:15.86409+00	122	test rabah to delete	3		8	1
518	2017-03-24 23:18:28.35394+00	12	Rich dad, poor dad : what the rich teach their kids about money - that the poor and middle class do not!	1	[{"added": {}}]	7	1
519	2017-03-25 02:05:59.881194+00	125	Winners are not afraid of losing. But losers are. Failure is part of the process of success. People who avoid failure also avoid success.	1	[{"added": {}}]	8	1
520	2017-03-25 19:07:04.393702+00	11	Rich dad's cashflow quadrant : guide to financial freedom	2	[{"changed": {"fields": ["title"]}}]	7	1
521	2017-03-25 19:09:08.794002+00	126	I-don't-wants hold the key to your success.	1	[{"added": {}}]	8	1
522	2017-03-25 19:10:38.227061+00	127	The words "I can't afford it" shut down you brain. "How can I afford it?" opens up possibilities, excitements, and dreams.	1	[{"added": {}}]	8	1
523	2017-03-25 19:12:33.660028+00	128	Cynics criticize, and winners analyze.	1	[{"added": {}}]	8	1
524	2017-03-25 19:14:27.949702+00	71	Fran Tarkenton	1	[{"added": {}}]	9	1
525	2017-03-25 19:16:19.640554+00	129	Winning means being unafraid to lose.	1	[{"added": {}}]	8	1
526	2017-03-25 19:18:42.953973+00	130	Failure inspires winners. And failure defeats losers.	1	[{"added": {}}]	8	1
527	2017-03-25 19:19:35.446385+00	131	The poor and the middle class work for money. The rich have money work for them.	1	[{"added": {}}]	8	1
528	2017-03-25 19:20:20.280437+00	132	There is a difference between being poor and being broke. Broke is temporary. Poor is eternal.	1	[{"added": {}}]	8	1
529	2017-03-25 19:22:17.063402+00	133	People's lives are forever controlled by two emotions: fear and greed.	1	[{"added": {}}]	8	1
530	2017-03-25 19:23:12.047984+00	134	It's easier to change yourself than everyone else.	1	[{"added": {}}]	8	1
531	2017-03-25 19:25:14.425723+00	135	A job is only a short-term solution to a long-term problem.	1	[{"added": {}}]	8	1
532	2017-03-25 19:27:08.840672+00	136	It's not how much money you make. It's how much money you keep.	1	[{"added": {}}]	8	1
533	2017-03-25 19:28:30.417805+00	137	Rich people acquire assets. The poor and middle-class acquire liabilities that they think are assets.	1	[{"added": {}}]	8	1
534	2017-03-25 19:30:09.043493+00	138	An intelligent person hires people who are more intelligent than he is.	1	[{"added": {}}]	8	1
535	2017-03-25 19:30:49.633079+00	139	If you work for money, you give the power to your employer. If money works for you, you keep the power and control it.	1	[{"added": {}}]	8	1
536	2017-03-25 19:31:54.720003+00	140	Often in the real world, it's not the smart who get ahead, but the bold.	1	[{"added": {}}]	8	1
537	2017-03-25 19:33:57.909829+00	141	It is not gambling if you know what you're doing. It is gambling if you're just throwing money into a deal and praying.	1	[{"added": {}}]	8	1
538	2017-03-25 19:35:14.749703+00	142	Life is much like going to the gym. The most painful part is deciding to go. Once you get past that, it's easy.	1	[{"added": {}}]	8	1
539	2017-03-25 19:36:52.498564+00	143	For most people, the reason they don't win financially is because the pain of losing money is far greater than the joy of being rich.	1	[{"added": {}}]	8	1
540	2017-03-25 19:37:34.695645+00	144	Risk comes from not knowing what you're doing.	1	[{"added": {}}]	8	1
541	2017-03-25 19:38:48.827676+00	145	The definition of insanity is doing the same thing over and over and expecting a different result.	1	[{"added": {}}]	8	1
542	2017-03-25 19:39:44.305067+00	72	Eleanor Roosevelt	1	[{"added": {}}]	9	1
543	2017-03-25 19:40:05.704336+00	146	Do what you feel in your heart to be right - for you'll be criticized anyway. You'll be damned if you do, and damned if you don't.	1	[{"added": {}}]	8	1
544	2017-03-25 19:40:37.889945+00	147	Action always beats inaction.	1	[{"added": {}}]	8	1
545	2017-03-25 19:41:08.159499+00	148	Be a little greedy. It's the best cure for laziness.	1	[{"added": {}}]	8	1
546	2017-03-25 19:41:45.60924+00	149	Look for people who wants to buy first. Then look for someone who wants to sell.	1	[{"added": {}}]	8	1
547	2017-03-25 19:42:16.404849+00	150	Listening is more important than talking. If that were not true, God would not have given us two ears and only one mouth.	1	[{"added": {}}]	8	1
548	2017-03-25 19:44:03.377261+00	151	Everyone wants to go to heaven, but no one wants to die.	1	[{"added": {}}]	8	1
549	2017-03-25 19:48:29.867817+00	73	John Davison Rockefeller	1	[{"added": {}}]	9	1
550	2017-03-25 19:49:20.7413+00	152	I always tried to turn every disaster into an opportunity.	1	[{"added": {}}]	8	1
551	2017-04-01 01:13:15.601023+00	153	test autocomplete	3		8	1
552	2017-04-01 22:50:22.334612+00	154	test new	3		8	1
553	2017-04-01 22:50:45.343793+00	74	 test	3		9	1
554	2017-04-01 22:50:57.581808+00	13	test	3		7	1
555	2017-04-01 22:51:19.635754+00	24	test	3		12	1
556	2017-04-01 22:51:35.239708+00	50	test1	3		13	1
557	2017-04-01 22:51:35.243646+00	51	test2	3		13	1
558	2017-04-12 23:12:20.439602+00	75	Jared Diamond	1	[{"added": {}}]	9	1
559	2017-04-12 23:12:24.521063+00	14	Guns, germs and steel	1	[{"added": {}}]	7	1
622	2017-04-17 12:12:44.76942+00	186	The simple willingness to improvise is more vital, in the long run, than research.	1	[{"added": {}}]	8	1
560	2017-04-12 23:13:30.236958+00	155	History followed different courses for different peoples because of differences among peoples' environments, not because of biological differences among peoples themselves.	1	[{"added": {}}]	8	1
561	2017-04-12 23:14:40.402128+00	156	One has to understand the enemy in order to beat him.	1	[{"added": {}}]	8	1
562	2017-04-12 23:15:35.717819+00	157	Necessity is the mother of invention.	1	[{"added": {}}]	8	1
563	2017-04-12 23:21:08.190343+00	76	Sun Tzu	1	[{"added": {}}]	9	1
564	2017-04-12 23:21:25.79135+00	15	The Art of War	1	[{"added": {}}]	7	1
565	2017-04-12 23:23:39.970694+00	25	War	1	[{"added": {}}]	12	1
566	2017-04-12 23:23:48.740501+00	52	War	1	[{"added": {}}]	13	1
567	2017-04-12 23:24:51.918059+00	158	Know the enemy, know yourself and victory is never in doubt, not in a hundred battles.	1	[{"added": {}}]	8	1
568	2017-04-16 18:37:12.447509+00	159	A large society that continues to leave conflict resolution to all of its memebers is guaranteed to blow up.	1	[{"added": {}}]	8	1
569	2017-04-16 18:37:55.925938+00	159	A large society that continues to leave conflict resolution to all of its members is guaranteed to blow up.	2	[{"changed": {"fields": ["text"]}}]	8	1
570	2017-04-17 11:40:56.959758+00	77	Timothy Ferriss	1	[{"added": {}}]	9	1
571	2017-04-17 11:41:04.849554+00	16	The 4-Hour Work Week: Escape the 9-5, Live Anywhere and Join the New Rich	1	[{"added": {}}]	7	1
572	2017-04-17 11:41:25.565997+00	26	Reading	1	[{"added": {}}]	12	1
573	2017-04-17 11:42:05.843579+00	160	Reading, after a certain age, diverts the mind too much from its creative pursuits. Any man who reads too much and uses his own brain too little falls into lazy habits of thinking.	1	[{"added": {}}]	8	1
574	2017-04-17 11:42:53.537307+00	78	John Ruskin	1	[{"added": {}}]	9	1
575	2017-04-17 11:43:07.367657+00	161	Genius is only a superior power of seeing.	1	[{"added": {}}]	8	1
576	2017-04-17 11:43:38.97512+00	79	Benjamin Disraeli	1	[{"added": {}}]	9	1
577	2017-04-17 11:43:57.599779+00	162	Action may not always bring happiness, but there is no happiness without action.	1	[{"added": {}}]	8	1
578	2017-04-17 11:45:02.707725+00	163	Whenever you find yourself on the side of the majority, it is time to pause and reflect.	1	[{"added": {}}]	8	1
579	2017-04-17 11:46:36.261213+00	164	What man actually needs is not a tensionless state but rather the striving and struggling for a worthwhile goal, a freely chosen task.	1	[{"added": {}}]	8	1
580	2017-04-17 11:47:20.426348+00	80	Dave Barry	1	[{"added": {}}]	9	1
581	2017-04-17 11:47:31.866856+00	53	Travel	1	[{"added": {}}]	13	1
582	2017-04-17 11:47:47.101244+00	27	Travel	1	[{"added": {}}]	12	1
583	2017-04-17 11:47:59.370826+00	165	Americans who travel abroad for the first time are often shocked to discover that, despite all the progress that has been made in the last 30 years, many foreign people still speak in foreign language	1	[{"added": {}}]	8	1
584	2017-04-17 11:48:47.727023+00	166	Finding a market before designing a product is smarter than the reverse.	1	[{"added": {}}]	8	1
585	2017-04-17 11:49:59.937865+00	81	Paula Poundstone	1	[{"added": {}}]	9	1
586	2017-04-17 11:50:29.076762+00	167	Adults are always asking kids what they want to be when they grow up because they are looking for ideas.	1	[{"added": {}}]	8	1
587	2017-04-17 11:50:59.404368+00	82	Calvin Coolidge	1	[{"added": {}}]	9	1
588	2017-04-17 11:51:18.536218+00	168	Nothing is more common than unsuccessful men with talent.	1	[{"added": {}}]	8	1
589	2017-04-17 11:51:48.528046+00	83	Robert Frost	1	[{"added": {}}]	9	1
590	2017-04-17 11:52:00.558604+00	169	By working faithfully eight hours a day you may eventually get to be boss and work twelve hours a day.	1	[{"added": {}}]	8	1
591	2017-04-17 11:53:05.275063+00	84	Bill Gates	1	[{"added": {}}]	9	1
592	2017-04-17 11:53:34.891278+00	28	Technology	1	[{"added": {}}]	12	1
593	2017-04-17 11:53:38.610432+00	170	The first rule of any technology used in a business is that automation applied to an efficient operation will magnify the efficiency. The second is that automation applied to an inefficient operation 	1	[{"added": {}}]	8	1
594	2017-04-17 11:54:10.022318+00	85	Peter Drucker	1	[{"added": {}}]	9	1
595	2017-04-17 11:55:53.100933+00	54	Management	1	[{"added": {}}]	13	1
596	2017-04-17 11:56:05.717268+00	171	What gets measured gets managed.	1	[{"added": {}}]	8	1
597	2017-04-17 11:56:44.182079+00	172	The fishing is best where the fewest go.	1	[{"added": {}}]	8	1
598	2017-04-17 11:57:15.70482+00	86	Bill Cosby	1	[{"added": {}}]	9	1
599	2017-04-17 11:57:27.578039+00	173	Civilization had too many rules for me, so I did my best to rewrite them.	1	[{"added": {}}]	8	1
600	2017-04-17 11:58:02.484765+00	55	Imagination	1	[{"added": {}}]	13	1
601	2017-04-17 11:58:07.396203+00	174	Anyone who lives within their means suffers from a lack of imagination.	1	[{"added": {}}]	8	1
602	2017-04-17 11:58:36.282787+00	87	Niels Bohr	1	[{"added": {}}]	9	1
603	2017-04-17 11:59:01.24653+00	175	An expert is a person who has made all the mistakes that can be made in a very narrow field.	1	[{"added": {}}]	8	1
604	2017-04-17 11:59:30.68476+00	176	Everything popular is wrong.	1	[{"added": {}}]	8	1
605	2017-04-17 12:00:14.8809+00	88	Herbert Bayard Swope	1	[{"added": {}}]	9	1
606	2017-04-17 12:00:29.222782+00	177	I can't give you a surefire formula for success, but I can give you a formula for failure: try to please everybody all the time.	1	[{"added": {}}]	8	1
607	2017-04-17 12:00:58.402988+00	89	Malcolm X	1	[{"added": {}}]	9	1
608	2017-04-17 12:01:11.190955+00	29	Struggle	1	[{"added": {}}]	12	1
609	2017-04-17 12:01:27.808126+00	29	Revolution	2	[{"changed": {"fields": ["name"]}}]	12	1
610	2017-04-17 12:01:30.285824+00	178	Nobody can give you freedom. Nobody can give you equality or justice or anything. If you're a man, you take it.	1	[{"added": {}}]	8	1
611	2017-04-17 12:03:28.416267+00	30	Productivity	1	[{"added": {}}]	12	1
612	2017-04-17 12:03:45.259277+00	179	Being busy is a form of laziness - lazy thinking and indiscriminate action.	1	[{"added": {}}]	8	1
613	2017-04-17 12:05:25.841684+00	180	Creating demand is hard. Filling demand is much easier. Don't create a product, then seek someone to sell it to. Find a market - define your customers - then find or develop a product for them.	1	[{"added": {}}]	8	1
614	2017-04-17 12:07:53.731602+00	56	Productivity	1	[{"added": {}}]	13	1
615	2017-04-17 12:08:02.488479+00	181	Lack of time is actually lack of priorities.	1	[{"added": {}}]	8	1
616	2017-04-17 12:08:41.210165+00	182	The customer can have any color he wants, so long as it's black.	1	[{"added": {}}]	8	1
617	2017-04-17 12:09:31.187187+00	183	Options - the ability to choose - is real power.	1	[{"added": {}}]	8	1
618	2017-04-17 12:10:11.64172+00	184	Many a false step was made by standing still.	1	[{"added": {}}]	8	1
619	2017-04-17 12:11:02.701035+00	90	Herb Kelleher	1	[{"added": {}}]	9	1
620	2017-04-17 12:11:10.687169+00	185	A company is stronger if it is bound by love rather than by fear... If the employees come first, then they're happy.	1	[{"added": {}}]	8	1
624	2017-04-17 12:13:50.767346+00	187	Companies go out of business when they make the wrong decisions or, just as important, make too many decisions. The latter creates complexity.	1	[{"added": {}}]	8	1
625	2017-04-17 12:14:37.676066+00	57	Reality	1	[{"added": {}}]	13	1
626	2017-04-17 12:14:55.059195+00	188	Reality is merely an illusion, albeit a very persistent one.	1	[{"added": {}}]	8	1
627	2017-04-17 12:15:52.075936+00	93	John F. Kennedy	1	[{"added": {}}]	9	1
628	2017-04-17 12:16:59.140665+00	189	Once you say you're going to settle for second, that's what happens to you in life.	1	[{"added": {}}]	8	1
629	2017-04-17 12:17:41.492923+00	94	Jean-Baptiste Say	1	[{"added": {}}]	9	1
630	2017-04-17 12:18:29.702611+00	190	The entrepreneur shifts economic resources out of an area of lower and into an area of higher yield.	1	[{"added": {}}]	8	1
631	2017-04-17 12:18:56.186145+00	95	Paul Fussell	1	[{"added": {}}]	9	1
632	2017-04-17 12:19:13.526277+00	191	Before the development of tourism, travel was conceived to be like study, and its fruits were considered to be the adornment of the mind and the formation of judgement.	1	[{"added": {}}]	8	1
633	2017-04-17 12:19:35.798573+00	96	Ingvar Kamprad	1	[{"added": {}}]	9	1
634	2017-04-17 12:19:51.834749+00	192	Only those who are asleep make no mistakes.	1	[{"added": {}}]	8	1
635	2017-04-17 12:20:17.560673+00	97	Colin Wilson	1	[{"added": {}}]	9	1
636	2017-04-17 12:20:28.137004+00	193	The average man is a conformist, accepting miseries and disasters with the stoicism of a cow standing in the rain.	1	[{"added": {}}]	8	1
637	2017-04-17 12:21:06.929958+00	98	Fanny Burney	1	[{"added": {}}]	9	1
638	2017-04-17 12:21:23.407896+00	194	Travelling is the ruin of all happiness! There's no looking at a building here after seeing Italy.	1	[{"added": {}}]	8	1
639	2017-04-17 12:21:41.823172+00	99	Mohandas Gandhi	1	[{"added": {}}]	9	1
640	2017-04-17 12:22:01.704152+00	195	There is more to life than increasing its speed.	1	[{"added": {}}]	8	1
641	2017-04-17 12:22:36.928937+00	100	Paul Theroux	1	[{"added": {}}]	9	1
642	2017-04-17 12:23:37.065099+00	196	It is fatal to know too much at the outcome: boredom comes as quickly to the traveler who knows his route as to the novelist who is overcertain of his plot.	1	[{"added": {}}]	8	1
643	2017-04-17 12:24:04.564428+00	197	Doubts invade the mind when nothing else fills it.	1	[{"added": {}}]	8	1
644	2017-04-17 12:24:34.507907+00	198	If you can't define it or act upon it, forget it.	1	[{"added": {}}]	8	1
645	2017-04-17 12:25:27.237284+00	101	Jean Sibelius	1	[{"added": {}}]	9	1
646	2017-04-17 12:25:37.588605+00	199	There are no statues erected to critics.	1	[{"added": {}}]	8	1
647	2017-04-17 12:26:04.061962+00	102	George Bernard Shaw	1	[{"added": {}}]	9	1
648	2017-04-17 12:28:19.005995+00	200	Liberty means responsibility. That is why most men dread it.	1	[{"added": {}}]	8	1
649	2017-04-17 12:28:56.374583+00	103	Thomas J. Watson	1	[{"added": {}}]	9	1
650	2017-04-17 12:29:46.35674+00	201	Recently, I was asked if I was going to fire an employee who made a mistake that cost the company $600,000. No, I replied, I just spent $600,000 training him.	1	[{"added": {}}]	8	1
651	2017-04-17 12:30:12.429439+00	104	Warren Bennis	1	[{"added": {}}]	9	1
652	2017-04-17 12:30:19.357483+00	202	The factory of the future will have only two employees, a man and a dog. The man will be there to feed the dog. The dog will be there to keep the man from touching the equipment.	1	[{"added": {}}]	8	1
653	2017-04-17 12:30:48.351148+00	203	The existential vacuum manifests itself mainly in a state of boredom.	1	[{"added": {}}]	8	1
654	2017-04-17 12:31:12.619606+00	105	Richard P. Feynman	1	[{"added": {}}]	9	1
655	2017-04-17 12:32:33.321133+00	204	The first principle is that you must not fool yourself, and you are the easiest person to fool.	1	[{"added": {}}]	8	1
656	2017-04-17 12:32:58.940398+00	106	Frank Wilczek	1	[{"added": {}}]	9	1
657	2017-04-17 12:33:08.107757+00	205	If you don't make mistakes, you're not working on hard enough problems. And that's a big mistake.	1	[{"added": {}}]	8	1
658	2017-04-17 12:34:15.693644+00	107	William of Occam	1	[{"added": {}}]	9	1
659	2017-04-17 12:34:31.515375+00	206	It is vain to do with more what can be done with less.	1	[{"added": {}}]	8	1
660	2017-04-17 12:34:53.542428+00	108	Antoine de Saint-Exupery	1	[{"added": {}}]	9	1
661	2017-04-17 12:35:17.089092+00	207	Perfection is not when there is no more to add, but no more to take away.	1	[{"added": {}}]	8	1
662	2017-04-17 12:36:00.996115+00	108	Antoine de Saint-Exupéry	2	[{"changed": {"fields": ["lastname"]}}]	9	1
663	2017-04-17 12:36:39.868351+00	109	Vilfredo Pareto	1	[{"added": {}}]	9	1
664	2017-04-17 12:37:59.049415+00	208	80% of the outputs result from 20% of the inputs.	1	[{"added": {}}]	8	1
665	2017-04-17 12:38:37.521714+00	110	Yvon Chouinard	1	[{"added": {}}]	9	1
666	2017-04-17 12:38:52.433407+00	209	There's no difference between a pessimist who says, "Oh it's hopeless, so don't bother doing anything," and an optimist who says, "Don't bother doing anything, it's going to turn out fine anyway. Eith	1	[{"added": {}}]	8	1
667	2017-04-17 12:39:48.606566+00	210	The reasonable man adapts himself to the world: the unreasonable one persists in trying to adapt the world to himself. Therefore all progress depends on the unreasonable man.	1	[{"added": {}}]	8	1
668	2017-04-17 12:40:12.910048+00	111	Robert Henri	1	[{"added": {}}]	9	1
669	2017-04-17 12:40:20.822403+00	211	To be free, to be happy and fruitful, can only be attained through sacrifice of many common but overestimated things.	1	[{"added": {}}]	8	1
670	2017-04-17 12:41:42.194887+00	212	If you must play, decide on three things at the start: the rules of the game, the stakes, and the quitting time.	1	[{"added": {}}]	8	1
671	2017-04-17 12:42:27.494786+00	112	Bill Watterson	1	[{"added": {}}]	9	1
672	2017-04-17 12:42:42.440554+00	58	Genius	1	[{"added": {}}]	13	1
673	2017-04-17 12:43:02.588149+00	213	People think it must be fun to be a super genius, but they don't realize how hard it is to put up with all the idiots in the world.	1	[{"added": {}}]	8	1
674	2017-04-23 17:25:41.082681+00	214	The striking differences between the long-term histories of peoples of the different continents have been due not to innate differences in the peoples themselves but to differences in their environmen	1	[{"added": {}}]	8	1
675	2017-04-23 21:04:19.955068+00	113	Michael Taillard	1	[{"added": {}}]	9	1
676	2017-04-23 21:04:23.765277+00	17	Personal finance : a practical guide	1	[{"added": {}}]	7	1
677	2017-04-23 21:05:50.578179+00	17	Introducing Personal Finance: A Practical Guide	2	[{"changed": {"fields": ["title"]}}]	7	1
678	2017-04-23 21:06:26.857223+00	215	Money is the root of all evil.	1	[{"added": {}}]	8	1
679	2017-04-23 21:07:47.334216+00	216	If you can't do the maths to determine the future value of your financial product, then that financial product is not for you.	1	[{"added": {}}]	8	1
680	2017-04-30 23:22:34.827182+00	217	test non published	1	[{"added": {}}]	8	1
681	2017-04-30 23:25:46.236417+00	217	test non published	3		8	1
682	2017-04-30 23:26:00.36381+00	218	test unpublished	1	[{"added": {}}]	8	1
683	2017-04-30 23:26:16.735173+00	218	test unpublished	3		8	1
684	2017-04-30 23:55:13.441871+00	228	test tweet url	1	[{"added": {}}]	8	1
685	2017-05-01 00:19:17.839684+00	228	test tweet url	3		8	1
686	2017-05-01 00:19:34.705822+00	229	test tweet url	1	[{"added": {}}]	8	1
687	2017-05-01 00:20:08.974335+00	229	test tweet url	3		8	1
688	2017-05-04 10:00:25.453245+00	230	Inaction too often has the greatest amount of risk.	1	[{"added": {}}]	8	1
689	2017-05-04 10:07:09.071883+00	231	Don't put all your eggs in one basket.	1	[{"added": {}}]	8	1
690	2017-05-23 11:07:22.227358+00	232	Great minds discuss ideas; average minds discuss events; small minds discuss people.	1	[{"added": {}}]	8	1
691	2017-05-24 09:47:37.384565+00	1	bookquotes.me	2	[{"changed": {"fields": ["domain", "name"]}}]	15	1
692	2017-05-24 09:52:48.878211+00	114	Anthony J. Peter	1	[{"added": {}}]	9	1
693	2017-05-24 09:53:23.404718+00	18	How to become financially free	1	[{"added": {}}]	7	1
694	2017-05-24 09:54:19.69262+00	115	Adam Adam	1	[{"added": {}}]	9	1
695	2017-05-24 09:54:32.583456+00	115	Adam Smith	2	[{"changed": {"fields": ["lastname"]}}]	9	1
696	2017-05-24 09:55:01.112187+00	19	The theory of moral sentiments	1	[{"added": {}}]	7	1
697	2017-05-24 09:56:43.726639+00	116	Tony Robbins	1	[{"added": {}}]	9	1
698	2017-05-24 09:56:48.424376+00	20	Money : master the game : 7 simple steps to financial freedom	1	[{"added": {}}]	7	1
699	2017-05-24 09:58:34.675454+00	233	Never spend more than you earn.	1	[{"added": {}}]	8	1
700	2017-05-24 09:59:08.0061+00	234	If you don't have something you take seriously to aim for you won't achieve it, it's as simple as that.	1	[{"added": {}}]	8	1
701	2017-05-24 10:00:14.313856+00	235	If you can't afford something you want don't buy it on credit.	1	[{"added": {}}]	8	1
702	2017-05-24 10:01:12.804496+00	236	Your deposits are loans that you make to your bank.	1	[{"added": {}}]	8	1
703	2017-05-24 10:02:32.256518+00	31	Society	1	[{"added": {}}]	12	1
704	2017-05-24 10:02:41.116143+00	59	Society	1	[{"added": {}}]	13	1
705	2017-05-24 10:03:04.12823+00	60	Justice	1	[{"added": {}}]	13	1
706	2017-05-24 10:03:24.410792+00	237	Society cannot subsist unless the laws of justice are tolerably observed.	1	[{"added": {}}]	8	1
707	2017-05-24 10:04:04.205452+00	32	Justice	1	[{"added": {}}]	12	1
708	2017-05-24 10:04:15.464256+00	238	Mercy to the guilty is cruelty to the innocent.	1	[{"added": {}}]	8	1
709	2017-05-24 10:06:04.898451+00	61	Knowledge	1	[{"added": {}}]	13	1
710	2017-05-24 10:06:13.305591+00	239	Knowledge is power, but execution trumps knowledge.	1	[{"added": {}}]	8	1
711	2017-05-29 13:58:03.033731+00	117	Felix Dennis	1	[{"added": {}}]	9	1
712	2017-05-29 13:58:06.686013+00	21	88, the narrow road : a brief guide to the getting of money	1	[{"added": {}}]	7	1
713	2017-05-29 13:58:49.148808+00	240	If you care what the neighbours think, you will never be rich.	1	[{"added": {}}]	8	1
714	2017-05-29 14:48:57.471927+00	241	You will never get rich working for your boss.	1	[{"added": {}}]	8	1
715	2017-05-29 14:49:39.553046+00	242	Ideas don't make you rich. The correct execution of ideas does.	1	[{"added": {}}]	8	1
716	2017-05-29 14:50:40.679593+00	118	Sam Walton	1	[{"added": {}}]	9	1
717	2017-05-29 14:52:40.796043+00	244	Experience is only the name we give to our failures.	1	[{"added": {}}]	8	1
718	2017-05-29 14:53:57.008967+00	245	No one can make you feel inferior without your consent.	1	[{"added": {}}]	8	1
719	2017-05-29 14:59:13.896694+00	247	There is only one boss. The customer. And he can fire everybody in the company from the chairman on down, simply by spending his money somewhere else.	1	[{"added": {}}]	8	1
720	2017-05-29 14:59:39.267774+00	247	There is only one boss. The customer. And he can fire everybody in the company from the chairman on down, simply by spending his money somewhere else.	3		8	1
721	2017-05-29 15:05:40.136052+00	248	There is only one boss. The customer. And he can fire everybody in the company from the chairman on down, simply by spending his money somewhere else.	1	[{"added": {}}]	8	1
722	2017-05-29 15:19:02.217645+00	248	There is only one boss. The customer. And he can fire everybody in the company from the chairman on down, simply by spending his money somewhere else.	2	[]	8	1
723	2017-05-29 15:19:24.29794+00	248	There is only one boss. The customer. And he can fire everybody in the company from the chairman on down, simply by spending his money somewhere else.	3		8	1
724	2017-05-29 15:45:37.669634+00	252	There is only one boss. The customer. And he can fire everybody in the company from the chairman on down, simply by spending his money somewhere else.	1	[{"added": {}}]	8	1
725	2017-05-29 15:46:40.107134+00	245	No one can make you feel inferior without your consent.	3		8	1
726	2017-05-29 15:47:04.14918+00	253	No one can make you feel inferior without your consent.	1	[{"added": {}}]	8	1
727	2017-06-03 18:27:42.622541+00	254	Before we can feel much for others, we must in some measure be at ease ourselves.	1	[{"added": {}}]	8	1
728	2017-06-03 18:28:50.998711+00	255	We suffer more when we fall from a better to a worse situation, than we ever enjoy when we rise from a worse to a better.	1	[{"added": {}}]	8	1
729	2017-06-05 17:58:24.658985+00	256	To a real wise man the judicious and well-weighed approbation of a single wise man, gives more heartfelt satisfaction than all the noisy applauses of ten thousand ignorant though enthusiastic admirers	1	[{"added": {}}]	8	1
730	2017-06-05 18:02:01.986268+00	257	In almost all cases, it is better to be a little too proud, than, in any respect, too humble.	1	[{"added": {}}]	8	1
731	2017-06-05 18:03:51.582333+00	258	Never complain of that of which it is at all times in your power to rid yourself.	1	[{"added": {}}]	8	1
732	2017-07-02 16:19:14.845926+00	119	J. Michael Straczynski	1	[{"added": {}}]	9	1
733	2017-07-02 16:19:33.546854+00	22	The Twilight Zone Volume 2: The Way In	1	[{"added": {}}]	7	1
734	2017-07-02 16:40:23.319284+00	269	The minute one decides one does not have a choice, one has made a choice.	1	[{"added": {}}]	8	1
735	2017-07-02 16:43:01.143598+00	120	John Le Carré	1	[{"added": {}}]	9	1
736	2017-07-02 16:43:20.83734+00	23	Absolute friends	1	[{"added": {}}]	7	1
737	2017-07-02 16:43:50.062117+00	270	By repetition, each lie becomes an irreversible fact upon which other lies are constructed.	1	[{"added": {}}]	8	1
738	2017-07-06 19:52:35.347123+00	271	Ignorance is not bliss. Ignorance is pain and poverty in the financial world.	1	[{"added": {}}]	8	1
739	2017-07-06 19:53:20.404528+00	272	We all get what we tolerate.	1	[{"added": {}}]	8	1
740	2017-07-06 19:53:54.075976+00	273	The ultimate thing that stops most of us from making significant progress in our lives is not somebody else's limitations, but rather our own limiting perceptions or beliefs.	1	[{"added": {}}]	8	1
741	2017-07-06 20:01:59.870707+00	274	The secret to living is giving.	1	[{"added": {}}]	8	1
742	2017-07-10 14:20:19.449829+00	121	Kieran Allen	1	[{"added": {}}]	9	1
743	2017-07-10 14:20:35.779114+00	24	Marx and the alternative to capitalism	1	[{"added": {}}]	7	1
744	2017-07-10 14:21:51.866777+00	275	The average worker, I am sorry to say, wants a job in which he does not have to think.	1	[{"added": {}}]	8	1
745	2017-07-16 11:35:06.741428+00	122	Dresden James	1	[{"added": {}}]	9	1
746	2017-07-16 11:35:42.235002+00	276	When a well-packaged web of lies has been sold gradually to the masses over generations, the truth will seem utterly preposterous and its speaker a raving lunatic.	1	[{"added": {}}]	8	1
747	2017-07-16 11:38:47.121486+00	123	James Connolly	1	[{"added": {}}]	9	1
748	2017-07-16 11:39:11.512766+00	277	Socialism properly implies above all things the co-operative control by the workers of the machinery of production; without this co-operative control the public ownership by the State is not Socialism	1	[{"added": {}}]	8	1
749	2017-07-16 11:43:21.262293+00	124	Brooks Stevens	1	[{"added": {}}]	9	1
750	2017-07-16 11:45:12.549791+00	62	Consumerism	1	[{"added": {}}]	13	1
751	2017-07-16 11:45:24.375418+00	63	Economics	1	[{"added": {}}]	13	1
752	2017-07-16 11:45:39.16713+00	278	We make good products, we induce people to buy them, and then the next year we deliberately introduce something else that will make these products old fashioned, out of date, obsolete.	1	[{"added": {}}]	8	1
753	2017-07-29 16:39:10.337525+00	125	Mario Andretti	1	[{"added": {}}]	9	1
754	2017-07-29 16:39:32.709726+00	279	'If everything seems under control, you're not going fast enough.	1	[{"added": {}}]	8	1
755	2017-07-29 16:40:47.668083+00	280	If it's a "must" and not just a "should", you'll find a way.	1	[{"added": {}}]	8	1
756	2017-07-29 16:43:48.002701+00	281	What you get will never make you happy; who you become will make you very happy or very sad.	1	[{"added": {}}]	8	1
757	2017-07-29 16:48:37.803877+00	1	Economics	2	[{"changed": {"fields": ["name"]}}]	12	1
758	2017-07-29 16:48:41.432583+00	282	The production of surplus value and the transformation of a portion of it back into capital or accumulation, is the immediate purpose and the determining motive of capitalist production.	1	[{"added": {}}]	8	1
759	2017-07-30 15:52:22.58544+00	126	Brian K. Vaughan	1	[{"added": {}}]	9	1
760	2017-07-30 15:52:40.88142+00	25	Y: The Last Man	1	[{"added": {}}]	7	1
761	2017-07-30 15:53:07.641529+00	127	Woody Allen	1	[{"added": {}}]	9	1
762	2017-07-30 15:53:29.147979+00	33	Humour	1	[{"added": {}}]	12	1
763	2017-07-30 15:53:37.818895+00	64	Humour	1	[{"added": {}}]	13	1
764	2017-07-30 15:53:52.241669+00	283	I don't want to move to a city where the only cultural advantage is being able to make a right turn on a red light.	1	[{"added": {}}]	8	1
765	2017-08-03 18:08:52.932523+00	6	zev	1	[{"added": {}}]	2	1
766	2017-08-03 18:13:15.884856+00	6	zev	2	[{"changed": {"fields": ["first_name", "last_name", "email", "is_staff", "date_joined"]}}]	2	1
767	2017-08-04 11:15:27.248335+00	128	Jawaharlal Nehru	1	[{"added": {}}]	9	1
768	2017-08-04 11:17:17.843229+00	129	Toby Manhire	1	[{"added": {}}]	9	1
769	2017-08-04 11:17:19.854525+00	26	The Arab Spring : rebellion, revolution and a new world order	1	[{"added": {}}]	7	1
770	2017-08-04 11:17:36.178939+00	284	Democracy for an Eastern country seems to mean only one thing: to carry out the behests of the imperialist ruling power.	1	[{"added": {}}]	8	1
771	2017-08-04 11:20:39.592887+00	130	Roger Trapp	1	[{"added": {}}]	9	1
772	2017-08-04 11:20:45.783867+00	27	What you need to know about business	1	[{"added": {}}]	7	1
773	2017-08-04 11:20:55.19334+00	285	There is only one valid definition of business purpose: to create a customer.	1	[{"added": {}}]	8	1
774	2017-08-05 23:13:24.11379+00	6	zev	2	[{"changed": {"fields": ["password"]}}]	2	1
775	2017-08-05 23:49:01.345447+00	6	zev	2	[]	2	1
789	2017-08-06 00:04:12.344908+00	5	article	2	[]	18	1
790	2017-08-06 00:04:23.922594+00	5	article	2	[{"changed": {"fields": ["text"]}}]	18	1
791	2017-08-06 00:05:23.501225+00	1	test1	2	[{"changed": {"fields": ["published"]}}]	18	1
792	2017-08-06 00:05:33.204789+00	2	test2	2	[{"changed": {"fields": ["published"]}}]	18	1
793	2017-08-06 00:05:37.354915+00	3	test3	2	[{"changed": {"fields": ["published"]}}]	18	1
794	2017-08-06 00:05:41.781704+00	4	test4	2	[{"changed": {"fields": ["published"]}}]	18	1
795	2017-08-06 00:05:51.650048+00	5	article	2	[{"changed": {"fields": ["published"]}}]	18	1
796	2017-08-06 00:05:58.676187+00	5	article	3		18	1
797	2017-08-06 00:05:58.680226+00	4	test4	3		18	1
798	2017-08-06 22:02:48.455711+00	1	hakim	2	[{"changed": {"fields": ["email"]}}]	2	1
799	2017-08-06 23:27:57.034371+00	7	HakimBenoudjit	3		2	1
800	2017-08-06 23:27:57.038922+00	9	h.benoudjit	3		2	1
801	2017-08-06 23:27:57.042255+00	8	h4k1m0u	3		2	1
802	2017-08-06 23:30:58.674056+00	10	HakimBenoudjit	3		2	1
803	2017-08-06 23:30:58.678948+00	12	h.benoudjit	3		2	1
804	2017-08-06 23:30:58.6819+00	11	h4k1m0u	3		2	1
805	2017-08-06 23:32:54.493751+00	13	h4k1m0u	3		2	1
806	2017-08-06 23:34:51.219751+00	14	h.benoudjit	3		2	1
807	2017-08-06 23:34:51.223563+00	15	h4k1m0u	3		2	1
808	2017-08-06 23:36:55.392536+00	16	h.benoudjit	3		2	1
809	2017-08-06 23:37:06.513501+00	11	hakim	3		22	1
810	2017-08-06 23:37:06.517505+00	7	hakim	3		22	1
811	2017-08-10 15:41:35.991137+00	131	Tim Hindle	1	[{"added": {}}]	9	1
812	2017-08-10 15:43:17.259449+00	286	Companies can win either by being cheaper or by being different (which means being perceived by the customer as better or more relevant).	1	[{"added": {}}]	8	1
813	2017-08-11 13:14:04.607545+00	1	test1	2	[{"changed": {"fields": ["published"]}}]	18	1
814	2017-08-11 13:14:18.526359+00	1	test1	2	[{"changed": {"fields": ["published"]}}]	18	1
815	2017-08-12 23:23:53.827161+00	13	HakimBenoudjit	3		22	1
816	2017-08-12 23:24:24.405976+00	17	HakimBenoudjit	3		2	1
817	2017-08-13 11:38:16.251738+00	8	Business	2	[{"changed": {"fields": ["image"]}}]	12	1
818	2017-08-13 11:38:22.385119+00	1	Economics	2	[{"changed": {"fields": ["image"]}}]	12	1
819	2017-08-13 11:38:28.040272+00	7	Inspirational	2	[{"changed": {"fields": ["image"]}}]	12	1
820	2017-08-13 11:38:37.520319+00	22	Life	2	[{"changed": {"fields": ["image"]}}]	12	1
821	2017-08-13 11:38:46.630513+00	18	Personal finance	2	[{"changed": {"fields": ["image"]}}]	12	1
822	2017-08-15 09:07:41.340884+00	132	Daniel Conaghan	1	[{"added": {}}]	9	1
823	2017-08-15 09:07:44.967569+00	28	The book of money : everything you need to know about how world finances work	1	[{"added": {}}]	7	1
824	2017-08-15 09:08:41.380529+00	133	Ronald Reagan	1	[{"added": {}}]	9	1
825	2017-08-15 09:08:57.637439+00	287	Government's view of the economy could be summed up in a few short phrases: If it moves, tax it. If it keeps moving, regulate it. And if it stops moving, subsidize it.	1	[{"added": {}}]	8	1
826	2017-08-18 21:31:20.895724+00	279	If everything seems under control, you're not going fast enough.	2	[{"changed": {"fields": ["text"]}}]	8	1
827	2017-08-18 21:33:58.669122+00	134	Jean-Michel Severino	1	[{"added": {}}]	9	1
828	2017-08-18 21:34:01.736218+00	29	Africa's moment	1	[{"added": {}}]	7	1
829	2017-08-18 21:35:30.637152+00	135	Pablo Picasso	1	[{"added": {}}]	9	1
830	2017-08-18 21:36:20.880531+00	288	Every act of creation is first of all an act of destruction.	1	[{"added": {}}]	8	1
831	2017-08-18 21:38:09.170499+00	136	Tim S. Grover	1	[{"added": {}}]	9	1
832	2017-08-18 21:38:18.261589+00	30	Relentless : from good to great to unstoppable	1	[{"added": {}}]	7	1
833	2017-08-18 21:39:11.70137+00	289	If you don't make a choice, the choice will be made for you.	1	[{"added": {}}]	8	1
834	2017-08-20 10:01:56.025974+00	137	Oprah Winfrey	1	[{"added": {}}]	9	1
835	2017-08-20 10:02:10.788367+00	290	Every right decision I've made has come from my gut, and every wrong decision I've ever made was a result of me not listening.	1	[{"added": {}}]	8	1
836	2017-08-23 14:23:08.156629+00	138	Wayne Gretzky	1	[{"added": {}}]	9	1
837	2017-08-23 14:23:51.840393+00	291	You miss one hundred percent of the shots you don't take.	1	[{"added": {}}]	8	1
838	2017-08-23 14:26:32.823732+00	3	rabah	3		2	1
839	2017-08-25 15:35:13.349528+00	292	An investment in knowledge pays the best interest.	1	[{"added": {}}]	8	1
840	2017-08-27 18:54:42.589011+00	139	John Stuart Mill	1	[{"added": {}}]	9	1
841	2017-08-27 18:55:06.991455+00	293	There is no democracy without democrats, and there are no democrats without democratic struggle.	1	[{"added": {}}]	8	1
842	2017-08-27 19:03:44.628957+00	140	Jeffrey Sachs	1	[{"added": {}}]	9	1
843	2017-08-27 19:04:01.275744+00	294	Eductiona and health care are preconditions for economic development.	1	[{"added": {}}]	8	1
844	2017-08-28 00:22:02.663631+00	294	Education and health care are preconditions for economic development.	2	[{"changed": {"fields": ["text"]}}]	8	1
845	2017-08-29 18:14:12.497801+00	141	Deng Xiaoping	1	[{"added": {}}]	9	1
846	2017-08-29 18:15:25.452043+00	295	It doesn't matter whether a cat is black or white. As long as it catches mice.	1	[{"added": {}}]	8	1
847	2017-09-06 16:13:33.890435+00	296	I try to buy stock in businesses that are so wonderful that an idiot can run them. Because sooner or later, one will.	1	[{"added": {}}]	8	1
848	2017-09-16 16:19:20.418677+00	142	Fyodor Dostoyevsky	1	[{"added": {}}]	9	1
849	2017-09-16 16:19:24.515497+00	31	The double	1	[{"added": {}}]	7	1
850	2017-09-16 16:22:27.131637+00	143	Jean-Baptiste de Villèle	1	[{"added": {}}]	9	1
851	2017-09-16 16:23:09.19887+00	297	All things will come in due course to him who has the gumption to be patient.	1	[{"added": {}}]	8	1
852	2017-10-23 09:43:41.591058+00	32	Benjamin Franklin's autobiography	1	[{"added": {}}]	7	1
853	2017-10-23 09:44:27.270907+00	298	Small things appearing great to those in small circumstances.	1	[{"added": {}}]	8	1
854	2017-11-17 23:58:10.651656+00	63	Expense object	1	[{"added": {}}]	25	1
855	2017-11-17 23:58:17.352743+00	63	Expense object	3		25	1
856	2017-11-18 00:02:34.841868+00	21	test	1	[{"added": {}}]	2	1
857	2017-11-18 00:04:20.349963+00	21	test	3		2	1
858	2017-11-18 00:04:34.770558+00	90cd83d38e099c556754567e99d823354f7b219e	90cd83d38e099c556754567e99d823354f7b219e	1	[{"added": {}}]	26	1
859	2017-11-18 00:44:27.673618+00	65	Expense object	3		25	1
860	2017-11-18 00:44:27.677717+00	64	Expense object	3		25	1
861	2017-11-18 01:13:45.071156+00	66	Expense object	3		25	1
862	2017-11-18 01:20:52.278946+00	67	Expense object	1	[{"added": {}}]	25	1
863	2017-11-18 01:20:57.936852+00	67	Expense object	3		25	1
864	2017-11-18 12:55:40.994576+00	68	Expense object	3		25	1
865	2017-11-18 14:46:04.657129+00	299	He that has once done you a kindness will be more ready to do you another, than he whom you yourself have obliged.	1	[{"added": {}}]	8	1
866	2017-11-18 14:50:13.043049+00	300	It is hard for an empty sack to stand upright.	1	[{"added": {}}]	8	1
867	2017-11-18 14:54:37.947524+00	301	If you teach a poor young man to shave himself, and keep his razor in order, you may contribute more to the happiness of his life than in giving him a thousand guineas.	1	[{"added": {}}]	8	1
868	2017-11-19 17:20:13.205105+00	72	Expense object	3		25	1
869	2017-11-19 17:29:32.262071+00	73	Expense object	3		25	1
870	2017-11-19 20:28:02.071472+00	302	test	3		8	1
871	2017-11-19 20:32:27.527098+00	303	test	3		8	1
872	2017-11-19 20:33:27.012899+00	304	test	3		8	1
873	2017-11-19 23:27:23.372805+00	305	Souk mouk	2	[{"changed": {"fields": ["published"]}}]	8	1
874	2017-11-19 23:28:15.389049+00	144	atmane 3aliwat	3		9	1
875	2017-11-19 23:52:13.680597+00	145	rabah lahbiri	3		9	1
876	2017-11-20 12:31:59.798465+00	74	Expense object	1	[{"added": {}}]	25	1
877	2017-11-20 20:53:05.903422+00	76	Expense object	1	[{"added": {}}]	25	1
878	2017-11-21 13:49:38.8746+00	77	Expense object	1	[{"added": {}}]	25	1
879	2017-11-21 13:50:05.722761+00	77	Expense object	2	[{"changed": {"fields": ["description"]}}]	25	1
880	2017-11-23 14:23:42.022071+00	79	Expense object	1	[{"added": {}}]	25	1
881	2017-11-23 15:38:01.814321+00	80	Expense object	1	[{"added": {}}]	25	1
882	2017-11-23 15:38:35.220741+00	81	Expense object	1	[{"added": {}}]	25	1
883	2017-11-24 11:10:37.733376+00	83	Expense object	1	[{"added": {}}]	25	1
884	2017-11-24 18:48:52.016195+00	84	Expense object	1	[{"added": {}}]	25	1
885	2017-11-26 14:46:21.954895+00	86	Expense object	1	[{"added": {}}]	25	1
886	2017-11-26 14:48:33.17771+00	87	Expense object	1	[{"added": {}}]	25	1
887	2017-11-26 22:37:56.809198+00	86	Expense object	2	[{"changed": {"fields": ["amount"]}}]	25	1
888	2017-11-30 10:10:29.58812+00	93	Expense object	1	[{"added": {}}]	25	1
889	2017-12-01 20:14:40.472248+00	95	Expense object	1	[{"added": {}}]	25	1
890	2017-12-02 11:22:32.617816+00	96	Expense object	1	[{"added": {}}]	25	1
891	2017-12-21 22:56:53.740047+00	1	test1	2	[{"changed": {"fields": ["published", "text"]}}]	18	1
892	2017-12-21 23:06:25.875602+00	1	test1	2	[{"changed": {"fields": ["text"]}}]	18	1
893	2017-12-21 23:12:23.194813+00	1	test1	2	[{"changed": {"fields": ["text"]}}]	18	1
894	2017-12-29 22:17:23.63088+00	2	test2	2	[{"changed": {"fields": ["published", "text"]}}]	18	1
895	2017-12-29 22:17:28.262791+00	3	test3	2	[{"changed": {"fields": ["published", "text"]}}]	18	1
896	2017-12-29 23:03:51.720704+00	1	test1	2	[]	18	1
897	2017-12-29 23:16:49.650983+00	1	test1	2	[]	18	1
898	2017-12-29 23:16:52.727274+00	2	test2	2	[]	18	1
899	2017-12-29 23:16:55.32025+00	3	test3	2	[]	18	1
900	2017-12-31 17:49:47.802089+00	6	test4	1	[{"added": {}}]	18	1
901	2017-12-31 17:59:14.76045+00	97	Expense object (97)	1	[{"added": {}}]	25	1
902	2018-01-01 21:06:29.784561+00	6	zev	3		2	1
903	2018-01-01 21:14:41.783924+00	98	Expense object (98)	1	[{"added": {}}]	25	1
904	2018-01-05 20:47:34.389903+00	22	test	3		2	1
905	2018-01-06 19:29:41.103954+00	6	test4	2	[{"changed": {"fields": ["published"]}}]	18	1
906	2018-01-06 19:29:45.255364+00	3	test3	2	[{"changed": {"fields": ["published"]}}]	18	1
907	2018-01-06 19:29:48.888564+00	2	test2	2	[{"changed": {"fields": ["published"]}}]	18	1
908	2018-01-06 19:29:52.571755+00	1	test1	2	[{"changed": {"fields": ["published"]}}]	18	1
909	2018-01-07 18:13:59.014687+00	6	test4	3		18	1
910	2018-01-07 18:13:59.017001+00	3	test3	3		18	1
911	2018-01-07 18:13:59.018186+00	2	test2	3		18	1
912	2018-01-07 18:13:59.019619+00	1	test1	3		18	1
913	2018-01-07 18:16:01.966431+00	4	article	3		17	1
914	2018-01-07 18:16:01.969796+00	1	test1	3		17	1
915	2018-01-07 18:16:01.971254+00	2	test2	3		17	1
916	2018-01-07 18:16:01.972538+00	3	test3	3		17	1
917	2018-01-07 18:17:11.471217+00	4	article	3		19	1
918	2018-01-07 18:17:11.473749+00	1	test1	3		19	1
919	2018-01-07 18:17:11.474887+00	2	test2	3		19	1
920	2018-01-07 18:17:11.475963+00	3	test3	3		19	1
921	2018-01-07 18:23:35.748195+00	5	Google Earth Engine	1	[{"added": {}}]	19	1
922	2018-01-07 18:23:50.581255+00	7	Getting started with Google Earth Engine	1	[{"added": {}}]	18	1
923	2018-01-07 18:30:00.240297+00	7	Getting started with Google Earth Engine	2	[{"changed": {"fields": ["text"]}}]	18	1
924	2018-01-07 18:30:34.961444+00	7	Getting started with Google Earth Engine	2	[{"changed": {"fields": ["text"]}}]	18	1
925	2018-01-07 18:36:33.899713+00	7	Getting started with Google Earth Engine	2	[{"changed": {"fields": ["text"]}}]	18	1
926	2018-01-07 18:39:19.44769+00	7	Getting started with Google Earth Engine	2	[{"changed": {"fields": ["text"]}}]	18	1
927	2018-01-07 18:42:36.272759+00	7	Getting started with Google Earth Engine	2	[{"changed": {"fields": ["text"]}}]	18	1
928	2018-01-07 18:54:48.775686+00	7	Getting started with Google Earth Engine	2	[{"changed": {"fields": ["text"]}}]	18	1
929	2018-01-07 18:55:02.935139+00	7	Getting started with Google Earth Engine	2	[{"changed": {"fields": ["published"]}}]	18	1
930	2018-01-07 18:57:28.854472+00	7	Getting started with Google Earth Engine	2	[{"changed": {"fields": ["text"]}}]	18	1
931	2018-01-07 21:05:11.52476+00	7	Getting started with Google Earth Engine	2	[{"changed": {"fields": ["text"]}}]	18	1
932	2018-01-07 21:33:27.429405+00	7	Getting started with Google Earth Engine	2	[{"changed": {"fields": ["text"]}}]	18	1
933	2018-01-07 21:53:05.073373+00	7	Getting started with Google Earth Engine	2	[{"changed": {"fields": ["image"]}}]	18	1
934	2018-01-07 21:54:26.867315+00	7	Getting started with Google Earth Engine	2	[]	18	1
935	2018-01-07 22:16:52.325115+00	7	Getting started with Google Earth Engine	2	[{"changed": {"fields": ["text"]}}]	18	1
936	2018-01-07 22:21:30.183183+00	7	Getting started with Google Earth Engine	2	[{"changed": {"fields": ["text"]}}]	18	1
937	2018-01-13 00:16:24.497041+00	23	hakima	3		2	1
938	2018-01-13 00:16:36.190669+00	5	abookzDax	3		2	1
939	2018-01-13 00:16:36.192797+00	18	h4k1m0u	3		2	1
940	2018-01-13 00:16:36.194024+00	20	HakimBenoudjit	3		2	1
941	2018-01-13 00:16:36.195243+00	19	h.benoudjit	3		2	1
942	2018-01-13 00:16:36.196539+00	4	vice112	3		2	1
943	2018-01-13 00:16:45.240811+00	5	abookzDax	3		2	1
944	2018-01-13 00:16:49.568536+00	4	vice112	3		2	1
945	2018-01-13 00:16:56.031113+00	20	HakimBenoudjit	3		2	1
946	2018-01-13 00:17:04.071083+00	19	h.benoudjit	3		2	1
947	2018-01-20 18:42:51.798924+00	7	Getting started with Google Earth Engine	2	[{"changed": {"fields": ["text"]}}]	18	1
948	2018-01-20 21:45:36.498117+00	7	Getting started with Google Earth Engine	2	[{"changed": {"fields": ["text"]}}]	18	1
949	2018-01-20 22:51:13.547338+00	7	Getting started with Google Earth Engine	2	[{"changed": {"fields": ["text"]}}]	18	1
950	2018-01-20 23:26:51.67032+00	7	Getting started with Google Earth Engine	2	[{"changed": {"fields": ["text"]}}]	18	1
951	2018-01-20 23:41:44.624914+00	2	www.gistutorials.com	1	[{"added": {}}]	15	1
952	2018-01-27 14:59:47.870551+00	7	Getting started with Google Earth Engine	2	[{"changed": {"fields": ["text"]}}]	18	1
953	2018-01-27 15:37:51.200931+00	7	Getting started with Google Earth Engine	2	[{"changed": {"fields": ["text"]}}]	18	1
954	2018-01-27 18:16:21.133191+00	7	Getting started with Google Earth Engine	2	[{"changed": {"fields": ["text"]}}]	18	1
955	2018-01-27 18:16:36.12021+00	7	Getting started with Google Earth Engine	2	[{"changed": {"fields": ["text"]}}]	18	1
956	2018-01-27 18:27:02.032054+00	7	Getting started with Google Earth Engine	2	[{"changed": {"fields": ["text"]}}]	18	1
957	2018-01-27 18:33:25.896405+00	7	Getting started with Google Earth Engine	2	[{"changed": {"fields": ["text"]}}]	18	1
958	2018-01-27 19:12:41.307388+00	7	Getting started with Google Earth Engine	2	[{"changed": {"fields": ["text"]}}]	18	1
959	2018-01-27 19:20:18.053755+00	7	Getting started with Google Earth Engine	2	[{"changed": {"fields": ["text"]}}]	18	1
960	2018-01-27 19:25:50.953771+00	7	Getting started with Google Earth Engine	2	[{"changed": {"fields": ["text"]}}]	18	1
961	2018-01-27 19:28:06.4407+00	7	Getting started with Google Earth Engine	2	[{"changed": {"fields": ["text"]}}]	18	1
962	2018-01-27 19:28:48.703542+00	7	Getting started with Google Earth Engine	2	[{"changed": {"fields": ["text"]}}]	18	1
963	2018-01-27 19:40:12.057284+00	7	Getting started with Google Earth Engine	2	[{"changed": {"fields": ["text"]}}]	18	1
964	2018-01-27 19:58:54.624538+00	7	Getting started with Google Earth Engine	2	[{"changed": {"fields": ["text"]}}]	18	1
965	2018-01-27 19:59:39.426277+00	7	Getting started with Google Earth Engine	2	[{"changed": {"fields": ["text"]}}]	18	1
966	2018-01-27 19:59:48.843318+00	7	Getting started with Google Earth Engine	2	[]	18	1
967	2018-01-28 13:27:02.898764+00	7	Getting started with Google Earth Engine	2	[]	18	1
968	2018-01-28 13:27:16.913644+00	7	Getting started with Google Earth Engine	2	[]	18	1
969	2018-01-28 13:27:52.321319+00	7	Getting started with Google Earth Engine	2	[]	18	1
970	2018-01-29 20:16:53.404138+00	6	test	1	[{"added": {}}]	19	1
971	2018-01-29 20:16:55.234846+00	7	Getting started with Google Earth Engine	2	[{"changed": {"fields": ["tags"]}}]	18	1
972	2018-01-29 20:17:10.236494+00	7	Getting started with Google Earth Engine	2	[{"changed": {"fields": ["tags"]}}]	18	1
973	2018-01-29 20:17:23.572019+00	6	test	3		19	1
974	2018-02-03 17:33:18.008193+00	7	Getting started with Google Earth Engine	2	[{"changed": {"fields": ["text"]}}]	18	1
975	2018-02-04 12:37:18.649469+00	7	GeoPandas	1	[{"added": {}}]	19	1
976	2018-02-04 12:37:26.333108+00	8	GeoJSON	1	[{"added": {}}]	19	1
977	2018-02-04 12:39:51.499967+00	8	Plot a GeoJSON map using GeoPandas	1	[{"added": {}}]	18	1
978	2018-02-04 12:47:50.090603+00	8	Plot a GeoJSON map using GeoPandas	2	[{"changed": {"fields": ["text"]}}]	18	1
979	2018-02-04 12:51:59.036474+00	8	Plot a GeoJSON map using GeoPandas	2	[{"changed": {"fields": ["text"]}}]	18	1
980	2018-02-04 12:54:57.917974+00	8	Plot a GeoJSON map using GeoPandas	2	[{"changed": {"fields": ["text"]}}]	18	1
981	2018-02-04 13:19:40.795287+00	8	Plot a GeoJSON map using GeoPandas	2	[]	18	1
982	2018-02-04 13:20:26.997531+00	8	Plot a GeoJSON map using GeoPandas	2	[{"changed": {"fields": ["text"]}}]	18	1
983	2018-02-04 13:20:51.480632+00	8	Plot a GeoJSON map using GeoPandas	2	[]	18	1
984	2018-02-04 13:21:52.501682+00	8	Plot a GeoJSON map using GeoPandas	2	[{"changed": {"fields": ["text"]}}]	18	1
985	2018-02-04 13:25:24.509062+00	8	Plot a GeoJSON map using GeoPandas	2	[{"changed": {"fields": ["text"]}}]	18	1
986	2018-02-04 13:25:29.844552+00	8	Plot a GeoJSON map using GeoPandas	2	[{"changed": {"fields": ["published"]}}]	18	1
987	2018-02-04 13:27:19.994908+00	8	Plot a GeoJSON map using GeoPandas	2	[{"changed": {"fields": ["text"]}}]	18	1
988	2018-02-04 13:50:37.186597+00	8	Plot a GeoJSON map using GeoPandas	2	[{"changed": {"fields": ["text"]}}]	18	1
989	2018-02-04 14:16:23.27341+00	8	Plot a GeoJSON map using GeoPandas	2	[{"changed": {"fields": ["text"]}}]	18	1
990	2018-02-08 01:19:08.792646+00	7	Getting started with Google Earth Engine	2	[{"changed": {"fields": ["text"]}}]	18	1
991	2018-02-18 21:41:35.573787+00	9	Scikit-learn	1	[{"added": {}}]	19	1
992	2018-02-18 22:15:39.79325+00	9	Clustering a satellite image with Scikit-learn	1	[{"added": {}}]	18	1
993	2018-02-18 22:16:27.127152+00	8	Plot a GeoJSON map using GeoPandas	2	[{"changed": {"fields": ["text"]}}]	18	1
994	2018-02-18 22:23:10.875866+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
995	2018-02-18 22:37:50.036015+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
996	2018-02-18 22:47:13.558153+00	10	GDAL	1	[{"added": {}}]	19	1
997	2018-02-18 22:47:15.443681+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["published", "text", "tags"]}}]	18	1
998	2018-02-18 22:49:23.098345+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
999	2018-02-18 22:50:12.330268+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1000	2018-02-18 22:53:06.808503+00	9	Clustering a satellite image with Scikit-learn	2	[]	18	1
1001	2018-02-18 23:08:25.320885+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1002	2018-02-18 23:09:59.57607+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1003	2018-02-18 23:12:35.194967+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1004	2018-02-18 23:14:32.922153+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1005	2018-02-18 23:15:25.776119+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1006	2018-02-18 23:16:06.646284+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1007	2018-02-18 23:16:29.425727+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1008	2018-02-18 23:17:05.788323+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1009	2018-02-18 23:18:08.556411+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1010	2018-02-18 23:18:34.119199+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1011	2018-02-18 23:19:09.801166+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1012	2018-02-18 23:20:12.260605+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1013	2018-02-18 23:20:51.381984+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1014	2018-02-18 23:21:23.422082+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1015	2018-02-18 23:23:58.236952+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1016	2018-02-18 23:25:52.679213+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1017	2018-02-18 23:26:06.947812+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1018	2018-02-18 23:26:27.665994+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1019	2018-02-18 23:26:46.283435+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1020	2018-02-18 23:27:04.779923+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1021	2018-02-18 23:27:42.263009+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1022	2018-02-18 23:28:07.583581+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1023	2018-02-18 23:30:08.464283+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1024	2018-02-18 23:30:46.620113+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1025	2018-02-18 23:33:16.2509+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1026	2018-02-18 23:36:55.094436+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1027	2018-02-18 23:37:58.991274+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1028	2018-02-18 23:38:14.37093+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1029	2018-02-18 23:38:25.236637+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1030	2018-02-18 23:39:17.8947+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1031	2018-02-18 23:39:37.084076+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1032	2018-02-18 23:39:54.114841+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1033	2018-02-18 23:40:07.977019+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1034	2018-02-18 23:42:45.244169+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1035	2018-02-18 23:43:14.439515+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1036	2018-02-18 23:43:43.293451+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1037	2018-02-18 23:44:21.946638+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1038	2018-02-18 23:44:35.205652+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1039	2018-02-18 23:44:48.58071+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1040	2018-02-18 23:45:05.960255+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1041	2018-02-18 23:45:16.717789+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1042	2018-02-19 00:18:57.337661+00	9	Clustering a satellite image with Scikit-learn	2	[]	18	1
1043	2018-02-19 00:20:05.967775+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1044	2018-02-19 00:20:22.295681+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1045	2018-02-19 00:21:06.261721+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1046	2018-02-19 00:21:19.66791+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1047	2018-02-19 00:21:41.529465+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1048	2018-02-19 00:22:14.045013+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1049	2018-02-19 00:22:52.671478+00	9	Clustering a satellite image with Scikit-learn	2	[{"changed": {"fields": ["text"]}}]	18	1
1050	2018-02-25 19:43:20.231869+00	11	PostgreSQL	1	[{"added": {}}]	19	1
1051	2018-02-25 19:43:26.329093+00	12	PostGIS	1	[{"added": {}}]	19	1
1052	2018-02-25 19:43:32.230189+00	13	Leaflet	1	[{"added": {}}]	19	1
1053	2018-02-25 19:43:37.362164+00	14	Django	1	[{"added": {}}]	19	1
1054	2018-02-25 19:47:34.665441+00	10	Displaying maps in a Django webapp	1	[{"added": {}}]	18	1
1055	2018-02-25 19:56:35.80239+00	10	Displaying maps in a Django webapp	2	[{"changed": {"fields": ["text"]}}]	18	1
1056	2018-02-25 20:01:54.625139+00	10	Displaying maps in a Django webapp	2	[{"changed": {"fields": ["text"]}}]	18	1
1057	2018-02-25 20:14:00.799563+00	10	Displaying maps in a Django webapp	2	[{"changed": {"fields": ["text"]}}]	18	1
1058	2018-02-25 20:18:42.386062+00	10	Displaying maps in a Django webapp	2	[{"changed": {"fields": ["published", "text"]}}]	18	1
1059	2018-02-25 20:21:56.917567+00	10	Create a GIS database with PostgreSQL and PostGIS	2	[{"changed": {"fields": ["title"]}}]	18	1
1060	2018-02-25 20:22:09.696433+00	10	Creating a GIS database with PostgreSQL and PostGIS	2	[{"changed": {"fields": ["title"]}}]	18	1
1061	2018-02-25 20:24:40.021684+00	10	Creating a GIS database with PostgreSQL and PostGIS	2	[]	18	1
1062	2018-02-25 20:25:00.121704+00	10	Creating a GIS database with PostgreSQL and PostGIS	2	[{"changed": {"fields": ["text"]}}]	18	1
1063	2018-02-25 20:25:25.086998+00	10	Creating a GIS database with PostgreSQL and PostGIS	2	[{"changed": {"fields": ["text"]}}]	18	1
1064	2018-02-25 20:33:10.958475+00	11	Develop a GIS webapp with GeoDjango	1	[{"added": {}}]	18	1
1065	2018-02-25 20:38:05.132182+00	11	Develop a GIS webapp with GeoDjango	2	[{"changed": {"fields": ["text"]}}]	18	1
1066	2018-02-25 20:43:22.353898+00	11	Develop a GIS webapp with GeoDjango	2	[{"changed": {"fields": ["text"]}}]	18	1
1067	2018-02-25 20:47:22.027371+00	11	Develop a GIS webapp with GeoDjango	2	[{"changed": {"fields": ["text"]}}]	18	1
1068	2018-02-25 21:05:53.780787+00	11	Develop a GIS webapp with GeoDjango	2	[{"changed": {"fields": ["text"]}}]	18	1
1069	2018-02-25 21:10:37.178936+00	11	Develop a GIS webapp with GeoDjango	2	[{"changed": {"fields": ["text"]}}]	18	1
1070	2018-02-25 21:17:40.726787+00	11	Develop a GIS webapp with GeoDjango	2	[{"changed": {"fields": ["published", "text"]}}]	18	1
1071	2018-02-25 21:26:32.648292+00	11	Develop a GIS webapp with GeoDjango	2	[{"changed": {"fields": ["text"]}}]	18	1
1072	2018-02-25 21:29:02.56696+00	11	Develop a GIS webapp with GeoDjango	2	[{"changed": {"fields": ["text"]}}]	18	1
1073	2018-02-25 21:40:51.735647+00	12	Showing a map on the Django admin	1	[{"added": {}}]	18	1
1074	2018-02-25 21:42:09.488713+00	12	Showing a map on the Django admin	2	[]	18	1
1075	2018-02-25 21:44:37.848752+00	11	Develop a GIS webapp with GeoDjango	2	[{"changed": {"fields": ["text"]}}]	18	1
1076	2018-02-25 21:45:09.655811+00	11	Develop a GIS webapp with GeoDjango	2	[{"changed": {"fields": ["text"]}}]	18	1
1077	2018-02-25 21:46:25.514489+00	10	Creating a GIS database with PostgreSQL and PostGIS	2	[{"changed": {"fields": ["text"]}}]	18	1
1078	2018-02-25 21:46:48.738277+00	10	Creating a GIS database with PostgreSQL and PostGIS	2	[{"changed": {"fields": ["text"]}}]	18	1
1079	2018-02-25 21:47:56.02544+00	10	Creating a GIS database with PostgreSQL and PostGIS	2	[{"changed": {"fields": ["text"]}}]	18	1
1080	2018-02-25 21:48:50.325664+00	11	Develop a GIS webapp with GeoDjango	2	[{"changed": {"fields": ["text"]}}]	18	1
1081	2018-02-25 21:49:06.687576+00	11	Develop a GIS webapp with GeoDjango	2	[{"changed": {"fields": ["text"]}}]	18	1
1082	2018-02-25 21:50:17.932207+00	11	Develop a GIS webapp with GeoDjango	2	[{"changed": {"fields": ["text"]}}]	18	1
1083	2018-02-25 21:53:54.351708+00	11	Develop a GIS webapp with GeoDjango	2	[]	18	1
1084	2018-02-25 21:54:26.708381+00	11	Develop a GIS webapp with GeoDjango	2	[{"changed": {"fields": ["text"]}}]	18	1
1085	2018-02-25 21:54:53.998875+00	11	Develop a GIS webapp with GeoDjango	2	[{"changed": {"fields": ["text"]}}]	18	1
1086	2018-02-25 21:55:10.463182+00	11	Develop a GIS webapp with GeoDjango	2	[{"changed": {"fields": ["text"]}}]	18	1
1087	2018-02-25 21:55:24.37296+00	11	Develop a GIS webapp with GeoDjango	2	[{"changed": {"fields": ["text"]}}]	18	1
1088	2018-02-25 21:56:06.245524+00	11	Develop a GIS webapp with GeoDjango	2	[{"changed": {"fields": ["text"]}}]	18	1
1089	2018-02-25 21:56:22.495769+00	11	Develop a GIS webapp with GeoDjango	2	[{"changed": {"fields": ["text"]}}]	18	1
1090	2018-02-25 21:56:43.604831+00	11	Develop a GIS webapp with GeoDjango	2	[{"changed": {"fields": ["text"]}}]	18	1
1091	2018-02-25 21:56:57.011431+00	11	Develop a GIS webapp with GeoDjango	2	[{"changed": {"fields": ["text"]}}]	18	1
1092	2018-02-25 21:57:13.594424+00	11	Develop a GIS webapp with GeoDjango	2	[{"changed": {"fields": ["text"]}}]	18	1
1093	2018-02-27 12:51:01.590573+00	11	Develop a GIS webapp with GeoDjango	2	[{"changed": {"fields": ["text"]}}]	18	1
1094	2018-03-10 14:19:30.474677+00	10	Displaying a map in a Django Webapp (1/3): Creating a GIS database with PostgreSQL and PostGIS	2	[{"changed": {"fields": ["title"]}}]	18	1
1095	2018-03-10 14:19:48.92421+00	11	Displaying a map in a Django Webapp (2/3): Develop a GIS webapp with GeoDjango	2	[{"changed": {"fields": ["title"]}}]	18	1
1096	2018-03-10 14:19:57.786651+00	12	Displaying a map in a Django Webapp (3/3): Showing a map on the Django admin	2	[{"changed": {"fields": ["title"]}}]	18	1
1097	2018-03-10 21:43:41.763368+00	11	Displaying a map in a Django Webapp (2/3): Develop a GIS webapp with GeoDjango	2	[{"changed": {"fields": ["text"]}}]	18	1
1098	2018-03-11 11:08:21.70969+00	15	Rasterio	1	[{"added": {}}]	19	1
1099	2018-03-11 11:08:36.633107+00	13	Polygonize a raster with rasterio and save it in a PostGIS database with Django	1	[{"added": {}}]	18	1
1100	2018-03-11 11:32:20.708055+00	13	Polygonize a raster with rasterio and save it in a PostGIS database with Django	2	[{"changed": {"fields": ["text"]}}]	18	1
1101	2018-03-11 12:17:12.678581+00	13	Polygonize a raster with rasterio and save it in a PostGIS database with Django	2	[{"changed": {"fields": ["published", "text"]}}]	18	1
1102	2018-03-24 17:48:57.828443+00	13	Display polygons with Mapbox in a Django Webapp (1/2): Polygonize a raster and save to the database	2	[{"changed": {"fields": ["title"]}}]	18	1
1103	2018-03-24 17:50:59.674824+00	13	Display polygons with Mapbox in a Django Webapp (1/2): Polygonize a raster and save polygons to the database	2	[{"changed": {"fields": ["title"]}}]	18	1
1104	2018-03-24 20:21:23.334154+00	13	Display polygonized raster in a Django Webapp (1/2): Polygonize a raster and save polygons to the database	2	[{"changed": {"fields": ["title"]}}]	18	1
1105	2018-03-24 20:22:10.358549+00	16	Mapbox	1	[{"added": {}}]	19	1
1106	2018-03-24 20:22:45.136388+00	14	Display polygonized raster in a Django Webapp (2/2): Show the polygons in a Mapbox	1	[{"added": {}}]	18	1
1107	2018-03-24 20:27:33.981753+00	14	Display polygonized raster in a Django Webapp (2/2): Show the polygons in a Mapbox	2	[{"changed": {"fields": ["text"]}}]	18	1
1108	2018-03-24 20:52:38.734114+00	14	Display polygonized raster in a Django Webapp (2/2): Show the polygons in a Mapbox	2	[{"changed": {"fields": ["text"]}}]	18	1
1109	2018-03-24 20:52:57.12118+00	14	Display a polygonized raster in a Django Webapp (2/2): Show the polygons in a Mapbox	2	[{"changed": {"fields": ["title"]}}]	18	1
1110	2018-03-24 20:53:03.199596+00	13	Display a polygonized raster in a Django Webapp (1/2): Polygonize a raster and save polygons to the database	2	[{"changed": {"fields": ["title"]}}]	18	1
1111	2018-03-24 20:55:10.594685+00	14	Display a polygonized raster in a Django Webapp (2/2): Show the polygons in a Mapbox	2	[{"changed": {"fields": ["text"]}}]	18	1
1112	2018-03-24 20:59:49.555506+00	14	Display a polygonized raster in a Django Webapp (2/2): Show the polygons in a Mapbox	2	[]	18	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: hakim
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	user
3	auth	permission
4	auth	group
5	contenttypes	contenttype
6	sessions	session
7	quotes	book
8	quotes	quote
9	quotes	author
12	quotes	category
13	quotes	tag
15	sites	site
16	members	member
17	articles	category
18	articles	article
19	articles	tag
20	social_django	nonce
21	social_django	code
22	social_django	usersocialauth
23	social_django	association
24	social_django	partial
25	expenses	expense
26	authtoken	token
27	places	city
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: hakim
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-02-05 00:58:16.427544+00
2	auth	0001_initial	2017-02-05 00:58:17.113884+00
3	admin	0001_initial	2017-02-05 00:58:17.320278+00
4	admin	0002_logentry_remove_auto_add	2017-02-05 00:58:17.353188+00
5	contenttypes	0002_remove_content_type_name	2017-02-05 00:58:17.402642+00
6	auth	0002_alter_permission_name_max_length	2017-02-05 00:58:17.427341+00
7	auth	0003_alter_user_email_max_length	2017-02-05 00:58:17.452178+00
8	auth	0004_alter_user_username_opts	2017-02-05 00:58:17.467373+00
9	auth	0005_alter_user_last_login_null	2017-02-05 00:58:17.493332+00
10	auth	0006_require_contenttypes_0002	2017-02-05 00:58:17.501638+00
11	auth	0007_alter_validators_add_error_messages	2017-02-05 00:58:17.519972+00
12	auth	0008_alter_user_username_max_length	2017-02-05 00:58:17.584046+00
13	sessions	0001_initial	2017-02-05 00:58:17.749157+00
14	quotes	0001_initial	2017-02-05 20:39:44.119768+00
15	quotes	0002_auto_20170207_2245	2017-02-07 22:46:34.630716+00
16	quotes	0003_auto_20170207_2252	2017-02-07 22:53:58.472284+00
17	quotes	0004_author_member	2017-02-07 23:12:30.937441+00
18	quotes	0005_book_author	2017-02-07 23:20:00.146486+00
19	quotes	0006_auto_20170207_2332	2017-02-07 23:32:08.689992+00
20	quotes	0007_auto_20170207_2346	2017-02-07 23:46:41.616218+00
21	quotes	0008_auto_20170208_0100	2017-02-08 01:00:40.79107+00
22	quotes	0009_auto_20170208_0133	2017-02-08 01:33:11.02506+00
23	quotes	0010_auto_20170219_0220	2017-02-19 02:20:31.545969+00
24	quotes	0010_auto_20170219_0248	2017-02-19 02:48:34.065362+00
25	quotes	0002_auto_20170219_1556	2017-02-19 15:56:48.919944+00
26	quotes	0003_auto_20170219_1708	2017-02-19 17:08:09.825023+00
27	quotes	0004_auto_20170219_1823	2017-02-19 18:23:20.995908+00
28	quotes	0005_auto_20170219_1934	2017-02-19 19:35:03.900819+00
29	quotes	0006_auto_20170220_2019	2017-02-20 20:19:47.777751+00
30	quotes	0007_auto_20170224_2340	2017-02-24 23:40:21.706318+00
31	quotes	0008_auto_20170226_1856	2017-02-26 18:56:36.154176+00
32	quotes	0009_auto_20170226_1907	2017-02-26 19:07:29.759117+00
33	quotes	0010_auto_20170226_1914	2017-02-26 19:14:32.042321+00
34	quotes	0011_auto_20170312_1821	2017-03-12 21:02:04.838469+00
35	quotes	0012_quote_published	2017-03-18 20:11:09.545132+00
36	quotes	0013_auto_20170318_2003	2017-03-18 20:14:01.01817+00
37	quotes	0014_auto_20170319_0005	2017-03-19 00:45:03.094155+00
38	quotes	0015_auto_20170324_2312	2017-03-24 23:17:16.84627+00
39	quotes	0016_auto_20170325_0158	2017-03-25 02:03:30.90867+00
40	sites	0001_initial	2017-05-01 02:09:43.638897+00
41	sites	0002_alter_domain_unique	2017-05-01 02:09:43.654613+00
42	members	0001_initial	2017-08-02 23:49:14.02233+00
43	quotes	0017_auto_20170803_0027	2017-08-02 23:49:14.131678+00
44	quotes	0018_quote_member	2017-08-02 23:49:14.167506+00
45	articles	0001_initial	2017-08-05 23:44:35.326724+00
46	default	0001_initial	2017-08-05 23:46:49.581296+00
47	social_auth	0001_initial	2017-08-05 23:46:49.58501+00
48	default	0002_add_related_name	2017-08-05 23:46:49.657216+00
49	social_auth	0002_add_related_name	2017-08-05 23:46:49.660264+00
50	default	0003_alter_email_max_length	2017-08-05 23:46:49.672268+00
51	social_auth	0003_alter_email_max_length	2017-08-05 23:46:49.675455+00
52	default	0004_auto_20160423_0400	2017-08-05 23:46:49.711607+00
53	social_auth	0004_auto_20160423_0400	2017-08-05 23:46:49.714579+00
54	social_auth	0005_auto_20160727_2333	2017-08-05 23:46:49.725772+00
55	social_django	0006_partial	2017-08-05 23:46:49.748912+00
56	social_django	0004_auto_20160423_0400	2017-08-05 23:46:49.754824+00
57	social_django	0001_initial	2017-08-05 23:46:49.757808+00
58	social_django	0003_alter_email_max_length	2017-08-05 23:46:49.7608+00
59	social_django	0005_auto_20160727_2333	2017-08-05 23:46:49.763666+00
60	social_django	0002_add_related_name	2017-08-05 23:46:49.767241+00
61	quotes	0019_auto_20170813_1152	2017-08-13 11:33:53.403456+00
62	expenses	0001_initial	2017-11-17 23:43:07.77963+00
63	authtoken	0001_initial	2017-11-18 00:01:07.483885+00
64	authtoken	0002_auto_20160226_1747	2017-11-18 00:01:07.593826+00
65	auth	0009_alter_user_last_name_max_length	2017-12-02 17:47:23.601309+00
66	social_django	0007_code_timestamp	2017-12-02 17:47:23.650747+00
67	social_django	0008_partial_timestamp	2017-12-02 17:47:23.684711+00
69	places	0001_initial	2017-12-02 22:52:46.840425+00
70	places	0002_city_slug	2017-12-21 15:11:08.690919+00
71	articles	0002_auto_20171221_2250	2017-12-21 22:55:58.938977+00
72	articles	0003_article_image	2018-01-07 21:51:31.592748+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: hakim
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
8dt39s48nmw13k5bl3tgc12ekzzcw3n9	ZDNhMDFmYjA2MDMyMWI3MzNmMjFmYjg2YjQ5MzMwZmU2MTcxM2I0NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhMzhkMmY4MDEyODZkNTE5MTUyNDIxODkwNjM4MzAxODFlMTFlY2NlIn0=	2017-02-19 00:59:54.191985+00
syw0zazkx2j9y429bz60f6hmy2u0ng6d	ZDNhMDFmYjA2MDMyMWI3MzNmMjFmYjg2YjQ5MzMwZmU2MTcxM2I0NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhMzhkMmY4MDEyODZkNTE5MTUyNDIxODkwNjM4MzAxODFlMTFlY2NlIn0=	2017-03-05 02:03:42.206951+00
xshsqu83fn9jevhp1rjr1o4bbcrhz7bn	ZTRiY2M5NWFlZDc0NWRlNWM3Njk0MWEzMTJlMmRjMGNhMmUzMTQ1NDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTM4ZDJmODAxMjg2ZDUxOTE1MjQyMTg5MDYzODMwMTgxZTExZWNjZSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-03-22 18:05:22.589152+00
oktgrz9o691log0onxkfs32fzfyukahq	MmI1NTcwZjI1ODVkNThhYzA5MjMwMTMyZTg5NWUyYWUwOTYyZmI4NTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9oYXNoIjoiZTE4M2QzMzA2Yjg4NzBmMDY3ZGNjNWY1Y2NlNGEwMGE4ZWYyNjU4NiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-05-04 08:35:46.250563+00
x5c1yzb422jfn907688bnqa04givh0kx	NjIyM2ExOTE4NDNhOTNmNjExODU3ZGNiYmY1MTBjNGFjY2EyZGUyYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTg2MDk3OTE4ZTg5ZmExMWVlZjY2ODYxZDg2OTdiNzZhZDU2YjQ0OSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-05-07 21:02:16.369511+00
z652o9txqtk1izhyj5vyk7qnqdr5ntyf	ZmQwYjE2YWZiODJiNTE2YWQ5NzI5MTc5OWUxZmMxZGE0N2NiYTUwYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImE4NjA5NzkxOGU4OWZhMTFlZWY2Njg2MWQ4Njk3Yjc2YWQ1NmI0NDkiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-05-18 09:58:42.215498+00
tiz3fgoqplxo5uaecw091qcn3kntqxr8	NWNjYTU5M2Y3YTUwMGJlMzc1OTQwNDNiNTE0ZDQ3YjNjNjdiOTBiMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImUxODNkMzMwNmI4ODcwZjA2N2RjYzVmNWNjZTRhMDBhOGVmMjY1ODYiLCJfYXV0aF91c2VyX2lkIjoiNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-05-22 08:23:16.269096+00
rsg0umao8uj9ja61l2f0b44d2lpn7glf	ZmQwYjE2YWZiODJiNTE2YWQ5NzI5MTc5OWUxZmMxZGE0N2NiYTUwYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImE4NjA5NzkxOGU4OWZhMTFlZWY2Njg2MWQ4Njk3Yjc2YWQ1NmI0NDkiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-06-03 20:59:06.570897+00
x1w316u44v6mit075ygrv39xdeaq9w0s	Mjg0MjMzN2Y2NjJiOTIzNGE0NWI4NmJlYzU2MGNmZDU3MGY4ZjM1NTp7ImZhY2Vib29rX3N0YXRlIjoiY0lCbGswVGhYOENvRlVNbjRSVk5DUEZYakIwbG1GVlYifQ==	2017-08-20 22:29:14.919962+00
d3j211ok3xmmm5uopwupu5sk1wvuj9a9	ZGVhYjg5MzVhOTNhNjAyMTU1MWQwYmMwMjlhZTU1YjhjMDRmYzBlZjp7Il9hdXRoX3VzZXJfaGFzaCI6IjAwMTgwNzUwZTUzNzhjMzM3YjcxZWZkMDg1NjBkNjViMzRiMGRkZTgiLCJfYXV0aF91c2VyX2lkIjoiNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-06-04 11:40:53.707188+00
pkzxhvh9a0au4x8bqrubhqekvr4e64y2	ZmQwYjE2YWZiODJiNTE2YWQ5NzI5MTc5OWUxZmMxZGE0N2NiYTUwYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImE4NjA5NzkxOGU4OWZhMTFlZWY2Njg2MWQ4Njk3Yjc2YWQ1NmI0NDkiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-06-06 10:59:03.869748+00
atgk4nr6z6agm7a0erm0872xvsop30jm	ZmQwYjE2YWZiODJiNTE2YWQ5NzI5MTc5OWUxZmMxZGE0N2NiYTUwYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImE4NjA5NzkxOGU4OWZhMTFlZWY2Njg2MWQ4Njk3Yjc2YWQ1NmI0NDkiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-06-07 09:47:24.264749+00
594gni30ptqcs05i7w423t4o84xz63vt	ZWEyZjg4MWZlNzI2YjZhNzBhMGQ2NDE0NmRjYzQ4Njc4MmUxMGRmYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTg2MDk3OTE4ZTg5ZmExMWVlZjY2ODYxZDg2OTdiNzZhZDU2YjQ0OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-06-19 17:52:57.066407+00
b7ozy0rscugg548tllo5vtlzn21zqjm1	ZmQwYjE2YWZiODJiNTE2YWQ5NzI5MTc5OWUxZmMxZGE0N2NiYTUwYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImE4NjA5NzkxOGU4OWZhMTFlZWY2Njg2MWQ4Njk3Yjc2YWQ1NmI0NDkiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-07-16 16:16:44.608029+00
499frcnwsj59ddgg1tuwhg4y4rot7fhg	MDI0M2ZlYmI1NzE2MmIxMGUzNjg3NDAxMGNmNDc2MDc0YjI5MDkyNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhODYwOTc5MThlODlmYTExZWVmNjY4NjFkODY5N2I3NmFkNTZiNDQ5In0=	2017-07-16 17:50:46.050925+00
wmbqyyc9lszzju37vtsxpdddhwiv9tuz	MDI0M2ZlYmI1NzE2MmIxMGUzNjg3NDAxMGNmNDc2MDc0YjI5MDkyNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhODYwOTc5MThlODlmYTExZWVmNjY4NjFkODY5N2I3NmFkNTZiNDQ5In0=	2017-07-24 14:17:29.43067+00
c0uunp7kokhzu8pzxsc6cxsveys7cb5m	MTc2MzQzZWE0YWEzNmQwNzYzMmE0NDliNTUyNjkzODJiNjY0YWZmMDp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiJxb0k3cGFIcTBKVTA3eTk4TWt0VENMY0dVUkkyMThkViJ9	2017-08-22 03:45:31.902392+00
mvrok36cpwxxiegs3gzv8wthwaoyakgb	ZmQwYjE2YWZiODJiNTE2YWQ5NzI5MTc5OWUxZmMxZGE0N2NiYTUwYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImE4NjA5NzkxOGU4OWZhMTFlZWY2Njg2MWQ4Njk3Yjc2YWQ1NmI0NDkiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-08-07 14:17:52.430614+00
q3bxgxt1mf094j4bl6lm5czeqqxq4dga	MDI0M2ZlYmI1NzE2MmIxMGUzNjg3NDAxMGNmNDc2MDc0YjI5MDkyNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhODYwOTc5MThlODlmYTExZWVmNjY4NjFkODY5N2I3NmFkNTZiNDQ5In0=	2017-04-02 01:11:28.694991+00
tm2lvc546in6kkb04ldhoaftownb6cqf	MGI4YjZiNmQ5M2QzZWM3NjE5YTMwZjI0ZGY1ODU4ZmQwNzAyODNlYjp7InR3aXR0ZXJfc3RhdGUiOiJRbUVvYVFFYVp6VGRVVmZIbEp2bFBoRmhiYmxlSkdudCIsInR3aXR0ZXJ1bmF1dGhvcml6ZWRfdG9rZW5fbmFtZSI6WyJvYXV0aF90b2tlbj00bXhFZWdBQUFBQUExb1E0QUFBQlhYZVQwcTAmb2F1dGhfdG9rZW5fc2VjcmV0PXRiNDBscUdsOGxVWUF2eEU0enE4bk5Ld2xraWJGckdoJm9hdXRoX2NhbGxiYWNrX2NvbmZpcm1lZD10cnVlIl19	2017-08-08 02:29:24.349254+00
aso6whw8cly2afyizbbf4e6jly3kxzu3	MDI0M2ZlYmI1NzE2MmIxMGUzNjg3NDAxMGNmNDc2MDc0YjI5MDkyNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhODYwOTc5MThlODlmYTExZWVmNjY4NjFkODY5N2I3NmFkNTZiNDQ5In0=	2017-04-05 10:30:30.337878+00
hsmrz06il0jtudww916d4jo10a6pdng5	ZWEyZjg4MWZlNzI2YjZhNzBhMGQ2NDE0NmRjYzQ4Njc4MmUxMGRmYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTg2MDk3OTE4ZTg5ZmExMWVlZjY2ODYxZDg2OTdiNzZhZDU2YjQ0OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-04-22 19:09:34.430228+00
jqiy62y3vpfxnnls2lparjgs55ubh94c	ZWEyZjg4MWZlNzI2YjZhNzBhMGQ2NDE0NmRjYzQ4Njc4MmUxMGRmYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTg2MDk3OTE4ZTg5ZmExMWVlZjY2ODYxZDg2OTdiNzZhZDU2YjQ0OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-04-26 23:01:50.456777+00
owhc9zj0qpvkizs0a0ah6ou2n8qgktfz	Nzg5N2EzY2ZlN2MxNTc1NGMyZjQ5MGQ0NTkwNWQwZWZjYmQ3YWI0MTp7InR3aXR0ZXJfc3RhdGUiOiJqeEdzcVhYMnVSMFlQV3kzSlhJUmtMelF5dVVOSHByNSIsInR3aXR0ZXJ1bmF1dGhvcml6ZWRfdG9rZW5fbmFtZSI6WyJvYXV0aF90b2tlbj1tdWs4NEFBQUFBQUExb1E0QUFBQlhYZkljZlkmb2F1dGhfdG9rZW5fc2VjcmV0PWc0bEZwMTBJU0Mwb0h6SXdkUHNoZno5MWN1ckpWWGRFJm9hdXRoX2NhbGxiYWNrX2NvbmZpcm1lZD10cnVlIl19	2017-08-08 03:26:52.999823+00
ghk9o9l1thv6k6dmnzhjy5pq8mqbhedu	NzAyNmExMzQ2MzIxOGQ3NmNjMjc1MWRkYTkxYjk2ODZiMjIyZGIwNjp7ImZhY2Vib29rX3N0YXRlIjoidE1kZW9HR1FETjJxNHBCejFJdldHdkRnc2N3UWhITVkifQ==	2017-08-08 03:45:11.562011+00
peejg2awb9ug3cnxy6oa2ztdqzrrbr4w	NjA0MTc4NzQyYmNmOTZlNjQ1YjVjMGNkZDVjMGU4YzJhYzUxODVhMTp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiJpcTRxcTdSSVZRcklDNWZGYkozVGJvUlhmWnRWUkRqRiJ9	2017-08-08 05:00:58.258012+00
08tos1bmlmd4at5w8eouhs91qi3ob4oi	MWJiNTMxNmUxYTlmM2RhNGYyNzA0OTllZTkwZThmNTAzZDU3OTlmYjp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiJGb0JLMlk1ZE1jM2ZYTnloeUU2NTh4VlNsbGJjbjc4YiJ9	2017-08-08 17:50:26.284501+00
wzba6mu01nzsn8ti4ukrjnm7fiuy9g34	Mzk5MGM1MTU3Mjg2NDZjNzA3ZDQ3M2EwNTNkN2U4MWIyNTc5OGJkNDp7ImZhY2Vib29rX3N0YXRlIjoiNzQ1RHAyaFJyWTllcDJRNXJ4VXVaMExyVndKWnpleGUifQ==	2017-08-09 06:16:20.17866+00
vtxkn3odkk2tuchalhmki85gwuybmyba	ZmQwYjE2YWZiODJiNTE2YWQ5NzI5MTc5OWUxZmMxZGE0N2NiYTUwYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImE4NjA5NzkxOGU4OWZhMTFlZWY2Njg2MWQ4Njk3Yjc2YWQ1NmI0NDkiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-08-11 10:22:47.614348+00
pe015g37u5lak2r9wi7owesv06mzd60p	MzAxZGIxOGY5ODU5OWQwZjBiZDVhMzY5YTU2NzM4MzEwY2E1MGEyZDp7InR3aXR0ZXJfc3RhdGUiOiJwT3lCYlJURWdDVWhleVp3NEZqQ3pLVFl6cExuVVVQbiIsInR3aXR0ZXJ1bmF1dGhvcml6ZWRfdG9rZW5fbmFtZSI6WyJvYXV0aF90b2tlbj1rdE5OQVFBQUFBQUExb1E0QUFBQlhkeS1sTGMmb2F1dGhfdG9rZW5fc2VjcmV0PTdmWW9MZVJKUDdjcnMxQkFvUk9WVHg0d3R0MzNDQXVoJm9hdXRoX2NhbGxiYWNrX2NvbmZpcm1lZD10cnVlIl19	2017-08-27 17:57:45.362787+00
jn59s3sxb8nf7j6p0dhiwx8l8v0htwlr	ZmQ1ZjUwOGI5MDY5M2Y5NWUzMGZkYjg1YzM0Njg4ZjQxZDg4MTEwOTp7InR3aXR0ZXJ1bmF1dGhvcml6ZWRfdG9rZW5fbmFtZSI6WyJvYXV0aF90b2tlbj1SN05Na1FBQUFBQUExb1E0QUFBQlhhcTZNUFUmb2F1dGhfdG9rZW5fc2VjcmV0PWl3TmMzb2FacEFOem5MWkloZUNwSXJuaFlBNXRrZzczJm9hdXRoX2NhbGxiYWNrX2NvbmZpcm1lZD10cnVlIl0sInR3aXR0ZXJfc3RhdGUiOiJVQWpZV0tNak1hQ3g2YnhUTlV5RzJzTFYzUnhkdTZvYiJ9	2017-08-18 00:51:56.959506+00
4ch6m6f8p9rigbt4559uec4t22l1xp6h	NmMwNDVjMmVhMzZhODZiYWM1NGE4Y2QwZDRkNzBmNjhmNTE5MjA5Mjp7ImZhY2Vib29rX3N0YXRlIjoiR29LR1UxS0hKcGNod3Y2VmJXb0RoMEpmR3ZhSXBqSVQifQ==	2017-08-18 00:53:21.446536+00
38iq8hbvkag84lmwwdgjm2r9sfytw0yx	NGViNjU2Y2MxMGNkZGFjNzJiMGM2NjQwMmVlZTcxNWM2NTc5MDYzNzp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiJwMXBTZ0wwcVlFY05ZeXd4ZVdkREgyNkhsbEFpWnlqUSJ9	2017-08-18 00:54:56.325853+00
jbov2ny7s1xr107r4psmc5bvj9yh6325	MjM2MTMwN2VhZDYxZmI4M2E4MTEwNGVmNDMyYTUwZDJiNzZkNGI3MDp7InR3aXR0ZXJ1bmF1dGhvcml6ZWRfdG9rZW5fbmFtZSI6WyJvYXV0aF90b2tlbj1reEVISXdBQUFBQUExb1E0QUFBQlhhMU1iQnMmb2F1dGhfdG9rZW5fc2VjcmV0PUZldm43Y3VrSVNKdXAwT09QamF3aWVJRlBJbVM3NXB5Jm9hdXRoX2NhbGxiYWNrX2NvbmZpcm1lZD10cnVlIl0sInR3aXR0ZXJfc3RhdGUiOiJNZ1RWeHJHZ1hseG9tdFpPSElNMWRETGZ5UDB2REwwbiJ9	2017-08-18 12:50:54.70568+00
1sfejjsa18itbxe4uxaso0jkjevjzf3y	MTBlOWYxNWI4YjhlZjllMjlmNTg0N2Y1MWFlNjc0ODA4NzFhYzBmMTp7ImZhY2Vib29rX3N0YXRlIjoiVVVuSHRKRlptaktQbjhjcFlKaTBjMkxaRzJza29RQWQifQ==	2017-08-31 19:11:49.26304+00
ley83ssbk5e9zidkltvy6wir99cxzh5g	MTMyOGRhMjdjZmMyZjUyMWJiMjJjODZkOTA3Yzg4MjIzN2I2ZGYxZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzlhNTQ4NDMzNzRmYmNiMDE5N2EzM2E4NDdlMTc0YTJkZTYyNzdkIn0=	2017-09-03 10:00:18.253871+00
j4gi39v8k2eyjar1pl9a6eojhz2s933g	ZDdiNWI5ZTNmNGJmOTNhNjZiZWJiNmJhMDc2ZGZhYmU4ODdmYjRlMzp7ImZhY2Vib29rX3N0YXRlIjoiRlVWRW5sN1RYRmRheEltRkt6Q1Q3UE9VZ0dFMXZCWWYifQ==	2017-08-22 03:45:29.789323+00
917giazk8khy3rrlnw0gdtekcre3rnjt	YjFkYzU2NzExMDVmNTc4NTllZjUxMWQ2MDAwYzI2M2FiNTlkZmFlMzp7InR3aXR0ZXJ1bmF1dGhvcml6ZWRfdG9rZW5fbmFtZSI6WyJvYXV0aF90b2tlbj1ZLUROclFBQUFBQUExb1E0QUFBQlhiX3lvUXcmb2F1dGhfdG9rZW5fc2VjcmV0PUtEZGNnQUt4eldVQVJVR1RSaHYxR1pNUDZ5Y21HbGZnJm9hdXRoX2NhbGxiYWNrX2NvbmZpcm1lZD10cnVlIl0sInR3aXR0ZXJfc3RhdGUiOiJXVFVialI5VnVTdlA0aWpBMmZpR3ZnM1lXQVg2bEF6RCJ9	2017-08-22 03:45:37.200067+00
lykalhaw2i2q9t525hz3qmo8zm1kkhpt	ZjYyZDQ4YmQ5NDQyMjlkNDBiZDEyN2ZlOGQxOGQxOWJmNDA0MWU4Yjp7InR3aXR0ZXJfc3RhdGUiOiI3VXZFb08zR1VlQkhVTVJqSkkyZ2Q3QTdlWFFld3dVdiIsInR3aXR0ZXJ1bmF1dGhvcml6ZWRfdG9rZW5fbmFtZSI6WyJvYXV0aF90b2tlbj1uYWQ0SndBQUFBQUExb1E0QUFBQlhnWUxPNUEmb2F1dGhfdG9rZW5fc2VjcmV0PTdheHpVQWFaRUN2Rk96RVdNUXpKQkZtcEJCSjNRNzAxJm9hdXRoX2NhbGxiYWNrX2NvbmZpcm1lZD10cnVlIl19	2017-09-04 18:25:54.653019+00
d1rswv6ivf1c852h9nm74oevlko3e5bx	NDdjYzRkYTY4NzU3NmQ1ZmY3NmU5MzA5MmE5NzMzNmYyNTBhZTliNDp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiJjd3hJWHdwM0owY2ljM1dKU09hNDVwYVBiQ3NkYnY2cyIsInR3aXR0ZXJ1bmF1dGhvcml6ZWRfdG9rZW5fbmFtZSI6WyJvYXV0aF90b2tlbj1tbmZYMXdBQUFBQUExb1E0QUFBQlhjRzByOHMmb2F1dGhfdG9rZW5fc2VjcmV0PXpLVjhEd0Zmcm0wQ01PTGtONGdlVmRXMWM4RE9HVTBKJm9hdXRoX2NhbGxiYWNrX2NvbmZpcm1lZD10cnVlIl0sImZhY2Vib29rX3N0YXRlIjoiVkdXdVl4N09LZ0pXam1zOWxveHhqakJISDRWREVHRkMiLCJ0d2l0dGVyX3N0YXRlIjoicldvdVVIa005akRScmR5eXRYRzcwU2VmY1dta0lpNzIifQ==	2017-08-22 11:57:13.966989+00
2bnj0dg5ufzv3jgg6wkdie6hc6ne5v5g	M2M2MmNjYWY1ZTMyZWYxN2NkZDU1ZmRmNjcwM2FlNTg2MTllMGRkMTp7ImZhY2Vib29rX3N0YXRlIjoiZjEyWmkyYkpEQm9zVENlbTR4c0Zpd1ZtWFY3R29Kc2QifQ==	2017-09-04 18:26:08.930995+00
zntk969g2cgr6whd1zj9uok46m2e809t	OGNmNTUzOWY4ZGEzNTkyNzc1NzYzMjZhYWE1NjhhMTliMTdiODE5Njp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiJpb0NQMTFDUko1OWdDYjhaUkp0Sm90a0tYR3hZTDhRTyJ9	2017-09-04 18:30:04.669493+00
v62c7gfjw40czzcd6kk7biocwk2kw80f	ZDYxMmNiYmVlMzIzZTc1Y2RmYzQzMmZhNmQ0YWU3MTcxYmJhMzAzNzp7InR3aXR0ZXJfc3RhdGUiOiJNNzZ4ZEFFZnhuNW5jTWVVc2k0NXpXT1ZwVnhDVjV6RSIsInR3aXR0ZXJ1bmF1dGhvcml6ZWRfdG9rZW5fbmFtZSI6WyJvYXV0aF90b2tlbj1jZTBieWdBQUFBQUExb1E0QUFBQlhnYnJGRXMmb2F1dGhfdG9rZW5fc2VjcmV0PUljQmdabnlWb0JCVmlNTDcwTVc2andXb0VqcDJ0VWt6Jm9hdXRoX2NhbGxiYWNrX2NvbmZpcm1lZD10cnVlIl19	2017-09-04 22:30:24.678703+00
t9mgf0un39xtvaz3oxczaj48oa8bkv87	YmRhNzgwMWQ2M2ExM2EyZGE0NTc2ZDNmOWFmMjQwZWJhZmQ5NjU0ODp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiJCc0tWU1J5OUNqc1djZ2ZGSnpha1F6dUNzMjh2cm9yVyIsInR3aXR0ZXJfc3RhdGUiOiI2Qkd2d1dsdG4xamJFOEppOXk2bk50YndCOFNoNFgzWSIsInR3aXR0ZXJ1bmF1dGhvcml6ZWRfdG9rZW5fbmFtZSI6WyJvYXV0aF90b2tlbj1fajNhYWdBQUFBQUExb1E0QUFBQlhnZnRtZUEmb2F1dGhfdG9rZW5fc2VjcmV0PXhsNFo4UXM2SHdURXhaQnNlcElZVGZCOG0xOXdCNHVuJm9hdXRoX2NhbGxiYWNrX2NvbmZpcm1lZD10cnVlIl0sImZhY2Vib29rX3N0YXRlIjoieW9SM3BhTFNGeUNpM1lzN2tOZmlrcExRemdMTk15OWwifQ==	2017-09-05 03:12:48.346011+00
obrd6o2vx3x3ibqfjazwm4e635kq2ynv	ZGVjYjhiOWVkMWMwNDVlZTQ4NGNkN2FmYmRmYzhkZTQyMDQ2ZDQ4NDp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiI0TUpWRTFOVnJHb2ZkU0ZVbTEzYVNOMHhRREFRZ21rRyJ9	2017-09-05 22:13:56.626232+00
f0atgwm36c3xmn7etgcxhm62lkxzrqz6	ODczNmQ4YzEzZWQ3OGVmZDg4OWQ1ZDBmZWY0MWJkMWM4ZDU5NjhlMTp7InR3aXR0ZXJfc3RhdGUiOiJQZGpuMnp1eERnN1AzcGtDS3dja3VoUVh4TzRvNktPdCIsInR3aXR0ZXJ1bmF1dGhvcml6ZWRfdG9rZW5fbmFtZSI6WyJvYXV0aF90b2tlbj1NSDh6MFFBQUFBQUExb1E0QUFBQlhobmR1bGcmb2F1dGhfdG9rZW5fc2VjcmV0PWR4d1hMOTE4TXdEZVlFN3ZNS0lBYUZJdzkxRGczTklFJm9hdXRoX2NhbGxiYWNrX2NvbmZpcm1lZD10cnVlIl19	2017-09-08 14:48:36.789425+00
j107ni6tbpfrg3bh74uszwdgzcxvji8p	ODhkNWI2OWM2MTlkMjJkODYzMGE1MDY5ZGRhNWU5MTQ5MDA0MTMyNDp7ImZhY2Vib29rX3N0YXRlIjoid2V2TUp0bmNjOHZPcVpndUd6UnlGcWNFNVpvVVBwUGcifQ==	2017-09-08 16:26:03.939583+00
96xonolz2g47zd0vh57w7llcb3c173hp	YzQyM2ZkZGQ0MjFiYTE0Y2ZlNzRhNTZmOGUyNTFkOWZhM2Q4MTY0ZTp7ImZhY2Vib29rX3N0YXRlIjoiaHNwajY4aEdSWjhhNmdVMlhuQlBxenRKT1EzTm9hdDUifQ==	2017-09-08 17:12:11.982673+00
7x243viy515rrl33brh8hlw5fgyeie7r	NzAyNDdlZjE4MjE1Mjc1ZTg0MzdhNGU0NDFhYTc1YWQyMDkzZTQ5YTp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiJQY1lVV3V6SkRMR0J2bWF4OXNMcnBCbmRKd0JXcm4wSSJ9	2017-09-09 12:24:11.990877+00
syat7hsg4in2cygtxxb9lhwt3tr2zub9	MTMyOGRhMjdjZmMyZjUyMWJiMjJjODZkOTA3Yzg4MjIzN2I2ZGYxZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzlhNTQ4NDMzNzRmYmNiMDE5N2EzM2E4NDdlMTc0YTJkZTYyNzdkIn0=	2017-09-11 00:21:42.472717+00
jkr3jm5j5oh06au3nb1wxy25wovc0vfo	OWQ3N2RhNmE2YjJlZTFjOThjZDJhMmY2MjAzODNiYjQxYWMyYjA2ZDp7InR3aXR0ZXJfc3RhdGUiOiIyaHpVN3JjUkt0MFNielhGR1pSSFFuTlB6UklpeEZ6QyIsInR3aXR0ZXJ1bmF1dGhvcml6ZWRfdG9rZW5fbmFtZSI6WyJvYXV0aF90b2tlbj1YdUdJeFFBQUFBQUExb1E0QUFBQlhqQTFFMnMmb2F1dGhfdG9rZW5fc2VjcmV0PUw5U3diQnpIeHNhODFzTDhKQmNFbTFKdXdMVWpUa1V4Jm9hdXRoX2NhbGxiYWNrX2NvbmZpcm1lZD10cnVlIl19	2017-09-12 22:55:39.962142+00
5l3d9948xblscagc5ezgohvs7nlba9to	MTkzY2Y5YWUwMGM5MzQwNGI5Y2JhZDMyMzFlMTc2YjNlMjNiODJhMjp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiJIeXlkWFFCM0d3aHV0ZHBINDNJQXl0Q1hJb0pwR1BqUyJ9	2017-09-13 23:31:46.919548+00
8tdildmwoedbia14ffzsd2nu6i7e5roh	NzI5ZDI2ZDk4NmQyZDUwNzYyZDgzMDcwYzBhYjI3ODlkMzQ5ZjdmNDp7InR3aXR0ZXJfc3RhdGUiOiJwTG5aRE9sVWE4cm1vSzlVVWtWbVh2OEhGbVJkM0xYTyIsInR3aXR0ZXJ1bmF1dGhvcml6ZWRfdG9rZW5fbmFtZSI6WyJvYXV0aF90b2tlbj0yRVBmamdBQUFBQUExb1E0QUFBQlhqbkJsVGcmb2F1dGhfdG9rZW5fc2VjcmV0PTE0cVRCcWdvSFVVZzFLQzdodGxJQklJVkhYYW9OVVZVJm9hdXRoX2NhbGxiYWNrX2NvbmZpcm1lZD10cnVlIl19	2017-09-14 19:25:43.178154+00
xihgth164o8adooxn4su4bna9583y8rf	MjQxOTAxNDc5MmNhYTM4YWU0ZWYxMjE2ZDIyY2UyYTc0NTFjOWZmNjp7ImZhY2Vib29rX3N0YXRlIjoiWTNYMTd4aXQ0Y1JtZjV2bzVnd24zYkRlcmJrMUlmRUoifQ==	2017-09-14 19:25:57.585112+00
vwbzh2tzj7tf0d832edyy9zkxjpa7ems	Nzc1NDJjYWNkMTJhMTM2MGU5Nzg5MjEyM2I4OTczYTYwMzRiODdhOTp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiJJMXNsNHh3WGI5d3VNdG5ORWExUTRjVXpxV0hLSGVrUiJ9	2017-09-14 19:30:13.060594+00
uw7tyqstk1sofv3pp5kgo43xtommdw31	MmM2ZTUxMDE5Njc0M2U4ZDliMGE2NzE4NDdlYmZmYzA1NGI5MjRjYTp7ImZhY2Vib29rX3N0YXRlIjoiNG42TnU5VGpjOVdzOWxySkxDdkpSUjJSeEhmWm1sejYifQ==	2017-09-16 21:48:46.782483+00
63a9ahs2h9l6u3xlct7ia9mia35wan9e	Mzk5MzY5NGQyNzJiYjU1ODAzOWRiYzgyMzVhZWVlMzgyMGE3MDg1Njp7InR3aXR0ZXJfc3RhdGUiOiJIVWQ1QmcyeTR3VmR3aU9qRUdmZXpsVE5JU0o3bmxkeSIsInR3aXR0ZXJ1bmF1dGhvcml6ZWRfdG9rZW5fbmFtZSI6WyJvYXV0aF90b2tlbj12VFdoS2dBQUFBQUExb1E0QUFBQlhrU1JTREkmb2F1dGhfdG9rZW5fc2VjcmV0PUhlZGNGeG9rMk0wc1doa2h1cFVaZFBTcnpFa1Jxdmh2Jm9hdXRoX2NhbGxiYWNrX2NvbmZpcm1lZD10cnVlIl19	2017-09-16 21:48:47.103225+00
l5t566890gv80px6jxc8zg5emz2twa5k	ZTEyZDA4NDk3MjM4YjE2ZjA5MzhmNjc0M2EyNTFlM2I5ZTFjNmFlYjp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiJjSXRmQ3UybE1LQWJac3FmMEcyRWtBbFRjRVE2RDgxNyJ9	2017-09-16 21:48:47.244625+00
yqky7tu8jla04rnbg68qslmccg52yj60	MTMyOGRhMjdjZmMyZjUyMWJiMjJjODZkOTA3Yzg4MjIzN2I2ZGYxZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzlhNTQ4NDMzNzRmYmNiMDE5N2EzM2E4NDdlMTc0YTJkZTYyNzdkIn0=	2017-09-20 16:11:25.125188+00
8mwf4pifj2a0ithyfg9pynz0svt32p3u	MDNjZmJmZTU1ZGQ5M2I4Yzc0NWM2NzlhMDhmZmFjNzk4MTk4YzA0NTp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiJCWWlDTVFISjgxdHJnQnpEUGZkTHY2NzNlWHdmWjJoWSJ9	2017-09-21 22:19:29.941595+00
n6ds6wzw7a1w39znrg57km3io1pquhjt	NGFjNTgzNmIyNDY5Y2I3MjRlZDA0M2Y1YTYwNTYxMTQyOTdmNDBlZTp7ImZhY2Vib29rX3N0YXRlIjoiUWhKVWI4QjhSekYzSGdXUmlITEtUM3M3dkNnR3p6c3oifQ==	2017-09-24 13:21:59.356572+00
bba4dij8yhf08igb9xolhghkzno29ts1	NjVmNjA3YjE3YzQ2MWQxNWQ3NWRhMTg0NDgxMzM2YWIwNDUxYmY3Nzp7InR3aXR0ZXJfc3RhdGUiOiJoRWVlQTJ2MTV4WFdLbmlwOW5Jb3I0cGxkMkZIaVlsMCIsInR3aXR0ZXJ1bmF1dGhvcml6ZWRfdG9rZW5fbmFtZSI6WyJvYXV0aF90b2tlbj0yczZ1NVFBQUFBQUExb1E0QUFBQlhtMV9BRGsmb2F1dGhfdG9rZW5fc2VjcmV0PUFUcEdkZkg1VFYwUUo4WU1nM3FIazlZbFlzZmFSaTFQJm9hdXRoX2NhbGxiYWNrX2NvbmZpcm1lZD10cnVlIl19	2017-09-24 20:33:14.995825+00
98z8n1w5idt2n3i8j2oom4nxcsq9m09d	ODM5NTNhMDc5ZTliYTE1ZGU5Y2RkYmEwYjkwZDI2NTkyZGZmY2VkNTp7ImZhY2Vib29rX3N0YXRlIjoidEYyeDJrQTNXRlRhT0lJRXVBNlNQcjM0ZllHQkptbWMifQ==	2017-09-24 20:33:34.988886+00
zjy0k77mmfkv0xd1r67ae4iua7h3ytbp	NjMzZDMwYmFkOGU0MWI1ZGEyNjNhZDdmYjcyNGQ4MDZiYjY0NjU0Nzp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiJVSVMwQnlpM1dFRjFCRzE3bTVTNDh5a2NXaURpNWpjOCJ9	2017-09-24 20:37:15.080147+00
sc16v5izpprjpjannrig37hvb4arriny	MzE2NGE4ZTkwZDI3YWJmNWM3M2FkNDkyOGFlYWRiMzgwMjZiNzkwNDp7ImZhY2Vib29rX3N0YXRlIjoiUllYdm8zY25aMHdXYTd5VVo3M3VyczQ5Z3Jndm50RkYiLCJ0d2l0dGVyX3N0YXRlIjoiY3d0TWRqbmN2R2xHYzJxSFlYdmQ2a2Q4VWh6eUZoY0EiLCJ0d2l0dGVydW5hdXRob3JpemVkX3Rva2VuX25hbWUiOlsib2F1dGhfdG9rZW49REhDSWF3QUFBQUFBMW9RNEFBQUJYb3RncWdZJm9hdXRoX3Rva2VuX3NlY3JldD1vYlE5NkdTcjFMcVZ3WkdtVkpVM0phbnJ5aEV4R2NVcSZvYXV0aF9jYWxsYmFja19jb25maXJtZWQ9dHJ1ZSJdLCJnb29nbGUtb2F1dGgyX3N0YXRlIjoiMzE1V1hRZWM1Nm03b0tIbUpac2JOQXBGamllQXhURDAifQ==	2017-09-30 15:48:44.37444+00
pe6njcxhnmr9nosljpyjbs5jlsvvgj3w	MTMyOGRhMjdjZmMyZjUyMWJiMjJjODZkOTA3Yzg4MjIzN2I2ZGYxZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzlhNTQ4NDMzNzRmYmNiMDE5N2EzM2E4NDdlMTc0YTJkZTYyNzdkIn0=	2017-09-30 19:45:41.278663+00
ji35qgqlgyw5bnl40sfhe1u14xb3dtlk	ODY5OTNhN2ZkMmM2ZDQ5ZjE3MTNjY2E5MmY1YmFmZGM0OTNiOTQyNjp7InR3aXR0ZXJfc3RhdGUiOiJxQ2dHU1p4RjdLN0ZHRmJMa3Nmc282aFF2TFMwbVZJeCIsInR3aXR0ZXJ1bmF1dGhvcml6ZWRfdG9rZW5fbmFtZSI6WyJvYXV0aF90b2tlbj1iVVUxeGdBQUFBQUExb1E0QUFBQlhxQkFpbnMmb2F1dGhfdG9rZW5fc2VjcmV0PXEwUXM0WXNJdzBzSHhCUm01c21BdHkwYUZKRGdZQmdSJm9hdXRoX2NhbGxiYWNrX2NvbmZpcm1lZD10cnVlIl19	2017-10-04 17:05:39.526988+00
69o04822917iurv3pi8zt1jdh5pqbh3u	MDY1NWQzY2QyMWRkNTY2OTBkYjYzZTU3OWQwMjlhYTE0YTQ2MjA2Njp7ImZhY2Vib29rX3N0YXRlIjoiQmliamFGTnplR2pIT0dORENXenptQVlKdlI0aDdNZEYifQ==	2017-10-04 17:05:59.561426+00
ob42sdeyap41bw1mf2zjkfgh6jjd2lq7	NzIyNzc1MzQ3NDExOTU3ZWQ3NWY2ZjY0YWZkNzZiMmMzMjY0NGI5Yjp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiJXZjRYZk1rR1UxMjJVc0xSalg0TDB4UXpaUU9tSktSMSJ9	2017-10-04 17:10:24.707869+00
614ytik5dhg6r4c9u60ya27qvu0ygr5x	NDc3NDE1ZDNlNjk3YzRlYzU3MTRlMWZiZDUwNmI5YjZiODU0MGRmNzp7ImZhY2Vib29rX3N0YXRlIjoiaG14aWE1NzVveTJneEp3OUEwOGJGblk0Y2VVRDQweUYifQ==	2017-10-11 00:54:39.784315+00
k3fw5eunturtru1i9lkax860kqyhcok4	M2IzNTViMjZjNzk0OTA3OTdmMDRjYjIxZTgzNTEwYzAyYzAzNWZkOTp7InR3aXR0ZXJfc3RhdGUiOiJXQVlKNXM0Sng5TnAza0E3cWZJUjRnMUpFWXM5ZWFrYyIsInR3aXR0ZXJ1bmF1dGhvcml6ZWRfdG9rZW5fbmFtZSI6WyJvYXV0aF90b2tlbj1CcUdVX0FBQUFBQUExb1E0QUFBQlh0TTZoMzQmb2F1dGhfdG9rZW5fc2VjcmV0PWlrQWtBVEE0UWF0cTJEM0czRkZXQVlncUlRTW5mZ09mJm9hdXRoX2NhbGxiYWNrX2NvbmZpcm1lZD10cnVlIl19	2017-10-14 14:39:43.567277+00
qunqjpbvgxx1ynvky21au4qzujel988p	ZDUwN2FhMDdkMDcyMjg4OTk1ZjY0N2MxMmExZjYwMDRmNjAzNzQ3Yzp7ImZhY2Vib29rX3N0YXRlIjoiOFpsNHdMTzFmUTJOaUI5MW8wZUx2enZZcDkyVGt6RGkifQ==	2017-10-14 14:40:02.867755+00
bgqh8gt3f9tqerdsa2yzb9bdvejfazm3	N2JhNTA3YTNlYzc2MTIzYjlhNWRjZjY1MTQwYmFhMzg4NGIyNGVhOTp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiIzS2pGV0c2RmROclgyYU5MeVpBdFozZ1Qya1kwY25TdyJ9	2017-10-14 14:44:18.884408+00
k0uscoazkol6b81xsik948dz862c5su7	OTI0YjI3YjJmNmEzYjM1OTZiYzY1NDE5OGZiMTZmM2EyZjEzMDM4Zjp7ImZhY2Vib29rX3N0YXRlIjoidEJUY3BIZFNhQnhucjBaU3daNUZBWDFaMVhwNGtMenoiLCJnb29nbGUtb2F1dGgyX3N0YXRlIjoiN1RVMHhZU0JKbjBmUnVkbm03QlhTUzVtMUlOQmlOa1giLCJ0d2l0dGVyX3N0YXRlIjoiVUlNNXhxWE4yVnJ1aUVFdkF5OE5McWxWZU45ckE2Sk4iLCJ0d2l0dGVydW5hdXRob3JpemVkX3Rva2VuX25hbWUiOlsib2F1dGhfdG9rZW49QzdlOTlBQUFBQUFBMW9RNEFBQUJYdHZVLTVZJm9hdXRoX3Rva2VuX3NlY3JldD1FRWl4SVNubGE4QktTMHU2OFZBN0g5MHl2cmw5MUxHOCZvYXV0aF9jYWxsYmFja19jb25maXJtZWQ9dHJ1ZSJdfQ==	2017-10-16 06:45:23.577846+00
tlgd30jmatzcw25tqw1w21oc04qu1s1e	NjQyMjBhZjhmMGU2NThlOWZhMDZhYWZiYzUxNzUwYjg4MzE1NWVlMjp7ImZhY2Vib29rX3N0YXRlIjoiZkg5TDZGZ0hwS1RrSHRCMUFDcGxpM0R2RDhCUmZJeHoifQ==	2017-10-16 10:15:19.392602+00
r11iifef50q163vvfvm2ut5v7uc2fboc	NGZjZTJhOTRlMjA0NmU4YzJlNWJjMzE1ZGUzZGViNDk2YzcyNTE0MTp7ImZhY2Vib29rX3N0YXRlIjoiNkZISWNkRVl5clRpZWx1a0ZNZnZ6czd5WVJ0WkpFV3oifQ==	2017-10-20 20:48:28.653284+00
gz5n8vo9e1rivs4p6cwsf5wqw6ta9ilx	YzE4OWQ3MTljZGQ3OTQyMDkyYTZlYThjM2UxY2RmODlmNzQzOTM0OTp7InR3aXR0ZXJfc3RhdGUiOiJWODJXZXdNWkY2d1kwZ1U1TTQyRzBiR0hRWWJXUFgzZSIsInR3aXR0ZXJ1bmF1dGhvcml6ZWRfdG9rZW5fbmFtZSI6WyJvYXV0aF90b2tlbj1BbmVrT0FBQUFBQUExb1E0QUFBQlh2WFROYXcmb2F1dGhfdG9rZW5fc2VjcmV0PTREWVRMbGszYXJTMWt2SE1RMTVkRWlQUDlvejVyc1NTJm9hdXRoX2NhbGxiYWNrX2NvbmZpcm1lZD10cnVlIl19	2017-10-21 07:53:34.981946+00
798b0qkb5tmw9bqztlzcwhy7n4mfcpv5	NDQzM2MxNjY0NWUwYzQ5NjAwNjQwODE1OWZlOGYxYWQ3Y2VlNDY4ZTp7InR3aXR0ZXJfc3RhdGUiOiJEWm5DZ1dLeFF1Qmt6Y2JFNzF6S0xhYlhFNEIyOWlWdyIsInR3aXR0ZXJ1bmF1dGhvcml6ZWRfdG9rZW5fbmFtZSI6WyJvYXV0aF90b2tlbj1HQVYyNVFBQUFBQUExb1E0QUFBQlh3RDQ2bjgmb2F1dGhfdG9rZW5fc2VjcmV0PTdBY1VWUlczVTdKTm1JVVJEYlNsTGlqYXB1RzdITGNCJm9hdXRoX2NhbGxiYWNrX2NvbmZpcm1lZD10cnVlIl19	2017-10-23 11:50:35.475797+00
lwv8ezh9ho3wfdq5tv8ro0310zoezz7z	MzRmOTQyY2U3ZmQ4NWE0OGY4NDFhMGQwZjVhNjczZTEzMjg5NzQ2ODp7ImZhY2Vib29rX3N0YXRlIjoia2hMVzB2VzExeVdDbkwydXFneHh5T1RPaHZzTGJ1YzEifQ==	2017-10-23 20:27:01.903155+00
g4sdrt5xw07qktukahodjkztrz4asya0	MTRlZWIzMGM2MDY1MjQyYjBlNGMzNmRmN2YwMjM0ZmFlYjA3ZTZhZDp7InR3aXR0ZXJfc3RhdGUiOiJZQThqazdRSHZ3bmYwTnhqdVR2NWZkb2hPMXJWZk9DYiIsInR3aXR0ZXJ1bmF1dGhvcml6ZWRfdG9rZW5fbmFtZSI6WyJvYXV0aF90b2tlbj1QOGFIcGdBQUFBQUExb1E0QUFBQlh3YWtfbDgmb2F1dGhfdG9rZW5fc2VjcmV0PXZrUUx6SVlVbU10aTZNa1hkdnFwUFljbTJVUmVGQ0xsJm9hdXRoX2NhbGxiYWNrX2NvbmZpcm1lZD10cnVlIl19	2017-10-24 14:16:38.830589+00
serhdy3dh38fylyayvri9snkutaqoxvz	Mzc1NTNkMzBmMjJjMmZhNWEzZTI2YjVhMTgyYTFmOGRlNjYxODEyOTp7ImZhY2Vib29rX3N0YXRlIjoidEpXd3kyUnU3cDRNdlJNVDloTlgwSUZoeHJzdGxETloifQ==	2017-10-24 14:17:03.39652+00
3s48yk2pwm11y62095anzjrkdf40l5bf	Njk0ZDUyMjFiNmExYWRhYzkxMGNhZDM1NzRjZmEyNmIxOTgzZjQ2YTp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiJESEhSeFZLTU1wMURVRTFFWkZydkFZb3ViajJGUlVnViJ9	2017-10-24 14:21:28.676588+00
myxxyvpwh4cdfcgx3jlmnf06swd0aolw	ZGU4OGNjYzgwNDcxZjMwZmNlZTMwNTExYWRmZGQ1ODQ3NWExNTNiZDp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiJyZG14eEt1NGpVZER3bEdJd1dIc0dQWmEzdmlSU1VLSyJ9	2017-10-25 14:24:29.134564+00
25t2gb441faxqeih5idjw4rpmbglosh2	OGI0M2NkNzYxOTdlOTA1MmFiZTE0ZjUwMDA0M2JjY2UzYjk2YzdiNzp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiJ6RzF0NUtEcHk3VG1JdHVHMnVXUnFlNGZoNUp6RU52RiJ9	2017-10-26 15:49:35.439318+00
8l24c3j19s5sd95p14akkny0l1l0oyw5	ZTc0Nzc4MjA2N2ZhYjhlNmQxMGJkNzI4OGY1MmE1Mzc2ODA2MGM1Mjp7ImZhY2Vib29rX3N0YXRlIjoiQk40cnQ3RkxZWnJhNE9vVHJyOW1DUkc5dkNIZHdrYTEiLCJ0d2l0dGVyX3N0YXRlIjoiN2NORmZjYmI3U1BpaWNqZm9YUWxOMGhhaG9SMHBlcjEiLCJ0d2l0dGVydW5hdXRob3JpemVkX3Rva2VuX25hbWUiOlsib2F1dGhfdG9rZW49TFJxVlh3QUFBQUFBMW9RNEFBQUJYeHhPTGRrJm9hdXRoX3Rva2VuX3NlY3JldD1LUmM4aGJnbXdpdGNFb0J5MkpMYnlVWjZWUW5Rc1A5dyZvYXV0aF9jYWxsYmFja19jb25maXJtZWQ9dHJ1ZSJdLCJnb29nbGUtb2F1dGgyX3N0YXRlIjoid2l2Wk13MDdWY0ZIN0tkYUtKVTMzSDVXSlpWR3psM2YifQ==	2017-10-28 19:13:29.778693+00
2eeqsnnff8h04lf64q0lc4jrjiycn51n	MTMyOGRhMjdjZmMyZjUyMWJiMjJjODZkOTA3Yzg4MjIzN2I2ZGYxZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzlhNTQ4NDMzNzRmYmNiMDE5N2EzM2E4NDdlMTc0YTJkZTYyNzdkIn0=	2017-10-29 12:53:47.741443+00
0amhgq7ebwh0fs0xrlpvbq49kohrfnef	MDlmYTQwODFmNjcyNmEzMjllMzAzNzQ1YjkzNjMyODkxYmQxN2QxOTp7InR3aXR0ZXJfc3RhdGUiOiJXVzVBQTZydmtkNk10UWdITmdQN3ZCN2VOY090aDdmRSIsInR3aXR0ZXJ1bmF1dGhvcml6ZWRfdG9rZW5fbmFtZSI6WyJvYXV0aF90b2tlbj1kVzM4QndBQUFBQUExb1E0QUFBQlh5WWgxRTQmb2F1dGhfdG9rZW5fc2VjcmV0PTNacXVIYWg3UXE0cUlvcU5aa20xMWpQNFF3ZTlXM1R5Jm9hdXRoX2NhbGxiYWNrX2NvbmZpcm1lZD10cnVlIl19	2017-10-30 17:01:13.758405+00
u2t0xyky93yw2b2u5fafece3pkds42ug	OTk1NzAyNDM3MTE0MzhhODNlNDJmNzUwYTIxMTA5MzAxODkzMTEwMjp7InR3aXR0ZXJfc3RhdGUiOiJINGZETFAybEZ1QjRLZk96U1JQTFY2Yk1hNFduRnJuNCIsInR3aXR0ZXJ1bmF1dGhvcml6ZWRfdG9rZW5fbmFtZSI6WyJvYXV0aF90b2tlbj1jckxOUlFBQUFBQUExb1E0QUFBQlh6R3RsVUEmb2F1dGhfdG9rZW5fc2VjcmV0PVdpeXo5Ull4MFBrbEF4cTZrbW9zQ2hCY2FyNktMb0hqJm9hdXRoX2NhbGxiYWNrX2NvbmZpcm1lZD10cnVlIl19	2017-11-01 22:49:42.03205+00
sv5ikwm1xyf2009rah7kjn65lzgk85wg	Y2NkOWIzZGY2YTljZmU0MDM4ODczODcwNDk0MTY1ZGM1MzIyYzhhYTp7ImZhY2Vib29rX3N0YXRlIjoiOFFGUmpKcHlNb2U0S2VnSU10clJ4WVVQbm9rVFg4MkgifQ==	2017-11-02 01:13:49.906201+00
w9h6o9q39zl5pdfrbszes2i6m5nkt2ix	NGJiNmUzZGRiYzE4ZTYxN2ZlZmU3NjJjNTZmZGM5OTFhNjYwZWMzYzp7InR3aXR0ZXJfc3RhdGUiOiI0dnlHTUZMTVNmV29mdHFDbnRIb3pjR2Q1Sm5xeEtDbCIsInR3aXR0ZXJ1bmF1dGhvcml6ZWRfdG9rZW5fbmFtZSI6WyJvYXV0aF90b2tlbj1sckZFdUFBQUFBQUExb1E0QUFBQlgwaHBLYWMmb2F1dGhfdG9rZW5fc2VjcmV0PUZIc0lKaEM3TVpXTlh6Z0pwdzRHZk1oWFRVNjZ0REtiJm9hdXRoX2NhbGxiYWNrX2NvbmZpcm1lZD10cnVlIl19	2017-11-06 08:46:14.020086+00
l20q5zm47wfjori936396mc2jeal63vt	MTMyOGRhMjdjZmMyZjUyMWJiMjJjODZkOTA3Yzg4MjIzN2I2ZGYxZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzlhNTQ4NDMzNzRmYmNiMDE5N2EzM2E4NDdlMTc0YTJkZTYyNzdkIn0=	2017-11-06 09:40:59.34775+00
8y9tc272yz7gffa77qqwvuisf1huen1m	ZjEwMmQ0NTE4MWI3MTI2NmE5Nzg1ZmY4MWMwYjUxMDM0MjViZDgxMTp7InR3aXR0ZXJfc3RhdGUiOiJvcU8xcmwybWpyWm16Y2FIODk3c0FORmRKQzlSZHFoZiIsInR3aXR0ZXJ1bmF1dGhvcml6ZWRfdG9rZW5fbmFtZSI6WyJvYXV0aF90b2tlbj1BVUNLa0FBQUFBQUExb1E0QUFBQlgwOFB3ZGsmb2F1dGhfdG9rZW5fc2VjcmV0PTlydDBsTFFsUmRtdjBzUHI1MmVDcUVPc1ZSTG1KNTNOJm9hdXRoX2NhbGxiYWNrX2NvbmZpcm1lZD10cnVlIl0sImZhY2Vib29rX3N0YXRlIjoiOW0ydmRmeDdjT2NhOElpZkRLdVZTeE9pRGhpaldYQzkifQ==	2017-11-07 15:46:02.082104+00
j5j29mm7fou4bkh9a357vuu5xm40j9om	MTkwMjY1YmQ1NjlkYjYwNDUwODg4OTQwOTNiMGQ4YjNhZTE5ODFkMjp7InR3aXR0ZXJfc3RhdGUiOiJ2Mloyd2k4MHMwbDVheTQ3ekxVTWpNNFBWZXpJaGM5aiIsInR3aXR0ZXJ1bmF1dGhvcml6ZWRfdG9rZW5fbmFtZSI6WyJvYXV0aF90b2tlbj0tRkE0cWdBQUFBQUExb1E0QUFBQlgwOVpXcmsmb2F1dGhfdG9rZW5fc2VjcmV0PW43eDRXQWxKMHRDNEQ0aXViM3dta1BzSTFKTnFVcnA2Jm9hdXRoX2NhbGxiYWNrX2NvbmZpcm1lZD10cnVlIl0sImZhY2Vib29rX3N0YXRlIjoiTFI0dTZvWTExSlpHSUg3bDRjaWs0eEtTZmtZNUtSUlkifQ==	2017-11-07 17:06:24.920729+00
3lmfqd8qghjqivjvdzns7025s74anqem	ZDMyMmFhZTA0Njc5ZGI5YTI4OWZlZGNjYmE5Y2ZmYzI4NjE0MDI0MDp7ImZhY2Vib29rX3N0YXRlIjoiQUtaTU9LVmJxcm13aWh2TGRYcmVYMVlqZUZjOXhESEgifQ==	2017-11-10 08:45:51.674299+00
ih95ifde2gfltzd8imlvbguxdxnyotym	MzA5M2EyZmM3YTEwZjQ5NDZjN2M2MzQ3ZTBlMGRlYTk2NmJiMzYyODp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiJyVVNxR1VSOFNwZ1BLZDBPRURDWjROUElVaTNubmpBSyJ9	2017-11-10 08:45:56.664132+00
g8bzkbnsg08onsyy0uknb3fwiuqvmoh7	YjBlZmZmNjRjY2U0ODk0MGNkMzRkNmU3MWI2ZmZlODYzOWY4NzYyZDp7InR3aXR0ZXJfc3RhdGUiOiJva3dseXVFUnFyVGQwUno0RWFWNXFaTDlpbW9aM2R1ViIsInR3aXR0ZXJ1bmF1dGhvcml6ZWRfdG9rZW5fbmFtZSI6WyJvYXV0aF90b2tlbj1VbmhpLVFBQUFBQUExb1E0QUFBQlgxMENhVEUmb2F1dGhfdG9rZW5fc2VjcmV0PTNvZEpnQ2kydlA3M2M5WEVKdTgyMEhrNloyMTRub1lpJm9hdXRoX2NhbGxiYWNrX2NvbmZpcm1lZD10cnVlIl19	2017-11-10 08:46:01.596293+00
4imiujvnplrlawfumbikg4afvib1b34g	ZTQ0MjUwNTgwYmQ4OGI4NWI4ZGYzMDI3OGRiM2RmYTYyYWYwOWU4ZTp7InR3aXR0ZXJfc3RhdGUiOiJOV2RERzVZS2s2blBiOVJ4MDF4bWdKOUxSMTlKUWdKaCIsInR3aXR0ZXJ1bmF1dGhvcml6ZWRfdG9rZW5fbmFtZSI6WyJvYXV0aF90b2tlbj1lQzY5T0FBQUFBQUExb1E0QUFBQlg0b253cWsmb2F1dGhfdG9rZW5fc2VjcmV0PWdhMnprU2s0THFWM0xQRE90a0NzRjFjU2s5SVlycVo1Jm9hdXRoX2NhbGxiYWNrX2NvbmZpcm1lZD10cnVlIl19	2017-11-19 03:09:44.063897+00
mx3ovfh57wlf6l79n532frf9dp24n8lz	MDc3Y2IxYjYxODUwZTI5MmU4ODY2OTUxZmYxZGQ3ZjNkZjQ4NzM2Mjp7ImZhY2Vib29rX3N0YXRlIjoiY1M2Mm90cTBnc3VMb29FV3Y3Wk9KUlFIZVV2cU5jOFgifQ==	2017-11-19 03:09:58.988285+00
agimmn939961xuksydwhjugn3vvnlwgh	OGY4ZWQ4Nzc0ZTkwM2VlYWM2YWNiNzBmMDA2N2E0ZDM1YjQ5ZjU0Yzp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiJ0NDZMcjZqSHkzY2pGSUFFTHFYeW5sT1hESjl6S3laNSJ9	2017-11-19 03:14:29.547407+00
baxdgsczlcylz10uh37am861qoedgw53	ZDE4NWYwNzlmMmYzYWExMjVlODAwOGE4MmEzNTVlMmU2ODUzYjNmZjp7ImZhY2Vib29rX3N0YXRlIjoiMmlhbFZRYzJEUTgxN3dPSExoVGtsUG53WTgyT0c0SEYiLCJ0d2l0dGVyX3N0YXRlIjoidHN3aFI5ZThvRWV1UE1FRXhudGlQVEZFbnhKOVNmcG4iLCJ0d2l0dGVydW5hdXRob3JpemVkX3Rva2VuX25hbWUiOlsib2F1dGhfdG9rZW49WVdlSTZBQUFBQUFBMW9RNEFBQUJYNXhVXy1jJm9hdXRoX3Rva2VuX3NlY3JldD11cFNYYVY3bXA5VWdsWWdyN09JQW9BZ3VrRUdFY2s3OCZvYXV0aF9jYWxsYmFja19jb25maXJtZWQ9dHJ1ZSJdLCJnb29nbGUtb2F1dGgyX3N0YXRlIjoiYXk5Z2xCWVlCWmxvOVVyYk1QTGE3UXN6akFuOHM1WE8ifQ==	2017-11-22 15:52:21.614552+00
hcj3nj5qoxbg2ib828smik48ogkmhy3v	MmUyYTlkMWI0ZmRmOWY4MjVmMGI3MjgwZTg3ODM1NzY5NzEyZDMyNjp7ImZhY2Vib29rX3N0YXRlIjoiRldMU0ozNEZKQ05ZazAwNlp1MDdta1ROZFRZbWxQdVAifQ==	2017-11-28 09:11:05.185997+00
cum1xzgbewj3vqwri8h9gywx8ppsz0xm	NmQ4ZGIxMzM2MjBlNTJiZWE5Y2UwZTZhZjE2ZjVlZWVmNzU3OWVjNDp7InR3aXR0ZXJfc3RhdGUiOiJjZ3l3NjB5RGZ5U3Q1QWxoZ21TSkhMOXFnVnllb1M2SiIsInR3aXR0ZXJ1bmF1dGhvcml6ZWRfdG9rZW5fbmFtZSI6WyJvYXV0aF90b2tlbj1WOFNyUWdBQUFBQUExb1E0QUFBQlg3ejBUeUUmb2F1dGhfdG9rZW5fc2VjcmV0PWp6V2lHQm82TnFZSk1OZHdiOGE1Q2NaZHFHcjc3VGx2Jm9hdXRoX2NhbGxiYWNrX2NvbmZpcm1lZD10cnVlIl19	2017-11-28 23:54:10.164108+00
02twkkgrumlulipyy0nkhiabagyvo5mt	MDg2ZmYyZWU5OTJhZWM5Mjg2ZjZiYjQ1NzI5MmU1NzE1YWJjYTg2Yjp7ImZhY2Vib29rX3N0YXRlIjoiMWVsbGNET0ltRVp5UEdDYThuVEQyYVNsWFFjQzhNbDUifQ==	2017-11-28 23:54:15.364889+00
a1d0aepb42sml0v629diu5ota5pzwebc	OTI2MjFjYjI0OTI1MzE0MGUwOTE5YWMxN2IyYzhlMDgwMmU1NmNiMTp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiI0WDhWYkdiTjlCcE9DelR6RFhyMHN5eEVxVldQWElHZSJ9	2017-11-28 23:58:39.957287+00
xhv1tl0ts7o428sh5blj08x1qe68kxgx	YTRlN2IzMzE3NTI3MDI0YjM4ODM1YzdjNDAwNDY0ZjlmNDA0Y2IyYjp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiJPVjZRYmJlcnhrWjlCYmJPY2RMdks3cjVqN0gxeUF2RCJ9	2017-11-29 23:00:27.23354+00
z2yd3iv5flairrekozetx4uqii21i4y9	MTY2NjcwNjU5MjA2Yjc5NTNhNTM4ZDMzZmFjYzZmOTU3NTMzYzUyMzp7InR3aXR0ZXJfc3RhdGUiOiJvbXRXTU9Pa3FTMkQyRW1ENnV1VmxMeVdsWkQ3SWFaWiIsInR3aXR0ZXJ1bmF1dGhvcml6ZWRfdG9rZW5fbmFtZSI6WyJvYXV0aF90b2tlbj10X25kOHdBQUFBQUExb1E0QUFBQlg4clVaT1kmb2F1dGhfdG9rZW5fc2VjcmV0PVpUcGhQU09KUDRpUVE4RU5kQ1pEM3ozejNnSEw2MTRJJm9hdXRoX2NhbGxiYWNrX2NvbmZpcm1lZD10cnVlIl19	2017-12-01 16:33:59.607611+00
wkd5rwb2vtbi46naxkt3v4347p3d4yqb	NDgwNTkxYmRmMzhlZjUwNTFkMDE3MTEwMzQ1YWNlNTk0NzBlNWM2ZDp7ImZhY2Vib29rX3N0YXRlIjoiS0dpQWdSOFNTWXl0c0ZKTTh3R09jVk5KRVI0QndXek8ifQ==	2017-12-01 21:43:37.5247+00
l70ejph1pg1xoh1sc57yaomzfyt3q8aq	OTg2MjI2OTk0ZjhiOWY3MzBlOGUyNDEzYjEwM2E5ZjFjNWVlNDNiYzp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiJBU3Z1VHpyQjN2elB2eWZ0THFmWjJDMHZ2UGt0MVk2WCJ9	2017-12-01 21:45:09.662136+00
a5e1xiikiqrqswh4rvqxy1ozwx2t74fo	MTMyOGRhMjdjZmMyZjUyMWJiMjJjODZkOTA3Yzg4MjIzN2I2ZGYxZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzlhNTQ4NDMzNzRmYmNiMDE5N2EzM2E4NDdlMTc0YTJkZTYyNzdkIn0=	2017-12-02 01:52:55.181748+00
r98p8jtu5rc22y1eh7fkeo3au4e4u2p2	Y2QzMTQyMDY1ZTZkYzVjYzUwZjI3M2NjYjBkNGZkZjQxNGQzOTg0Nzp7InR3aXR0ZXJfc3RhdGUiOiJVd3F5ZWlBQjhWNnZveEpxaklRd2VhU0QxSVhueFZuSCIsInR3aXR0ZXJ1bmF1dGhvcml6ZWRfdG9rZW5fbmFtZSI6WyJvYXV0aF90b2tlbj1XUFk0V0FBQUFBQUExb1E0QUFBQlg4NmFuV0Umb2F1dGhfdG9rZW5fc2VjcmV0PXJUcElSdWZxTmNYaG44dkZib1E4VU83NUhIUWFlVXNKJm9hdXRoX2NhbGxiYWNrX2NvbmZpcm1lZD10cnVlIl19	2017-12-02 10:09:21.962931+00
mws6qn2d6snecgfq3d1th9wztqnf709y	MTMyOGRhMjdjZmMyZjUyMWJiMjJjODZkOTA3Yzg4MjIzN2I2ZGYxZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzlhNTQ4NDMzNzRmYmNiMDE5N2EzM2E4NDdlMTc0YTJkZTYyNzdkIn0=	2017-12-02 12:44:13.917649+00
anpqnftslyitqj2t9er0td6lwq7usl2f	MTMyOGRhMjdjZmMyZjUyMWJiMjJjODZkOTA3Yzg4MjIzN2I2ZGYxZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzlhNTQ4NDMzNzRmYmNiMDE5N2EzM2E4NDdlMTc0YTJkZTYyNzdkIn0=	2017-12-05 13:49:22.864296+00
hjj0ig5j3ug80jsg8y0g9ww3xuso5gnp	MjE1NjQyOTU3MWM1N2JlMzEwZDA1Mzk0NmUyMTJlMDY0ZmE5NzVmNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ZTlmM2IwMjQ4NWY0MDA2OTA0Nzc5MTdjMzU4NTg2Y2YzYmFkNzljIn0=	2017-12-16 17:49:20.92283+00
lfy1z3tpjh6psm3brjncp92tm9e5cowz	MjE1NjQyOTU3MWM1N2JlMzEwZDA1Mzk0NmUyMTJlMDY0ZmE5NzVmNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ZTlmM2IwMjQ4NWY0MDA2OTA0Nzc5MTdjMzU4NTg2Y2YzYmFkNzljIn0=	2017-12-16 17:51:30.959747+00
beyqb49crc2rmdaqosu37ur3coa51qeh	MjE1NjQyOTU3MWM1N2JlMzEwZDA1Mzk0NmUyMTJlMDY0ZmE5NzVmNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ZTlmM2IwMjQ4NWY0MDA2OTA0Nzc5MTdjMzU4NTg2Y2YzYmFkNzljIn0=	2018-01-04 13:56:09.523714+00
z4b9uimk9gnxpj3ifcbpzifuhdxg5m65	MjE1NjQyOTU3MWM1N2JlMzEwZDA1Mzk0NmUyMTJlMDY0ZmE5NzVmNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ZTlmM2IwMjQ4NWY0MDA2OTA0Nzc5MTdjMzU4NTg2Y2YzYmFkNzljIn0=	2018-01-18 00:25:26.162847+00
mtctnzl6dzntbf9sb7ymbp2ph8piiy31	MjE1NjQyOTU3MWM1N2JlMzEwZDA1Mzk0NmUyMTJlMDY0ZmE5NzVmNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ZTlmM2IwMjQ4NWY0MDA2OTA0Nzc5MTdjMzU4NTg2Y2YzYmFkNzljIn0=	2018-01-21 15:05:33.601307+00
ujd8kqkorartyefzwu1nb51hzadd8cs3	MjE1NjQyOTU3MWM1N2JlMzEwZDA1Mzk0NmUyMTJlMDY0ZmE5NzVmNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ZTlmM2IwMjQ4NWY0MDA2OTA0Nzc5MTdjMzU4NTg2Y2YzYmFkNzljIn0=	2018-01-27 00:15:50.805523+00
tcveykr7745erubv66n0kcztu5i3xydc	MjE1NjQyOTU3MWM1N2JlMzEwZDA1Mzk0NmUyMTJlMDY0ZmE5NzVmNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ZTlmM2IwMjQ4NWY0MDA2OTA0Nzc5MTdjMzU4NTg2Y2YzYmFkNzljIn0=	2018-02-02 22:54:49.07019+00
zspp8bhauv6aj67y2gj1obe6gm5aoqpu	MjE1NjQyOTU3MWM1N2JlMzEwZDA1Mzk0NmUyMTJlMDY0ZmE5NzVmNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ZTlmM2IwMjQ4NWY0MDA2OTA0Nzc5MTdjMzU4NTg2Y2YzYmFkNzljIn0=	2018-02-10 14:43:22.810578+00
j8xif95nqsa41heusoalhzvm0qh7t0wj	MjE1NjQyOTU3MWM1N2JlMzEwZDA1Mzk0NmUyMTJlMDY0ZmE5NzVmNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ZTlmM2IwMjQ4NWY0MDA2OTA0Nzc5MTdjMzU4NTg2Y2YzYmFkNzljIn0=	2018-02-10 18:23:54.396831+00
c2j76p1xwuywfabuf06zhchif2m3jqvs	MjE1NjQyOTU3MWM1N2JlMzEwZDA1Mzk0NmUyMTJlMDY0ZmE5NzVmNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ZTlmM2IwMjQ4NWY0MDA2OTA0Nzc5MTdjMzU4NTg2Y2YzYmFkNzljIn0=	2018-03-04 21:39:02.378092+00
u65qmagxohkl4wsuzk31fmso3ys5ve5y	MjE1NjQyOTU3MWM1N2JlMzEwZDA1Mzk0NmUyMTJlMDY0ZmE5NzVmNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ZTlmM2IwMjQ4NWY0MDA2OTA0Nzc5MTdjMzU4NTg2Y2YzYmFkNzljIn0=	2018-03-04 22:04:58.528843+00
790tnncrzw4kg1fuenebgc62ys818lkp	MjE1NjQyOTU3MWM1N2JlMzEwZDA1Mzk0NmUyMTJlMDY0ZmE5NzVmNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ZTlmM2IwMjQ4NWY0MDA2OTA0Nzc5MTdjMzU4NTg2Y2YzYmFkNzljIn0=	2018-03-04 23:14:01.879898+00
qq4u2l51ti0wwy15llpycxkvho63xsuu	MjE1NjQyOTU3MWM1N2JlMzEwZDA1Mzk0NmUyMTJlMDY0ZmE5NzVmNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ZTlmM2IwMjQ4NWY0MDA2OTA0Nzc5MTdjMzU4NTg2Y2YzYmFkNzljIn0=	2018-03-13 14:55:23.754712+00
y5ga0am7teju9a96bf2wvmelfav3vb8a	MjE1NjQyOTU3MWM1N2JlMzEwZDA1Mzk0NmUyMTJlMDY0ZmE5NzVmNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ZTlmM2IwMjQ4NWY0MDA2OTA0Nzc5MTdjMzU4NTg2Y2YzYmFkNzljIn0=	2018-03-24 14:18:43.201126+00
vhb585d4lgcxy2g0ezjkal9szl1v1o47	MjE1NjQyOTU3MWM1N2JlMzEwZDA1Mzk0NmUyMTJlMDY0ZmE5NzVmNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ZTlmM2IwMjQ4NWY0MDA2OTA0Nzc5MTdjMzU4NTg2Y2YzYmFkNzljIn0=	2018-04-07 17:45:09.806916+00
10i5u0dmy1m3zrboanbkk7l46vde8fh6	MjE1NjQyOTU3MWM1N2JlMzEwZDA1Mzk0NmUyMTJlMDY0ZmE5NzVmNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ZTlmM2IwMjQ4NWY0MDA2OTA0Nzc5MTdjMzU4NTg2Y2YzYmFkNzljIn0=	2018-04-21 20:31:08.372787+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: hakim
--

COPY django_site (id, domain, name) FROM stdin;
1	gistutorials.com	gistutorials.com
2	www.gistutorials.com	www.gistutorials.com
\.


--
-- Data for Name: expenses_expense; Type: TABLE DATA; Schema: public; Owner: hakim
--

COPY expenses_expense (id, date, amount, description, user_id) FROM stdin;
54	2017-11-11	9.60	tesco	1
55	2017-11-12	3.50	neutrogena	1
56	2017-11-12	41.99	clothes	1
57	2017-11-12	5.40	kebab	1
58	2017-11-13	2.34	tesco	1
59	2017-11-14	4.90	tesco	1
60	2017-11-15	7.64	tesco	1
61	2017-11-16	12.99	pizza	1
62	2017-11-16	3.40	tesco	1
22	2017-11-01	3.99	tesco	1
23	2017-11-02	7.63	tesco	1
24	2017-11-03	12.99	pizza	1
25	2017-11-03	3.88	tesco	1
26	2017-11-04	6.74	tesco	1
34	2017-11-05	9.65	tesco	1
35	2017-11-06	4.72	tesco	1
36	2017-11-07	5.29	tesco	1
37	2017-11-07	9.00	haircut	1
38	2017-11-08	5.00	rice	1
39	2017-11-08	8.02	tesco	1
40	2017-11-09	2.45	tesco	1
41	2017-11-10	39.59	jacket	1
69	2017-11-18	8.15	tesco	1
70	2017-11-19	16.44	meat	1
71	2017-11-19	5.05	tesco	1
74	2017-11-20	24.99	shoes	1
75	2017-11-20	8.32	tesco	1
76	2017-11-20	58.00	tablet	1
77	2017-11-21	3.00	rubix	1
78	2017-11-21	3.20	tesco	1
79	2017-11-23	5.00	rice	1
80	2017-11-23	43.00	watch	1
81	2017-11-23	20.53	earrings	1
82	2017-11-23	4.66	tesco	1
83	2017-11-24	24.99	suitcase	1
84	2017-11-24	12.99	pizza	1
85	2017-11-25	8.47	tesco	1
87	2017-11-26	100.40	measurer	1
86	2017-11-26	5.45	cleaning	1
88	2017-11-27	1.20	cookie	1
89	2017-11-27	3.46	tesco	1
90	2017-11-28	6.27	tesco	1
91	2017-11-28	5.59	tesco	1
92	2017-11-29	1.00	tesco	1
93	2017-11-30	3.90	batteries	1
94	2017-11-30	11.30	tesco	1
95	2017-12-01	4.10	tesco	1
97	2017-01-31	1.00	test-jan	1
98	2018-01-01	1.00	test-jan2018	1
99	2018-01-05	2.00	test-jan-05-2018	1
100	2018-01-13	9.00	test-android-2018	1
102	2018-01-13	0.50	test-webapp-13Jan	1
103	2018-01-14	8.00	test-motog-2018	1
\.


--
-- Data for Name: members_member; Type: TABLE DATA; Schema: public; Owner: hakim
--

COPY members_member (id, slug, user_id) FROM stdin;
1	hakim	1
17	h4k1m0u	18
18	hbenoudjit	19
19	hakimbenoudjit	20
\.


--
-- Data for Name: places_city; Type: TABLE DATA; Schema: public; Owner: hakim
--

COPY places_city (id, name, geometry, slug) FROM stdin;
13	Ain Naadja	0101000020E610000080374A4F3DA40840C4A65D9BEA594240	ain-naadja
52	Aïn Taya	0101000020E610000001F08BD648570A4048B2BDFE48654240	ain-taya
21	Alger	0101000020E6100000010ECA50037B084034B0C5993E634240	alger
41	Baba Ali	0101000020E6100000FE01CA4E2F6F084010A2E1D242554240	baba-ali
5	Bab Ezzouar	0101000020E610000041124B473F7C09404CA995586B5C4240	bab-ezzouar
15	Bachdjarrah	0101000020E6100000C17A8AF2ADE608400CA90DE52A5C4240	bachdjarrah
18	Baraki	0101000020E6100000C0584AB8E0C4084050A2CDE480554240	baraki
69	Bateau Cassé	0101000020E6100000005B8B5611C40940B8AE8D3CC6614240	bateau-casse
39	Belaouadi	0101000020E610000040AA4AAF6B150940E0981118314C4240	belaouadi
72	Ben Aknoun	0101000020E61000003EBA09516128084020AE2DCA2F614240	ben-aknoun
94	Benchaâbane	0101000020E6100000C09188DE4C030740249CC1766A4F4240	benchaabane
81	Ben Chaoua	0101000020E6100000BF9009FA68FF0740C0A19DB2F2544240	ben-chaoua
95	Bendali Ali	0101000020E61000003EAB0A50A01609401096C9D266494240	bendali-ali
98	Ben Hamza	0101000020E610000001C58B02FC2C0A40C4A37534F1564240	ben-hamza
8	Beni Messous	0101000020E6100000815E891F9BCD0740C3B09975CA634240	beni-messous
40	Bentalha	0101000020E610000080368AC82AA30840BB9F7560F6524240	bentalha
17	Birkhadem	0101000020E6100000FFF6893A7F64084074A8B132945B4240	birkhadem
34	Birtouta	0101000020E61000003F8E8982DBFC0740549F81258F524240	birtouta
16	Bologhine	0101000020E6100000C1E989704757084004B491AEFF664240	bologhine
48	Bordj El Bahri	0101000020E6100000FF978B0A5D000A4038B2F9C338654240	bordj-el-bahri
2	Bordj El Kiffan	0101000020E6100000001D8B1AF486094094AC29A4A65F4240	bordj-el-kiffan
73	Bouchaoui	0101000020E610000081DC087E5B4D074054ACD95E695F4240	bouchaoui
29	Boufarik	0101000020E6100000C1DC48939C4D0740549659B2AB494240	boufarik
78	Bouhadja Ali	0101000020E6100000FFAC4964391B0840AC9EC579E8514240	bouhadja-ali
11	Bourouba	0101000020E6100000C07ACAC18FE608403CA8A98E5E5B4240	bourouba
80	Chaibia	0101000020E6100000C08549E476F407407C9C99A2C04F4240	chaibia
35	Chebli	0101000020E61000003FA18903B10F0840A896F909FF494240	chebli
6	Chéraga	0101000020E6100000FF3EC95391AE07401CAF6DDC27624240	cheraga
10	Dely Brahim	0101000020E6100000406B89066BDA074030AD798C40604240	dely-brahim
50	Dergana	0101000020E6100000BFAE8BEAED160A40CFAF15BCDB624240	dergana
57	El Achour	0101000020E6100000C17D899A97EC0740DFAA2908F95D4240	el-achour
4	El Biar	0101000020E610000080CFC9E2543D084064AF3D896E624240	el-biar
87	El Djoumhouria	0101000020E6100000BF200BBA858A094084A3A9F2B3564240	el-djoumhouria
1	El Hamiz	0101000020E61000004180CB3EE2E809407CAACD3E975D4240	el-hamiz
14	El Harrach	0101000020E610000040AE8A996A19094034A95549515C4240	el-harrach
53	El Marsa	0101000020E610000001A1CBBF6D090A4098B4498291674240	el-marsa
97	Ferme des mûriers	0101000020E6100000011B0950F18A0740209A41536A4D4240	ferme-des-muriers
86	Haï Kourifa	0101000020E6100000C0008B3E0A6B0940D4A46DD3FE574240	hai-kourifa
65	Hammamet	0101000020E61000003F5B49535FCA074010B5E1430A684240	hammamet
59	Hammedi	0101000020E6100000FFA9CB044D120A4008A4396934574240	hammedi
61	H'raoua	0101000020E6100000C1108C3ECF770A40E0AFF555E9624240	hraoua
85	Hydra	0101000020E6100000BFE409884B52084098ACA9A6AB5F4240	hydra
58	Kadous	0101000020E6100000809749820306084040AB4D76575E4240	kadous
26	Khraïcia	0101000020E61000007F6B0938AADA074080A3750EAE564240	khraicia
12	Kouba	0101000020E610000000448A857EB00840D4AA5D1DEC5D4240	kouba
105	Labaziz	0101000020E6100000C0400A5028AD0840B89571DC0F494240	labaziz
32	Larbatache	0101000020E61000003F930C429DF80A403C9EEDBF7A514240	larbatache
106	La Trappe	0101000020E610000040BB8853812C074038AF91E644624240	la-trappe
75	Les Dunes	0101000020E61000003FDA088CE64A074080B0F9DE88634240	les-dunes
37	Les Eucalyptus	0101000020E61000003FCA8A1230350940BFA1AD93F2544240	les-eucalyptus
22	Mahelma	0101000020E6100000C093085A6D0507402CA489AA57574240	mahelma
36	Meftah	0101000020E6100000015E4B6620C70940149CF95F584F4240	meftah
64	Meridja	0101000020E61000007FE0C9271D4E084040A5D14069584240	meridja
76	Moretti	0101000020E6100000FF77885102EA064050AE59E85D614240	moretti
92	Mouhous	0101000020E61000007F34CB84329E094078AC7D798C5F4240	mouhous
104	Ouled Allal	0101000020E610000000280AF2CB940840149AFDA15F4D4240	ouled-allal
66	Ouled Belhadj	0101000020E610000001D50933DD4208406CA33DE19A564240	ouled-belhadj
44	Ouled Brahim	0101000020E610000080880B0330F1094074A165E8A9544240	ouled-brahim
31	Ouled Chebel	0101000020E610000000870988A8F5074044996D6B904C4240	ouled-chebel
47	Ouled Haddadj	0101000020E6100000BF4E0C8E1CB50A4024A8DD55455B4240	ouled-haddadj
96	Ouled Khodem	0101000020E6100000817D09D069EC07406896C92FBE494240	ouled-khodem
82	Ouled Mendil	0101000020E61000003F5349E48AC20740E09F951D19534240	ouled-mendil
77	Ouled Sidi M'Hamed	0101000020E61000007F3B897837AB0740309C79E2734F4240	ouled-sidi-mhamed
27	Rahmania	0101000020E610000080CF08C45E400740F4A3793A23574240	rahmania
33	Raïs	0101000020E6100000FF928A8C74FE0840509B751F964E4240	rais
63	Raïs Hamidou	0101000020E610000040A9C93096170840A8B595739E684240	rais-hamidou
46	Reghaïa	0101000020E61000007F568C4DA8BC0A4078AB9162905E4240	reghaia
45	Rouiba	0101000020E6100000C0DA0BA45B420A402CABD1AA445E4240	rouiba
7	Saoula	0101000020E61000007FC8C9A778360840C4A649BFE9594240	saoula
24	Sebbala	0101000020E6100000BFAA09CD1219084088A93DCFA65C4240	sebbala
101	Sidi Abbad	0101000020E6100000C0CC0850993D0740E09A993A2A4E4240	sidi-abbad
100	Sidi Aid	0101000020E6100000C02C09D09B9C0740DC99C996264D4240	sidi-aid
99	Sidi Aissa	0101000020E61000003F7609504BE50740C497DD74184B4240	sidi-aissa
79	Sidi Boukhris	0101000020E61000007F6C09E394DB07406CA229E59C554240	sidi-boukhris
91	Sidi Hassen	0101000020E6100000800EC975907E0740B8AFA563C2624240	sidi-hassen
38	Sidi Moussa	0101000020E610000000484AF685B40840509A15B9994D4240	sidi-moussa
83	Sidi Slimane	0101000020E6100000009E4964750C0840E0A22D4F10564240	sidi-slimane
43	Souakria	0101000020E61000000039CBC088A20940EC9F95B724534240	souakria
71	Stambul	0101000020E6100000FF660BD6F6CF0940A0AF9998A8624240	stambul
28	Staoueli	0101000020E6100000C0A988BDFB1A07405CADC1716D604240	staoueli
56	Tamentfoust	0101000020E61000008072CBBF5FDB09409FB4D5839A674240	tamentfoust
30	Tessala El Merdja	0101000020E61000007F2049636B900740789DB968BB504240	tessala-el-merdja
25	Tixeraïne	0101000020E610000040D389532F410840D4A805CBF25B4240	tixeraine
93	Village Figuier	0101000020E610000080FFC884EA6F0740FC99DD05494D4240	village-figuier
90	Village Marie	0101000020E610000081EA8946F85708404CB315B24B664240	village-marie
51	Zghara	0101000020E610000001D4C9C3E7410840BCB3B935BA664240	zghara
102	Zouaoui	0101000020E6100000C1650A50E5D108406C9CA1E5B14F4240	zouaoui
60	بن مراد	0101000020E610000041728B1D24DB09402CAEBD6C39614240	
19	دويرة	0101000020E61000007E19C9516D8907407CA2AD30AF554240	
205	Ali Ghazali	0101000020E61000003F808CFA0DE60A40C8AC6D69D95F4240	ali-ghazali
199	Baba Hassen	0101000020E61000000057C9BE4AC60740B8A5CD62E1584240	baba-hassen
200	Belgourari Ali	0101000020E6100000C08E0C132BF40A4054AEA10562614240	belgourari-ali
186	Ben Choubane	0101000020E6100000C0C20B63A52A0A4080A76D1FA15A4240	ben-choubane
160	Ben Khellil	0101000020E61000007F3F08871BB20640F79729064A4B4240	ben-khellil
131	Ben Ouadah	0101000020E6100000BFA64B66050F0A40B09F41BDEB524240	ben-ouadah
128	Ben Ramdane	0101000020E610000040E8C968D4550840DC9891AD2A4C4240	ben-ramdane
109	Benzerga	0101000020E610000080958B2A03FE0940F7AE418802624240	benzerga
108	Benzerga II	0101000020E6100000BF88CB4A46F1094018B0BDEB21634240	benzerga-ii
116	Boulaissi	0101000020E6100000BE4A08ED22BD0640ECA1F98121554240	boulaissi
180	Boumenir	0101000020E6100000C100497B097107405C9DAD579C504240	boumenir
126	Bourari	0101000020E6100000013509509BA407403096D5B388494240	bourari
170	Café Chergui	0101000020E6100000C0948B9A57FD094090B0494398634240	cafe-chergui
202	Chebcheb	0101000020E6100000006D4C90DAD20A40C4AD7593D3604240	chebcheb
112	Cité Ben Ramdan	0101000020E6100000C0620BB2B5CB094094ADA12DA4604240	cite-ben-ramdan
187	Cité El-Nasr	0101000020E6100000C08E0BB040F70940BCAAF56ED55D4240	cite-el-nasr
158	Clos des Joncs	0101000020E6100000FF51C92570C107407C9A99BCC64D4240	clos-des-joncs
154	Clos Romain	0101000020E6100000BF4DC92538BD0740F3990987414D4240	clos-romain
171	Diar El Gharb	0101000020E610000081B20BBFB31A0A4098B3FD5F97664240	diar-el-gharb
172	Diar El Gharb 2	0101000020E610000081AA4BCACA120A40B0B27188B0654240	diar-el-gharb-2
204	Djaafri	0101000020E6100000BF6B4C10B6D10A40FCAC01DD0D604240	djaafri
145	Djebabra	0101000020E61000007FBE8BA280260A404B97F106A04A4240	djebabra
164	Djemaï	0101000020E61000004170CA5C2CDC08400C9B6174554E4240	djemai
120	D'Kakna	0101000020E6100000C0CFC8DFBE400740D49E15D410524240	dkakna
111	Domaine Mimouni Hamoud	0101000020E61000007F430B56E5AC094044AC49C5565F4240	domaine-mimouni-hamoud
124	El Bor	0101000020E61000007E388BEC15A20940949B5DB4DC4E4240	el-bor
134	El Medene	0101000020E61000007F148CE2727B0A407899BD32C44C4240	el-medene
195	Gué de Constantine	0101000020E6100000FF4A8ACD6BB70840F0A575A118594240	gue-de-constantine
153	Haouch Ben Bahri	0101000020E61000007EC6C925663408402C9C8D67714F4240	haouch-ben-bahri
140	Haouch Ben Sari	0101000020E6100000C0E589FA395308405896B516AF494240	haouch-ben-sari
150	Haouch Cheurfa	0101000020E610000001F6C92582630840409BD5A1864E4240	haouch-cheurfa
157	Haouch De Richemont	0101000020E61000000004CA25387108400C9D39BE4F504240	haouch-de-richemont
155	Haouch Derradji	0101000020E6100000BFCBC925AC390840049C31084B4F4240	haouch-derradji
159	Haouch El Bey	0101000020E610000000BDC925152B0840FC9CDDD03E504240	haouch-el-bey
177	Haouch El Mekhfi	0101000020E6100000C0954C6942FB0A4024A9F95B405C4240	haouch-el-mekhfi
149	Haouch Kidar	0101000020E610000081E209312C500840009AE1D04C4D4240	haouch-kidar
144	Haouch Messioura	0101000020E6100000C0B9C9A5D42708401C98F1FC6C4B4240	haouch-messioura
152	Haouch Mougded	0101000020E61000007FDCC9A51B4A0840F09899DD3D4C4240	haouch-mougded
188	Haouch Nacef Khodja	0101000020E6100000817689C078E507404FA6750677594240	haouch-nacef-khodja
141	Haouch Ouled Tahar	0101000020E6100000FF65C92430D507405896255AB0494240	haouch-ouled-tahar
185	Haouch Rouiba	0101000020E610000000CECB57E5350A40E0A88995FE5B4240	haouch-rouiba
147	Haouch Semmar	0101000020E610000080E8C9A50F5608407C9A99BCC64D4240	haouch-semmar
146	Haouch Sidi Daoud	0101000020E61000003FB5093186230840FC981D6A4B4C4240	haouch-sidi-daoud
148	Haouch Smail	0101000020E610000080D7093146450840D09989671D4D4240	haouch-smail
165	Houaoura	0101000020E61000004072CA5C48DE0840E09D4D2222514240	houaoura
209	Jolie Vue	0101000020E6100000FF388ADA8EA50840C4A9E9BCDF5C4240	jolie-vue
127	Klafta	0101000020E61000003FA98B227F110A40889C051DCB4F4240	klafta
207	Les Vergers	0101000020E610000081FEC93DDA6B0840FCA93575175D4240	les-vergers
198	Lido	0101000020E610000081F78A0DCC61094018ACBD6B2D5F4240	lido
175	Lotissement Adda	0101000020E6100000FFDC091CCE4A084000A5759129584240	lotissement-adda
139	Mahada	0101000020E6100000418B8BE2BEF30940149FC54B52524240	mahada
156	Mehamdia	0101000020E61000000097C925A4050840909B9507D94E4240	mehamdia
168	Merzouk Ali Bentayeb	0101000020E61000007F86486A48F8064038A5DD9463584240	merzouk-ali-bentayeb
143	Mimouche	0101000020E610000001BCC945232A0840709679EEC7494240	mimouche
184	Mohamed Ben Mohamed	0101000020E6100000409C4802B90D0740AC9DF556EB504240	mohamed-ben-mohamed
201	Mohamed El Bey	0101000020E6100000FE824C9F97E80A4018AC8DD92B5F4240	mohamed-el-bey
179	Mzraa	0101000020E610000080960C04F6FB0A40C4A7A9E7E75A4240	mzraa
192	Oued Koreiche	0101000020E6100000BFEA497A4058084080B1B94D86644240	oued-koreiche
203	Oued Roumane	0101000020E6100000808F09C409FE074024AC818D385F4240	oued-roumane
125	Ouled Ali	0101000020E6100000412A8CE2E4900A40289EA19767514240	ouled-ali
114	Ouled Mendil Gheraba	0101000020E6100000FFA208ED7F14074094A16164C8544240	ouled-mendil-gheraba
178	Ouled Omar	0101000020E6100000C19BCCE413010B40D4A349D701574240	ouled-omar
129	Ouled Omar	0101000020E6100000C1AACBED08130A40AC97D52EFD4A4240	ouled-omar
130	Ouled Salem	0101000020E6100000C02FCCED57960A40089B0D90514E4240	ouled-salem
196	Pins Maritimes	0101000020E6100000FFE48AED944F0940C0AA5961D95D4240	pins-maritimes
110	Rassauta	0101000020E61000004055CB4A79BE094008AC156E1E5F4240	rassauta
173	R'Mili	0101000020E6100000C140088549B30640D096D9D7234A4240	rmili
135	Ronda	0101000020E6100000C18E0A285DFA0840C09C855404504240	ronda
123	Safsaf	0101000020E6100000414C4B297EB50940389A9DCF824D4240	safsaf
194	Safsafa	0101000020E610000081158A678E820840D8A68DA2FE594240	safsafa
210	Sahnoun	0101000020E6100000018A8C5F90EF0A4090A445F2BC574240	sahnoun
121	Sahraoui	0101000020E6100000C003CB2FE56D0940CC987D0D1B4C4240	sahraoui
208	Said Hamdine	0101000020E610000081D2C94E4040084000AB990E195E4240	said-hamdine
182	Sidi Aissa	0101000020E61000004066C8BE75D806407C9F05D2B8524240	sidi-aissa
115	Sidi Bennour	0101000020E6100000809108A41603074068A0653F9F534240	sidi-bennour
122	Sidi Hammad	0101000020E610000080188BE46A820940D897C18D2A4B4240	sidi-hammad
191	Sidi M'Hamed	0101000020E610000040F80966A5650840CCAE7DA3D8614240	sidi-mhamed
183	Souaci	0101000020E6100000FFD20B63A43A0A4024A8ED74435B4240	souaci
162	Souk Ali	0101000020E6100000BF204977939007406896A561BF494240	souk-ali
197	Tamaris تماريس	0101000020E610000081F80A1CD36209403FABB9CC585E4240	tamaris
181	Tayeb El Djoughlali	0101000020E610000041E748C2DB570740509D657E90504240	tayeb-el-djoughlali
118	Zaatria	0101000020E6100000FF768883FEE80640E4A0DDB41A544240	zaatria
136	Zayane	0101000020E610000080D1CB8D60390A40B89D4D98F7504240	zayane
107	Zidane	0101000020E610000001328B84C09B0940C8A139DEFD544240	zidane
133	الحوين	0101000020E6100000004B8CE269B10A40E49D31E223514240	
276	19 éme Arrt Mohamed Keroudj	0101000020E6100000C0A909B10218084083B55D447E684240	19-eme-arrt-mohamed-keroudj
246	3 Horloges	0101000020E6100000C0FC09BD0D6A08403CB2D19A3E654240	3-horloges
259	Agha	0101000020E610000000030AAD5370084018AF51BE25624240	agha
230	Aimar Ahmed	0101000020E6100000009D8947710B084098A849FFB65B4240	aimar-ahmed
262	Aïn Kahla	0101000020E610000040348CE7C69A0A4024AFB11730624240	ain-kahla
260	Aïn Malha	0101000020E610000080188A957B85084087A56D8AB0584240	ain-malha
270	Air de France	0101000020E610000080A4C98BC7120840A8B015CBAD634240	air-de-france
217	Amirett	0101000020E610000080898C3416EF0A4014A45DED40574240	amirett
250	Artisanat	0101000020E61000007F73CB1167DC09405CAE250E6C614240	artisanat
226	Balota	0101000020E610000080B108CDCD220740C8A9391CE55C4240	balota
234	Baranas	0101000020E610000000B38911192108407BB0110884634240	baranas
269	Beau Fraisier	0101000020E61000007FE189E6064F084098B1E1F09C644240	beau-fraisier
280	Beau séjour	0101000020E610000000A2C9505010084074B4258C6F674240	beau-sejour
243	Belouizdad	0101000020E610000000340A068EA0084030AC214C435F4240	belouizdad
220	Ben Danoun	0101000020E6100000800F4C6274760A4084A18DFCB8544240	ben-danoun
268	Bouzareah	0101000020E6100000BFB3497E0922084028B2B5E82A654240	bouzareah
286	Brahimi (Kantina)	0101000020E610000040E00877F550074010A9010A305C4240	brahimi-kantina
236	Carnot	0101000020E610000000C489E8E5310840DCAF4166E7624240	carnot
275	Casbah	0101000020E6100000FF0CCA79087A08406CB1114870644240	casbah
272	Centre Ville Hydra	0101000020E610000040E44914F851084094AC3DDAA75F4240	centre-ville-hydra
253	Chaouche	0101000020E610000001178B8DFF8009406FA0958DA8534240	chaouche
235	Chevalley	0101000020E610000040A609F4B314084050AF2DE75C624240	chevalley
256	Cinq Maisons	0101000020E6100000BECACA12B3350940E0A9A1E9FA5C4240	cinq-maisons
307	Cité 310 logements	0101000020E6100000C1D049687B3E084014B1E94018644240	cite-310-logements
308	Cité 384 logements	0101000020E6100000014B094950BA074084B1111189644240	cite-384-logements
242	Cité Addeche	0101000020E6100000FF7CC920C3EB0740EC9F31DE25534240	cite-addeche
239	Cité Baba Ali	0101000020E6100000C1E7491B66550840D49E0D8F12524240	cite-baba-ali
267	Cité El Badr	0101000020E6100000005ECA261ACA084030A921544D5C4240	cite-el-badr
296	Cité les cèdres	0101000020E610000080AF492DC81D08405CAFA53965624240	cite-les-cedres
282	Cité Zerhouni Mokhtar	0101000020E610000040FACA338164094078AAEDC8925D4240	cite-zerhouni-mokhtar
291	City Ali Amran 2	0101000020E610000080630B73A8CC0940E8ADFD7EF6604240	city-ali-amran-2
254	Club des Pins	0101000020E61000007F9B088BE90C07402CAFB1E138624240	club-des-pins
288	Conor	0101000020E6100000415E8BBA4FC7094024A83102455B4240	conor
232	Dar El Beida	0101000020E6100000FF430B275FAD09406CA8B5098C5B4240	dar-el-beida
299	Douar Khouali	0101000020E6100000403FC96BD3AE0740F0A099CF25544240	douar-khouali
258	Douar Mouloud	0101000020E61000004191882AF2020740849D45B3C6504240	douar-mouloud
294	El Bridja	0101000020E6100000FF8908C4D0FB064010AC21C4255F4240	el-bridja
311	EL Idrissi 2	0101000020E610000041CC891D303A0840DCAF45DDE4624240	el-idrissi-2
290	El Magharia	0101000020E610000080728A0A53DE084084AAA5619C5D4240	el-magharia
240	El Mouradia	0101000020E610000041F9C967976608409CAC49F5AD5F4240	el-mouradia
257	Ennedjd (Plateau)	0101000020E6100000403D4870D6AF06404CA3C9097D564240	ennedjd-plateau
241	Frais Vallon	0101000020E6100000FFDC895FCE4A08405CB00DD164634240	frais-vallon
293	Hadj Yakoub	0101000020E610000000F4C84B5C640740A89F09B4E1524240	hadj-yakoub
248	Hamiz 5	0101000020E6100000BF798B6F7FE2094073ABF5F28C5E4240	hamiz-5
278	Haouch El Bay	0101000020E61000007F538BF6B4BC09401FAA319F3C5D4240	haouch-el-bay
229	Haouch Nadjma	0101000020E610000001918BE9A2F9094018A519F341584240	haouch-nadjma
255	Hassan Badi	0101000020E610000000C14AB5E52B094053A9D19D715C4240	hassan-badi
271	Haut Hydra	0101000020E6100000BFCE497CB43C084024ADC57835604240	haut-hydra
249	Hay Essalem	0101000020E61000003F5EC9EF6CCD0740FCA19DB12F554240	hay-essalem
252	Kaidi	0101000020E61000003F3A0B83C1A3094070ABA9CC865E4240	kaidi
222	Kara Mostefa	0101000020E61000007FA5CC59D10A0B4014A379EE42564240	kara-mostefa
245	Khemis El Khechna	0101000020E6100000003F8C2A88A50A40FC9F591134534240	khemis-el-khechna
216	Kouadria	0101000020E6100000FF4D4C022DB40A40A0A489AECB574240	kouadria
238	La Fantan	0101000020E61000003FDA0948E1470840EFB071ACF7634240	la-fantan
309	LGTS CNEP	0101000020E6100000BF7D4CF88EE30A4010A57D1E3A584240	lgts-cnep
287	Lotissement les Mandariniers	0101000020E6100000BFEC0A543D570940D0AA511EE85D4240	lotissement-les-mandariniers
233	Lotissement Takarli Abdelghani	0101000020E61000004181494EF3EF074094AA2953AE5D4240	lotissement-takarli-abdelghani
312	Lpp Bordj el Bahri Faizi	0101000020E610000001A00BB764080A405CB25DD05E654240	lpp-bordj-el-bahri-faizi
300	Madani Sellam	0101000020E6100000813789990BA70740E0A235480F564240	madani-sellam
303	Merdja	0101000020E61000004075CAF740E1084020A2591C54554240	merdja
289	Mohammadia	0101000020E610000000C28A3AE32C09402FAA65A74B5D4240	mohammadia
223	Mouilha	0101000020E61000003FAA0CB48C0F0B40E8A6A5400C5A4240	mouilha
273	Oued Tarfa	0101000020E61000003E77C97D20E6074038A9D19C545C4240	oued-tarfa
219	Ouled Belhadi	0101000020E610000000E04BC996470A403CA6094C61594240	ouled-belhadi
266	Ouled Fayet	0101000020E6100000C02BC9CE749B07400CAB75AD255E4240	ouled-fayet
221	Ouled Hamada	0101000020E6100000808F8C17F1F40A4004A371D734564240	ouled-hamada
224	Ouled Larbi	0101000020E6100000BF460C960DAD0A404CA339127D564240	ouled-larbi
274	Palm Beach	0101000020E6100000FF53C88476C6064038AC65EF4C5F4240	palm-beach
227	Paradou	0101000020E61000003ED0095E113E084044ACD9AB585F4240	paradou
283	Résidence El Karma	0101000020E610000000034A2028700840C0A5418DE8584240	residence-el-karma
277	Résidence Petit Hydra	0101000020E61000003FD3C9360C410840B8AC1DD5CC5F4240	residence-petit-hydra
212	Rihe Ali	0101000020E61000007E8ACCE613F00A40FBA4BD3E25584240	rihe-ali
237	Scala	0101000020E61000003FEB899BCF58084004B0F1AC0E634240	scala
304	Sidi Hemmed	0101000020E6100000401B8B7A2C850940549739D5A74A4240	sidi-hemmed
306	Sidi Youcef	0101000020E6100000FF4E896E4CBE074098B10DC69B644240	sidi-youcef
284	Si Smail	0101000020E6100000C05C4B0AD8C50940BCAC0187CD5F4240	si-smail
218	Smaidia	0101000020E6100000C0C18B1C9A290A40A0A1DD73D3544240	smaidia
298	Télegraphe	0101000020E6100000C04A09F03FBA07400FA2197A45554240	telegraphe
313	Val d'Hydra	0101000020E6100000FFCAC94604390840B4AD6919C3604240	val-dhydra
261	Vieux Kouba	0101000020E6100000812C8A563D9908404CAA3D88655D4240	vieux-kouba
213	Village	0101000020E6100000C0898C726EEF0A4014A5193140584240	village
225	Zeralda	0101000020E6100000C047C8A534BA06400CA8D5742E5B4240	zeralda
302	حي الخير	0101000020E6100000FF4DC94851BD074014A6918239594240	
305	حي المرجة 3	0101000020E6100000BF808A996AEC0840FFA175A734554240	3
214	1500 lgts	0101000020E6100000C1918C143DF70A403BA581B166584240	1500-lgts
231	200 lgts حي 200 مسكـــن	0101000020E610000000854C989CEA0A40B8A471E9E4574240	200-lgts-200
206	Aïn Allah	0101000020E6100000007E49C2EBEC074088ADB50798604240	ain-allah
62	Aïn Benian	0101000020E610000000EFC878705F0740E4B3E50DE3664240	ain-benian
319	Ain Soltane	0101000020E6100000FF0ECA24017C084080A9B5BA9D5C4240	ain-soltane
190	Alger Centre	0101000020E6100000800A4A4CC777084054B025DE5D634240	alger-centre
335	Artisana	0101000020E610000080720BF382DB094064AE59F271614240	artisana
20	Bab El Oued	0101000020E61000007EF809B7DB65084030B23D8434654240	bab-el-oued
297	Balcon Ouagnouni	0101000020E61000007E01CAA6C86E084028B0018931634240	balcon-ouagnouni
68	Beaulieu	0101000020E610000000D98A8CB643094000A8D1C31F5B4240	beaulieu
84	Ben Ghazi	0101000020E610000040668AAA64D20840A4A4EDDBD0574240	ben-ghazi
161	Ben Hamdani	0101000020E6100000FF6F088718E206402C977907814A4240	ben-hamdani
318	Bidonvilles Ain Taya 1	0101000020E610000041C0CBC13D280A4014B3B18A13664240	bidonvilles-ain-taya-1
3	Bir Mourad Raïs	0101000020E6100000FFF889077466084090ABA5EEA45E4240	bir-mourad-rais
138	Boukendoura	0101000020E610000080E28AC4384D09404C99094E994C4240	boukendoura
88	Boumati	0101000020E610000000B04AA84E1B094078A86D53995B4240	boumati
263	Boutaren taher	0101000020E6100000FF74CB55C7DD09406CABF593825E4240	boutaren-taher
325	Braïdia	0101000020E61000003F38CCE4D09E0A4044AE050A54614240	braidia
324	Campagne Semmar	0101000020E610000040E649A1E1530840C0A92D42DA5C4240	campagne-semmar
320	Chabou bidonville 1	0101000020E610000000BDCBD301250A4044B051984A634240	chabou-bidonville-1
321	Chabou bidonvilles 2	0101000020E610000080C10B8476290A4064B0D9946B634240	chabou-bidonvilles-2
285	Chentaba	0101000020E610000041EB4892BC5B07402FA6E51057594240	chentaba
193	Cherarba	0101000020E6100000C1F58A0503600940C8A0291BFF534240	cherarba
322	Cité 150 logements	0101000020E61000003FE08BFAD9470A4014AC4911295F4240	cite-150-logements
327	Cité 200 logements	0101000020E6100000BF348C616A9B0A402CA0552164534240	cite-200-logements
317	Cité 420 logements	0101000020E610000000880BC7B7F0094068AA991D835D4240	cite-420-logements
323	Cité 600 logements	0101000020E6100000002C0C8BAB920A4060A045919A534240	cite-600-logements
281	Cité  762 logements	0101000020E6100000C0EF0BAD10570A4058B0457060634240	cite-762-logements
334	Cité Bois des Pins	0101000020E610000041EB89FAAC580840ACABD9ACC15E4240	cite-bois-des-pins
301	Cité les palmiers	0101000020E61000007E6ACB4B81D3094084A8493EA55B4240	cite-les-palmiers
316	Cité Soummam	0101000020E6100000BE1B0BFDA1850940A0A93D7CBD5C4240	cite-soummam
336	City Mouhamed Ouali Menasria	0101000020E61000007F760B9960DF094088AB89B4A05E4240	city-mouhamed-ouali-menasria
310	Dar Hamou	0101000020E610000001DA880ABB4A0740A0B175BEA4644240	dar-hamou
163	Dehimet	0101000020E6100000C16ECA5CC4DA0840C09B65CC074F4240	dehimet
328	Domaine Ali Houri	0101000020E610000081C9CB8066310A40B8B2B1C5BA654240	domaine-ali-houri
117	Domaine Hadadou	0101000020E6100000FF354837ADA80640049F21D63E524240	domaine-hadadou
333	Douar Lalla Aicha	0101000020E6100000C1CE88A0993F0740EBA98551095D4240	douar-lalla-aicha
9	Draria	0101000020E6100000008D09088CFB074044A8E1F7625B4240	draria
337	Droudj el Rounda	0101000020E6100000FFF9C90E6867084000B2295103654240	droudj-el-rounda
331	El Karia	0101000020E61000007F3B48D545AE06400BA6818834594240	el-karia
74	El Karia (Cheraga)	0101000020E6100000C0F88885306907408CAEA52499614240	el-karia-cheraga
244	El Madania	0101000020E6100000401B4A9D56880840E4ABD112FA5E4240	el-madania
279	Forêt de paradou	0101000020E610000000D0C9C8E63D0840C4AB5D2DDB5E4240	foret-de-paradou
137	Haouch Ben Koula	0101000020E61000007FE5C925295308402499F50E744C4240	haouch-ben-koula
132	Haouch El Abboud	0101000020E6100000BFD3C925954108407097559DC34A4240	haouch-el-abboud
151	Haouch Mizrani	0101000020E61000003FD609B121440840F89C3D2B39504240	haouch-mizrani
228	Haouch Rahmoun	0101000020E610000000870C8ABBEC0A4000AFD5330E624240	haouch-rahmoun
167	Haouch Scalladji	0101000020E610000081DD48EA534E0740C0A2FD61F1554240	haouch-scalladji
329	Houri 02	0101000020E6100000C0C7CB55B12F0A40C0B22D54BF654240	houri-02
42	Hussein Dey	0101000020E61000007E63CA6A85CF0840CCABB1D3E05E4240	hussein-dey
295	Khaiti Ahmed	0101000020E61000007F95083E2D070740D3AA3129EE5D4240	khaiti-ahmed
174	Lablana	0101000020E6100000011B4C3004820A40C8AEFDDBD4614240	lablana
70	La Verte Rive	0101000020E6100000403BCB2FBDA4094074ADF13786604240	la-verte-rive
265	Lotissement des jeunes aveugles	0101000020E6100000018889BEA5F6074008A88193275B4240	lotissement-des-jeunes-aveugles
166	Mahieddine Mustapha	0101000020E610000080DD48EA264E0740C4A4214EEE574240	mahieddine-mustapha
211	Markette	0101000020E610000080920CAB07F80A4098A4B1F6C4574240	markette
330	Moulahoum	0101000020E61000007FFF48E1EF6F074004A92151235C4240	moulahoum
169	Naâmoune El Amri	0101000020E610000000F8089F79680740B4A4697DE0574240	naamoune-el-amri
67	Oued Smar	0101000020E610000001EE4A396258094004A7E16D2A5A4240	oued-smar
54	Ouled Chebacheb	0101000020E61000004002CC5766690A40A0A6C945C5594240	ouled-chebacheb
215	Ouled Chikh	0101000020E61000003E4ACC249DB00A40C7A5D102F2584240	ouled-chikh
176	Ouled El Ghalia	0101000020E6100000016E8C74E2D30A4054A2D1AC87554240	ouled-el-ghalia
326	Ouled Maamar	0101000020E61000003FFB0B178C620A4094AF41BF9D624240	ouled-maamar
49	Ouled Moussa	0101000020E610000080848C1F12EA0A409CA42D5BC6574240	ouled-moussa
332	Plateau	0101000020E6100000802189EC82910740B0A81936CE5B4240	plateau
292	Ramdania	0101000020E6100000401D4961348D074033A18D0F6A544240	ramdania
189	Reguiegue	0101000020E6100000C0D94882744A0740589D252C9B504240	reguiegue
338	Residence d'Etat Sahel	0101000020E6100000FF92C86ABB040740DCAE0D8CE7614240	residence-detat-sahel
55	Sbaatte	0101000020E610000081E50B47EA4C0A4000A8318E225B4240	sbaatte
119	Sidi Abdellah	0101000020E610000041AE08ED921F0740D0A22DD700564240	sidi-abdellah
103	Sidi Brahim	0101000020E610000001EB08507B5B0740E49A89BE2E4E4240	sidi-brahim
251	Sidi Fredj	0101000020E6100000C14B480D49BE06405CAE09586B614240	sidi-fredj
314	Sidi M'Barek	0101000020E6100000C10B8A61E978084048A8B12F6A5B4240	sidi-mbarek
113	Souachette	0101000020E6100000FF9B0BD14E040A4054AC9585685F4240	souachette
23	Souidania	0101000020E610000041DCC8D3EB4C07407CA7D1EA9E5A4240	souidania
247	Tahar Bouchet	0101000020E6100000FEDA896DB348084054A911BA6F5C4240	tahar-bouchet
89	Village Céleste	0101000020E610000040D7C96317450840F8B29947F6654240	village-celeste
264	Village touristique du Mazafran	0101000020E6100000BF3E08914EB1064004AA7D7E205D4240	village-touristique-du-mazafran
142	Zerouala	0101000020E6100000FF648B620ACE0940A79979BEF44C4240	zerouala
315	Zonka	0101000020E61000003F124AEF587F0840A8A7FDFDC85A4240	zonka
\.


--
-- Data for Name: quotes_author; Type: TABLE DATA; Schema: public; Owner: hakim
--

COPY quotes_author (id, slug, firstname, lastname) FROM stdin;
39	jim-rohn	Jim	Rohn
1	max-weber	Max	Weber
2	viktor-e-frankl	Viktor E.	Frankl
3	stephen-r-covey	Stephen R.	Covey
38	paulo-coelho	Paulo	Coelho
36	len-deighton	Len	Deighton
33	mark-twain	Mark	Twain
34	george-santayana	George	Santayana
37	gwendolyn-willow-wilson	Gwendolyn Willow	Wilson
31	william-cowper	William	Cowper
29	allan-leighton	Allan	Leighton
32	joe-studwell	Joe	Studwell
30	forrest-gump	Forrest	Gump
28	warren-buffett	Warren	Buffett
25	john-bytheway	John	Bytheway
27	oscar-wilde	Oscar	Wilde
26	gerald-ronson	Gerald	Ronson
23	thomas-edison	Thomas	Edison
4	niall-ferguson	Niall	Ferguson
20	mary-kay-ash	Mary Kay	Ash
18	andrew-carnegie	Andrew	Carnegie
22	seneca		Seneca
24	mia-hamm	Mia	Hamm
17	earl-nightingale	Earl	Nightingale
14	plutarch		Plutarch
12	nathan-mayer-rothschild	Nathan Mayer	Rothschild
13	mayer-amschel-rothschild	Mayer Amschel	Rothschild
10	lao-tzu	Lao	Tzu
8	blaise-pascal	Blaise	Pascal
7	benjamin-franklin	Benjamin	Franklin
16	karl-marx	Karl	Marx
9	johann-wolfgang-von-goethe	Johann Wolfgang	von Goethe
5	richard-denny	Richard	Denny
11	james-mayer-de-rothschild	James Mayer	de Rothschild
6	robert-peston	Robert	Peston
15	heinrich-heine	Heinrich	Heine
19	dennis-waitley	Dennis	Waitley
21	john-galsworthy	John	Galsworthy
35	abraham-lincoln	Abraham	Lincoln
40	michael-lipton	Michael	Lipton
41	masayuki-kondo	Masayuki	Kondo
42	meiji-charter-oath-1868	Meiji Charter Oath 1868	
43	hyundai-quality-control-manager	Hyundai quality control manager	
44	carmine-gallo	Carmine	Gallo
45	oliver-uberti	Oliver	Uberti
46	amy-cuddy	Amy	Cuddy
47	ken-robinson	Ken	Robinson
48	howard-schultz	Howard	Schultz
49	steve-jobs	Steve	Jobs
50	bryan-stevenson	Bryan	Stevenson
51	adam-spencer	Adam	Spencer
52	matthew-may	Matthew	May
53	albert-einstein	Albert	Einstein
54	leonardo-da-vinci	Leonardo	da Vinci
55	maya-angelou	Maya	Angelou
56	wael-ghonim	Wael	Ghonim
57	francis-ford-coppola	Francis Ford	Coppola
58	ernst-friedrich-schumacher	Ernst Friedrich	Schumacher
59	robert-kiyosaki	Robert	Kiyosaki
60	ray-kroc	Ray	Kroc
61	galileo	Galileo	
62	henry-louis-mencken	Henry Louis	Mencken
63	norman-douglas	Norman	Douglas
64	john-updike	John	Updike
65	winston-churchill	Winston	Churchill
66	rich-dad	Rich	dad
67	eric-hoffer	Eric	Hoffer
68	henry-ford	Henry	Ford
69	nhat-hanh	Nhat	Hanh
70	hollywood-celebrity	Hollywood	celebrity
71	fran-tarkenton	Fran	Tarkenton
72	eleanor-roosevelt	Eleanor	Roosevelt
73	john-davison-rockefeller	John Davison	Rockefeller
75	jared-diamond	Jared	Diamond
76	sun-tzu	Sun	Tzu
77	timothy-ferriss	Timothy	Ferriss
78	john-ruskin	John	Ruskin
79	benjamin-disraeli	Benjamin	Disraeli
80	dave-barry	Dave	Barry
81	paula-poundstone	Paula	Poundstone
82	calvin-coolidge	Calvin	Coolidge
83	robert-frost	Robert	Frost
84	bill-gates	Bill	Gates
85	peter-drucker	Peter	Drucker
86	bill-cosby	Bill	Cosby
87	niels-bohr	Niels	Bohr
88	herbert-bayard-swope	Herbert Bayard	Swope
89	malcolm-x	Malcolm	X
90	herb-kelleher	Herb	Kelleher
91	rolf-potts	Rolf	Potts
92	mike-maples	Mike	Maples
93	john-f-kennedy	John F.	Kennedy
94	jean-baptiste-say	Jean-Baptiste	Say
95	paul-fussell	Paul	Fussell
96	ingvar-kamprad	Ingvar	Kamprad
97	colin-wilson	Colin	Wilson
98	fanny-burney	Fanny	Burney
99	mohandas-gandhi	Mohandas	Gandhi
100	paul-theroux	Paul	Theroux
101	jean-sibelius	Jean	Sibelius
102	george-bernard-shaw	George Bernard	Shaw
103	thomas-j-watson	Thomas J.	Watson
104	warren-bennis	Warren	Bennis
105	richard-p-feynman	Richard P.	Feynman
106	frank-wilczek	Frank	Wilczek
107	william-of-occam	William	of Occam
108	antoine-de-saint-exupery	Antoine	de Saint-Exupéry
109	vilfredo-pareto	Vilfredo	Pareto
110	yvon-chouinard	Yvon	Chouinard
111	robert-henri	Robert	Henri
112	bill-watterson	Bill	Watterson
113	michael-taillard	Michael	Taillard
114	anthony-j-peter	Anthony J.	Peter
115	adam-adam	Adam	Smith
116	tony-robbins	Tony	Robbins
117	felix-dennis	Felix	Dennis
118	sam-walton	Sam	Walton
119	j-michael-straczynski	J. Michael	Straczynski
120	john-le-carre	John	Le Carré
121	kieran-allen	Kieran	Allen
122	dresden-james	Dresden	James
123	james-connolly	James	Connolly
124	brooks-stevens	Brooks	Stevens
125	mario-andretti	Mario	Andretti
126	brian-k-vaughan	Brian K.	Vaughan
127	woody-allen	Woody	Allen
128	jawaharlal-nehru	Jawaharlal	Nehru
129	toby-manhire	Toby	Manhire
130	roger-trapp	Roger	Trapp
131	tim-hindle	Tim	Hindle
132	daniel-conaghan	Daniel	Conaghan
133	ronald-reagan	Ronald	Reagan
134	jean-michel-severino	Jean-Michel	Severino
135	pablo-picasso	Pablo	Picasso
136	tim-s-grover	Tim S.	Grover
137	oprah-winfrey	Oprah	Winfrey
138	wayne-gretzky	Wayne	Gretzky
139	john-stuart-mill	John Stuart	Mill
140	jeffrey-sachs	Jeffrey	Sachs
141	deng-xiaoping	Deng	Xiaoping
142	fyodor-dostoyevsky	Fyodor	Dostoyevsky
143	jean-baptiste-de-villele	Jean-Baptiste	de Villèle
\.


--
-- Data for Name: quotes_book; Type: TABLE DATA; Schema: public; Owner: hakim
--

COPY quotes_book (id, title, isbn, author_id, slug) FROM stdin;
7	How Asia works : success and failure in the world's most dynamic region	1846682428	32	how-asia-works-success-and-failure-worlds-most-dyn
2	Man's search for ultimate meaning	1846043069	2	mans-search-ultimate-meaning
9	Ms. Marvel, Vol. 2: Generation Why	0785190228	37	ms-marvel-vol-2-generation-why
6	Selling to win	0749456434	5	selling-win
8	Spy line	0008125023	36	spy-line
3	The 7 habits of highly effective people	0684858398	3	7-habits-highly-effective-people
1	The Protestant ethic and the spirit of capitalism	041525406X	1	protestant-ethic-and-spirit-capitalism
5	Who runs Britain?	0340839449	6	who-runs-britain
4	The house of Rothschild : money's prophets, 1798-1848	0140240845	4	house-rothschild-moneys-prophets-1798-1848
10	Talk Like TED: The 9 Public Speaking Secrets of the World's Top Minds	1447261135	44	talk-ted-9-public-speaking-secrets-worlds-top-mind
12	Rich dad, poor dad : what the rich teach their kids about money - that the poor and middle class do not!	1612680003	59	rich-dad-poor-dad-what-the-rich-teach-their-kids-a
11	Rich dad's cashflow quadrant : guide to financial freedom	1612680054	59	rich-dads-cashflow-quadrant
14	Guns, germs and steel	0099302780	75	guns-germs-and-steel
15	The Art of War	0140455523	76	the-art-of-war
16	The 4-Hour Work Week: Escape the 9-5, Live Anywhere and Join the New Rich	0091929113	77	the-4-hour-work-week-escape-the-9-5-live-anywhere-
17	Introducing Personal Finance: A Practical Guide	1848317239	113	personal-finance-a-practical-guide
18	How to become financially free	1848763891	114	how-to-become-financially-free
19	The theory of moral sentiments	0143105922	115	the-theory-of-moral-sentiments
20	Money : master the game : 7 simple steps to financial freedom	147114335X	116	money-master-the-game-7-simple-steps-to-financial-
21	88, the narrow road : a brief guide to the getting of money	0091935490	117	88-the-narrow-road-a-brief-guide-to-the-getting-of
22	The Twilight Zone Volume 2: The Way In	1606905430	119	the-twilight-zone-volume-2-the-way-in
23	Absolute friends	0340923695	120	absolute-friends
24	Marx and the alternative to capitalism	0745330029	121	marx-and-the-alternative-to-capitalism
25	Y: The Last Man	1401230512	126	y-the-last-man
26	The Arab Spring : rebellion, revolution and a new world order	0852652542	129	the-arab-spring-rebellion-revolution-and-a-new-wor
27	What you need to know about business	0857081152	130	what-you-need-to-know-about-business
28	The book of money : everything you need to know about how world finances work	1845336801	132	the-book-of-money-everything-you-need-to-know-abou
29	Africa's moment	0745651577	134	africas-moment
30	Relentless : from good to great to unstoppable	1476714207	136	relentless-from-good-to-great-to-unstoppable
31	The double	0141396180	142	the-double
32	Benjamin Franklin's autobiography	0393935612	7	benjamin-franklins-autobiography
\.


--
-- Data for Name: quotes_category; Type: TABLE DATA; Schema: public; Owner: hakim
--

COPY quotes_category (id, name, slug, image) FROM stdin;
10	Education	education	
2	History	history	
6	Marketing	marketing	
4	Negotiation	negotiation	
12	Philosophy	philosophy	
5	Politics	politics	
13	Social life	social-life	
11	Spirituality	spirituality	
14	Presentation	presentation	
15	Initiative	initiative	
16	Identity	identity	
17	Mathematics	mathematics	
19	Problem-solving	problem-solving	
20	Leadership	leadership	
21	Thinking	thinking	
23	Investment	investment	
25	War	war	
26	Reading	reading	
27	Travel	travel	
28	Technology	technology	
29	Revolution	struggle	
30	Productivity	productivity	
31	Society	society	
32	Justice	justice	
33	Humour	humour	
8	Business	business	images/business.jpg
1	Economics	economy	images/economics.jpg
7	Inspirational	inspirational	images/inspirational.jpg
22	Life	life	images/life.jpg
18	Personal finance	personal-finance	images/personal-finance.jpg
9	Creativity	creativity	images/creativity.jpg
3	Self-help	self-help	images/self-help.jpg
\.


--
-- Data for Name: quotes_quote; Type: TABLE DATA; Schema: public; Owner: hakim
--

COPY quotes_quote (id, text, date, book_id, author_id, slug, category_id, published, member_id) FROM stdin;
284	Democracy for an Eastern country seems to mean only one thing: to carry out the behests of the imperialist ruling power.	2017-08-04 11:17:35.8461+00	26	128	democracy-for-an-eastern-country-seems-to-mean-onl	5	t	1
293	There is no democracy without democrats, and there are no democrats without democratic struggle.	2017-08-27 18:55:06.654637+00	29	139	there-is-no-democracy-without-democrats-and-there-	5	t	1
301	If you teach a poor young man to shave himself, and keep his razor in order, you may contribute more to the happiness of his life than in giving him a thousand guineas.	2017-11-18 14:54:37.644133+00	32	7	if-you-teach-a-poor-young-man-to-shave-himself-and	7	t	1
285	There is only one valid definition of business purpose: to create a customer.	2017-08-04 11:20:54.901132+00	27	85	there-is-only-one-valid-definition-of-business-pur	8	t	1
294	Education and health care are preconditions for economic development.	2017-08-27 19:04:00.945134+00	29	140	eductiona-and-health-care-are-preconditions-for-ec	1	t	1
286	Companies can win either by being cheaper or by being different (which means being perceived by the customer as better or more relevant).	2017-08-10 15:43:16.818595+00	27	131	companies-can-win-either-by-being-cheaper-or-by-be	8	t	1
295	It doesn't matter whether a cat is black or white. As long as it catches mice.	2017-08-29 18:15:25.0357+00	\N	141	it-doesnt-matter-whether-a-cat-is-black-or-white-a	1	t	1
287	Government's view of the economy could be summed up in a few short phrases: If it moves, tax it. If it keeps moving, regulate it. And if it stops moving, subsidize it.	2017-08-15 09:08:57.308415+00	20	133	governments-view-of-the-economy-could-be-summed-up	5	t	1
296	I try to buy stock in businesses that are so wonderful that an idiot can run them. Because sooner or later, one will.	2017-09-06 16:13:33.495154+00	28	28	i-try-to-buy-stock-in-businesses-that-are-so-wonde	8	t	1
288	Every act of creation is first of all an act of destruction.	2017-08-18 21:36:20.541636+00	29	135	every-act-of-creation-is-first-of-all-an-act-of-de	9	t	1
297	All things will come in due course to him who has the gumption to be patient.	2017-09-16 16:23:08.74957+00	31	143	all-things-will-come-in-due-course-to-him-who-has-	7	t	1
60	Schools kill creativity.	2017-03-10 20:54:50.894246+00	10	47	schools-kill-creativity	10	t	1
289	If you don't make a choice, the choice will be made for you.	2017-08-18 21:39:11.340511+00	30	136	if-you-dont-make-a-choice-the-choice-will-be-made-	3	t	1
298	Small things appearing great to those in small circumstances.	2017-10-23 09:44:26.691034+00	32	7	small-things-appearing-great-to-those-in-small-cir	7	t	1
290	Every right decision I've made has come from my gut, and every wrong decision I've ever made was a result of me not listening.	2017-08-20 10:02:10.463075+00	30	137	every-right-decision-ive-made-has-come-from-my-gut	7	t	1
299	He that has once done you a kindness will be more ready to do you another, than he whom you yourself have obliged.	2017-11-18 14:46:04.323527+00	32	7	he-that-has-once-done-you-a-kindness-will-be-more-	3	t	1
48	It is better to fail trying than never to try at all.	2017-03-10 20:36:52.124446+00	7	32	it-better-fail-trying-never-try-all	1	t	1
43	If you wish for industrialization, prepare to develop agriculture.	2017-03-10 20:29:36.362523+00	7	40	if-you-wish-industrialization-prepare-develop-agri	1	t	1
29	If you go to the zoo, always take something to feed the animals, even if the signs say 'Do not feed the animals.' It wasn't the animals that put them signs up.	2017-02-08 01:37:20.294536+00	5	30	if-you-go-zoo-always-take-something-feed-animals-e	7	t	1
8	Stick to your brewery, and you may be the great brewer of London. But be a brewer, and a banker, and a merchant, and a manufacturer, and you will soon be in the Gazette.	2017-02-08 00:36:54.715507+00	4	12	stick-your-brewery-and-you-may-be-great-brewer-lon	8	t	1
15	The winners in life think constantly in terms of I can, I will and I am. Losers on the other hand concentrate their waking thoughts on what they should have done or what they can't do.	2017-02-08 01:05:18.452041+00	6	19	winners-life-think-constantly-terms-i-can-i-will-a	7	t	1
23	Success by the inch is a cinch but by the yard it is hard.	2017-02-08 01:19:58.308745+00	6	25	success-inch-cinch-yard-it-hard	7	t	1
3	Treat a man as he is, and he will remain as he is; treat a man as he can and should be, and he will become as he can and should be.	2017-02-06 23:51:02.37194+00	3	9	treat-man-he-and-he-will-remain-he-treat-man-he-ca	12	t	1
10	A bundle of arrows could not be broken, but the individual arrows could.	2017-02-08 00:46:07.882551+00	4	14	bundle-arrows-could-not-be-broken-individual-arrow	12	t	1
39	If everybody loves you, something is wrong. Find at least one enemy to keep you alert.	2017-02-19 17:10:07.832372+00	\N	38	if-everybody-loves-you-something-wrong-find-least-	13	t	1
40	You are the average of the five people you spend the most time with.	2017-02-19 17:14:12.700085+00	\N	39	you-are-average-five-people-you-spend-most-time	13	t	1
33	Geography is not destiny in development.	2017-02-11 23:38:21.977426+00	7	32	geography-not-destiny-development	1	t	1
24	If it works, don't fix it.	2017-02-08 01:21:02.252152+00	6	20	if-it-works-dont-fix-it	8	t	1
20	Success breeds success.	2017-02-08 01:16:47.337515+00	6	24	success-breeds-success	8	t	1
37	The outcome names the deed.	2017-02-12 13:13:47.174777+00	8	9	outcome-names-deed	12	t	1
12	History repeats itself, first as tragedy, then as farce.	2017-02-08 00:50:57.342235+00	4	16	history-repeats-itself-first-tragedy-then-farce	2	t	1
31	Variety is the spice of life.	2017-02-11 23:25:39.429775+00	\N	31	variety-spice-life	12	t	1
30	When the student is ready the teacher will appear.	2017-02-11 23:21:05.836665+00	9	10	when-student-ready-teacher-will-appear	7	t	1
1	He that idly loses five shillings’ worth of time, loses five shillings, and might as prudently throw five shillings into the sea.	2017-02-06 23:50:51.671301+00	1	7	he-idly-loses-five-shillings-worth-time-loses-five	1	t	1
4	A thousand mile journey begins with the first step.	2017-02-08 00:22:52.430818+00	3	10	thousand-mile-journey-begins-first-step	7	t	1
7	The honest and upright man will always value a man of similar character.	2017-02-08 00:34:18.669264+00	4	11	honest-and-upright-man-will-always-value-man-simil	8	t	1
9	If you can't make yourself loved, make yourself feared.	2017-02-08 00:38:30.721802+00	4	13	if-you-cant-make-yourself-loved-make-yourself-fear	8	t	1
272	We all get what we tolerate.	2017-07-06 19:53:19.713068+00	20	116	we-all-get-what-we-tolerate	18	t	1
6	Satisfied needs do not motivate.	2017-02-08 00:30:32.755798+00	3	3	satisfied-needs-do-not-motivate	7	t	1
22	A 'No' is only a 'No, not today'.	2017-02-08 01:18:53.114667+00	6	5	no-only-no-not-today	4	t	1
26	Experience is the hardest kind of teacher. It gives you the test first and the lesson afterwards.	2017-02-08 01:25:41.679124+00	6	27	experience-hardest-kind-teacher-it-gives-you-test-	3	t	1
11	Money is round and rolls away, but education endures.	2017-02-08 00:47:38.301787+00	4	15	money-round-and-rolls-away-education-endures	10	t	1
27	The greatest investment anyone can make is in oneself.	2017-02-08 01:27:13.057793+00	6	28	greatest-investment-anyone-can-make-oneself	8	t	1
32	Practice makes perfect.	2017-02-11 23:31:57.801909+00	\N	\N	practice-makes-perfect	3	t	1
34	The man who does not read has no advantage over the man who cannot read.	2017-02-12 12:45:36.073099+00	\N	33	man-who-does-not-read-has-no-advantage-over-man-wh	10	t	1
18	Luck is what happens when preparation meets opportunity.	2017-02-08 01:13:19.256501+00	6	22	luck-what-happens-when-preparation-meets-opportuni	7	t	1
2	The heart has its reasons which reason knows not of.	2017-02-06 23:50:57.511736+00	2	8	heart-has-its-reasons-which-reason-knows-not	11	t	1
35	Those who cannot remember the past are condemned to repeat it.	2017-02-12 12:47:09.579962+00	\N	34	those-who-cannot-remember-past-are-condemned-repea	2	t	1
36	You can fool all the people some of the time, and some of the people all the time, but you cannot fool all the people all the time.	2017-02-12 12:49:14.955603+00	\N	35	you-can-fool-all-people-some-time-and-some-people-	5	t	1
21	You cannot fail until you throw the towel in.	2017-02-08 01:17:44.883174+00	6	5	you-cannot-fail-until-you-throw-towel	3	t	1
28	Every day we [business leaders] metaphorically decide what the 'animals' want. We don't talk to the animals enough, we don't ask the animals enough questions, and we don't listen to the animals enough. We just think we know what to feed them. The companies who don't do that, but who ask the 'animals' what they want, are the ones that work and succeed.	2017-02-08 01:35:22.89581+00	5	29	every-day-we-business-leaders-metaphorically-decid	6	t	1
17	If you do not think about the future, you cannot have one.	2017-02-08 01:10:13.235912+00	6	21	if-you-do-not-think-about-future-you-cannot-have-o	3	t	1
38	Reactive people are often affected by their physical environment. If the weather is good, they feel good. If it isn’t, it affects their attitude and their performance. Proactive people can carry their own weather with them.	2017-02-12 14:15:40.518861+00	3	3	reactive-people-are-often-affected-their-physical-	3	t	1
25	There is no substitute for hard work. Don't talk about it, do it.	2017-02-08 01:21:59.64998+00	6	26	there-no-substitute-hard-work-dont-talk-about-it-d	3	t	1
5	To act and not to be acted upon.	2017-02-08 00:29:24.890541+00	3	3	act-and-not-be-acted-upon	3	t	1
13	We become what we think about.	2017-02-08 00:55:37.756339+00	6	17	we-become-what-we-think-about	3	t	1
14	Give me a man of average ability but a burning desire and I will give you a winner in return every time.	2017-02-08 00:57:46.962753+00	6	18	give-me-man-average-ability-burning-desire-and-i-w	8	t	1
16	There are those in this world who make things happen. There are those in this world who watch things happen. And there are those who wonder what happened!	2017-02-08 01:09:04.418743+00	6	20	there-are-those-world-who-make-things-happen-there	9	t	1
19	I haven't failed 500 times, I have just found 500 ways it doesn't work.	2017-02-08 01:15:43.090563+00	6	23	i-havent-failed-500-times-i-have-just-found-500-wa	7	t	1
41	All mankind is divided into three classes: those that are immovable, those that are movable, and those that move.	2017-03-10 17:40:44.54829+00	\N	7	all-mankind-divided-three-classes-those-are-immova	5	t	1
42	Don't complain about things you're not willing to change.	2017-03-10 17:46:38.896481+00	\N	\N	dont-complain-about-things-youre-not-willing-chang	7	t	1
44	The main context for industrial technology development is firms, not public institutions.	2017-03-10 20:31:24.824594+00	7	41	main-context-industrial-technology-development-fir	1	t	1
45	Developing countries are not just little ships blown about on the developmental ocean by the winds of rich states.	2017-03-10 20:33:19.976046+00	7	32	developing-countries-are-not-just-little-ships-blo	1	t	1
46	Genuine free trade in services would require free movement of labour around the world, so that any service could be performed where it was required.	2017-03-10 20:34:33.875257+00	7	32	genuine-free-trade-services-would-require-free-mov	1	t	1
47	Knowledge shall be sought throughout the world so as to strengthen the foundation of imperial rule.	2017-03-10 20:35:34.84135+00	7	42	knowledge-shall-be-sought-throughout-world-so-stre	1	t	1
49	The secret of technological progress is 'not repeating the same mistake' over a very long period of time.	2017-03-10 20:38:36.050557+00	7	43	secret-technological-progress-not-repeating-same-m	1	t	1
50	Genius is the crystallisation of perseverance.	2017-03-10 20:39:08.486464+00	7	9	genius-crystallisation-perseverance	7	t	1
51	The most basic prerequisites of infant industry policy are: export discipline and sanctions for failure.	2017-03-10 20:39:55.770583+00	7	32	most-basic-prerequisites-infant-industry-policy-ar	1	t	1
52	The rich world cannot be expected to save poor countries from bad politicians.	2017-03-10 20:40:27.478941+00	7	32	rich-world-cannot-be-expected-save-poor-countries-	5	t	1
53	When countries think they have discovered the mythological 'secret' of wealth creation and stop adjusting, they become vulnerable. (e.g. Japan).	2017-03-10 20:40:47.658055+00	7	32	when-countries-think-they-have-discovered-mytholog	1	t	1
54	It is the quality of governance and policy-making that determine a country's prospect.	2017-03-10 20:41:15.383008+00	7	32	it-quality-governance-and-policy-making-determine-	1	t	1
55	To act on the basis that what worked for everybody else cannot work for you is - to adapt Friedrich List's metaphor - like kicking away the ladder of progress yourself from below.	2017-03-10 20:43:01.82314+00	7	32	act-basis-what-worked-everybody-else-cannot-work-y	1	t	1
56	Every superhero has an origin story. So do you. Don't follow someone else's. Create your own masterpiece.	2017-03-10 20:50:48.981833+00	10	45	every-superhero-has-origin-story-so-do-you-dont-fo	14	t	1
57	If you can't explain your product or idea in 140 characters, keep working at it until you can.	2017-03-10 20:52:05.040149+00	10	44	if-you-cant-explain-your-product-or-idea-140-chara	14	t	1
58	Great innovators apply ideas from fields other than their own.	2017-03-10 20:53:17.348616+00	10	44	great-innovators-apply-ideas-fields-other-their-ow	9	t	1
59	Don't fake it till you make it. Fake it till you become it.	2017-03-10 20:54:17.62156+00	10	46	dont-fake-it-till-you-make-it-fake-it-till-you-bec	7	t	1
61	When you're surrounded by people who share a collective passion around a common purpose, anything is possible.	2017-03-10 20:55:51.789095+00	10	48	when-youre-surrounded-people-who-share-collective-	9	t	1
62	Your time is limited, so don't waste it living someone else's life. Don't be trapped by dogma - which is living with the results of other people's thinking. Don't let the noise of other's opinions drown out your own inner voice. And most important, have the courage to follow your heart and intuition. They somehow already know what you truly want to become.	2017-03-10 20:56:45.724233+00	10	49	your-time-limited-so-dont-waste-it-living-someone-	9	t	1
63	Many people will not head down the street until all the lights are green. That is why they don't go anywhere.	2017-03-10 20:57:41.899412+00	10	44	many-people-will-not-head-down-street-until-all-li	15	t	1
64	Ideas are the currency of the 21st century.	2017-03-10 20:58:19.78231+00	10	44	ideas-are-currency-21st-century	9	t	1
65	Passion is contagious.	2017-03-10 20:58:40.698907+00	10	44	passion-contagious	9	t	1
66	There is power in identity. When we create the right kind of identity, we can say things to the world around us that they don’t actually believe makes sense. We can get them to do things that they don’t think they can do.	2017-03-10 20:59:39.894259+00	10	50	there-power-identity-when-we-create-right-kind-ide	16	t	1
67	If you're not prepared to be wrong, you'll never come up with anything original.	2017-03-10 21:00:19.634357+00	10	47	if-youre-not-prepared-be-wrong-youll-never-come-an	7	t	1
68	Numbers are the musical notes with which the symphony of the universe is written.	2017-03-10 21:01:49.525377+00	10	51	numbers-are-musical-notes-which-symphony-universe-	17	t	1
69	Creativity thrives under intelligent constraints.	2017-03-10 21:02:46.598905+00	10	52	creativity-thrives-under-intelligent-constraints	9	t	1
70	If you can't explain it simply, you don't understand it well enough.	2017-03-10 21:03:50.118201+00	10	53	if-you-cant-explain-it-simply-you-dont-understand-	10	t	1
71	Simplicity is the ultimate sophistication.	2017-03-10 21:04:47.712568+00	10	54	simplicity-ultimate-sophistication	9	t	1
72	People will forget what you said, people will forget what you did, but people will never forget how you made them feel.	2017-03-10 21:05:57.25181+00	10	55	people-will-forget-what-you-said-people-will-forge	7	t	1
73	The power of the people is so much stronger than the people in power.	2017-03-10 21:06:41.50186+00	10	56	power-people-so-much-stronger-people-power	5	t	1
74	You have to really be courageous about your instincts and your ideas. Otherwise you'll just knuckle under, and things that might have been memorable will be lost.	2017-03-10 21:07:12.344051+00	10	57	you-have-really-be-courageous-about-your-instincts	9	t	1
75	Any intelligent fool can make things bigger, more complex. It takes a touch of genius and a lot of courage to move in the opposite direction.	2017-03-10 21:08:12.167884+00	10	58	any-intelligent-fool-can-make-things-bigger-more-c	9	t	1
76	Never ask an insurance salesman if you need insurance.	2017-03-10 21:11:54.391798+00	11	28	never-ask-insurance-salesman-if-you-need-insurance	8	t	1
77	Wall Street is the only place that people ride to in a Rolls Royce, to get advice from those who take the subway.	2017-03-10 21:12:16.290226+00	11	28	wall-street-only-place-people-ride-rolls-royce-get	8	t	1
78	My business is not hamburgers. My business is real estate.	2017-03-10 21:12:46.616639+00	11	60	my-business-not-hamburgers-my-business-real-estate	8	t	1
79	There is too much education altogether, especially in American schools.	2017-03-10 21:13:25.409327+00	11	53	there-too-much-education-altogether-especially-ame	10	t	1
80	I have never let my schooling interfere with my education.	2017-03-10 21:14:05.697789+00	11	33	i-have-never-let-my-schooling-interfere-my-educati	10	t	1
81	You cannot teach a person anything, you can only help him find it within himself.	2017-03-10 21:14:54.993948+00	11	61	you-cannot-teach-person-anything-you-can-only-help	10	t	1
82	School days, I believe, are the unhappiest in the whole span of human existence. They are full of dull, unintelligible tasks, new and unpleasant ordinances, and brutal violations of common sense and common decency.	2017-03-10 22:24:51.799133+00	11	62	school-days-i-believe-are-unhappiest-whole-span-hu	10	t	1
83	Education is the state-controlled manufacture of echoes.	2017-03-10 22:25:57.588709+00	11	63	education-state-controlled-manufacture-echoes	10	t	1
84	The founding fathers, in their wisdom, decided that children were an unnatural strain on their parents. So they provided jails called schools, equipped with tortures called an education.	2017-03-10 22:26:43.644574+00	11	64	founding-fathers-their-wisdom-decided-children-wer	10	t	1
85	Personally, I am always ready to learn, although I do not always like being taught.	2017-03-10 22:27:31.587413+00	11	65	personally-i-am-always-ready-learn-although-i-do-n	10	t	1
86	Instead of living below your means, focus on expanding your means.	2017-03-10 22:29:24.703692+00	11	66	instead-living-below-your-means-focus-expanding-yo	18	t	1
87	More money will not solve the problem, if cash-flow management is the problem.	2017-03-10 22:30:05.75189+00	11	66	more-money-will-not-solve-problem-if-cash-flow-man	18	t	1
88	Inside every problem lies an opportunity, and inside every disappointment lies a priceless gem of wisdom.	2017-03-10 22:31:39.2281+00	11	59	inside-every-problem-lies-opportunity-and-inside-e	19	t	1
89	Giants often trip and fall, but worms don't, because all they do is dig and crawl.	2017-03-10 22:32:42.01284+00	11	59	giants-often-trip-and-fall-worms-dont-because-all-	7	t	1
90	In times of change learners inherit the earth, while the learned find themselves beautifully equipped to deal with a world that no longer exists.	2017-03-10 22:33:36.717491+00	11	67	times-change-learners-inherit-earth-while-learned-	9	t	1
91	What we say to ourselves become our reality.	2017-03-10 22:35:12.710377+00	11	66	what-we-say-ourselves-become-our-reality	3	t	1
92	People think that working hard for money and then buying things that make them look rich will make them rich. In most cases it doesn't. It only makes them more tired.	2017-03-10 22:35:52.580144+00	11	66	people-think-working-hard-money-and-then-buying-th	18	t	1
93	Your profit is made when you buy, not when you sell.	2017-03-10 22:36:45.307752+00	11	66	your-profit-made-when-you-buy-not-when-you-sell	18	t	1
94	If you take on risk and debt, make sure you get paid for it.	2017-03-10 22:37:27.13008+00	11	66	if-you-take-risk-and-debt-make-sure-you-get-paid-i	18	t	1
95	If you're in a poker game and after 20 minutes you don't know who the patsy is, then you're the patsy.	2017-03-10 22:38:42.792201+00	11	28	if-youre-poker-game-and-after-20-minutes-you-dont-	8	t	1
96	If you do what everyone else does, you'll wind up having what everyone has.	2017-03-10 22:39:22.103067+00	11	59	if-you-do-what-everyone-else-does-youll-wind-havin	18	t	1
97	Action always beats inaction. If you take action and make a mistake, at least you have learned something. Ultimately, the way we learn is by making mistakes.	2017-03-10 22:40:12.155007+00	11	59	action-always-beats-inaction-if-you-take-action-an	3	t	1
98	People who write down their goals are more likely to achieve them.	2017-03-10 22:40:41.921282+00	11	59	people-who-write-down-their-goals-are-more-likely-	3	t	1
99	You've got to walk before you can run.	2017-03-10 22:41:11.885058+00	11	59	youve-got-walk-you-can-run	3	t	1
100	Bankers love debtors because debtors make the bank rich.	2017-03-10 22:43:23.508522+00	11	59	bankers-love-debtors-because-debtors-make-bank-ric	18	t	1
101	The more people you're indebted to, the poorer you are. And the more people you have indebted to you, the wealthier you are. That's the game.	2017-03-10 22:46:55.721112+00	11	66	more-people-youre-indebted-poorer-you-are-and-more	8	t	1
102	It's not how much money you make, but how much money you keep, how hard it works for you, and how many generations you keep it for.	2017-03-10 22:49:48.378053+00	11	59	its-not-how-much-money-you-make-how-much-money-you	18	t	1
103	An asset puts money in my pocket. A liability takes money out of my pocket.	2017-03-10 22:50:44.395644+00	11	66	asset-puts-money-my-pocket-liability-takes-money-o	18	t	1
104	What you think of me is none of my business. What is most important is what I think about myself.	2017-03-10 22:51:20.058788+00	11	59	what-you-think-me-none-my-business-what-most-impor	3	t	1
105	Managers often see their subordinates as inferiors. Leaders must direct people who are often smarter.	2017-03-10 22:53:06.133041+00	11	59	managers-often-see-their-subordinates-inferiors-le	20	t	1
106	The only difference between a rich person and a poor person is what they do in their spare time.	2017-03-10 22:53:41.938762+00	11	66	only-difference-between-rich-person-and-poor-perso	18	t	1
107	Your home is not an asset, but a liability.	2017-03-10 22:55:09.55109+00	11	66	your-home-not-asset-liability	18	t	1
108	Thinking is the hardest work there is. That is why so few people engage in it.	2017-03-10 22:56:51.401953+00	11	68	thinking-hardest-work-there-why-so-few-people-enga	21	t	1
109	You can't teach an old dog new tricks.	2017-03-10 22:58:09.962127+00	11	\N	you-cant-teach-old-dog-new-tricks	22	t	1
110	Most addictions are attempts to find happiness in people's souls.	2017-03-10 22:58:43.796369+00	11	59	most-addictions-are-attempts-find-happiness-people	22	t	1
111	You can never have true freedom without financial freedom.	2017-03-10 22:59:18.571543+00	11	66	you-can-never-have-true-freedom-without-financial-	18	t	1
112	Success is a poor teacher. We learn the most about ourselves when we fail, so don't be afraid of failing. Failing is part of the process of success. You can't have success without failure.	2017-03-10 23:01:46.529931+00	11	66	success-poor-teacher-we-learn-most-about-ourselves	22	t	1
113	If you want to be a leader of people, then you need to be a master of words.	2017-03-10 23:03:24.016554+00	11	66	if-you-want-be-leader-people-then-you-need-be-mast	20	t	1
114	The path is the goal.	2017-03-10 23:07:20.458299+00	11	69	path-goal	22	t	1
115	The definition of wealth is the number of days you can survive without physically working and still maintain your standard of living.	2017-03-10 23:08:03.539994+00	11	59	definition-wealth-number-days-you-can-survive-with	18	t	1
116	It's not return on the investment that I worry about. It's the return of the investment	2017-03-10 23:09:31.155869+00	11	70	its-not-return-investment-i-worry-about-its-return	23	t	1
117	People who take risks change the world. Few people ever get rich without taking risks.	2017-03-10 23:10:06.207984+00	11	59	people-who-take-risks-change-world-few-people-ever	3	t	1
118	Your boss's job is not to make you rich. Your boss's job is to make sure you get your paycheck. It's your job to become rich if you want to.	2017-03-10 23:10:50.421178+00	11	59	your-bosss-job-not-make-you-rich-your-bosss-job-ma	18	t	1
119	If you want to get rich, you need to learn how to take risks. Learn to be an investor.	2017-03-10 23:11:25.461402+00	11	66	if-you-want-get-rich-you-need-learn-how-take-risks	23	t	1
125	Winners are not afraid of losing. But losers are. Failure is part of the process of success. People who avoid failure also avoid success.	2017-03-25 02:05:59.87236+00	12	59	winners-are-not-afraid-of-losing-but-losers-are-fa	8	t	1
126	I-don't-wants hold the key to your success.	2017-03-25 19:09:08.785053+00	12	66	i-dont-wants-hold-the-key-to-your-success	22	t	1
127	The words "I can't afford it" shut down you brain. "How can I afford it?" opens up possibilities, excitements, and dreams.	2017-03-25 19:10:38.220643+00	12	66	the-words-i-cant-afford-it-shut-down-you-brain-how	8	t	1
128	Cynics criticize, and winners analyze.	2017-03-25 19:12:33.651672+00	12	66	cynics-criticize-and-winners-analyze	7	t	1
129	Winning means being unafraid to lose.	2017-03-25 19:16:19.632738+00	12	71	winning-means-being-unafraid-to-lose	7	t	1
130	Failure inspires winners. And failure defeats losers.	2017-03-25 19:18:42.946306+00	12	59	failure-inspires-winners-and-failure-defeats-loser	7	t	1
131	The poor and the middle class work for money. The rich have money work for them.	2017-03-25 19:19:35.440051+00	12	66	the-poor-and-the-middle-class-work-for-money-the-r	8	t	1
132	There is a difference between being poor and being broke. Broke is temporary. Poor is eternal.	2017-03-25 19:20:20.274137+00	12	66	there-is-a-difference-between-being-poor-and-being	8	t	1
133	People's lives are forever controlled by two emotions: fear and greed.	2017-03-25 19:22:17.053931+00	12	66	peoples-lives-are-forever-controlled-by-two-emotio	22	t	1
134	It's easier to change yourself than everyone else.	2017-03-25 19:23:12.04151+00	12	66	its-easier-to-change-yourself-than-everyone-else	22	t	1
135	A job is only a short-term solution to a long-term problem.	2017-03-25 19:25:14.419265+00	12	66	a-job-is-only-a-short-term-solution-to-a-long-term	8	t	1
136	It's not how much money you make. It's how much money you keep.	2017-03-25 19:27:08.832133+00	12	59	its-not-how-much-money-you-make-its-how-much-money	18	t	1
137	Rich people acquire assets. The poor and middle-class acquire liabilities that they think are assets.	2017-03-25 19:28:30.410531+00	12	66	rich-people-acquire-assets-the-poor-and-middle-cla	18	t	1
138	An intelligent person hires people who are more intelligent than he is.	2017-03-25 19:30:09.036193+00	12	66	an-intelligent-person-hires-people-who-are-more-in	20	t	1
139	If you work for money, you give the power to your employer. If money works for you, you keep the power and control it.	2017-03-25 19:30:49.624278+00	12	59	if-you-work-for-money-you-give-the-power-to-your-e	8	t	1
140	Often in the real world, it's not the smart who get ahead, but the bold.	2017-03-25 19:31:54.712688+00	12	59	often-in-the-real-world-its-not-the-smart-who-get-	22	t	1
141	It is not gambling if you know what you're doing. It is gambling if you're just throwing money into a deal and praying.	2017-03-25 19:33:57.903487+00	12	59	it-is-not-gambling-if-you-know-what-youre-doing-it	8	t	1
142	Life is much like going to the gym. The most painful part is deciding to go. Once you get past that, it's easy.	2017-03-25 19:35:14.74067+00	12	59	life-is-much-like-going-to-the-gym-the-most-painfu	22	t	1
143	For most people, the reason they don't win financially is because the pain of losing money is far greater than the joy of being rich.	2017-03-25 19:36:52.491597+00	12	59	for-most-people-the-reason-they-dont-win-financial	18	t	1
144	Risk comes from not knowing what you're doing.	2017-03-25 19:37:34.689225+00	12	28	risk-comes-from-not-knowing-what-youre-doing	23	t	1
145	The definition of insanity is doing the same thing over and over and expecting a different result.	2017-03-25 19:38:48.821313+00	12	53	the-definition-of-insanity-is-doing-the-same-thing	7	t	1
146	Do what you feel in your heart to be right - for you'll be criticized anyway. You'll be damned if you do, and damned if you don't.	2017-03-25 19:40:05.695809+00	12	72	do-what-you-feel-in-your-heart-to-be-right-for-you	22	t	1
147	Action always beats inaction.	2017-03-25 19:40:37.883311+00	12	59	action-always-beats-inaction	7	t	1
148	Be a little greedy. It's the best cure for laziness.	2017-03-25 19:41:08.151636+00	12	59	be-a-little-greedy-its-the-best-cure-for-laziness	23	t	1
149	Look for people who wants to buy first. Then look for someone who wants to sell.	2017-03-25 19:41:45.600973+00	12	59	look-for-people-who-wants-to-buy-first-then-look-f	8	t	1
150	Listening is more important than talking. If that were not true, God would not have given us two ears and only one mouth.	2017-03-25 19:42:16.398284+00	12	59	listening-is-more-important-than-talking-if-that-w	7	t	1
151	Everyone wants to go to heaven, but no one wants to die.	2017-03-25 19:44:03.369723+00	12	\N	everyone-wants-to-go-to-heaven-but-no-one-wants-to	7	t	1
152	I always tried to turn every disaster into an opportunity.	2017-03-25 19:49:20.733294+00	12	73	i-always-tried-to-turn-every-disaster-into-an-oppo	7	t	1
155	History followed different courses for different peoples because of differences among peoples' environments, not because of biological differences among peoples themselves.	2017-04-12 23:13:30.228246+00	14	75	history-followed-different-courses-for-different-p	2	t	1
156	One has to understand the enemy in order to beat him.	2017-04-12 23:14:40.393725+00	14	\N	one-has-to-understand-the-enemy-in-order-to-beat-h	2	t	1
157	Necessity is the mother of invention.	2017-04-12 23:15:35.709765+00	14	\N	necessity-is-the-mother-of-invention	7	t	1
158	Know the enemy, know yourself and victory is never in doubt, not in a hundred battles.	2017-04-12 23:24:51.910606+00	15	76	know-the-enemy-know-yourself-and-victory-is-never-	25	t	1
159	A large society that continues to leave conflict resolution to all of its members is guaranteed to blow up.	2017-04-16 18:37:12.434295+00	14	75	a-large-society-that-continues-to-leave-conflict-r	5	t	1
160	Reading, after a certain age, diverts the mind too much from its creative pursuits. Any man who reads too much and uses his own brain too little falls into lazy habits of thinking.	2017-04-17 11:42:05.832373+00	16	53	reading-after-a-certain-age-diverts-the-mind-too-m	26	t	1
161	Genius is only a superior power of seeing.	2017-04-17 11:43:07.360563+00	16	78	genius-is-only-a-superior-power-of-seeing	7	t	1
162	Action may not always bring happiness, but there is no happiness without action.	2017-04-17 11:43:57.57021+00	16	79	action-may-not-always-bring-happiness-but-there-is	7	t	1
163	Whenever you find yourself on the side of the majority, it is time to pause and reflect.	2017-04-17 11:45:02.70136+00	16	33	whenever-you-find-yourself-on-the-side-of-the-majo	7	t	1
164	What man actually needs is not a tensionless state but rather the striving and struggling for a worthwhile goal, a freely chosen task.	2017-04-17 11:46:36.253402+00	16	2	what-man-actually-needs-is-not-a-tensionless-state	22	t	1
165	Americans who travel abroad for the first time are often shocked to discover that, despite all the progress that has been made in the last 30 years, many foreign people still speak in foreign languages.	2017-04-17 11:47:59.363416+00	16	80	americans-who-travel-abroad-for-the-first-time-are	27	t	1
166	Finding a market before designing a product is smarter than the reverse.	2017-04-17 11:48:47.719781+00	16	77	finding-a-market-before-designing-a-product-is-sma	8	t	1
167	Adults are always asking kids what they want to be when they grow up because they are looking for ideas.	2017-04-17 11:50:29.068464+00	16	81	adults-are-always-asking-kids-what-they-want-to-be	9	t	1
168	Nothing is more common than unsuccessful men with talent.	2017-04-17 11:51:18.528857+00	16	82	nothing-is-more-common-than-unsuccessful-men-with-	8	t	1
169	By working faithfully eight hours a day you may eventually get to be boss and work twelve hours a day.	2017-04-17 11:52:00.546898+00	16	83	by-working-faithfully-eight-hours-a-day-you-may-ev	8	t	1
170	The first rule of any technology used in a business is that automation applied to an efficient operation will magnify the efficiency. The second is that automation applied to an inefficient operation will magnify the inefficiency.	2017-04-17 11:53:38.604193+00	16	84	the-first-rule-of-any-technology-used-in-a-busines	28	t	1
171	What gets measured gets managed.	2017-04-17 11:56:05.709998+00	16	85	what-gets-measured-gets-managed	8	t	1
172	The fishing is best where the fewest go.	2017-04-17 11:56:44.173396+00	16	77	the-fishing-is-best-where-the-fewest-go	7	t	1
173	Civilization had too many rules for me, so I did my best to rewrite them.	2017-04-17 11:57:27.569555+00	16	86	civilization-had-too-many-rules-for-me-so-i-did-my	7	t	1
174	Anyone who lives within their means suffers from a lack of imagination.	2017-04-17 11:58:07.38959+00	16	27	anyone-who-lives-within-their-means-suffers-from-a	9	t	1
175	An expert is a person who has made all the mistakes that can be made in a very narrow field.	2017-04-17 11:59:01.238943+00	16	87	an-expert-is-a-person-who-has-made-all-the-mistake	7	t	1
176	Everything popular is wrong.	2017-04-17 11:59:30.676252+00	16	27	everything-popular-is-wrong	7	t	1
177	I can't give you a surefire formula for success, but I can give you a formula for failure: try to please everybody all the time.	2017-04-17 12:00:29.213149+00	16	88	i-cant-give-you-a-surefire-formula-for-success-but	22	t	1
178	Nobody can give you freedom. Nobody can give you equality or justice or anything. If you're a man, you take it.	2017-04-17 12:01:30.278218+00	16	89	nobody-can-give-you-freedom-nobody-can-give-you-eq	29	t	1
179	Being busy is a form of laziness - lazy thinking and indiscriminate action.	2017-04-17 12:03:45.252433+00	16	77	being-busy-is-a-form-of-laziness-lazy-thinking-and	30	t	1
291	You miss one hundred percent of the shots you don't take.	2017-08-23 14:23:51.429901+00	30	138	you-miss-one-hundred-percent-of-the-shots-you-dont	7	t	1
180	Creating demand is hard. Filling demand is much easier. Don't create a product, then seek someone to sell it to. Find a market - define your customers - then find or develop a product for them.	2017-04-17 12:05:25.826583+00	16	77	creating-demand-is-hard-filling-demand-is-much-eas	8	t	1
181	Lack of time is actually lack of priorities.	2017-04-17 12:08:02.473626+00	16	77	lack-of-time-is-actually-lack-of-priorities	30	t	1
182	The customer can have any color he wants, so long as it's black.	2017-04-17 12:08:41.202196+00	16	68	the-customer-can-have-any-color-he-wants-so-long-a	8	t	1
183	Options - the ability to choose - is real power.	2017-04-17 12:09:31.178201+00	16	77	options-the-ability-to-choose-is-real-power	22	t	1
184	Many a false step was made by standing still.	2017-04-17 12:10:11.633933+00	16	\N	many-a-false-step-was-made-by-standing-still	7	t	1
185	A company is stronger if it is bound by love rather than by fear... If the employees come first, then they're happy.	2017-04-17 12:11:10.68017+00	16	90	a-company-is-stronger-if-it-is-bound-by-love-rathe	8	t	1
186	The simple willingness to improvise is more vital, in the long run, than research.	2017-04-17 12:12:44.759551+00	16	91	the-simple-willingness-to-improvise-is-more-vital-	9	t	1
187	Companies go out of business when they make the wrong decisions or, just as important, make too many decisions. The latter creates complexity.	2017-04-17 12:13:50.760654+00	16	92	companies-go-out-of-business-when-they-make-the-wr	8	t	1
188	Reality is merely an illusion, albeit a very persistent one.	2017-04-17 12:14:55.051417+00	16	53	reality-is-merely-an-illusion-albeit-a-very-persis	7	t	1
189	Once you say you're going to settle for second, that's what happens to you in life.	2017-04-17 12:16:59.133961+00	16	93	once-you-say-youre-going-to-settle-for-second-that	22	t	1
190	The entrepreneur shifts economic resources out of an area of lower and into an area of higher yield.	2017-04-17 12:18:29.695977+00	16	94	the-entrepreneur-shifts-economic-resources-out-of-	8	t	1
191	Before the development of tourism, travel was conceived to be like study, and its fruits were considered to be the adornment of the mind and the formation of judgement.	2017-04-17 12:19:13.519764+00	16	95	before-the-development-of-tourism-travel-was-conce	27	t	1
192	Only those who are asleep make no mistakes.	2017-04-17 12:19:51.824338+00	16	96	only-those-who-are-asleep-make-no-mistakes	7	t	1
193	The average man is a conformist, accepting miseries and disasters with the stoicism of a cow standing in the rain.	2017-04-17 12:20:28.12944+00	16	97	the-average-man-is-a-conformist-accepting-miseries	22	t	1
194	Travelling is the ruin of all happiness! There's no looking at a building here after seeing Italy.	2017-04-17 12:21:23.401343+00	16	98	travelling-is-the-ruin-of-all-happiness-theres-no-	27	t	1
195	There is more to life than increasing its speed.	2017-04-17 12:22:01.6941+00	16	99	there-is-more-to-life-than-increasing-its-speed	22	t	1
196	It is fatal to know too much at the outcome: boredom comes as quickly to the traveler who knows his route as to the novelist who is overcertain of his plot.	2017-04-17 12:23:37.053687+00	16	100	it-is-fatal-to-know-too-much-at-the-outcome-boredo	7	t	1
197	Doubts invade the mind when nothing else fills it.	2017-04-17 12:24:04.557578+00	16	77	doubts-invade-the-mind-when-nothing-else-fills-it	7	t	1
198	If you can't define it or act upon it, forget it.	2017-04-17 12:24:34.497214+00	16	77	if-you-cant-define-it-or-act-upon-it-forget-it	7	t	1
199	There are no statues erected to critics.	2017-04-17 12:25:37.581763+00	16	101	there-are-no-statues-erected-to-critics	7	t	1
200	Liberty means responsibility. That is why most men dread it.	2017-04-17 12:28:18.998777+00	16	102	liberty-means-responsibility-that-is-why-most-men-	22	t	1
201	Recently, I was asked if I was going to fire an employee who made a mistake that cost the company $600,000. No, I replied, I just spent $600,000 training him.	2017-04-17 12:29:46.349574+00	16	103	recently-i-was-asked-if-i-was-going-to-fire-an-emp	8	t	1
202	The factory of the future will have only two employees, a man and a dog. The man will be there to feed the dog. The dog will be there to keep the man from touching the equipment.	2017-04-17 12:30:19.349106+00	16	104	the-factory-of-the-future-will-have-only-two-emplo	8	t	1
203	The existential vacuum manifests itself mainly in a state of boredom.	2017-04-17 12:30:48.344803+00	16	2	the-existential-vacuum-manifests-itself-mainly-in-	22	t	1
204	The first principle is that you must not fool yourself, and you are the easiest person to fool.	2017-04-17 12:32:33.313395+00	16	105	the-first-principle-is-that-you-must-not-fool-your	7	t	1
205	If you don't make mistakes, you're not working on hard enough problems. And that's a big mistake.	2017-04-17 12:33:08.101105+00	16	106	if-you-dont-make-mistakes-youre-not-working-on-har	7	t	1
206	It is vain to do with more what can be done with less.	2017-04-17 12:34:31.507991+00	16	107	it-is-vain-to-do-with-more-what-can-be-done-with-l	22	t	1
207	Perfection is not when there is no more to add, but no more to take away.	2017-04-17 12:35:17.081835+00	16	108	perfection-is-not-when-there-is-no-more-to-add-but	7	t	1
208	80% of the outputs result from 20% of the inputs.	2017-04-17 12:37:59.037621+00	16	109	80-of-the-outputs-result-from-20-of-the-inputs	7	t	1
209	There's no difference between a pessimist who says, "Oh it's hopeless, so don't bother doing anything," and an optimist who says, "Don't bother doing anything, it's going to turn out fine anyway. Either way, nothing happens.	2017-04-17 12:38:52.426397+00	16	110	theres-no-difference-between-a-pessimist-who-says-	7	t	1
210	The reasonable man adapts himself to the world: the unreasonable one persists in trying to adapt the world to himself. Therefore all progress depends on the unreasonable man.	2017-04-17 12:39:48.60027+00	16	102	the-reasonable-man-adapts-himself-to-the-world-the	7	t	1
211	To be free, to be happy and fruitful, can only be attained through sacrifice of many common but overestimated things.	2017-04-17 12:40:20.815239+00	16	111	to-be-free-to-be-happy-and-fruitful-can-only-be-at	22	t	1
212	If you must play, decide on three things at the start: the rules of the game, the stakes, and the quitting time.	2017-04-17 12:41:42.188177+00	16	\N	if-you-must-play-decide-on-three-things-at-the-sta	22	t	1
213	People think it must be fun to be a super genius, but they don't realize how hard it is to put up with all the idiots in the world.	2017-04-17 12:43:02.578158+00	16	112	people-think-it-must-be-fun-to-be-a-super-genius-b	22	t	1
214	The striking differences between the long-term histories of peoples of the different continents have been due not to innate differences in the peoples themselves but to differences in their environments.	2017-04-23 17:25:41.070476+00	14	75	the-striking-differences-between-the-long-term-his	2	t	1
215	Money is the root of all evil.	2017-04-23 21:06:26.469777+00	17	\N	money-is-the-root-of-all-evil	8	t	1
216	If you can't do the maths to determine the future value of your financial product, then that financial product is not for you.	2017-04-23 21:07:47.091229+00	17	113	if-you-cant-do-the-maths-to-determine-the-future-v	23	t	1
230	Inaction too often has the greatest amount of risk.	2017-05-04 10:00:25.010186+00	17	113	inaction-too-often-has-the-greatest-amount-of-risk	8	t	1
231	Don't put all your eggs in one basket.	2017-05-04 10:07:08.772801+00	17	\N	dont-put-all-your-eggs-in-one-basket	8	t	1
232	Great minds discuss ideas; average minds discuss events; small minds discuss people.	2017-05-23 11:07:21.882472+00	\N	72	great-minds-discuss-ideas-average-minds-discuss-ev	7	t	1
233	Never spend more than you earn.	2017-05-24 09:58:34.222659+00	18	114	never-spend-more-than-you-earn	18	t	1
234	If you don't have something you take seriously to aim for you won't achieve it, it's as simple as that.	2017-05-24 09:59:07.663527+00	18	114	if-you-dont-have-something-you-take-seriously-to-a	7	t	1
235	If you can't afford something you want don't buy it on credit.	2017-05-24 10:00:14.007635+00	18	114	if-you-cant-afford-something-you-want-dont-buy-it-	18	t	1
236	Your deposits are loans that you make to your bank.	2017-05-24 10:01:12.218588+00	18	114	your-deposits-are-loans-that-you-make-to-your-bank	18	t	1
237	Society cannot subsist unless the laws of justice are tolerably observed.	2017-05-24 10:03:24.100675+00	19	115	society-cannot-subsist-unless-the-laws-of-justice-	31	t	1
238	Mercy to the guilty is cruelty to the innocent.	2017-05-24 10:04:15.141463+00	19	115	mercy-to-the-guilty-is-cruelty-to-the-innocent	32	t	1
239	Knowledge is power, but execution trumps knowledge.	2017-05-24 10:06:12.923573+00	20	116	knowledge-is-power-but-execution-trumps-knowledge	3	t	1
240	If you care what the neighbours think, you will never be rich.	2017-05-29 13:58:48.839207+00	21	117	if-you-care-what-the-neighbours-think-you-will-nev	8	t	1
241	You will never get rich working for your boss.	2017-05-29 14:48:57.18004+00	21	117	you-will-never-get-rich-working-for-your-boss	8	t	1
242	Ideas don't make you rich. The correct execution of ideas does.	2017-05-29 14:49:39.148599+00	21	117	ideas-dont-make-you-rich-the-correct-execution-of-	8	t	1
244	Experience is only the name we give to our failures.	2017-05-29 14:52:40.4436+00	21	27	experience-is-only-the-name-we-give-to-our-failure	7	t	1
256	To a real wise man the judicious and well-weighed approbation of a single wise man, gives more heartfelt satisfaction than all the noisy applauses of ten thousand ignorant though enthusiastic admirers.	2017-06-05 17:58:24.015126+00	19	115	to-a-real-wise-man-the-judicious-and-well-weighed-	7	t	1
252	There is only one boss. The customer. And he can fire everybody in the company from the chairman on down, simply by spending his money somewhere else.	2017-05-29 15:45:37.273183+00	21	118	there-is-only-one-boss-the-customer-and-he-can-fir	8	t	1
253	No one can make you feel inferior without your consent.	2017-05-29 15:47:03.772054+00	21	72	no-one-can-make-you-feel-inferior-without-your-con	22	t	1
254	Before we can feel much for others, we must in some measure be at ease ourselves.	2017-06-03 18:27:42.221928+00	19	115	before-we-can-feel-much-for-others-we-must-in-some	22	t	1
255	We suffer more when we fall from a better to a worse situation, than we ever enjoy when we rise from a worse to a better.	2017-06-03 18:28:50.593231+00	19	115	we-suffer-more-when-we-fall-from-a-better-to-a-wor	22	t	1
257	In almost all cases, it is better to be a little too proud, than, in any respect, too humble.	2017-06-05 18:02:01.562928+00	19	115	in-almost-all-cases-it-is-better-to-be-a-little-to	22	t	1
258	Never complain of that of which it is at all times in your power to rid yourself.	2017-06-05 18:03:51.256994+00	19	115	never-complain-of-that-of-which-it-is-at-all-times	7	t	1
269	The minute one decides one does not have a choice, one has made a choice.	2017-07-02 16:40:22.921859+00	22	\N	the-minute-one-decides-one-does-not-have-a-choice-	22	t	1
270	By repetition, each lie becomes an irreversible fact upon which other lies are constructed.	2017-07-02 16:43:49.764731+00	23	\N	by-repetition-each-lie-becomes-an-irreversible-fac	5	t	1
271	Ignorance is not bliss. Ignorance is pain and poverty in the financial world.	2017-07-06 19:52:34.966049+00	20	116	ignorance-is-not-bliss-ignorance-is-pain-and-pover	18	t	1
273	The ultimate thing that stops most of us from making significant progress in our lives is not somebody else's limitations, but rather our own limiting perceptions or beliefs.	2017-07-06 19:53:53.782949+00	20	116	the-ultimate-thing-that-stops-most-of-us-from-maki	18	t	1
274	The secret to living is giving.	2017-07-06 20:01:59.573048+00	20	116	the-secret-to-living-is-giving	22	t	1
275	The average worker, I am sorry to say, wants a job in which he does not have to think.	2017-07-10 14:21:51.481766+00	24	68	the-average-worker-i-am-sorry-to-say-wants-a-job-i	8	t	1
276	When a well-packaged web of lies has been sold gradually to the masses over generations, the truth will seem utterly preposterous and its speaker a raving lunatic.	2017-07-16 11:35:41.654662+00	23	122	when-a-well-packaged-web-of-lies-has-been-sold-gra	5	t	1
277	Socialism properly implies above all things the co-operative control by the workers of the machinery of production; without this co-operative control the public ownership by the State is not Socialism – it is only State capitalism.	2017-07-16 11:39:11.221267+00	24	123	socialism-properly-implies-above-all-things-the-co	5	t	1
278	We make good products, we induce people to buy them, and then the next year we deliberately introduce something else that will make these products old fashioned, out of date, obsolete.	2017-07-16 11:45:38.833953+00	24	124	we-make-good-products-we-induce-people-to-buy-them	1	t	1
280	If it's a "must" and not just a "should", you'll find a way.	2017-07-29 16:40:47.370898+00	20	116	if-its-a-must-and-not-just-a-should-youll-find-a-w	22	t	1
281	What you get will never make you happy; who you become will make you very happy or very sad.	2017-07-29 16:43:47.691651+00	20	39	what-you-get-will-never-make-you-happy-who-you-bec	22	t	1
282	The production of surplus value and the transformation of a portion of it back into capital or accumulation, is the immediate purpose and the determining motive of capitalist production.	2017-07-29 16:48:41.13506+00	24	121	the-production-of-surplus-value-and-the-transforma	1	t	1
283	I don't want to move to a city where the only cultural advantage is being able to make a right turn on a red light.	2017-07-30 15:53:51.931443+00	25	127	i-dont-want-to-move-to-a-city-where-the-only-cultu	33	t	1
279	If everything seems under control, you're not going fast enough.	2017-07-29 16:39:32.315543+00	20	125	if-everything-seems-under-control-youre-not-going-	7	t	1
292	An investment in knowledge pays the best interest.	2017-08-25 15:35:13.007416+00	\N	7	an-investment-in-knowledge-pays-the-best-interest	10	t	1
300	It is hard for an empty sack to stand upright.	2017-11-18 14:50:12.750391+00	32	7	it-is-hard-for-an-empty-sack-to-stand-upright	22	t	1
\.


--
-- Data for Name: quotes_quote_tags; Type: TABLE DATA; Schema: public; Owner: hakim
--

COPY quotes_quote_tags (id, quote_id, tag_id) FROM stdin;
1	33	1
2	33	2
4	32	3
5	20	4
6	37	5
7	12	6
8	31	8
9	31	7
10	30	9
11	22	10
12	4	11
13	24	12
14	9	13
15	9	14
16	6	16
17	6	17
18	6	15
19	22	18
20	1	18
21	1	19
22	1	20
23	26	9
24	26	21
25	11	9
26	11	20
27	27	9
28	27	18
29	27	22
30	32	23
31	7	24
32	34	25
33	18	26
34	18	27
35	18	28
36	2	29
37	2	30
38	35	6
39	36	32
40	36	31
41	41	31
42	42	17
43	42	33
44	43	34
45	43	35
46	44	35
47	45	2
48	46	2
49	46	36
50	47	9
51	47	2
52	48	2
53	48	37
54	49	2
55	49	35
56	50	37
57	51	2
58	52	2
59	52	31
60	53	2
61	54	2
62	54	31
63	55	2
64	56	37
65	57	38
66	58	39
67	59	37
68	60	9
69	61	39
70	62	39
71	63	39
72	64	39
73	65	39
74	66	40
75	67	37
76	68	41
77	68	42
78	69	43
79	69	39
80	70	9
81	71	44
82	71	39
83	72	45
84	72	37
85	73	31
86	74	39
87	75	44
88	75	39
89	76	18
90	77	18
91	78	18
92	79	9
93	80	9
94	81	9
95	82	9
96	83	9
97	84	9
98	85	9
99	86	46
100	87	46
101	88	37
102	89	37
103	90	39
104	91	37
105	92	46
106	93	46
107	94	46
108	95	18
109	96	46
110	97	37
111	98	37
112	99	37
113	100	46
114	101	18
115	102	18
116	102	46
117	103	18
118	103	46
119	104	37
120	105	47
121	106	46
122	107	48
123	107	46
124	108	49
125	108	37
126	109	7
127	110	7
128	111	46
129	111	7
130	112	7
131	113	47
132	114	7
133	115	46
134	116	22
135	117	46
136	118	46
137	119	18
138	119	22
145	125	18
146	126	7
147	127	18
148	128	37
149	129	37
150	130	37
151	131	18
152	132	18
153	133	7
154	134	7
155	135	18
156	136	46
157	137	46
158	138	47
159	139	18
160	140	7
161	141	18
162	142	7
163	143	46
164	144	22
165	145	37
166	146	7
167	147	37
168	148	22
169	149	18
170	150	37
171	151	37
172	152	37
177	155	2
178	156	6
179	157	37
180	158	52
181	159	31
182	160	25
183	161	37
184	162	37
185	163	37
186	164	7
187	165	53
188	166	18
189	167	39
190	167	7
191	168	18
192	169	18
193	170	12
194	171	18
195	171	54
196	172	18
197	172	37
198	173	37
199	174	39
200	174	55
201	175	37
202	176	37
203	177	7
204	178	7
205	179	18
206	180	18
207	181	56
208	182	18
209	183	7
210	184	37
211	185	18
212	186	39
213	186	55
214	187	18
215	188	57
216	189	7
217	190	18
218	191	53
219	192	37
220	193	7
221	194	53
222	195	7
223	196	37
224	197	37
225	198	37
226	199	37
227	200	7
228	201	18
229	202	18
230	203	7
231	204	37
232	205	37
233	206	7
234	207	37
235	208	37
236	209	37
237	210	37
238	211	7
239	212	7
240	213	58
241	213	7
242	214	6
243	215	18
244	216	22
249	230	18
250	231	18
251	232	37
252	233	46
253	234	37
254	235	46
255	236	46
256	237	59
257	237	60
258	238	60
259	239	61
260	240	18
261	241	18
262	242	18
263	244	37
267	252	18
268	253	7
269	254	7
270	255	7
271	256	37
272	257	7
273	258	37
274	269	7
275	270	31
276	271	46
277	272	46
278	273	46
279	274	7
280	275	18
281	276	31
282	277	31
283	278	62
284	278	63
285	279	37
286	280	7
287	281	7
288	282	63
289	283	64
290	284	31
291	285	18
292	286	18
293	287	31
294	288	39
295	289	37
296	290	37
297	291	37
298	292	9
299	292	22
300	293	31
301	294	2
302	294	63
303	295	63
304	296	18
305	297	37
306	298	37
307	299	7
308	300	7
309	301	37
\.


--
-- Data for Name: quotes_tag; Type: TABLE DATA; Schema: public; Owner: hakim
--

COPY quotes_tag (id, name, slug) FROM stdin;
1	Geography	geography
2	Development	development
3	Practice	practice
4	Success	success
5	Pragmatism	pragmatism
6	History	history
7	Life	life
8	Variety	variety
9	Education	education
10	Negotiation	negotiation
11	Journey	journey
12	Efficiency	efficiency
13	Love	love
14	Fear	fear
15	Satisfaction	satisfaction
16	Need	need
17	Motivation	motivation
18	Business	business
19	Time management	time-management
20	Money	money
21	Experience	experience
22	Investment	investment
23	Perfection	perfection
24	Honesty	honesty
25	Reading	reading
26	Luck	luck
27	Preparation	preparation
28	Opportunity	opportunity
29	Religion	religion
30	Faith	faith
31	Politics	politics
32	Elections	elections
33	Negativity	negativity
34	Agriculture	agriculture
35	Industry	industry
36	Trade	trade
37	Inspirational	inspirational
38	Presentation	presentation
39	Creativity	creativity
40	Identity	identity
41	Numbers	numbers
42	Music	music
43	Constraints	constraints
44	Simplicity	simplicity
45	Feelings	feelings
46	Finance	finance
47	Leadership	leadership
48	Real estate	real-estate
49	Thinking	thinking
52	War	war
53	Travel	travel
54	Management	management
55	Imagination	imagination
56	Productivity	productivity
57	Reality	reality
58	Genius	genius
59	Society	society
60	Justice	justice
61	Knowledge	knowledge
62	Consumerism	consumerism
63	Economics	economics
64	Humour	humour
\.


--
-- Data for Name: social_auth_association; Type: TABLE DATA; Schema: public; Owner: hakim
--

COPY social_auth_association (id, server_url, handle, secret, issued, lifetime, assoc_type) FROM stdin;
\.


--
-- Data for Name: social_auth_code; Type: TABLE DATA; Schema: public; Owner: hakim
--

COPY social_auth_code (id, email, code, verified, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_nonce; Type: TABLE DATA; Schema: public; Owner: hakim
--

COPY social_auth_nonce (id, server_url, "timestamp", salt) FROM stdin;
\.


--
-- Data for Name: social_auth_partial; Type: TABLE DATA; Schema: public; Owner: hakim
--

COPY social_auth_partial (id, token, next_step, backend, data, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_usersocialauth; Type: TABLE DATA; Schema: public; Owner: hakim
--

COPY social_auth_usersocialauth (id, provider, uid, extra_data, user_id) FROM stdin;
14	twitter	1629980322	{"id": 1629980322, "access_token": {"screen_name": "h4k1m0u", "user_id": "1629980322", "oauth_token": "1629980322-dX2cp3YnvFzQimNykDgIzfJx7HGwx77PzYgebVN", "x_auth_expires": "0", "oauth_token_secret": "NEnQLzNLpLcBhvrH87AW8zlCytEU77xPMWreuEUyJn995"}, "auth_time": 1502377229}	18
15	google-oauth2	h.benoudjit@gmail.com	{"access_token": "ya29.GlyjBAawgKiGirOxh-_aUOVAHFo4QRaH3jvYdd240mJq8xa47yIz-BFd8F7s_EvI4eyCt8LCEKx9BdbZLR9Us3hSda-SWBsNLKT3POs4GlLSlDZEi_6C1iKDmFvi5w", "auth_time": 1502377240, "expires": 3600, "token_type": "Bearer"}	19
16	facebook	244241772761372	{"auth_time": 1502580270, "id": "244241772761372", "expires": 5183920, "granted_scopes": ["public_profile"], "denied_scopes": null, "access_token": "EAAUYecYRA24BAKsZBRDvJsLFFtSfyEiIP1RDdOlgqM0Qm0ZCd6InrAxiddQKSh48u489kcn3mZBL9ZBIJXnFsaGqiMEcoF1EXAVRldsZBYaSF3aje2M29zlnHvwayMAzfPJZAi1ThDGlzCwpq2XfL1JK2EZADR0HGhN3y5XhUyVVwZDZD", "token_type": null}	20
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: hakim
--

COPY spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Name: articles_article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hakim
--

SELECT pg_catalog.setval('articles_article_id_seq', 14, true);


--
-- Name: articles_article_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hakim
--

SELECT pg_catalog.setval('articles_article_tags_id_seq', 31, true);


--
-- Name: articles_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hakim
--

SELECT pg_catalog.setval('articles_category_id_seq', 4, true);


--
-- Name: articles_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hakim
--

SELECT pg_catalog.setval('articles_tag_id_seq', 16, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hakim
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hakim
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hakim
--

SELECT pg_catalog.setval('auth_permission_id_seq', 81, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hakim
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hakim
--

SELECT pg_catalog.setval('auth_user_id_seq', 23, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hakim
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 9, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hakim
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1112, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hakim
--

SELECT pg_catalog.setval('django_content_type_id_seq', 27, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hakim
--

SELECT pg_catalog.setval('django_migrations_id_seq', 72, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hakim
--

SELECT pg_catalog.setval('django_site_id_seq', 2, true);


--
-- Name: expenses_expense_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hakim
--

SELECT pg_catalog.setval('expenses_expense_id_seq', 103, true);


--
-- Name: members_member_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hakim
--

SELECT pg_catalog.setval('members_member_id_seq', 20, true);


--
-- Name: places_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hakim
--

SELECT pg_catalog.setval('places_city_id_seq', 338, true);


--
-- Name: quotes_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hakim
--

SELECT pg_catalog.setval('quotes_author_id_seq', 145, true);


--
-- Name: quotes_book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hakim
--

SELECT pg_catalog.setval('quotes_book_id_seq', 32, true);


--
-- Name: quotes_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hakim
--

SELECT pg_catalog.setval('quotes_category_id_seq', 33, true);


--
-- Name: quotes_quote_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hakim
--

SELECT pg_catalog.setval('quotes_quote_id_seq', 306, true);


--
-- Name: quotes_quote_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hakim
--

SELECT pg_catalog.setval('quotes_quote_tags_id_seq', 310, true);


--
-- Name: quotes_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hakim
--

SELECT pg_catalog.setval('quotes_tag_id_seq', 64, true);


--
-- Name: social_auth_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hakim
--

SELECT pg_catalog.setval('social_auth_association_id_seq', 1, false);


--
-- Name: social_auth_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hakim
--

SELECT pg_catalog.setval('social_auth_code_id_seq', 1, false);


--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hakim
--

SELECT pg_catalog.setval('social_auth_nonce_id_seq', 1, false);


--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hakim
--

SELECT pg_catalog.setval('social_auth_partial_id_seq', 1, false);


--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hakim
--

SELECT pg_catalog.setval('social_auth_usersocialauth_id_seq', 16, true);


--
-- Name: articles_article articles_article_pkey; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY articles_article
    ADD CONSTRAINT articles_article_pkey PRIMARY KEY (id);


--
-- Name: articles_article_tags articles_article_tags_article_id_1988a91e_uniq; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY articles_article_tags
    ADD CONSTRAINT articles_article_tags_article_id_1988a91e_uniq UNIQUE (article_id, tag_id);


--
-- Name: articles_article_tags articles_article_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY articles_article_tags
    ADD CONSTRAINT articles_article_tags_pkey PRIMARY KEY (id);


--
-- Name: articles_article articles_article_title_key; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY articles_article
    ADD CONSTRAINT articles_article_title_key UNIQUE (title);


--
-- Name: articles_category articles_category_name_key; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY articles_category
    ADD CONSTRAINT articles_category_name_key UNIQUE (name);


--
-- Name: articles_category articles_category_pkey; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY articles_category
    ADD CONSTRAINT articles_category_pkey PRIMARY KEY (id);


--
-- Name: articles_tag articles_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY articles_tag
    ADD CONSTRAINT articles_tag_name_key UNIQUE (name);


--
-- Name: articles_tag articles_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY articles_tag
    ADD CONSTRAINT articles_tag_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: expenses_expense expenses_expense_pkey; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY expenses_expense
    ADD CONSTRAINT expenses_expense_pkey PRIMARY KEY (id);


--
-- Name: members_member members_member_pkey; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY members_member
    ADD CONSTRAINT members_member_pkey PRIMARY KEY (id);


--
-- Name: members_member members_member_user_id_key; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY members_member
    ADD CONSTRAINT members_member_user_id_key UNIQUE (user_id);


--
-- Name: places_city places_city_pkey; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY places_city
    ADD CONSTRAINT places_city_pkey PRIMARY KEY (id);


--
-- Name: quotes_author quotes_author_firstname_ea3961f0_uniq; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY quotes_author
    ADD CONSTRAINT quotes_author_firstname_ea3961f0_uniq UNIQUE (firstname, lastname);


--
-- Name: quotes_author quotes_author_pkey; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY quotes_author
    ADD CONSTRAINT quotes_author_pkey PRIMARY KEY (id);


--
-- Name: quotes_book quotes_book_isbn_67e82e06_uniq; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY quotes_book
    ADD CONSTRAINT quotes_book_isbn_67e82e06_uniq UNIQUE (isbn);


--
-- Name: quotes_book quotes_book_pkey; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY quotes_book
    ADD CONSTRAINT quotes_book_pkey PRIMARY KEY (id);


--
-- Name: quotes_book quotes_book_title_9aad9efb_uniq; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY quotes_book
    ADD CONSTRAINT quotes_book_title_9aad9efb_uniq UNIQUE (title);


--
-- Name: quotes_category quotes_category_pkey; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY quotes_category
    ADD CONSTRAINT quotes_category_pkey PRIMARY KEY (id);


--
-- Name: quotes_category quotes_category_title_87027e50_uniq; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY quotes_category
    ADD CONSTRAINT quotes_category_title_87027e50_uniq UNIQUE (name);


--
-- Name: quotes_quote quotes_quote_pkey; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY quotes_quote
    ADD CONSTRAINT quotes_quote_pkey PRIMARY KEY (id);


--
-- Name: quotes_quote_tags quotes_quote_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY quotes_quote_tags
    ADD CONSTRAINT quotes_quote_tags_pkey PRIMARY KEY (id);


--
-- Name: quotes_quote_tags quotes_quote_tags_quote_id_c7336f80_uniq; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY quotes_quote_tags
    ADD CONSTRAINT quotes_quote_tags_quote_id_c7336f80_uniq UNIQUE (quote_id, tag_id);


--
-- Name: quotes_quote quotes_quote_text_7bfc4c20_uniq; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY quotes_quote
    ADD CONSTRAINT quotes_quote_text_7bfc4c20_uniq UNIQUE (text);


--
-- Name: quotes_tag quotes_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY quotes_tag
    ADD CONSTRAINT quotes_tag_name_key UNIQUE (name);


--
-- Name: quotes_tag quotes_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY quotes_tag
    ADD CONSTRAINT quotes_tag_pkey PRIMARY KEY (id);


--
-- Name: social_auth_association social_auth_association_pkey; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY social_auth_association
    ADD CONSTRAINT social_auth_association_pkey PRIMARY KEY (id);


--
-- Name: social_auth_association social_auth_association_server_url_078befa2_uniq; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY social_auth_association
    ADD CONSTRAINT social_auth_association_server_url_078befa2_uniq UNIQUE (server_url, handle);


--
-- Name: social_auth_code social_auth_code_email_801b2d02_uniq; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY social_auth_code
    ADD CONSTRAINT social_auth_code_email_801b2d02_uniq UNIQUE (email, code);


--
-- Name: social_auth_code social_auth_code_pkey; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY social_auth_code
    ADD CONSTRAINT social_auth_code_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce social_auth_nonce_pkey; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce social_auth_nonce_server_url_f6284463_uniq; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_server_url_f6284463_uniq UNIQUE (server_url, "timestamp", salt);


--
-- Name: social_auth_partial social_auth_partial_pkey; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY social_auth_partial
    ADD CONSTRAINT social_auth_partial_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_pkey; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_provider_e6b5e668_uniq; Type: CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_provider_e6b5e668_uniq UNIQUE (provider, uid);


--
-- Name: articles_article_2dbcba41; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX articles_article_2dbcba41 ON articles_article USING btree (slug);


--
-- Name: articles_article_b583a629; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX articles_article_b583a629 ON articles_article USING btree (category_id);


--
-- Name: articles_article_b5c3e75b; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX articles_article_b5c3e75b ON articles_article USING btree (member_id);


--
-- Name: articles_article_slug_cc61df93_like; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX articles_article_slug_cc61df93_like ON articles_article USING btree (slug varchar_pattern_ops);


--
-- Name: articles_article_tags_76f094bc; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX articles_article_tags_76f094bc ON articles_article_tags USING btree (tag_id);


--
-- Name: articles_article_tags_a00c1b00; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX articles_article_tags_a00c1b00 ON articles_article_tags USING btree (article_id);


--
-- Name: articles_article_title_9a9f46c8_like; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX articles_article_title_9a9f46c8_like ON articles_article USING btree (title varchar_pattern_ops);


--
-- Name: articles_category_2dbcba41; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX articles_category_2dbcba41 ON articles_category USING btree (slug);


--
-- Name: articles_category_name_6996fcd4_like; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX articles_category_name_6996fcd4_like ON articles_category USING btree (name varchar_pattern_ops);


--
-- Name: articles_category_slug_f02e70e2_like; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX articles_category_slug_f02e70e2_like ON articles_category USING btree (slug varchar_pattern_ops);


--
-- Name: articles_tag_2dbcba41; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX articles_tag_2dbcba41 ON articles_tag USING btree (slug);


--
-- Name: articles_tag_name_5be47acd_like; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX articles_tag_name_5be47acd_like ON articles_tag USING btree (name varchar_pattern_ops);


--
-- Name: articles_tag_slug_c4fc6368_like; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX articles_tag_slug_c4fc6368_like ON articles_tag USING btree (slug varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX django_site_domain_a2e37b91_like ON django_site USING btree (domain varchar_pattern_ops);


--
-- Name: expenses_expense_user_id_ab1aae2b; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX expenses_expense_user_id_ab1aae2b ON expenses_expense USING btree (user_id);


--
-- Name: members_member_2dbcba41; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX members_member_2dbcba41 ON members_member USING btree (slug);


--
-- Name: members_member_slug_d63afed9_like; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX members_member_slug_d63afed9_like ON members_member USING btree (slug varchar_pattern_ops);


--
-- Name: places_city_geometry_id; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX places_city_geometry_id ON places_city USING gist (geometry);


--
-- Name: places_city_slug_845e208f; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX places_city_slug_845e208f ON places_city USING btree (slug);


--
-- Name: places_city_slug_845e208f_like; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX places_city_slug_845e208f_like ON places_city USING btree (slug varchar_pattern_ops);


--
-- Name: quotes_author_2dbcba41; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX quotes_author_2dbcba41 ON quotes_author USING btree (slug);


--
-- Name: quotes_author_slug_05950971_like; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX quotes_author_slug_05950971_like ON quotes_author USING btree (slug varchar_pattern_ops);


--
-- Name: quotes_book_2dbcba41; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX quotes_book_2dbcba41 ON quotes_book USING btree (slug);


--
-- Name: quotes_book_4f331e2f; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX quotes_book_4f331e2f ON quotes_book USING btree (author_id);


--
-- Name: quotes_book_isbn_67e82e06_like; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX quotes_book_isbn_67e82e06_like ON quotes_book USING btree (isbn varchar_pattern_ops);


--
-- Name: quotes_book_slug_1a68bdd8_like; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX quotes_book_slug_1a68bdd8_like ON quotes_book USING btree (slug varchar_pattern_ops);


--
-- Name: quotes_book_title_9aad9efb_like; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX quotes_book_title_9aad9efb_like ON quotes_book USING btree (title varchar_pattern_ops);


--
-- Name: quotes_category_2dbcba41; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX quotes_category_2dbcba41 ON quotes_category USING btree (slug);


--
-- Name: quotes_category_slug_8fa9525d_like; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX quotes_category_slug_8fa9525d_like ON quotes_category USING btree (slug varchar_pattern_ops);


--
-- Name: quotes_category_title_87027e50_like; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX quotes_category_title_87027e50_like ON quotes_category USING btree (name varchar_pattern_ops);


--
-- Name: quotes_quote_0a4572cc; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX quotes_quote_0a4572cc ON quotes_quote USING btree (book_id);


--
-- Name: quotes_quote_2dbcba41; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX quotes_quote_2dbcba41 ON quotes_quote USING btree (slug);


--
-- Name: quotes_quote_4f331e2f; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX quotes_quote_4f331e2f ON quotes_quote USING btree (author_id);


--
-- Name: quotes_quote_b583a629; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX quotes_quote_b583a629 ON quotes_quote USING btree (category_id);


--
-- Name: quotes_quote_b5c3e75b; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX quotes_quote_b5c3e75b ON quotes_quote USING btree (member_id);


--
-- Name: quotes_quote_slug_159c87a1_like; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX quotes_quote_slug_159c87a1_like ON quotes_quote USING btree (slug varchar_pattern_ops);


--
-- Name: quotes_quote_tags_76f094bc; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX quotes_quote_tags_76f094bc ON quotes_quote_tags USING btree (tag_id);


--
-- Name: quotes_quote_tags_9c7b8123; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX quotes_quote_tags_9c7b8123 ON quotes_quote_tags USING btree (quote_id);


--
-- Name: quotes_quote_text_7bfc4c20_like; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX quotes_quote_text_7bfc4c20_like ON quotes_quote USING btree (text varchar_pattern_ops);


--
-- Name: quotes_tag_2dbcba41; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX quotes_tag_2dbcba41 ON quotes_tag USING btree (slug);


--
-- Name: quotes_tag_name_62d37795_like; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX quotes_tag_name_62d37795_like ON quotes_tag USING btree (name varchar_pattern_ops);


--
-- Name: quotes_tag_slug_b409750f_like; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX quotes_tag_slug_b409750f_like ON quotes_tag USING btree (slug varchar_pattern_ops);


--
-- Name: social_auth_code_c1336794; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX social_auth_code_c1336794 ON social_auth_code USING btree (code);


--
-- Name: social_auth_code_code_a2393167_like; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX social_auth_code_code_a2393167_like ON social_auth_code USING btree (code varchar_pattern_ops);


--
-- Name: social_auth_code_timestamp_176b341f; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX social_auth_code_timestamp_176b341f ON social_auth_code USING btree ("timestamp");


--
-- Name: social_auth_partial_94a08da1; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX social_auth_partial_94a08da1 ON social_auth_partial USING btree (token);


--
-- Name: social_auth_partial_timestamp_50f2119f; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX social_auth_partial_timestamp_50f2119f ON social_auth_partial USING btree ("timestamp");


--
-- Name: social_auth_partial_token_3017fea3_like; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX social_auth_partial_token_3017fea3_like ON social_auth_partial USING btree (token varchar_pattern_ops);


--
-- Name: social_auth_usersocialauth_e8701ad4; Type: INDEX; Schema: public; Owner: hakim
--

CREATE INDEX social_auth_usersocialauth_e8701ad4 ON social_auth_usersocialauth USING btree (user_id);


--
-- Name: articles_article articles_article_category_id_633dad2b_fk_articles_category_id; Type: FK CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY articles_article
    ADD CONSTRAINT articles_article_category_id_633dad2b_fk_articles_category_id FOREIGN KEY (category_id) REFERENCES articles_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: articles_article articles_article_member_id_f842a3a6_fk_members_member_id; Type: FK CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY articles_article
    ADD CONSTRAINT articles_article_member_id_f842a3a6_fk_members_member_id FOREIGN KEY (member_id) REFERENCES members_member(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: articles_article_tags articles_article_tag_article_id_524565b8_fk_articles_article_id; Type: FK CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY articles_article_tags
    ADD CONSTRAINT articles_article_tag_article_id_524565b8_fk_articles_article_id FOREIGN KEY (article_id) REFERENCES articles_article(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: articles_article_tags articles_article_tags_tag_id_56ec02c6_fk_articles_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY articles_article_tags
    ADD CONSTRAINT articles_article_tags_tag_id_56ec02c6_fk_articles_tag_id FOREIGN KEY (tag_id) REFERENCES articles_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: expenses_expense expenses_expense_user_id_ab1aae2b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY expenses_expense
    ADD CONSTRAINT expenses_expense_user_id_ab1aae2b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: members_member members_member_user_id_5b73e2f8_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY members_member
    ADD CONSTRAINT members_member_user_id_5b73e2f8_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: quotes_book quotes_book_author_id_a73cbd21_fk_quotes_author_id; Type: FK CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY quotes_book
    ADD CONSTRAINT quotes_book_author_id_a73cbd21_fk_quotes_author_id FOREIGN KEY (author_id) REFERENCES quotes_author(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: quotes_quote quotes_quote_author_id_201a84c4_fk_quotes_author_id; Type: FK CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY quotes_quote
    ADD CONSTRAINT quotes_quote_author_id_201a84c4_fk_quotes_author_id FOREIGN KEY (author_id) REFERENCES quotes_author(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: quotes_quote quotes_quote_book_id_b3594643_fk_quotes_book_id; Type: FK CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY quotes_quote
    ADD CONSTRAINT quotes_quote_book_id_b3594643_fk_quotes_book_id FOREIGN KEY (book_id) REFERENCES quotes_book(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: quotes_quote quotes_quote_category_id_f356a19f_fk_quotes_category_id; Type: FK CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY quotes_quote
    ADD CONSTRAINT quotes_quote_category_id_f356a19f_fk_quotes_category_id FOREIGN KEY (category_id) REFERENCES quotes_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: quotes_quote quotes_quote_member_id_2ae22e55_fk_members_member_id; Type: FK CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY quotes_quote
    ADD CONSTRAINT quotes_quote_member_id_2ae22e55_fk_members_member_id FOREIGN KEY (member_id) REFERENCES members_member(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: quotes_quote_tags quotes_quote_tags_quote_id_500d8829_fk_quotes_quote_id; Type: FK CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY quotes_quote_tags
    ADD CONSTRAINT quotes_quote_tags_quote_id_500d8829_fk_quotes_quote_id FOREIGN KEY (quote_id) REFERENCES quotes_quote(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: quotes_quote_tags quotes_quote_tags_tag_id_e9ff72c1_fk_quotes_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY quotes_quote_tags
    ADD CONSTRAINT quotes_quote_tags_tag_id_e9ff72c1_fk_quotes_tag_id FOREIGN KEY (tag_id) REFERENCES quotes_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: hakim
--

ALTER TABLE ONLY social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

