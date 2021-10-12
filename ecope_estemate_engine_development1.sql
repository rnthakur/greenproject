--
-- PostgreSQL database dump
--

-- Dumped from database version 11.3
-- Dumped by pg_dump version 11.3

-- Started on 2021-10-04 12:35:54

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
-- TOC entry 2 (class 3079 OID 57923)
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- TOC entry 3786 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 198 (class 1259 OID 57915)
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO ecope;

--
-- TOC entry 199 (class 1259 OID 61439)
-- Name: clients; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.clients (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    company_id uuid NOT NULL,
    ecope_id text NOT NULL,
    ecope_company_id text NOT NULL,
    tenant_id text,
    synced_company_id text NOT NULL,
    synced_setting_at character varying,
    corporate_number character varying,
    name character varying,
    phonetic_guides_of_name character varying,
    postal_code character varying,
    prefecture_id integer,
    city character varying,
    street_address character varying,
    other_address character varying,
    phone character varying,
    fax character varying,
    email character varying,
    url character varying,
    representative_name character varying,
    date_of_establishment character varying,
    images json,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.clients OWNER TO ecope;

--
-- TOC entry 200 (class 1259 OID 61449)
-- Name: companies; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.companies (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    ecope_id text NOT NULL,
    tenant_id text,
    customer_id text,
    corporate_number integer,
    name character varying DEFAULT ''::character varying NOT NULL,
    phonetic_guides_of_name character varying DEFAULT ''::character varying NOT NULL,
    postal_code character varying(30) DEFAULT ''::character varying NOT NULL,
    street_address character varying DEFAULT ''::character varying NOT NULL,
    phone character varying(30) DEFAULT ''::character varying NOT NULL,
    fax character varying(30) DEFAULT ''::character varying NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    url character varying DEFAULT ''::character varying NOT NULL,
    representative_name character varying DEFAULT ''::character varying NOT NULL,
    date_of_establishment character varying DEFAULT ''::character varying NOT NULL,
    icon character varying DEFAULT ''::character varying NOT NULL,
    images json,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    city character varying,
    other_address character varying,
    prefecture_id integer
);


ALTER TABLE public.companies OWNER TO ecope;

--
-- TOC entry 201 (class 1259 OID 61469)
-- Name: company_approval_members; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.company_approval_members (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    company_id uuid NOT NULL,
    created_resource_type character varying,
    created_resource_id text,
    updated_resource_type character varying,
    updated_resource_id text,
    staff_name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp without time zone
);


ALTER TABLE public.company_approval_members OWNER TO ecope;

--
-- TOC entry 202 (class 1259 OID 61482)
-- Name: company_settings; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.company_settings (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    company_id uuid NOT NULL,
    round_id integer NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.company_settings OWNER TO ecope;

--
-- TOC entry 203 (class 1259 OID 61489)
-- Name: customer_users; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.customer_users (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    company_id uuid NOT NULL,
    ecope_id text NOT NULL,
    tenant_id text,
    customer_id text,
    email character varying(255) NOT NULL,
    uid character varying(255) NOT NULL,
    name character varying DEFAULT ''::character varying NOT NULL,
    phone character varying DEFAULT ''::character varying NOT NULL,
    icon character varying DEFAULT ''::character varying NOT NULL,
    user_type character varying DEFAULT ''::character varying NOT NULL,
    aws_cognito_access_tokens text,
    aws_cognito_id_tokens text,
    aws_cognito_refresh_tokens text,
    sign_in_count integer,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    is_manage_all_workplaces boolean,
    aws_username character varying,
    deleted_at timestamp without time zone
);


ALTER TABLE public.customer_users OWNER TO ecope;

--
-- TOC entry 205 (class 1259 OID 61508)
-- Name: delayed_jobs; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.delayed_jobs (
    id bigint NOT NULL,
    priority integer DEFAULT 0 NOT NULL,
    attempts integer DEFAULT 0 NOT NULL,
    handler text NOT NULL,
    last_error text,
    run_at timestamp without time zone,
    locked_at timestamp without time zone,
    failed_at timestamp without time zone,
    locked_by character varying,
    queue character varying,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.delayed_jobs OWNER TO ecope;

--
-- TOC entry 204 (class 1259 OID 61506)
-- Name: delayed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: ecope
--

CREATE SEQUENCE public.delayed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.delayed_jobs_id_seq OWNER TO ecope;

--
-- TOC entry 3787 (class 0 OID 0)
-- Dependencies: 204
-- Name: delayed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecope
--

ALTER SEQUENCE public.delayed_jobs_id_seq OWNED BY public.delayed_jobs.id;


--
-- TOC entry 206 (class 1259 OID 61520)
-- Name: desired_request_dates; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.desired_request_dates (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    request_estimate_id uuid NOT NULL,
    date date NOT NULL,
    start_time time without time zone,
    end_time time without time zone,
    "position" integer NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.desired_request_dates OWNER TO ecope;

--
-- TOC entry 207 (class 1259 OID 61527)
-- Name: estimate_approval_members; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.estimate_approval_members (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    estimate_id uuid NOT NULL,
    estimate_approval_status_id integer NOT NULL,
    uid text NOT NULL,
    staff_name character varying(255) DEFAULT ''::character varying NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    "position" integer NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp without time zone
);


ALTER TABLE public.estimate_approval_members OWNER TO ecope;

--
-- TOC entry 208 (class 1259 OID 61542)
-- Name: estimate_assignments; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.estimate_assignments (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    parent_ownership_id uuid NOT NULL,
    child_ownership_id uuid NOT NULL,
    uid text NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp without time zone
);


ALTER TABLE public.estimate_assignments OWNER TO ecope;

--
-- TOC entry 209 (class 1259 OID 61554)
-- Name: estimate_auth_informations; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.estimate_auth_informations (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    resource_type character varying,
    resource_id text,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    confirmation_token text,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.estimate_auth_informations OWNER TO ecope;

--
-- TOC entry 210 (class 1259 OID 61565)
-- Name: estimate_client_profiles; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.estimate_client_profiles (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    estimate_id uuid NOT NULL,
    ecope_id text,
    tenant_id text,
    synced_company_id text,
    corporate_number character varying(255) DEFAULT ''::character varying NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    staff_name character varying(255) DEFAULT ''::character varying NOT NULL,
    phonetic_guides_of_name character varying(255) DEFAULT ''::character varying NOT NULL,
    postal_code character varying(255) DEFAULT ''::character varying NOT NULL,
    street_address character varying(255) DEFAULT ''::character varying NOT NULL,
    phone character varying(255) DEFAULT ''::character varying NOT NULL,
    fax character varying(255) DEFAULT ''::character varying NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    url character varying(255) DEFAULT ''::character varying NOT NULL,
    representative_name character varying(255) DEFAULT ''::character varying NOT NULL,
    date_of_establishment character varying(255) DEFAULT ''::character varying NOT NULL,
    images json,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp without time zone,
    city character varying,
    other_address character varying,
    prefecture_id integer
);


ALTER TABLE public.estimate_client_profiles OWNER TO ecope;

--
-- TOC entry 211 (class 1259 OID 61588)
-- Name: estimate_details; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.estimate_details (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    estimate_id uuid NOT NULL,
    estimate_detail_category_id integer NOT NULL,
    tax_kind_id integer NOT NULL,
    code character varying(255) DEFAULT ''::character varying NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    qty numeric(60,6) NOT NULL,
    unit character varying(100) NOT NULL,
    unit_price numeric(60,6) NOT NULL,
    price numeric(60,6) NOT NULL,
    tax_amount numeric(60,6) NOT NULL,
    total_price numeric(60,6) NOT NULL,
    tax_pct numeric(60,6) NOT NULL,
    description text,
    "position" integer NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp without time zone
);


ALTER TABLE public.estimate_details OWNER TO ecope;

--
-- TOC entry 212 (class 1259 OID 61601)
-- Name: estimate_files; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.estimate_files (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    estimate_id uuid NOT NULL,
    file text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp without time zone
);


ALTER TABLE public.estimate_files OWNER TO ecope;

--
-- TOC entry 213 (class 1259 OID 61612)
-- Name: estimate_owner_profiles; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.estimate_owner_profiles (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    estimate_id uuid NOT NULL,
    ecope_id text,
    tenant_id text,
    customer_id text,
    corporate_number character varying(255) DEFAULT ''::character varying NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    staff_name character varying(255) DEFAULT ''::character varying NOT NULL,
    phonetic_guides_of_name character varying(255) DEFAULT ''::character varying NOT NULL,
    postal_code character varying(255) DEFAULT ''::character varying NOT NULL,
    street_address character varying(255) DEFAULT ''::character varying NOT NULL,
    phone character varying(255) DEFAULT ''::character varying NOT NULL,
    fax character varying(255) DEFAULT ''::character varying NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    url character varying(255) DEFAULT ''::character varying NOT NULL,
    representative_name character varying(255) DEFAULT ''::character varying NOT NULL,
    date_of_establishment character varying(255) DEFAULT ''::character varying NOT NULL,
    icon character varying DEFAULT ''::character varying NOT NULL,
    images json,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp without time zone,
    city character varying,
    other_address character varying,
    prefecture_id integer
);


ALTER TABLE public.estimate_owner_profiles OWNER TO ecope;

--
-- TOC entry 214 (class 1259 OID 61636)
-- Name: estimate_ownership_revisions; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.estimate_ownership_revisions (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    parent_ownership_id uuid NOT NULL,
    child_ownership_id uuid NOT NULL,
    revision_at timestamp without time zone NOT NULL,
    current_revision_at timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp without time zone
);


ALTER TABLE public.estimate_ownership_revisions OWNER TO ecope;

--
-- TOC entry 215 (class 1259 OID 61645)
-- Name: estimate_ownership_status_histories; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.estimate_ownership_status_histories (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    estimate_ownership_id uuid NOT NULL,
    current_estimate_ownership_status_id integer NOT NULL,
    last_estimate_ownership_status_id integer NOT NULL,
    last_updated_at timestamp without time zone NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp without time zone,
    updated_user_type character varying,
    updated_user_id text
);


ALTER TABLE public.estimate_ownership_status_histories OWNER TO ecope;

--
-- TOC entry 216 (class 1259 OID 61655)
-- Name: estimate_ownerships; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.estimate_ownerships (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    request_estimate_ownership_id uuid NOT NULL,
    estimate_id uuid NOT NULL,
    created_resource_type character varying,
    created_resource_id text,
    uid text NOT NULL,
    estimate_ownership_status_id integer NOT NULL,
    level integer NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp without time zone,
    sent_type_id integer DEFAULT 1,
    editable_type_id integer DEFAULT 1,
    created_agent_type_id integer DEFAULT 1,
    created_user_type character varying NOT NULL,
    created_user_id text NOT NULL,
    updated_user_type character varying,
    updated_user_id text
);


ALTER TABLE public.estimate_ownerships OWNER TO ecope;

--
-- TOC entry 217 (class 1259 OID 61675)
-- Name: estimate_pdfs; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.estimate_pdfs (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    estimate_ownership_id uuid NOT NULL,
    file text NOT NULL,
    title text DEFAULT ''::text NOT NULL,
    status integer NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp without time zone
);


ALTER TABLE public.estimate_pdfs OWNER TO ecope;

--
-- TOC entry 218 (class 1259 OID 61686)
-- Name: estimates; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.estimates (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    client_id uuid NOT NULL,
    estimate_type_id integer NOT NULL,
    estimate_destination_id integer NOT NULL,
    title character varying(255) DEFAULT ''::character varying NOT NULL,
    uid text NOT NULL,
    code character varying(255) DEFAULT ''::character varying NOT NULL,
    description text NOT NULL,
    current_created_at timestamp without time zone,
    expiration_at timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp without time zone
);


ALTER TABLE public.estimates OWNER TO ecope;

--
-- TOC entry 219 (class 1259 OID 61700)
-- Name: guest_users; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.guest_users (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    resource_type character varying,
    resource_id text,
    belong_type character varying,
    belong_id text,
    email character varying,
    token text,
    sign_in_count integer,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp without time zone
);


ALTER TABLE public.guest_users OWNER TO ecope;

--
-- TOC entry 220 (class 1259 OID 61714)
-- Name: history_estimate_approval_members; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.history_estimate_approval_members (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    history_estimate_id uuid NOT NULL,
    estimate_approval_member_id text NOT NULL,
    estimate_id text NOT NULL,
    estimate_approval_status_id integer NOT NULL,
    uid text NOT NULL,
    staff_name character varying(255) DEFAULT ''::character varying NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    "position" integer NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp without time zone
);


ALTER TABLE public.history_estimate_approval_members OWNER TO ecope;

--
-- TOC entry 221 (class 1259 OID 61728)
-- Name: history_estimate_client_profiles; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.history_estimate_client_profiles (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    history_estimate_id uuid NOT NULL,
    estimate_client_profile_id text NOT NULL,
    estimate_id text NOT NULL,
    ecope_id text,
    tenant_id text,
    synced_company_id text,
    corporate_number character varying(255) DEFAULT ''::character varying NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    staff_name character varying(255) DEFAULT ''::character varying NOT NULL,
    phonetic_guides_of_name character varying(255) DEFAULT ''::character varying NOT NULL,
    postal_code character varying(255) DEFAULT ''::character varying NOT NULL,
    street_address character varying(255) DEFAULT ''::character varying NOT NULL,
    phone character varying(255) DEFAULT ''::character varying NOT NULL,
    fax character varying(255) DEFAULT ''::character varying NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    url character varying(255) DEFAULT ''::character varying NOT NULL,
    representative_name character varying(255) DEFAULT ''::character varying NOT NULL,
    date_of_establishment character varying(255) DEFAULT ''::character varying NOT NULL,
    images json,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp without time zone,
    city character varying,
    other_address character varying,
    prefecture_id integer
);


ALTER TABLE public.history_estimate_client_profiles OWNER TO ecope;

--
-- TOC entry 222 (class 1259 OID 61752)
-- Name: history_estimate_details; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.history_estimate_details (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    history_estimate_id uuid NOT NULL,
    estimate_detail_id text NOT NULL,
    estimate_id text NOT NULL,
    estimate_detail_category_id integer NOT NULL,
    tax_kind_id integer NOT NULL,
    code character varying DEFAULT ''::character varying NOT NULL,
    name character varying DEFAULT ''::character varying NOT NULL,
    qty numeric(60,6) NOT NULL,
    unit character varying(100) NOT NULL,
    unit_price numeric(60,6) NOT NULL,
    price numeric(60,6) NOT NULL,
    tax_amount numeric(60,6) NOT NULL,
    total_price numeric(60,6) NOT NULL,
    tax_pct numeric(60,6) NOT NULL,
    description text,
    "position" integer NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp without time zone
);


ALTER TABLE public.history_estimate_details OWNER TO ecope;

--
-- TOC entry 223 (class 1259 OID 61766)
-- Name: history_estimate_files; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.history_estimate_files (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    history_estimate_id uuid NOT NULL,
    estimate_file_id text NOT NULL,
    estimate_id text NOT NULL,
    file text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp without time zone
);


ALTER TABLE public.history_estimate_files OWNER TO ecope;

--
-- TOC entry 224 (class 1259 OID 61778)
-- Name: history_estimate_imprints; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.history_estimate_imprints (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    history_estimate_id uuid NOT NULL,
    company_id character varying,
    file text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp without time zone
);


ALTER TABLE public.history_estimate_imprints OWNER TO ecope;

--
-- TOC entry 225 (class 1259 OID 61788)
-- Name: history_estimate_owner_profiles; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.history_estimate_owner_profiles (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    history_estimate_id uuid NOT NULL,
    estimate_owner_profile_id text NOT NULL,
    estimate_id text NOT NULL,
    ecope_id character varying,
    tenant_id character varying,
    customer_id character varying,
    corporate_number character varying DEFAULT ''::character varying NOT NULL,
    name character varying DEFAULT ''::character varying NOT NULL,
    staff_name character varying DEFAULT ''::character varying NOT NULL,
    phonetic_guides_of_name character varying DEFAULT ''::character varying NOT NULL,
    postal_code character varying DEFAULT ''::character varying NOT NULL,
    street_address character varying DEFAULT ''::character varying NOT NULL,
    phone character varying DEFAULT ''::character varying NOT NULL,
    fax character varying DEFAULT ''::character varying NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    url character varying DEFAULT ''::character varying NOT NULL,
    representative_name character varying DEFAULT ''::character varying NOT NULL,
    date_of_establishment character varying DEFAULT ''::character varying NOT NULL,
    icon character varying DEFAULT ''::character varying NOT NULL,
    images json,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp without time zone,
    city character varying,
    other_address character varying,
    prefecture_id integer
);


ALTER TABLE public.history_estimate_owner_profiles OWNER TO ecope;

--
-- TOC entry 226 (class 1259 OID 61813)
-- Name: history_estimate_ownerships; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.history_estimate_ownerships (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    history_estimate_id uuid NOT NULL,
    estimate_ownership_id text NOT NULL,
    request_estimate_ownership_id text NOT NULL,
    estimate_id text NOT NULL,
    created_resource_type character varying NOT NULL,
    created_resource_id text NOT NULL,
    uid text NOT NULL,
    estimate_ownership_status_id integer NOT NULL,
    level integer NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp without time zone,
    sent_type_id integer,
    editable_type_id integer,
    created_agent_type_id integer,
    created_user_type character varying NOT NULL,
    created_user_id text NOT NULL,
    updated_user_type character varying,
    updated_user_id text
);


ALTER TABLE public.history_estimate_ownerships OWNER TO ecope;

--
-- TOC entry 227 (class 1259 OID 61830)
-- Name: history_estimate_pdfs; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.history_estimate_pdfs (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    history_estimate_id uuid NOT NULL,
    file text NOT NULL,
    title text DEFAULT ''::text NOT NULL,
    status integer NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp without time zone
);


ALTER TABLE public.history_estimate_pdfs OWNER TO ecope;

--
-- TOC entry 228 (class 1259 OID 61841)
-- Name: history_estimates; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.history_estimates (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    resource_type character varying,
    resource_id text,
    changed_user_type character varying,
    changed_user_id text,
    estimate_id text NOT NULL,
    client_id uuid NOT NULL,
    estimate_type_id integer NOT NULL,
    estimate_destination_id integer NOT NULL,
    title character varying DEFAULT ''::character varying NOT NULL,
    uid text NOT NULL,
    code character varying DEFAULT ''::character varying NOT NULL,
    description text NOT NULL,
    current_created_at timestamp without time zone,
    expiration_at timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp without time zone,
    history_estimate_kind_id integer NOT NULL,
    event character varying NOT NULL,
    object_changes json
);


ALTER TABLE public.history_estimates OWNER TO ecope;

--
-- TOC entry 229 (class 1259 OID 61857)
-- Name: history_request_estimates; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.history_request_estimates (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    history_estimate_id uuid NOT NULL,
    request_estimate_id character varying,
    customer_user_id character varying,
    company_id character varying,
    estimate_destination_id integer NOT NULL,
    desired_time_type_id integer NOT NULL,
    uid character varying NOT NULL,
    client_name character varying DEFAULT ''::character varying NOT NULL,
    title character varying DEFAULT ''::character varying NOT NULL,
    staff_name character varying DEFAULT ''::character varying NOT NULL,
    phone character varying DEFAULT ''::character varying NOT NULL,
    description text,
    postal_code character varying DEFAULT ''::character varying NOT NULL,
    prefecture_id integer,
    address1 character varying DEFAULT ''::character varying NOT NULL,
    address2 character varying DEFAULT ''::character varying NOT NULL,
    address3 character varying DEFAULT ''::character varying NOT NULL,
    deadline_at timestamp without time zone,
    collection_cycle_id integer,
    request_estimate_type_ids json,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp without time zone
);


ALTER TABLE public.history_request_estimates OWNER TO ecope;

--
-- TOC entry 230 (class 1259 OID 61875)
-- Name: imprints; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.imprints (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    company_id uuid NOT NULL,
    file text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.imprints OWNER TO ecope;

--
-- TOC entry 231 (class 1259 OID 61885)
-- Name: internal_groups; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.internal_groups (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    name character varying,
    icon text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.internal_groups OWNER TO ecope;

--
-- TOC entry 232 (class 1259 OID 61894)
-- Name: invitations; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.invitations (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    company_id uuid NOT NULL,
    customer_user_id uuid NOT NULL,
    email character varying NOT NULL,
    token text NOT NULL,
    permissions json,
    sent_at timestamp without time zone NOT NULL,
    confirmed_at timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp without time zone
);


ALTER TABLE public.invitations OWNER TO ecope;

--
-- TOC entry 233 (class 1259 OID 61909)
-- Name: message_files; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.message_files (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    message_id uuid NOT NULL,
    file text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.message_files OWNER TO ecope;

--
-- TOC entry 234 (class 1259 OID 61919)
-- Name: messages; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.messages (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    resource_type character varying,
    resource_id text,
    sender_type character varying,
    sender_id text,
    text text NOT NULL,
    sent_at timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    is_confirmed boolean DEFAULT false NOT NULL
);


ALTER TABLE public.messages OWNER TO ecope;

--
-- TOC entry 235 (class 1259 OID 61932)
-- Name: notifications; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.notifications (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    resource_type character varying,
    resource_id text,
    receiver_type character varying,
    receiver_id text,
    sender_type character varying,
    sender_id text,
    is_confirmed boolean DEFAULT false,
    notification_type_id integer NOT NULL,
    sent_at timestamp without time zone NOT NULL,
    confirmed_at timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp without time zone
);


ALTER TABLE public.notifications OWNER TO ecope;

--
-- TOC entry 236 (class 1259 OID 61946)
-- Name: notify_settings; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.notify_settings (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    resource_type character varying,
    resource_id text,
    notification_type_id integer NOT NULL,
    sendable boolean DEFAULT true NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.notify_settings OWNER TO ecope;

--
-- TOC entry 237 (class 1259 OID 61957)
-- Name: permissions; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.permissions (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    permission_type_id integer NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.permissions OWNER TO ecope;

--
-- TOC entry 238 (class 1259 OID 61963)
-- Name: read_messages; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.read_messages (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    message_id uuid NOT NULL,
    reader_type character varying,
    reader_id text,
    status integer NOT NULL,
    read_at timestamp without time zone NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp without time zone
);


ALTER TABLE public.read_messages OWNER TO ecope;

--
-- TOC entry 239 (class 1259 OID 61975)
-- Name: remark_templates; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.remark_templates (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    resource_type character varying,
    resource_id text,
    title character varying NOT NULL,
    text text NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp without time zone
);


ALTER TABLE public.remark_templates OWNER TO ecope;

--
-- TOC entry 240 (class 1259 OID 61986)
-- Name: request_estimate_assignments; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.request_estimate_assignments (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    parent_ownership_id uuid NOT NULL,
    child_ownership_id uuid NOT NULL,
    uid character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.request_estimate_assignments OWNER TO ecope;

--
-- TOC entry 241 (class 1259 OID 61997)
-- Name: request_estimate_files; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.request_estimate_files (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    request_estimate_id uuid NOT NULL,
    file text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.request_estimate_files OWNER TO ecope;

--
-- TOC entry 242 (class 1259 OID 62007)
-- Name: request_estimate_ownership_groups; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.request_estimate_ownership_groups (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    uid character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.request_estimate_ownership_groups OWNER TO ecope;

--
-- TOC entry 243 (class 1259 OID 62016)
-- Name: request_estimate_ownership_progresses; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.request_estimate_ownership_progresses (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    request_estimate_ownership_id uuid NOT NULL,
    sender_resource_type character varying,
    sender_resource_id text,
    receiver_resource_type character varying,
    receiver_resource_id text,
    sender_request_progress_id integer NOT NULL,
    receiver_request_progress_id integer NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.request_estimate_ownership_progresses OWNER TO ecope;

--
-- TOC entry 244 (class 1259 OID 62029)
-- Name: request_estimate_ownerships; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.request_estimate_ownerships (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    request_estimate_id uuid NOT NULL,
    owner_id uuid NOT NULL,
    client_id uuid NOT NULL,
    group_id uuid NOT NULL,
    uid character varying NOT NULL,
    request_status_id integer NOT NULL,
    level integer NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.request_estimate_ownerships OWNER TO ecope;

--
-- TOC entry 245 (class 1259 OID 62042)
-- Name: request_estimate_types; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.request_estimate_types (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    request_estimate_id uuid NOT NULL,
    estimate_type_id integer NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.request_estimate_types OWNER TO ecope;

--
-- TOC entry 246 (class 1259 OID 62049)
-- Name: request_estimates; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.request_estimates (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    customer_user_id uuid NOT NULL,
    company_id uuid NOT NULL,
    estimate_destination_id integer NOT NULL,
    desired_time_type_id integer NOT NULL,
    uid character varying NOT NULL,
    client_name character varying DEFAULT ''::character varying NOT NULL,
    title character varying DEFAULT ''::character varying NOT NULL,
    staff_name character varying DEFAULT ''::character varying NOT NULL,
    phone character varying DEFAULT ''::character varying NOT NULL,
    description text,
    postal_code character varying DEFAULT ''::character varying NOT NULL,
    prefecture_id integer,
    address1 character varying DEFAULT ''::character varying NOT NULL,
    address2 character varying DEFAULT ''::character varying NOT NULL,
    deadline_at timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    collection_cycle_id integer,
    address3 character varying DEFAULT ''::character varying
);


ALTER TABLE public.request_estimates OWNER TO ecope;

--
-- TOC entry 197 (class 1259 OID 57907)
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO ecope;

--
-- TOC entry 247 (class 1259 OID 62068)
-- Name: sent_mail_histories; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.sent_mail_histories (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    resource_type character varying,
    resource_id text,
    content json,
    sent_at timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp without time zone
);


ALTER TABLE public.sent_mail_histories OWNER TO ecope;

--
-- TOC entry 248 (class 1259 OID 62079)
-- Name: status_comments; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.status_comments (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    resource_type character varying,
    resource_id text,
    history_type character varying,
    history_id text,
    created_resource_type character varying,
    created_resource_id text,
    comment_type_id integer NOT NULL,
    text text NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp without time zone
);


ALTER TABLE public.status_comments OWNER TO ecope;

--
-- TOC entry 249 (class 1259 OID 62092)
-- Name: user_permissions; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.user_permissions (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    customer_user_id uuid NOT NULL,
    permission_id uuid NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.user_permissions OWNER TO ecope;

--
-- TOC entry 251 (class 1259 OID 62102)
-- Name: version_approvals; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.version_approvals (
    id bigint NOT NULL,
    item_type character varying NOT NULL,
    item_id uuid NOT NULL,
    event character varying NOT NULL,
    whodunnit uuid,
    object json,
    object_changes json,
    created_at timestamp without time zone
);


ALTER TABLE public.version_approvals OWNER TO ecope;

--
-- TOC entry 250 (class 1259 OID 62100)
-- Name: version_approvals_id_seq; Type: SEQUENCE; Schema: public; Owner: ecope
--

CREATE SEQUENCE public.version_approvals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.version_approvals_id_seq OWNER TO ecope;

--
-- TOC entry 3788 (class 0 OID 0)
-- Dependencies: 250
-- Name: version_approvals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecope
--

ALTER SEQUENCE public.version_approvals_id_seq OWNED BY public.version_approvals.id;


--
-- TOC entry 253 (class 1259 OID 62114)
-- Name: version_clients; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.version_clients (
    id bigint NOT NULL,
    item_type character varying NOT NULL,
    item_id uuid NOT NULL,
    event character varying NOT NULL,
    whodunnit uuid,
    object json,
    object_changes json,
    created_at timestamp without time zone
);


ALTER TABLE public.version_clients OWNER TO ecope;

--
-- TOC entry 252 (class 1259 OID 62112)
-- Name: version_clients_id_seq; Type: SEQUENCE; Schema: public; Owner: ecope
--

CREATE SEQUENCE public.version_clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.version_clients_id_seq OWNER TO ecope;

--
-- TOC entry 3789 (class 0 OID 0)
-- Dependencies: 252
-- Name: version_clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecope
--

ALTER SEQUENCE public.version_clients_id_seq OWNED BY public.version_clients.id;


--
-- TOC entry 255 (class 1259 OID 62126)
-- Name: version_companies; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.version_companies (
    id bigint NOT NULL,
    item_type character varying NOT NULL,
    item_id uuid NOT NULL,
    event character varying NOT NULL,
    whodunnit uuid,
    object json,
    object_changes json,
    created_at timestamp without time zone
);


ALTER TABLE public.version_companies OWNER TO ecope;

--
-- TOC entry 254 (class 1259 OID 62124)
-- Name: version_companies_id_seq; Type: SEQUENCE; Schema: public; Owner: ecope
--

CREATE SEQUENCE public.version_companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.version_companies_id_seq OWNER TO ecope;

--
-- TOC entry 3790 (class 0 OID 0)
-- Dependencies: 254
-- Name: version_companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecope
--

ALTER SEQUENCE public.version_companies_id_seq OWNED BY public.version_companies.id;


--
-- TOC entry 257 (class 1259 OID 62138)
-- Name: version_company_approval_members; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.version_company_approval_members (
    id bigint NOT NULL,
    item_type character varying NOT NULL,
    item_id uuid NOT NULL,
    event character varying NOT NULL,
    whodunnit uuid,
    object json,
    object_changes json,
    created_at timestamp without time zone
);


ALTER TABLE public.version_company_approval_members OWNER TO ecope;

--
-- TOC entry 256 (class 1259 OID 62136)
-- Name: version_company_approval_members_id_seq; Type: SEQUENCE; Schema: public; Owner: ecope
--

CREATE SEQUENCE public.version_company_approval_members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.version_company_approval_members_id_seq OWNER TO ecope;

--
-- TOC entry 3791 (class 0 OID 0)
-- Dependencies: 256
-- Name: version_company_approval_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecope
--

ALTER SEQUENCE public.version_company_approval_members_id_seq OWNED BY public.version_company_approval_members.id;


--
-- TOC entry 259 (class 1259 OID 62150)
-- Name: version_company_settings; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.version_company_settings (
    id bigint NOT NULL,
    item_type character varying NOT NULL,
    item_id uuid NOT NULL,
    event character varying NOT NULL,
    whodunnit uuid,
    object json,
    object_changes json,
    created_at timestamp without time zone
);


ALTER TABLE public.version_company_settings OWNER TO ecope;

--
-- TOC entry 258 (class 1259 OID 62148)
-- Name: version_company_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: ecope
--

CREATE SEQUENCE public.version_company_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.version_company_settings_id_seq OWNER TO ecope;

--
-- TOC entry 3792 (class 0 OID 0)
-- Dependencies: 258
-- Name: version_company_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecope
--

ALTER SEQUENCE public.version_company_settings_id_seq OWNED BY public.version_company_settings.id;


--
-- TOC entry 261 (class 1259 OID 62162)
-- Name: version_customer_users; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.version_customer_users (
    id bigint NOT NULL,
    item_type character varying NOT NULL,
    item_id uuid NOT NULL,
    event character varying NOT NULL,
    whodunnit uuid,
    object json,
    object_changes json,
    created_at timestamp without time zone
);


ALTER TABLE public.version_customer_users OWNER TO ecope;

--
-- TOC entry 260 (class 1259 OID 62160)
-- Name: version_customer_users_id_seq; Type: SEQUENCE; Schema: public; Owner: ecope
--

CREATE SEQUENCE public.version_customer_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.version_customer_users_id_seq OWNER TO ecope;

--
-- TOC entry 3793 (class 0 OID 0)
-- Dependencies: 260
-- Name: version_customer_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecope
--

ALTER SEQUENCE public.version_customer_users_id_seq OWNED BY public.version_customer_users.id;


--
-- TOC entry 263 (class 1259 OID 62174)
-- Name: version_estimates; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.version_estimates (
    id bigint NOT NULL,
    item_type character varying NOT NULL,
    item_id uuid NOT NULL,
    event character varying NOT NULL,
    whodunnit uuid,
    object json,
    object_changes json,
    created_at timestamp without time zone
);


ALTER TABLE public.version_estimates OWNER TO ecope;

--
-- TOC entry 262 (class 1259 OID 62172)
-- Name: version_estimates_id_seq; Type: SEQUENCE; Schema: public; Owner: ecope
--

CREATE SEQUENCE public.version_estimates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.version_estimates_id_seq OWNER TO ecope;

--
-- TOC entry 3794 (class 0 OID 0)
-- Dependencies: 262
-- Name: version_estimates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecope
--

ALTER SEQUENCE public.version_estimates_id_seq OWNED BY public.version_estimates.id;


--
-- TOC entry 265 (class 1259 OID 62186)
-- Name: version_imprints; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.version_imprints (
    id bigint NOT NULL,
    item_type character varying NOT NULL,
    item_id uuid NOT NULL,
    event character varying NOT NULL,
    whodunnit uuid,
    object json,
    object_changes json,
    created_at timestamp without time zone
);


ALTER TABLE public.version_imprints OWNER TO ecope;

--
-- TOC entry 264 (class 1259 OID 62184)
-- Name: version_imprints_id_seq; Type: SEQUENCE; Schema: public; Owner: ecope
--

CREATE SEQUENCE public.version_imprints_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.version_imprints_id_seq OWNER TO ecope;

--
-- TOC entry 3795 (class 0 OID 0)
-- Dependencies: 264
-- Name: version_imprints_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecope
--

ALTER SEQUENCE public.version_imprints_id_seq OWNED BY public.version_imprints.id;


--
-- TOC entry 267 (class 1259 OID 62198)
-- Name: version_invitations; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.version_invitations (
    id bigint NOT NULL,
    item_type character varying NOT NULL,
    item_id uuid NOT NULL,
    event character varying NOT NULL,
    whodunnit uuid,
    object json,
    object_changes json,
    created_at timestamp without time zone
);


ALTER TABLE public.version_invitations OWNER TO ecope;

--
-- TOC entry 266 (class 1259 OID 62196)
-- Name: version_invitations_id_seq; Type: SEQUENCE; Schema: public; Owner: ecope
--

CREATE SEQUENCE public.version_invitations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.version_invitations_id_seq OWNER TO ecope;

--
-- TOC entry 3796 (class 0 OID 0)
-- Dependencies: 266
-- Name: version_invitations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecope
--

ALTER SEQUENCE public.version_invitations_id_seq OWNED BY public.version_invitations.id;


--
-- TOC entry 269 (class 1259 OID 62210)
-- Name: version_messages; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.version_messages (
    id bigint NOT NULL,
    item_type character varying NOT NULL,
    item_id uuid NOT NULL,
    event character varying NOT NULL,
    whodunnit uuid,
    object json,
    object_changes json,
    created_at timestamp without time zone
);


ALTER TABLE public.version_messages OWNER TO ecope;

--
-- TOC entry 268 (class 1259 OID 62208)
-- Name: version_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: ecope
--

CREATE SEQUENCE public.version_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.version_messages_id_seq OWNER TO ecope;

--
-- TOC entry 3797 (class 0 OID 0)
-- Dependencies: 268
-- Name: version_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecope
--

ALTER SEQUENCE public.version_messages_id_seq OWNED BY public.version_messages.id;


--
-- TOC entry 271 (class 1259 OID 62222)
-- Name: version_notifications; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.version_notifications (
    id bigint NOT NULL,
    item_type character varying NOT NULL,
    item_id uuid NOT NULL,
    event character varying NOT NULL,
    whodunnit uuid,
    object json,
    object_changes json,
    created_at timestamp without time zone
);


ALTER TABLE public.version_notifications OWNER TO ecope;

--
-- TOC entry 270 (class 1259 OID 62220)
-- Name: version_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: ecope
--

CREATE SEQUENCE public.version_notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.version_notifications_id_seq OWNER TO ecope;

--
-- TOC entry 3798 (class 0 OID 0)
-- Dependencies: 270
-- Name: version_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecope
--

ALTER SEQUENCE public.version_notifications_id_seq OWNED BY public.version_notifications.id;


--
-- TOC entry 273 (class 1259 OID 62234)
-- Name: version_notify_settings; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.version_notify_settings (
    id bigint NOT NULL,
    item_type character varying NOT NULL,
    item_id uuid NOT NULL,
    event character varying NOT NULL,
    whodunnit uuid,
    object json,
    object_changes json,
    created_at timestamp without time zone
);


ALTER TABLE public.version_notify_settings OWNER TO ecope;

--
-- TOC entry 272 (class 1259 OID 62232)
-- Name: version_notify_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: ecope
--

CREATE SEQUENCE public.version_notify_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.version_notify_settings_id_seq OWNER TO ecope;

--
-- TOC entry 3799 (class 0 OID 0)
-- Dependencies: 272
-- Name: version_notify_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecope
--

ALTER SEQUENCE public.version_notify_settings_id_seq OWNED BY public.version_notify_settings.id;


--
-- TOC entry 275 (class 1259 OID 62246)
-- Name: version_permissions; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.version_permissions (
    id bigint NOT NULL,
    item_type character varying NOT NULL,
    item_id uuid NOT NULL,
    event character varying NOT NULL,
    whodunnit uuid,
    object json,
    object_changes json,
    created_at timestamp without time zone
);


ALTER TABLE public.version_permissions OWNER TO ecope;

--
-- TOC entry 274 (class 1259 OID 62244)
-- Name: version_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ecope
--

CREATE SEQUENCE public.version_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.version_permissions_id_seq OWNER TO ecope;

--
-- TOC entry 3800 (class 0 OID 0)
-- Dependencies: 274
-- Name: version_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecope
--

ALTER SEQUENCE public.version_permissions_id_seq OWNED BY public.version_permissions.id;


--
-- TOC entry 277 (class 1259 OID 62258)
-- Name: version_remark_templates; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.version_remark_templates (
    id bigint NOT NULL,
    item_type character varying NOT NULL,
    item_id uuid NOT NULL,
    event character varying NOT NULL,
    whodunnit uuid,
    object json,
    object_changes json,
    created_at timestamp without time zone
);


ALTER TABLE public.version_remark_templates OWNER TO ecope;

--
-- TOC entry 276 (class 1259 OID 62256)
-- Name: version_remark_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: ecope
--

CREATE SEQUENCE public.version_remark_templates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.version_remark_templates_id_seq OWNER TO ecope;

--
-- TOC entry 3801 (class 0 OID 0)
-- Dependencies: 276
-- Name: version_remark_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecope
--

ALTER SEQUENCE public.version_remark_templates_id_seq OWNED BY public.version_remark_templates.id;


--
-- TOC entry 279 (class 1259 OID 62270)
-- Name: version_requests; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.version_requests (
    id bigint NOT NULL,
    item_type character varying NOT NULL,
    item_id uuid NOT NULL,
    event character varying NOT NULL,
    whodunnit uuid,
    object json,
    object_changes json,
    created_at timestamp without time zone
);


ALTER TABLE public.version_requests OWNER TO ecope;

--
-- TOC entry 278 (class 1259 OID 62268)
-- Name: version_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: ecope
--

CREATE SEQUENCE public.version_requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.version_requests_id_seq OWNER TO ecope;

--
-- TOC entry 3802 (class 0 OID 0)
-- Dependencies: 278
-- Name: version_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecope
--

ALTER SEQUENCE public.version_requests_id_seq OWNED BY public.version_requests.id;


--
-- TOC entry 281 (class 1259 OID 62282)
-- Name: version_revisions; Type: TABLE; Schema: public; Owner: ecope
--

CREATE TABLE public.version_revisions (
    id bigint NOT NULL,
    item_type character varying NOT NULL,
    item_id uuid NOT NULL,
    event character varying NOT NULL,
    whodunnit uuid,
    object json,
    object_changes json,
    created_at timestamp without time zone
);


ALTER TABLE public.version_revisions OWNER TO ecope;

--
-- TOC entry 280 (class 1259 OID 62280)
-- Name: version_revisions_id_seq; Type: SEQUENCE; Schema: public; Owner: ecope
--

CREATE SEQUENCE public.version_revisions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.version_revisions_id_seq OWNER TO ecope;

--
-- TOC entry 3803 (class 0 OID 0)
-- Dependencies: 280
-- Name: version_revisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecope
--

ALTER SEQUENCE public.version_revisions_id_seq OWNED BY public.version_revisions.id;


--
-- TOC entry 3104 (class 2604 OID 61511)
-- Name: delayed_jobs id; Type: DEFAULT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.delayed_jobs ALTER COLUMN id SET DEFAULT nextval('public.delayed_jobs_id_seq'::regclass);


--
-- TOC entry 3238 (class 2604 OID 62105)
-- Name: version_approvals id; Type: DEFAULT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.version_approvals ALTER COLUMN id SET DEFAULT nextval('public.version_approvals_id_seq'::regclass);


--
-- TOC entry 3239 (class 2604 OID 62117)
-- Name: version_clients id; Type: DEFAULT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.version_clients ALTER COLUMN id SET DEFAULT nextval('public.version_clients_id_seq'::regclass);


--
-- TOC entry 3240 (class 2604 OID 62129)
-- Name: version_companies id; Type: DEFAULT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.version_companies ALTER COLUMN id SET DEFAULT nextval('public.version_companies_id_seq'::regclass);


--
-- TOC entry 3241 (class 2604 OID 62141)
-- Name: version_company_approval_members id; Type: DEFAULT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.version_company_approval_members ALTER COLUMN id SET DEFAULT nextval('public.version_company_approval_members_id_seq'::regclass);


--
-- TOC entry 3242 (class 2604 OID 62153)
-- Name: version_company_settings id; Type: DEFAULT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.version_company_settings ALTER COLUMN id SET DEFAULT nextval('public.version_company_settings_id_seq'::regclass);


--
-- TOC entry 3243 (class 2604 OID 62165)
-- Name: version_customer_users id; Type: DEFAULT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.version_customer_users ALTER COLUMN id SET DEFAULT nextval('public.version_customer_users_id_seq'::regclass);


--
-- TOC entry 3244 (class 2604 OID 62177)
-- Name: version_estimates id; Type: DEFAULT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.version_estimates ALTER COLUMN id SET DEFAULT nextval('public.version_estimates_id_seq'::regclass);


--
-- TOC entry 3245 (class 2604 OID 62189)
-- Name: version_imprints id; Type: DEFAULT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.version_imprints ALTER COLUMN id SET DEFAULT nextval('public.version_imprints_id_seq'::regclass);


--
-- TOC entry 3246 (class 2604 OID 62201)
-- Name: version_invitations id; Type: DEFAULT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.version_invitations ALTER COLUMN id SET DEFAULT nextval('public.version_invitations_id_seq'::regclass);


--
-- TOC entry 3247 (class 2604 OID 62213)
-- Name: version_messages id; Type: DEFAULT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.version_messages ALTER COLUMN id SET DEFAULT nextval('public.version_messages_id_seq'::regclass);


--
-- TOC entry 3248 (class 2604 OID 62225)
-- Name: version_notifications id; Type: DEFAULT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.version_notifications ALTER COLUMN id SET DEFAULT nextval('public.version_notifications_id_seq'::regclass);


--
-- TOC entry 3249 (class 2604 OID 62237)
-- Name: version_notify_settings id; Type: DEFAULT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.version_notify_settings ALTER COLUMN id SET DEFAULT nextval('public.version_notify_settings_id_seq'::regclass);


--
-- TOC entry 3250 (class 2604 OID 62249)
-- Name: version_permissions id; Type: DEFAULT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.version_permissions ALTER COLUMN id SET DEFAULT nextval('public.version_permissions_id_seq'::regclass);


--
-- TOC entry 3251 (class 2604 OID 62261)
-- Name: version_remark_templates id; Type: DEFAULT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.version_remark_templates ALTER COLUMN id SET DEFAULT nextval('public.version_remark_templates_id_seq'::regclass);


--
-- TOC entry 3252 (class 2604 OID 62273)
-- Name: version_requests id; Type: DEFAULT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.version_requests ALTER COLUMN id SET DEFAULT nextval('public.version_requests_id_seq'::regclass);


--
-- TOC entry 3253 (class 2604 OID 62285)
-- Name: version_revisions id; Type: DEFAULT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.version_revisions ALTER COLUMN id SET DEFAULT nextval('public.version_revisions_id_seq'::regclass);


--
-- TOC entry 3697 (class 0 OID 57915)
-- Dependencies: 198
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2021-10-04 11:33:41.60119	2021-10-04 11:33:41.60119
schema_sha1	6854aaee906cd6bf243e17b5893f6af6f15f782d	2021-10-04 11:48:10.365168	2021-10-04 11:48:10.365168
\.


--
-- TOC entry 3698 (class 0 OID 61439)
-- Dependencies: 199
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.clients (id, company_id, ecope_id, ecope_company_id, tenant_id, synced_company_id, synced_setting_at, corporate_number, name, phonetic_guides_of_name, postal_code, prefecture_id, city, street_address, other_address, phone, fax, email, url, representative_name, date_of_establishment, images, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3699 (class 0 OID 61449)
-- Dependencies: 200
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.companies (id, ecope_id, tenant_id, customer_id, corporate_number, name, phonetic_guides_of_name, postal_code, street_address, phone, fax, email, url, representative_name, date_of_establishment, icon, images, created_at, updated_at, city, other_address, prefecture_id) FROM stdin;
\.


--
-- TOC entry 3700 (class 0 OID 61469)
-- Dependencies: 201
-- Data for Name: company_approval_members; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.company_approval_members (id, company_id, created_resource_type, created_resource_id, updated_resource_type, updated_resource_id, staff_name, email, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 3701 (class 0 OID 61482)
-- Dependencies: 202
-- Data for Name: company_settings; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.company_settings (id, company_id, round_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3702 (class 0 OID 61489)
-- Dependencies: 203
-- Data for Name: customer_users; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.customer_users (id, company_id, ecope_id, tenant_id, customer_id, email, uid, name, phone, icon, user_type, aws_cognito_access_tokens, aws_cognito_id_tokens, aws_cognito_refresh_tokens, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, is_manage_all_workplaces, aws_username, deleted_at) FROM stdin;
\.


--
-- TOC entry 3704 (class 0 OID 61508)
-- Dependencies: 205
-- Data for Name: delayed_jobs; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.delayed_jobs (id, priority, attempts, handler, last_error, run_at, locked_at, failed_at, locked_by, queue, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3705 (class 0 OID 61520)
-- Dependencies: 206
-- Data for Name: desired_request_dates; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.desired_request_dates (id, request_estimate_id, date, start_time, end_time, "position", created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3706 (class 0 OID 61527)
-- Dependencies: 207
-- Data for Name: estimate_approval_members; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.estimate_approval_members (id, estimate_id, estimate_approval_status_id, uid, staff_name, email, "position", created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 3707 (class 0 OID 61542)
-- Dependencies: 208
-- Data for Name: estimate_assignments; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.estimate_assignments (id, parent_ownership_id, child_ownership_id, uid, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 3708 (class 0 OID 61554)
-- Dependencies: 209
-- Data for Name: estimate_auth_informations; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.estimate_auth_informations (id, resource_type, resource_id, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3709 (class 0 OID 61565)
-- Dependencies: 210
-- Data for Name: estimate_client_profiles; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.estimate_client_profiles (id, estimate_id, ecope_id, tenant_id, synced_company_id, corporate_number, name, staff_name, phonetic_guides_of_name, postal_code, street_address, phone, fax, email, url, representative_name, date_of_establishment, images, created_at, updated_at, deleted_at, city, other_address, prefecture_id) FROM stdin;
\.


--
-- TOC entry 3710 (class 0 OID 61588)
-- Dependencies: 211
-- Data for Name: estimate_details; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.estimate_details (id, estimate_id, estimate_detail_category_id, tax_kind_id, code, name, qty, unit, unit_price, price, tax_amount, total_price, tax_pct, description, "position", created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 3711 (class 0 OID 61601)
-- Dependencies: 212
-- Data for Name: estimate_files; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.estimate_files (id, estimate_id, file, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 3712 (class 0 OID 61612)
-- Dependencies: 213
-- Data for Name: estimate_owner_profiles; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.estimate_owner_profiles (id, estimate_id, ecope_id, tenant_id, customer_id, corporate_number, name, staff_name, phonetic_guides_of_name, postal_code, street_address, phone, fax, email, url, representative_name, date_of_establishment, icon, images, created_at, updated_at, deleted_at, city, other_address, prefecture_id) FROM stdin;
\.


--
-- TOC entry 3713 (class 0 OID 61636)
-- Dependencies: 214
-- Data for Name: estimate_ownership_revisions; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.estimate_ownership_revisions (id, parent_ownership_id, child_ownership_id, revision_at, current_revision_at, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 3714 (class 0 OID 61645)
-- Dependencies: 215
-- Data for Name: estimate_ownership_status_histories; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.estimate_ownership_status_histories (id, estimate_ownership_id, current_estimate_ownership_status_id, last_estimate_ownership_status_id, last_updated_at, created_at, updated_at, deleted_at, updated_user_type, updated_user_id) FROM stdin;
\.


--
-- TOC entry 3715 (class 0 OID 61655)
-- Dependencies: 216
-- Data for Name: estimate_ownerships; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.estimate_ownerships (id, request_estimate_ownership_id, estimate_id, created_resource_type, created_resource_id, uid, estimate_ownership_status_id, level, created_at, updated_at, deleted_at, sent_type_id, editable_type_id, created_agent_type_id, created_user_type, created_user_id, updated_user_type, updated_user_id) FROM stdin;
\.


--
-- TOC entry 3716 (class 0 OID 61675)
-- Dependencies: 217
-- Data for Name: estimate_pdfs; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.estimate_pdfs (id, estimate_ownership_id, file, title, status, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 3717 (class 0 OID 61686)
-- Dependencies: 218
-- Data for Name: estimates; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.estimates (id, client_id, estimate_type_id, estimate_destination_id, title, uid, code, description, current_created_at, expiration_at, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 3718 (class 0 OID 61700)
-- Dependencies: 219
-- Data for Name: guest_users; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.guest_users (id, resource_type, resource_id, belong_type, belong_id, email, token, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 3719 (class 0 OID 61714)
-- Dependencies: 220
-- Data for Name: history_estimate_approval_members; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.history_estimate_approval_members (id, history_estimate_id, estimate_approval_member_id, estimate_id, estimate_approval_status_id, uid, staff_name, email, "position", created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 3720 (class 0 OID 61728)
-- Dependencies: 221
-- Data for Name: history_estimate_client_profiles; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.history_estimate_client_profiles (id, history_estimate_id, estimate_client_profile_id, estimate_id, ecope_id, tenant_id, synced_company_id, corporate_number, name, staff_name, phonetic_guides_of_name, postal_code, street_address, phone, fax, email, url, representative_name, date_of_establishment, images, created_at, updated_at, deleted_at, city, other_address, prefecture_id) FROM stdin;
\.


--
-- TOC entry 3721 (class 0 OID 61752)
-- Dependencies: 222
-- Data for Name: history_estimate_details; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.history_estimate_details (id, history_estimate_id, estimate_detail_id, estimate_id, estimate_detail_category_id, tax_kind_id, code, name, qty, unit, unit_price, price, tax_amount, total_price, tax_pct, description, "position", created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 3722 (class 0 OID 61766)
-- Dependencies: 223
-- Data for Name: history_estimate_files; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.history_estimate_files (id, history_estimate_id, estimate_file_id, estimate_id, file, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 3723 (class 0 OID 61778)
-- Dependencies: 224
-- Data for Name: history_estimate_imprints; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.history_estimate_imprints (id, history_estimate_id, company_id, file, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 3724 (class 0 OID 61788)
-- Dependencies: 225
-- Data for Name: history_estimate_owner_profiles; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.history_estimate_owner_profiles (id, history_estimate_id, estimate_owner_profile_id, estimate_id, ecope_id, tenant_id, customer_id, corporate_number, name, staff_name, phonetic_guides_of_name, postal_code, street_address, phone, fax, email, url, representative_name, date_of_establishment, icon, images, created_at, updated_at, deleted_at, city, other_address, prefecture_id) FROM stdin;
\.


--
-- TOC entry 3725 (class 0 OID 61813)
-- Dependencies: 226
-- Data for Name: history_estimate_ownerships; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.history_estimate_ownerships (id, history_estimate_id, estimate_ownership_id, request_estimate_ownership_id, estimate_id, created_resource_type, created_resource_id, uid, estimate_ownership_status_id, level, created_at, updated_at, deleted_at, sent_type_id, editable_type_id, created_agent_type_id, created_user_type, created_user_id, updated_user_type, updated_user_id) FROM stdin;
\.


--
-- TOC entry 3726 (class 0 OID 61830)
-- Dependencies: 227
-- Data for Name: history_estimate_pdfs; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.history_estimate_pdfs (id, history_estimate_id, file, title, status, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 3727 (class 0 OID 61841)
-- Dependencies: 228
-- Data for Name: history_estimates; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.history_estimates (id, resource_type, resource_id, changed_user_type, changed_user_id, estimate_id, client_id, estimate_type_id, estimate_destination_id, title, uid, code, description, current_created_at, expiration_at, created_at, updated_at, deleted_at, history_estimate_kind_id, event, object_changes) FROM stdin;
\.


--
-- TOC entry 3728 (class 0 OID 61857)
-- Dependencies: 229
-- Data for Name: history_request_estimates; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.history_request_estimates (id, history_estimate_id, request_estimate_id, customer_user_id, company_id, estimate_destination_id, desired_time_type_id, uid, client_name, title, staff_name, phone, description, postal_code, prefecture_id, address1, address2, address3, deadline_at, collection_cycle_id, request_estimate_type_ids, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 3729 (class 0 OID 61875)
-- Dependencies: 230
-- Data for Name: imprints; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.imprints (id, company_id, file, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3730 (class 0 OID 61885)
-- Dependencies: 231
-- Data for Name: internal_groups; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.internal_groups (id, name, icon, created_at, updated_at) FROM stdin;
7b7cdfdb-81b8-4f67-82f2-f8bdf932a649	Ecope Estimate	\N	2021-10-04 12:15:49.527337	2021-10-04 12:15:49.527337
\.


--
-- TOC entry 3731 (class 0 OID 61894)
-- Dependencies: 232
-- Data for Name: invitations; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.invitations (id, company_id, customer_user_id, email, token, permissions, sent_at, confirmed_at, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 3732 (class 0 OID 61909)
-- Dependencies: 233
-- Data for Name: message_files; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.message_files (id, message_id, file, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3733 (class 0 OID 61919)
-- Dependencies: 234
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.messages (id, resource_type, resource_id, sender_type, sender_id, text, sent_at, created_at, updated_at, is_confirmed) FROM stdin;
\.


--
-- TOC entry 3734 (class 0 OID 61932)
-- Dependencies: 235
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.notifications (id, resource_type, resource_id, receiver_type, receiver_id, sender_type, sender_id, is_confirmed, notification_type_id, sent_at, confirmed_at, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 3735 (class 0 OID 61946)
-- Dependencies: 236
-- Data for Name: notify_settings; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.notify_settings (id, resource_type, resource_id, notification_type_id, sendable, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3736 (class 0 OID 61957)
-- Dependencies: 237
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.permissions (id, permission_type_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3737 (class 0 OID 61963)
-- Dependencies: 238
-- Data for Name: read_messages; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.read_messages (id, message_id, reader_type, reader_id, status, read_at, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 3738 (class 0 OID 61975)
-- Dependencies: 239
-- Data for Name: remark_templates; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.remark_templates (id, resource_type, resource_id, title, text, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 3739 (class 0 OID 61986)
-- Dependencies: 240
-- Data for Name: request_estimate_assignments; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.request_estimate_assignments (id, parent_ownership_id, child_ownership_id, uid, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3740 (class 0 OID 61997)
-- Dependencies: 241
-- Data for Name: request_estimate_files; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.request_estimate_files (id, request_estimate_id, file, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3741 (class 0 OID 62007)
-- Dependencies: 242
-- Data for Name: request_estimate_ownership_groups; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.request_estimate_ownership_groups (id, uid, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3742 (class 0 OID 62016)
-- Dependencies: 243
-- Data for Name: request_estimate_ownership_progresses; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.request_estimate_ownership_progresses (id, request_estimate_ownership_id, sender_resource_type, sender_resource_id, receiver_resource_type, receiver_resource_id, sender_request_progress_id, receiver_request_progress_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3743 (class 0 OID 62029)
-- Dependencies: 244
-- Data for Name: request_estimate_ownerships; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.request_estimate_ownerships (id, request_estimate_id, owner_id, client_id, group_id, uid, request_status_id, level, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3744 (class 0 OID 62042)
-- Dependencies: 245
-- Data for Name: request_estimate_types; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.request_estimate_types (id, request_estimate_id, estimate_type_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3745 (class 0 OID 62049)
-- Dependencies: 246
-- Data for Name: request_estimates; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.request_estimates (id, customer_user_id, company_id, estimate_destination_id, desired_time_type_id, uid, client_name, title, staff_name, phone, description, postal_code, prefecture_id, address1, address2, deadline_at, created_at, updated_at, collection_cycle_id, address3) FROM stdin;
\.


--
-- TOC entry 3696 (class 0 OID 57907)
-- Dependencies: 197
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.schema_migrations (version) FROM stdin;
20200913044229
20200913073201
20200914033210
20201002081314
20201002081949
20201002093309
20201006073124
20201007030010
20201007035130
20201010080045
20201018234024
20201020111710
20201020112345
20201020112532
20201020230942
20201020231012
20201020234221
20201021000958
20201021014926
20201021021556
20201021023421
20201021060809
20201021100419
20201021101215
20201029115462
20201113031144
20201113032423
20201113092232
20201116103455
20201123110315
20201123111225
20201123112928
20201125063026
20201125121005
20201202063708
20201202082552
20201207053804
20201207115616
20201207123432
20201208014303
20201209083703
20201209084628
20201209085159
20201209101104
20201209102307
20201210015239
20201210015636
20201210024133
20201211073050
20201211111240
20201212195412
20201212195413
20201215100756
20201218032614
20201218033203
20201218041923
20201218060738
20201218062610
20201221094242
20201222021724
20201223080805
20210104075233
20210104081365
20210115021216
20210115025250
20210115025413
20210115025525
20210115025757
20210115030121
20210115030428
20210115104802
20210118034359
20210118101623
20210118111365
20210119120046
20210120062333
20210120062915
20210121020716
20210121023227
20210121024328
20210121025053
20210121025830
20210121030458
20210121083248
20210121091365
20210121093488
20210121094694
20210121110124
20210121110355
20210121110583
20210121110584
20210121110585
20210121110599
20210121110612
20210121110646
20210122123905
20210123060158
20210123063401
20210123063923
20210123065219
20210123065351
20210125105543
20210204033427
20210208111034
20210208113603
20210218072855
20210317061708
20210317123456
20210614030337
20210615040131
20210615062434
20210617070425
20210618094857
20210618095513
20210618095800
20210618100010
20210618100247
20210618100422
20210629062043
20210629071744
20210629075021
20210630092758
20210630093337
\.


--
-- TOC entry 3746 (class 0 OID 62068)
-- Dependencies: 247
-- Data for Name: sent_mail_histories; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.sent_mail_histories (id, resource_type, resource_id, content, sent_at, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 3747 (class 0 OID 62079)
-- Dependencies: 248
-- Data for Name: status_comments; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.status_comments (id, resource_type, resource_id, history_type, history_id, created_resource_type, created_resource_id, comment_type_id, text, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 3748 (class 0 OID 62092)
-- Dependencies: 249
-- Data for Name: user_permissions; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.user_permissions (id, customer_user_id, permission_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3750 (class 0 OID 62102)
-- Dependencies: 251
-- Data for Name: version_approvals; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.version_approvals (id, item_type, item_id, event, whodunnit, object, object_changes, created_at) FROM stdin;
\.


--
-- TOC entry 3752 (class 0 OID 62114)
-- Dependencies: 253
-- Data for Name: version_clients; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.version_clients (id, item_type, item_id, event, whodunnit, object, object_changes, created_at) FROM stdin;
\.


--
-- TOC entry 3754 (class 0 OID 62126)
-- Dependencies: 255
-- Data for Name: version_companies; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.version_companies (id, item_type, item_id, event, whodunnit, object, object_changes, created_at) FROM stdin;
\.


--
-- TOC entry 3756 (class 0 OID 62138)
-- Dependencies: 257
-- Data for Name: version_company_approval_members; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.version_company_approval_members (id, item_type, item_id, event, whodunnit, object, object_changes, created_at) FROM stdin;
\.


--
-- TOC entry 3758 (class 0 OID 62150)
-- Dependencies: 259
-- Data for Name: version_company_settings; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.version_company_settings (id, item_type, item_id, event, whodunnit, object, object_changes, created_at) FROM stdin;
\.


--
-- TOC entry 3760 (class 0 OID 62162)
-- Dependencies: 261
-- Data for Name: version_customer_users; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.version_customer_users (id, item_type, item_id, event, whodunnit, object, object_changes, created_at) FROM stdin;
\.


--
-- TOC entry 3762 (class 0 OID 62174)
-- Dependencies: 263
-- Data for Name: version_estimates; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.version_estimates (id, item_type, item_id, event, whodunnit, object, object_changes, created_at) FROM stdin;
\.


--
-- TOC entry 3764 (class 0 OID 62186)
-- Dependencies: 265
-- Data for Name: version_imprints; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.version_imprints (id, item_type, item_id, event, whodunnit, object, object_changes, created_at) FROM stdin;
\.


--
-- TOC entry 3766 (class 0 OID 62198)
-- Dependencies: 267
-- Data for Name: version_invitations; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.version_invitations (id, item_type, item_id, event, whodunnit, object, object_changes, created_at) FROM stdin;
\.


--
-- TOC entry 3768 (class 0 OID 62210)
-- Dependencies: 269
-- Data for Name: version_messages; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.version_messages (id, item_type, item_id, event, whodunnit, object, object_changes, created_at) FROM stdin;
\.


--
-- TOC entry 3770 (class 0 OID 62222)
-- Dependencies: 271
-- Data for Name: version_notifications; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.version_notifications (id, item_type, item_id, event, whodunnit, object, object_changes, created_at) FROM stdin;
\.


--
-- TOC entry 3772 (class 0 OID 62234)
-- Dependencies: 273
-- Data for Name: version_notify_settings; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.version_notify_settings (id, item_type, item_id, event, whodunnit, object, object_changes, created_at) FROM stdin;
\.


--
-- TOC entry 3774 (class 0 OID 62246)
-- Dependencies: 275
-- Data for Name: version_permissions; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.version_permissions (id, item_type, item_id, event, whodunnit, object, object_changes, created_at) FROM stdin;
\.


--
-- TOC entry 3776 (class 0 OID 62258)
-- Dependencies: 277
-- Data for Name: version_remark_templates; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.version_remark_templates (id, item_type, item_id, event, whodunnit, object, object_changes, created_at) FROM stdin;
\.


--
-- TOC entry 3778 (class 0 OID 62270)
-- Dependencies: 279
-- Data for Name: version_requests; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.version_requests (id, item_type, item_id, event, whodunnit, object, object_changes, created_at) FROM stdin;
\.


--
-- TOC entry 3780 (class 0 OID 62282)
-- Dependencies: 281
-- Data for Name: version_revisions; Type: TABLE DATA; Schema: public; Owner: ecope
--

COPY public.version_revisions (id, item_type, item_id, event, whodunnit, object, object_changes, created_at) FROM stdin;
\.


--
-- TOC entry 3804 (class 0 OID 0)
-- Dependencies: 204
-- Name: delayed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecope
--

SELECT pg_catalog.setval('public.delayed_jobs_id_seq', 1, false);


--
-- TOC entry 3805 (class 0 OID 0)
-- Dependencies: 250
-- Name: version_approvals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecope
--

SELECT pg_catalog.setval('public.version_approvals_id_seq', 1, false);


--
-- TOC entry 3806 (class 0 OID 0)
-- Dependencies: 252
-- Name: version_clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecope
--

SELECT pg_catalog.setval('public.version_clients_id_seq', 1, false);


--
-- TOC entry 3807 (class 0 OID 0)
-- Dependencies: 254
-- Name: version_companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecope
--

SELECT pg_catalog.setval('public.version_companies_id_seq', 1, false);


--
-- TOC entry 3808 (class 0 OID 0)
-- Dependencies: 256
-- Name: version_company_approval_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecope
--

SELECT pg_catalog.setval('public.version_company_approval_members_id_seq', 1, false);


--
-- TOC entry 3809 (class 0 OID 0)
-- Dependencies: 258
-- Name: version_company_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecope
--

SELECT pg_catalog.setval('public.version_company_settings_id_seq', 1, false);


--
-- TOC entry 3810 (class 0 OID 0)
-- Dependencies: 260
-- Name: version_customer_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecope
--

SELECT pg_catalog.setval('public.version_customer_users_id_seq', 1, false);


--
-- TOC entry 3811 (class 0 OID 0)
-- Dependencies: 262
-- Name: version_estimates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecope
--

SELECT pg_catalog.setval('public.version_estimates_id_seq', 1, false);


--
-- TOC entry 3812 (class 0 OID 0)
-- Dependencies: 264
-- Name: version_imprints_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecope
--

SELECT pg_catalog.setval('public.version_imprints_id_seq', 1, false);


--
-- TOC entry 3813 (class 0 OID 0)
-- Dependencies: 266
-- Name: version_invitations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecope
--

SELECT pg_catalog.setval('public.version_invitations_id_seq', 1, false);


--
-- TOC entry 3814 (class 0 OID 0)
-- Dependencies: 268
-- Name: version_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecope
--

SELECT pg_catalog.setval('public.version_messages_id_seq', 1, false);


--
-- TOC entry 3815 (class 0 OID 0)
-- Dependencies: 270
-- Name: version_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecope
--

SELECT pg_catalog.setval('public.version_notifications_id_seq', 1, false);


--
-- TOC entry 3816 (class 0 OID 0)
-- Dependencies: 272
-- Name: version_notify_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecope
--

SELECT pg_catalog.setval('public.version_notify_settings_id_seq', 1, false);


--
-- TOC entry 3817 (class 0 OID 0)
-- Dependencies: 274
-- Name: version_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecope
--

SELECT pg_catalog.setval('public.version_permissions_id_seq', 1, false);


--
-- TOC entry 3818 (class 0 OID 0)
-- Dependencies: 276
-- Name: version_remark_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecope
--

SELECT pg_catalog.setval('public.version_remark_templates_id_seq', 1, false);


--
-- TOC entry 3819 (class 0 OID 0)
-- Dependencies: 278
-- Name: version_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecope
--

SELECT pg_catalog.setval('public.version_requests_id_seq', 1, false);


--
-- TOC entry 3820 (class 0 OID 0)
-- Dependencies: 280
-- Name: version_revisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecope
--

SELECT pg_catalog.setval('public.version_revisions_id_seq', 1, false);


--
-- TOC entry 3257 (class 2606 OID 57922)
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- TOC entry 3259 (class 2606 OID 61447)
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- TOC entry 3262 (class 2606 OID 61468)
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- TOC entry 3264 (class 2606 OID 61477)
-- Name: company_approval_members company_approval_members_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.company_approval_members
    ADD CONSTRAINT company_approval_members_pkey PRIMARY KEY (id);


--
-- TOC entry 3270 (class 2606 OID 61487)
-- Name: company_settings company_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.company_settings
    ADD CONSTRAINT company_settings_pkey PRIMARY KEY (id);


--
-- TOC entry 3273 (class 2606 OID 61501)
-- Name: customer_users customer_users_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.customer_users
    ADD CONSTRAINT customer_users_pkey PRIMARY KEY (id);


--
-- TOC entry 3279 (class 2606 OID 61518)
-- Name: delayed_jobs delayed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.delayed_jobs
    ADD CONSTRAINT delayed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 3282 (class 2606 OID 61525)
-- Name: desired_request_dates desired_request_dates_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.desired_request_dates
    ADD CONSTRAINT desired_request_dates_pkey PRIMARY KEY (id);


--
-- TOC entry 3285 (class 2606 OID 61537)
-- Name: estimate_approval_members estimate_approval_members_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.estimate_approval_members
    ADD CONSTRAINT estimate_approval_members_pkey PRIMARY KEY (id);


--
-- TOC entry 3291 (class 2606 OID 61550)
-- Name: estimate_assignments estimate_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.estimate_assignments
    ADD CONSTRAINT estimate_assignments_pkey PRIMARY KEY (id);


--
-- TOC entry 3296 (class 2606 OID 61563)
-- Name: estimate_auth_informations estimate_auth_informations_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.estimate_auth_informations
    ADD CONSTRAINT estimate_auth_informations_pkey PRIMARY KEY (id);


--
-- TOC entry 3299 (class 2606 OID 61585)
-- Name: estimate_client_profiles estimate_client_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.estimate_client_profiles
    ADD CONSTRAINT estimate_client_profiles_pkey PRIMARY KEY (id);


--
-- TOC entry 3303 (class 2606 OID 61598)
-- Name: estimate_details estimate_details_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.estimate_details
    ADD CONSTRAINT estimate_details_pkey PRIMARY KEY (id);


--
-- TOC entry 3307 (class 2606 OID 61609)
-- Name: estimate_files estimate_files_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.estimate_files
    ADD CONSTRAINT estimate_files_pkey PRIMARY KEY (id);


--
-- TOC entry 3311 (class 2606 OID 61633)
-- Name: estimate_owner_profiles estimate_owner_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.estimate_owner_profiles
    ADD CONSTRAINT estimate_owner_profiles_pkey PRIMARY KEY (id);


--
-- TOC entry 3315 (class 2606 OID 61641)
-- Name: estimate_ownership_revisions estimate_ownership_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.estimate_ownership_revisions
    ADD CONSTRAINT estimate_ownership_revisions_pkey PRIMARY KEY (id);


--
-- TOC entry 3320 (class 2606 OID 61653)
-- Name: estimate_ownership_status_histories estimate_ownership_status_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.estimate_ownership_status_histories
    ADD CONSTRAINT estimate_ownership_status_histories_pkey PRIMARY KEY (id);


--
-- TOC entry 3323 (class 2606 OID 61666)
-- Name: estimate_ownerships estimate_ownerships_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.estimate_ownerships
    ADD CONSTRAINT estimate_ownerships_pkey PRIMARY KEY (id);


--
-- TOC entry 3333 (class 2606 OID 61684)
-- Name: estimate_pdfs estimate_pdfs_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.estimate_pdfs
    ADD CONSTRAINT estimate_pdfs_pkey PRIMARY KEY (id);


--
-- TOC entry 3336 (class 2606 OID 61696)
-- Name: estimates estimates_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.estimates
    ADD CONSTRAINT estimates_pkey PRIMARY KEY (id);


--
-- TOC entry 3341 (class 2606 OID 61708)
-- Name: guest_users guest_users_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.guest_users
    ADD CONSTRAINT guest_users_pkey PRIMARY KEY (id);


--
-- TOC entry 3348 (class 2606 OID 61724)
-- Name: history_estimate_approval_members history_estimate_approval_members_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.history_estimate_approval_members
    ADD CONSTRAINT history_estimate_approval_members_pkey PRIMARY KEY (id);


--
-- TOC entry 3353 (class 2606 OID 61748)
-- Name: history_estimate_client_profiles history_estimate_client_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.history_estimate_client_profiles
    ADD CONSTRAINT history_estimate_client_profiles_pkey PRIMARY KEY (id);


--
-- TOC entry 3358 (class 2606 OID 61762)
-- Name: history_estimate_details history_estimate_details_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.history_estimate_details
    ADD CONSTRAINT history_estimate_details_pkey PRIMARY KEY (id);


--
-- TOC entry 3363 (class 2606 OID 61774)
-- Name: history_estimate_files history_estimate_files_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.history_estimate_files
    ADD CONSTRAINT history_estimate_files_pkey PRIMARY KEY (id);


--
-- TOC entry 3368 (class 2606 OID 61786)
-- Name: history_estimate_imprints history_estimate_imprints_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.history_estimate_imprints
    ADD CONSTRAINT history_estimate_imprints_pkey PRIMARY KEY (id);


--
-- TOC entry 3371 (class 2606 OID 61809)
-- Name: history_estimate_owner_profiles history_estimate_owner_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.history_estimate_owner_profiles
    ADD CONSTRAINT history_estimate_owner_profiles_pkey PRIMARY KEY (id);


--
-- TOC entry 3376 (class 2606 OID 61821)
-- Name: history_estimate_ownerships history_estimate_ownerships_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.history_estimate_ownerships
    ADD CONSTRAINT history_estimate_ownerships_pkey PRIMARY KEY (id);


--
-- TOC entry 3386 (class 2606 OID 61839)
-- Name: history_estimate_pdfs history_estimate_pdfs_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.history_estimate_pdfs
    ADD CONSTRAINT history_estimate_pdfs_pkey PRIMARY KEY (id);


--
-- TOC entry 3389 (class 2606 OID 61851)
-- Name: history_estimates history_estimates_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.history_estimates
    ADD CONSTRAINT history_estimates_pkey PRIMARY KEY (id);


--
-- TOC entry 3396 (class 2606 OID 61873)
-- Name: history_request_estimates history_request_estimates_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.history_request_estimates
    ADD CONSTRAINT history_request_estimates_pkey PRIMARY KEY (id);


--
-- TOC entry 3399 (class 2606 OID 61883)
-- Name: imprints imprints_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.imprints
    ADD CONSTRAINT imprints_pkey PRIMARY KEY (id);


--
-- TOC entry 3402 (class 2606 OID 61893)
-- Name: internal_groups internal_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.internal_groups
    ADD CONSTRAINT internal_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 3410 (class 2606 OID 61902)
-- Name: invitations invitations_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.invitations
    ADD CONSTRAINT invitations_pkey PRIMARY KEY (id);


--
-- TOC entry 3413 (class 2606 OID 61917)
-- Name: message_files message_files_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.message_files
    ADD CONSTRAINT message_files_pkey PRIMARY KEY (id);


--
-- TOC entry 3418 (class 2606 OID 61928)
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- TOC entry 3424 (class 2606 OID 61941)
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- TOC entry 3427 (class 2606 OID 61955)
-- Name: notify_settings notify_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.notify_settings
    ADD CONSTRAINT notify_settings_pkey PRIMARY KEY (id);


--
-- TOC entry 3429 (class 2606 OID 61962)
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3434 (class 2606 OID 61971)
-- Name: read_messages read_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.read_messages
    ADD CONSTRAINT read_messages_pkey PRIMARY KEY (id);


--
-- TOC entry 3438 (class 2606 OID 61983)
-- Name: remark_templates remark_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.remark_templates
    ADD CONSTRAINT remark_templates_pkey PRIMARY KEY (id);


--
-- TOC entry 3442 (class 2606 OID 61994)
-- Name: request_estimate_assignments request_estimate_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.request_estimate_assignments
    ADD CONSTRAINT request_estimate_assignments_pkey PRIMARY KEY (id);


--
-- TOC entry 3445 (class 2606 OID 62005)
-- Name: request_estimate_files request_estimate_files_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.request_estimate_files
    ADD CONSTRAINT request_estimate_files_pkey PRIMARY KEY (id);


--
-- TOC entry 3447 (class 2606 OID 62015)
-- Name: request_estimate_ownership_groups request_estimate_ownership_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.request_estimate_ownership_groups
    ADD CONSTRAINT request_estimate_ownership_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 3453 (class 2606 OID 62024)
-- Name: request_estimate_ownership_progresses request_estimate_ownership_progresses_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.request_estimate_ownership_progresses
    ADD CONSTRAINT request_estimate_ownership_progresses_pkey PRIMARY KEY (id);


--
-- TOC entry 3459 (class 2606 OID 62037)
-- Name: request_estimate_ownerships request_estimate_ownerships_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.request_estimate_ownerships
    ADD CONSTRAINT request_estimate_ownerships_pkey PRIMARY KEY (id);


--
-- TOC entry 3462 (class 2606 OID 62047)
-- Name: request_estimate_types request_estimate_types_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.request_estimate_types
    ADD CONSTRAINT request_estimate_types_pkey PRIMARY KEY (id);


--
-- TOC entry 3466 (class 2606 OID 62065)
-- Name: request_estimates request_estimates_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.request_estimates
    ADD CONSTRAINT request_estimates_pkey PRIMARY KEY (id);


--
-- TOC entry 3255 (class 2606 OID 57914)
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 3470 (class 2606 OID 62076)
-- Name: sent_mail_histories sent_mail_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.sent_mail_histories
    ADD CONSTRAINT sent_mail_histories_pkey PRIMARY KEY (id);


--
-- TOC entry 3476 (class 2606 OID 62087)
-- Name: status_comments status_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.status_comments
    ADD CONSTRAINT status_comments_pkey PRIMARY KEY (id);


--
-- TOC entry 3480 (class 2606 OID 62097)
-- Name: user_permissions user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.user_permissions
    ADD CONSTRAINT user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3483 (class 2606 OID 62110)
-- Name: version_approvals version_approvals_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.version_approvals
    ADD CONSTRAINT version_approvals_pkey PRIMARY KEY (id);


--
-- TOC entry 3486 (class 2606 OID 62122)
-- Name: version_clients version_clients_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.version_clients
    ADD CONSTRAINT version_clients_pkey PRIMARY KEY (id);


--
-- TOC entry 3489 (class 2606 OID 62134)
-- Name: version_companies version_companies_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.version_companies
    ADD CONSTRAINT version_companies_pkey PRIMARY KEY (id);


--
-- TOC entry 3492 (class 2606 OID 62146)
-- Name: version_company_approval_members version_company_approval_members_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.version_company_approval_members
    ADD CONSTRAINT version_company_approval_members_pkey PRIMARY KEY (id);


--
-- TOC entry 3495 (class 2606 OID 62158)
-- Name: version_company_settings version_company_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.version_company_settings
    ADD CONSTRAINT version_company_settings_pkey PRIMARY KEY (id);


--
-- TOC entry 3498 (class 2606 OID 62170)
-- Name: version_customer_users version_customer_users_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.version_customer_users
    ADD CONSTRAINT version_customer_users_pkey PRIMARY KEY (id);


--
-- TOC entry 3501 (class 2606 OID 62182)
-- Name: version_estimates version_estimates_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.version_estimates
    ADD CONSTRAINT version_estimates_pkey PRIMARY KEY (id);


--
-- TOC entry 3504 (class 2606 OID 62194)
-- Name: version_imprints version_imprints_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.version_imprints
    ADD CONSTRAINT version_imprints_pkey PRIMARY KEY (id);


--
-- TOC entry 3507 (class 2606 OID 62206)
-- Name: version_invitations version_invitations_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.version_invitations
    ADD CONSTRAINT version_invitations_pkey PRIMARY KEY (id);


--
-- TOC entry 3510 (class 2606 OID 62218)
-- Name: version_messages version_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.version_messages
    ADD CONSTRAINT version_messages_pkey PRIMARY KEY (id);


--
-- TOC entry 3513 (class 2606 OID 62230)
-- Name: version_notifications version_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.version_notifications
    ADD CONSTRAINT version_notifications_pkey PRIMARY KEY (id);


--
-- TOC entry 3516 (class 2606 OID 62242)
-- Name: version_notify_settings version_notify_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.version_notify_settings
    ADD CONSTRAINT version_notify_settings_pkey PRIMARY KEY (id);


--
-- TOC entry 3519 (class 2606 OID 62254)
-- Name: version_permissions version_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.version_permissions
    ADD CONSTRAINT version_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3522 (class 2606 OID 62266)
-- Name: version_remark_templates version_remark_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.version_remark_templates
    ADD CONSTRAINT version_remark_templates_pkey PRIMARY KEY (id);


--
-- TOC entry 3525 (class 2606 OID 62278)
-- Name: version_requests version_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.version_requests
    ADD CONSTRAINT version_requests_pkey PRIMARY KEY (id);


--
-- TOC entry 3528 (class 2606 OID 62290)
-- Name: version_revisions version_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.version_revisions
    ADD CONSTRAINT version_revisions_pkey PRIMARY KEY (id);


--
-- TOC entry 3280 (class 1259 OID 61519)
-- Name: delayed_jobs_priority; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX delayed_jobs_priority ON public.delayed_jobs USING btree (priority, run_at);


--
-- TOC entry 3260 (class 1259 OID 61448)
-- Name: index_clients_on_company_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_clients_on_company_id ON public.clients USING btree (company_id);


--
-- TOC entry 3265 (class 1259 OID 61479)
-- Name: index_company_approval_members_on_c_r_type_and_c_r_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_company_approval_members_on_c_r_type_and_c_r_id ON public.company_approval_members USING btree (created_resource_type, created_resource_id);


--
-- TOC entry 3266 (class 1259 OID 61478)
-- Name: index_company_approval_members_on_company_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_company_approval_members_on_company_id ON public.company_approval_members USING btree (company_id);


--
-- TOC entry 3267 (class 1259 OID 61480)
-- Name: index_company_approval_members_on_deleted_at; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_company_approval_members_on_deleted_at ON public.company_approval_members USING btree (deleted_at);


--
-- TOC entry 3268 (class 1259 OID 61481)
-- Name: index_company_approval_members_on_u_r_type_and_u_r_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_company_approval_members_on_u_r_type_and_u_r_id ON public.company_approval_members USING btree (updated_resource_type, updated_resource_id);


--
-- TOC entry 3271 (class 1259 OID 61488)
-- Name: index_company_settings_on_company_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_company_settings_on_company_id ON public.company_settings USING btree (company_id);


--
-- TOC entry 3274 (class 1259 OID 61502)
-- Name: index_customer_users_on_company_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_customer_users_on_company_id ON public.customer_users USING btree (company_id);


--
-- TOC entry 3275 (class 1259 OID 61503)
-- Name: index_customer_users_on_deleted_at; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_customer_users_on_deleted_at ON public.customer_users USING btree (deleted_at);


--
-- TOC entry 3276 (class 1259 OID 61504)
-- Name: index_customer_users_on_email; Type: INDEX; Schema: public; Owner: ecope
--

CREATE UNIQUE INDEX index_customer_users_on_email ON public.customer_users USING btree (email);


--
-- TOC entry 3277 (class 1259 OID 61505)
-- Name: index_customer_users_on_uid; Type: INDEX; Schema: public; Owner: ecope
--

CREATE UNIQUE INDEX index_customer_users_on_uid ON public.customer_users USING btree (uid);


--
-- TOC entry 3283 (class 1259 OID 61526)
-- Name: index_desired_request_dates_on_request_estimate_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_desired_request_dates_on_request_estimate_id ON public.desired_request_dates USING btree (request_estimate_id);


--
-- TOC entry 3297 (class 1259 OID 61564)
-- Name: index_es_auth_informations_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_es_auth_informations_on_resource_type_and_resource_id ON public.estimate_auth_informations USING btree (resource_type, resource_id);


--
-- TOC entry 3377 (class 1259 OID 61824)
-- Name: index_es_h_ownerships_on_created_user_type_and_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_es_h_ownerships_on_created_user_type_and_id ON public.history_estimate_ownerships USING btree (created_user_type, created_user_id);


--
-- TOC entry 3378 (class 1259 OID 61829)
-- Name: index_es_h_ownerships_on_updated_user_type_and_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_es_h_ownerships_on_updated_user_type_and_id ON public.history_estimate_ownerships USING btree (updated_user_type, updated_user_id);


--
-- TOC entry 3324 (class 1259 OID 61673)
-- Name: index_es_os_status_histories_on_updated_user_type_and_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_es_os_status_histories_on_updated_user_type_and_id ON public.estimate_ownerships USING btree (updated_user_type, updated_user_id);


--
-- TOC entry 3325 (class 1259 OID 61667)
-- Name: index_es_owner_on_created_resource_type_and_created_resource_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_es_owner_on_created_resource_type_and_created_resource_id ON public.estimate_ownerships USING btree (created_resource_type, created_resource_id);


--
-- TOC entry 3321 (class 1259 OID 61654)
-- Name: index_es_ownership_status_histories_on_estimate_ownership_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_es_ownership_status_histories_on_estimate_ownership_id ON public.estimate_ownership_status_histories USING btree (estimate_ownership_id);


--
-- TOC entry 3326 (class 1259 OID 61668)
-- Name: index_es_ownerships_on_created_user_type_and_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_es_ownerships_on_created_user_type_and_id ON public.estimate_ownerships USING btree (created_user_type, created_user_id);


--
-- TOC entry 3327 (class 1259 OID 61674)
-- Name: index_es_ownerships_on_updated_user_type_and_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_es_ownerships_on_updated_user_type_and_id ON public.estimate_ownerships USING btree (updated_user_type, updated_user_id);


--
-- TOC entry 3286 (class 1259 OID 61538)
-- Name: index_estimate_approval_members_on_deleted_at; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_estimate_approval_members_on_deleted_at ON public.estimate_approval_members USING btree (deleted_at);


--
-- TOC entry 3287 (class 1259 OID 61539)
-- Name: index_estimate_approval_members_on_estimate_approval_status_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_estimate_approval_members_on_estimate_approval_status_id ON public.estimate_approval_members USING btree (estimate_approval_status_id);


--
-- TOC entry 3288 (class 1259 OID 61540)
-- Name: index_estimate_approval_members_on_estimate_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_estimate_approval_members_on_estimate_id ON public.estimate_approval_members USING btree (estimate_id);


--
-- TOC entry 3289 (class 1259 OID 61541)
-- Name: index_estimate_approval_members_on_uid; Type: INDEX; Schema: public; Owner: ecope
--

CREATE UNIQUE INDEX index_estimate_approval_members_on_uid ON public.estimate_approval_members USING btree (uid);


--
-- TOC entry 3292 (class 1259 OID 61553)
-- Name: index_estimate_assignments_on_uid; Type: INDEX; Schema: public; Owner: ecope
--

CREATE UNIQUE INDEX index_estimate_assignments_on_uid ON public.estimate_assignments USING btree (uid);


--
-- TOC entry 3300 (class 1259 OID 61586)
-- Name: index_estimate_client_profiles_on_deleted_at; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_estimate_client_profiles_on_deleted_at ON public.estimate_client_profiles USING btree (deleted_at);


--
-- TOC entry 3301 (class 1259 OID 61587)
-- Name: index_estimate_client_profiles_on_estimate_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_estimate_client_profiles_on_estimate_id ON public.estimate_client_profiles USING btree (estimate_id);


--
-- TOC entry 3304 (class 1259 OID 61599)
-- Name: index_estimate_details_on_deleted_at; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_estimate_details_on_deleted_at ON public.estimate_details USING btree (deleted_at);


--
-- TOC entry 3305 (class 1259 OID 61600)
-- Name: index_estimate_details_on_estimate_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_estimate_details_on_estimate_id ON public.estimate_details USING btree (estimate_id);


--
-- TOC entry 3308 (class 1259 OID 61610)
-- Name: index_estimate_files_on_deleted_at; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_estimate_files_on_deleted_at ON public.estimate_files USING btree (deleted_at);


--
-- TOC entry 3309 (class 1259 OID 61611)
-- Name: index_estimate_files_on_estimate_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_estimate_files_on_estimate_id ON public.estimate_files USING btree (estimate_id);


--
-- TOC entry 3312 (class 1259 OID 61634)
-- Name: index_estimate_owner_profiles_on_deleted_at; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_estimate_owner_profiles_on_deleted_at ON public.estimate_owner_profiles USING btree (deleted_at);


--
-- TOC entry 3313 (class 1259 OID 61635)
-- Name: index_estimate_owner_profiles_on_estimate_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_estimate_owner_profiles_on_estimate_id ON public.estimate_owner_profiles USING btree (estimate_id);


--
-- TOC entry 3293 (class 1259 OID 61551)
-- Name: index_estimate_ownership_assignments_on_child_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_estimate_ownership_assignments_on_child_id ON public.estimate_assignments USING btree (child_ownership_id);


--
-- TOC entry 3294 (class 1259 OID 61552)
-- Name: index_estimate_ownership_assignments_on_parent_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_estimate_ownership_assignments_on_parent_id ON public.estimate_assignments USING btree (parent_ownership_id);


--
-- TOC entry 3316 (class 1259 OID 61642)
-- Name: index_estimate_ownership_revisions_on_child_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_estimate_ownership_revisions_on_child_id ON public.estimate_ownership_revisions USING btree (child_ownership_id);


--
-- TOC entry 3317 (class 1259 OID 61643)
-- Name: index_estimate_ownership_revisions_on_parent_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_estimate_ownership_revisions_on_parent_id ON public.estimate_ownership_revisions USING btree (parent_ownership_id);


--
-- TOC entry 3318 (class 1259 OID 61644)
-- Name: index_estimate_ownership_revisions_on_revision_at; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_estimate_ownership_revisions_on_revision_at ON public.estimate_ownership_revisions USING btree (revision_at);


--
-- TOC entry 3328 (class 1259 OID 61669)
-- Name: index_estimate_ownerships_on_deleted_at; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_estimate_ownerships_on_deleted_at ON public.estimate_ownerships USING btree (deleted_at);


--
-- TOC entry 3329 (class 1259 OID 61670)
-- Name: index_estimate_ownerships_on_estimate_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_estimate_ownerships_on_estimate_id ON public.estimate_ownerships USING btree (estimate_id);


--
-- TOC entry 3330 (class 1259 OID 61671)
-- Name: index_estimate_ownerships_on_request_estimate_ownership_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_estimate_ownerships_on_request_estimate_ownership_id ON public.estimate_ownerships USING btree (request_estimate_ownership_id);


--
-- TOC entry 3331 (class 1259 OID 61672)
-- Name: index_estimate_ownerships_on_uid; Type: INDEX; Schema: public; Owner: ecope
--

CREATE UNIQUE INDEX index_estimate_ownerships_on_uid ON public.estimate_ownerships USING btree (uid);


--
-- TOC entry 3334 (class 1259 OID 61685)
-- Name: index_estimate_pdfs_on_estimate_ownership_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_estimate_pdfs_on_estimate_ownership_id ON public.estimate_pdfs USING btree (estimate_ownership_id);


--
-- TOC entry 3337 (class 1259 OID 61697)
-- Name: index_estimates_on_client_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_estimates_on_client_id ON public.estimates USING btree (client_id);


--
-- TOC entry 3338 (class 1259 OID 61698)
-- Name: index_estimates_on_deleted_at; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_estimates_on_deleted_at ON public.estimates USING btree (deleted_at);


--
-- TOC entry 3339 (class 1259 OID 61699)
-- Name: index_estimates_on_uid; Type: INDEX; Schema: public; Owner: ecope
--

CREATE UNIQUE INDEX index_estimates_on_uid ON public.estimates USING btree (uid);


--
-- TOC entry 3342 (class 1259 OID 61709)
-- Name: index_guest_users_on_belong_type_and_belong_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_guest_users_on_belong_type_and_belong_id ON public.guest_users USING btree (belong_type, belong_id);


--
-- TOC entry 3343 (class 1259 OID 61710)
-- Name: index_guest_users_on_deleted_at; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_guest_users_on_deleted_at ON public.guest_users USING btree (deleted_at);


--
-- TOC entry 3344 (class 1259 OID 61711)
-- Name: index_guest_users_on_email; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_guest_users_on_email ON public.guest_users USING btree (email);


--
-- TOC entry 3345 (class 1259 OID 61712)
-- Name: index_guest_users_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_guest_users_on_resource_type_and_resource_id ON public.guest_users USING btree (resource_type, resource_id);


--
-- TOC entry 3346 (class 1259 OID 61713)
-- Name: index_guest_users_on_token; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_guest_users_on_token ON public.guest_users USING btree (token);


--
-- TOC entry 3349 (class 1259 OID 61725)
-- Name: index_history_e_approval_members_on_e_approval_member_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_history_e_approval_members_on_e_approval_member_id ON public.history_estimate_approval_members USING btree (estimate_approval_member_id);


--
-- TOC entry 3354 (class 1259 OID 61749)
-- Name: index_history_e_client_profiles_on_e_client_profile_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_history_e_client_profiles_on_e_client_profile_id ON public.history_estimate_client_profiles USING btree (estimate_client_profile_id);


--
-- TOC entry 3372 (class 1259 OID 61811)
-- Name: index_history_e_owner_profiles_on_e_owner_profile_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_history_e_owner_profiles_on_e_owner_profile_id ON public.history_estimate_owner_profiles USING btree (estimate_owner_profile_id);


--
-- TOC entry 3350 (class 1259 OID 61726)
-- Name: index_history_estimate_approval_members_on_estimate_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_history_estimate_approval_members_on_estimate_id ON public.history_estimate_approval_members USING btree (estimate_id);


--
-- TOC entry 3351 (class 1259 OID 61727)
-- Name: index_history_estimate_approval_members_on_history_estimate_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_history_estimate_approval_members_on_history_estimate_id ON public.history_estimate_approval_members USING btree (history_estimate_id);


--
-- TOC entry 3355 (class 1259 OID 61750)
-- Name: index_history_estimate_client_profiles_on_estimate_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_history_estimate_client_profiles_on_estimate_id ON public.history_estimate_client_profiles USING btree (estimate_id);


--
-- TOC entry 3356 (class 1259 OID 61751)
-- Name: index_history_estimate_client_profiles_on_history_estimate_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_history_estimate_client_profiles_on_history_estimate_id ON public.history_estimate_client_profiles USING btree (history_estimate_id);


--
-- TOC entry 3359 (class 1259 OID 61763)
-- Name: index_history_estimate_details_on_estimate_detail_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_history_estimate_details_on_estimate_detail_id ON public.history_estimate_details USING btree (estimate_detail_id);


--
-- TOC entry 3360 (class 1259 OID 61764)
-- Name: index_history_estimate_details_on_estimate_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_history_estimate_details_on_estimate_id ON public.history_estimate_details USING btree (estimate_id);


--
-- TOC entry 3361 (class 1259 OID 61765)
-- Name: index_history_estimate_details_on_history_estimate_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_history_estimate_details_on_history_estimate_id ON public.history_estimate_details USING btree (history_estimate_id);


--
-- TOC entry 3364 (class 1259 OID 61775)
-- Name: index_history_estimate_files_on_estimate_file_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_history_estimate_files_on_estimate_file_id ON public.history_estimate_files USING btree (estimate_file_id);


--
-- TOC entry 3365 (class 1259 OID 61776)
-- Name: index_history_estimate_files_on_estimate_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_history_estimate_files_on_estimate_id ON public.history_estimate_files USING btree (estimate_id);


--
-- TOC entry 3366 (class 1259 OID 61777)
-- Name: index_history_estimate_files_on_history_estimate_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_history_estimate_files_on_history_estimate_id ON public.history_estimate_files USING btree (history_estimate_id);


--
-- TOC entry 3369 (class 1259 OID 61787)
-- Name: index_history_estimate_imprints_on_history_estimate_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_history_estimate_imprints_on_history_estimate_id ON public.history_estimate_imprints USING btree (history_estimate_id);


--
-- TOC entry 3373 (class 1259 OID 61810)
-- Name: index_history_estimate_owner_profiles_on_estimate_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_history_estimate_owner_profiles_on_estimate_id ON public.history_estimate_owner_profiles USING btree (estimate_id);


--
-- TOC entry 3374 (class 1259 OID 61812)
-- Name: index_history_estimate_owner_profiles_on_history_estimate_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_history_estimate_owner_profiles_on_history_estimate_id ON public.history_estimate_owner_profiles USING btree (history_estimate_id);


--
-- TOC entry 3379 (class 1259 OID 61822)
-- Name: index_history_estimate_ownerships_on_created_resource_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_history_estimate_ownerships_on_created_resource_id ON public.history_estimate_ownerships USING btree (created_resource_id);


--
-- TOC entry 3380 (class 1259 OID 61823)
-- Name: index_history_estimate_ownerships_on_created_resource_type; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_history_estimate_ownerships_on_created_resource_type ON public.history_estimate_ownerships USING btree (created_resource_type);


--
-- TOC entry 3381 (class 1259 OID 61825)
-- Name: index_history_estimate_ownerships_on_estimate_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_history_estimate_ownerships_on_estimate_id ON public.history_estimate_ownerships USING btree (estimate_id);


--
-- TOC entry 3382 (class 1259 OID 61826)
-- Name: index_history_estimate_ownerships_on_estimate_ownership_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_history_estimate_ownerships_on_estimate_ownership_id ON public.history_estimate_ownerships USING btree (estimate_ownership_id);


--
-- TOC entry 3383 (class 1259 OID 61827)
-- Name: index_history_estimate_ownerships_on_history_estimate_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_history_estimate_ownerships_on_history_estimate_id ON public.history_estimate_ownerships USING btree (history_estimate_id);


--
-- TOC entry 3384 (class 1259 OID 61828)
-- Name: index_history_estimate_ownerships_on_r_e_ownership_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_history_estimate_ownerships_on_r_e_ownership_id ON public.history_estimate_ownerships USING btree (request_estimate_ownership_id);


--
-- TOC entry 3387 (class 1259 OID 61840)
-- Name: index_history_estimate_pdfs_on_history_estimate_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_history_estimate_pdfs_on_history_estimate_id ON public.history_estimate_pdfs USING btree (history_estimate_id);


--
-- TOC entry 3390 (class 1259 OID 61852)
-- Name: index_history_estimates_on_changed_u_type_and_changed_u_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_history_estimates_on_changed_u_type_and_changed_u_id ON public.history_estimates USING btree (changed_user_type, changed_user_id);


--
-- TOC entry 3391 (class 1259 OID 61853)
-- Name: index_history_estimates_on_client_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_history_estimates_on_client_id ON public.history_estimates USING btree (client_id);


--
-- TOC entry 3392 (class 1259 OID 61854)
-- Name: index_history_estimates_on_estimate_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_history_estimates_on_estimate_id ON public.history_estimates USING btree (estimate_id);


--
-- TOC entry 3393 (class 1259 OID 61855)
-- Name: index_history_estimates_on_history_estimate_kind_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_history_estimates_on_history_estimate_kind_id ON public.history_estimates USING btree (history_estimate_kind_id);


--
-- TOC entry 3394 (class 1259 OID 61856)
-- Name: index_history_estimates_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_history_estimates_on_resource_type_and_resource_id ON public.history_estimates USING btree (resource_type, resource_id);


--
-- TOC entry 3397 (class 1259 OID 61874)
-- Name: index_history_request_estimates_on_history_estimate_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_history_request_estimates_on_history_estimate_id ON public.history_request_estimates USING btree (history_estimate_id);


--
-- TOC entry 3400 (class 1259 OID 61884)
-- Name: index_imprints_on_company_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_imprints_on_company_id ON public.imprints USING btree (company_id);


--
-- TOC entry 3403 (class 1259 OID 61903)
-- Name: index_invitations_on_company_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_invitations_on_company_id ON public.invitations USING btree (company_id);


--
-- TOC entry 3404 (class 1259 OID 61904)
-- Name: index_invitations_on_customer_user_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_invitations_on_customer_user_id ON public.invitations USING btree (customer_user_id);


--
-- TOC entry 3405 (class 1259 OID 61905)
-- Name: index_invitations_on_deleted_at; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_invitations_on_deleted_at ON public.invitations USING btree (deleted_at);


--
-- TOC entry 3406 (class 1259 OID 61906)
-- Name: index_invitations_on_email; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_invitations_on_email ON public.invitations USING btree (email);


--
-- TOC entry 3407 (class 1259 OID 61907)
-- Name: index_invitations_on_sent_at; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_invitations_on_sent_at ON public.invitations USING btree (sent_at);


--
-- TOC entry 3408 (class 1259 OID 61908)
-- Name: index_invitations_on_token; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_invitations_on_token ON public.invitations USING btree (token);


--
-- TOC entry 3411 (class 1259 OID 61918)
-- Name: index_message_files_on_message_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_message_files_on_message_id ON public.message_files USING btree (message_id);


--
-- TOC entry 3414 (class 1259 OID 61929)
-- Name: index_messages_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_messages_on_resource_type_and_resource_id ON public.messages USING btree (resource_type, resource_id);


--
-- TOC entry 3415 (class 1259 OID 61930)
-- Name: index_messages_on_sender_type_and_sender_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_messages_on_sender_type_and_sender_id ON public.messages USING btree (sender_type, sender_id);


--
-- TOC entry 3416 (class 1259 OID 61931)
-- Name: index_messages_on_sent_at; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_messages_on_sent_at ON public.messages USING btree (sent_at);


--
-- TOC entry 3419 (class 1259 OID 61942)
-- Name: index_notifications_on_receiver_type_and_receiver_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_notifications_on_receiver_type_and_receiver_id ON public.notifications USING btree (receiver_type, receiver_id);


--
-- TOC entry 3420 (class 1259 OID 61943)
-- Name: index_notifications_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_notifications_on_resource_type_and_resource_id ON public.notifications USING btree (resource_type, resource_id);


--
-- TOC entry 3421 (class 1259 OID 61944)
-- Name: index_notifications_on_sender_type_and_sender_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_notifications_on_sender_type_and_sender_id ON public.notifications USING btree (sender_type, sender_id);


--
-- TOC entry 3422 (class 1259 OID 61945)
-- Name: index_notifications_on_sent_at; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_notifications_on_sent_at ON public.notifications USING btree (sent_at);


--
-- TOC entry 3425 (class 1259 OID 61956)
-- Name: index_notify_settings_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_notify_settings_on_resource_type_and_resource_id ON public.notify_settings USING btree (resource_type, resource_id);


--
-- TOC entry 3448 (class 1259 OID 62026)
-- Name: index_r_e_o_progresses_on_r_e_o_id_and_resources_type_and_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE UNIQUE INDEX index_r_e_o_progresses_on_r_e_o_id_and_resources_type_and_id ON public.request_estimate_ownership_progresses USING btree (request_estimate_ownership_id, sender_resource_type, sender_resource_id, receiver_resource_type, receiver_resource_id);


--
-- TOC entry 3449 (class 1259 OID 62027)
-- Name: index_r_e_ownership_progresses_on_r_e_ownership_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_r_e_ownership_progresses_on_r_e_ownership_id ON public.request_estimate_ownership_progresses USING btree (request_estimate_ownership_id);


--
-- TOC entry 3450 (class 1259 OID 62025)
-- Name: index_r_e_ownership_progresses_on_receiver_resource_type_and_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_r_e_ownership_progresses_on_receiver_resource_type_and_id ON public.request_estimate_ownership_progresses USING btree (receiver_resource_type, receiver_resource_id);


--
-- TOC entry 3451 (class 1259 OID 62028)
-- Name: index_r_e_ownership_progresses_on_sender_resource_type_and_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_r_e_ownership_progresses_on_sender_resource_type_and_id ON public.request_estimate_ownership_progresses USING btree (sender_resource_type, sender_resource_id);


--
-- TOC entry 3430 (class 1259 OID 61972)
-- Name: index_read_messages_on_message_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_read_messages_on_message_id ON public.read_messages USING btree (message_id);


--
-- TOC entry 3431 (class 1259 OID 61973)
-- Name: index_read_messages_on_reader_type_and_reader_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_read_messages_on_reader_type_and_reader_id ON public.read_messages USING btree (reader_type, reader_id);


--
-- TOC entry 3432 (class 1259 OID 61974)
-- Name: index_read_messages_on_status_and_read_at; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_read_messages_on_status_and_read_at ON public.read_messages USING btree (status, read_at);


--
-- TOC entry 3435 (class 1259 OID 61984)
-- Name: index_remark_templates_on_deleted_at; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_remark_templates_on_deleted_at ON public.remark_templates USING btree (deleted_at);


--
-- TOC entry 3436 (class 1259 OID 61985)
-- Name: index_remark_templates_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_remark_templates_on_resource_type_and_resource_id ON public.remark_templates USING btree (resource_type, resource_id);


--
-- TOC entry 3443 (class 1259 OID 62006)
-- Name: index_request_estimate_files_on_request_estimate_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_request_estimate_files_on_request_estimate_id ON public.request_estimate_files USING btree (request_estimate_id);


--
-- TOC entry 3439 (class 1259 OID 61995)
-- Name: index_request_estimate_ownership_assignments_on_child_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_request_estimate_ownership_assignments_on_child_id ON public.request_estimate_assignments USING btree (child_ownership_id);


--
-- TOC entry 3440 (class 1259 OID 61996)
-- Name: index_request_estimate_ownership_assignments_on_parent_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_request_estimate_ownership_assignments_on_parent_id ON public.request_estimate_assignments USING btree (parent_ownership_id);


--
-- TOC entry 3454 (class 1259 OID 62038)
-- Name: index_request_estimate_ownerships_on_client_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_request_estimate_ownerships_on_client_id ON public.request_estimate_ownerships USING btree (client_id);


--
-- TOC entry 3455 (class 1259 OID 62039)
-- Name: index_request_estimate_ownerships_on_group_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_request_estimate_ownerships_on_group_id ON public.request_estimate_ownerships USING btree (group_id);


--
-- TOC entry 3456 (class 1259 OID 62040)
-- Name: index_request_estimate_ownerships_on_owner_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_request_estimate_ownerships_on_owner_id ON public.request_estimate_ownerships USING btree (owner_id);


--
-- TOC entry 3457 (class 1259 OID 62041)
-- Name: index_request_estimate_ownerships_on_request_estimate_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_request_estimate_ownerships_on_request_estimate_id ON public.request_estimate_ownerships USING btree (request_estimate_id);


--
-- TOC entry 3460 (class 1259 OID 62048)
-- Name: index_request_estimate_types_on_request_estimate_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_request_estimate_types_on_request_estimate_id ON public.request_estimate_types USING btree (request_estimate_id);


--
-- TOC entry 3463 (class 1259 OID 62066)
-- Name: index_request_estimates_on_company_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_request_estimates_on_company_id ON public.request_estimates USING btree (company_id);


--
-- TOC entry 3464 (class 1259 OID 62067)
-- Name: index_request_estimates_on_customer_user_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_request_estimates_on_customer_user_id ON public.request_estimates USING btree (customer_user_id);


--
-- TOC entry 3467 (class 1259 OID 62077)
-- Name: index_sent_mail_histories_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_sent_mail_histories_on_resource_type_and_resource_id ON public.sent_mail_histories USING btree (resource_type, resource_id);


--
-- TOC entry 3468 (class 1259 OID 62078)
-- Name: index_sent_mail_histories_on_sent_at; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_sent_mail_histories_on_sent_at ON public.sent_mail_histories USING btree (sent_at);


--
-- TOC entry 3471 (class 1259 OID 62088)
-- Name: index_status_comments_on_created_r_type_and_created_r_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_status_comments_on_created_r_type_and_created_r_id ON public.status_comments USING btree (created_resource_type, created_resource_id);


--
-- TOC entry 3472 (class 1259 OID 62089)
-- Name: index_status_comments_on_history_type_and_history_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_status_comments_on_history_type_and_history_id ON public.status_comments USING btree (history_type, history_id);


--
-- TOC entry 3473 (class 1259 OID 62090)
-- Name: index_status_comments_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_status_comments_on_resource_type_and_resource_id ON public.status_comments USING btree (resource_type, resource_id);


--
-- TOC entry 3474 (class 1259 OID 62091)
-- Name: index_status_comments_on_text; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_status_comments_on_text ON public.status_comments USING btree (text);


--
-- TOC entry 3477 (class 1259 OID 62098)
-- Name: index_user_permissions_on_customer_user_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_user_permissions_on_customer_user_id ON public.user_permissions USING btree (customer_user_id);


--
-- TOC entry 3478 (class 1259 OID 62099)
-- Name: index_user_permissions_on_permission_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_user_permissions_on_permission_id ON public.user_permissions USING btree (permission_id);


--
-- TOC entry 3481 (class 1259 OID 62111)
-- Name: index_version_approvals_on_item_type_and_item_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_version_approvals_on_item_type_and_item_id ON public.version_approvals USING btree (item_type, item_id);


--
-- TOC entry 3484 (class 1259 OID 62123)
-- Name: index_version_clients_on_item_type_and_item_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_version_clients_on_item_type_and_item_id ON public.version_clients USING btree (item_type, item_id);


--
-- TOC entry 3487 (class 1259 OID 62135)
-- Name: index_version_companies_on_item_type_and_item_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_version_companies_on_item_type_and_item_id ON public.version_companies USING btree (item_type, item_id);


--
-- TOC entry 3490 (class 1259 OID 62147)
-- Name: index_version_company_approval_members_on_item_type_and_item_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_version_company_approval_members_on_item_type_and_item_id ON public.version_company_approval_members USING btree (item_type, item_id);


--
-- TOC entry 3493 (class 1259 OID 62159)
-- Name: index_version_company_settings_on_item_type_and_item_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_version_company_settings_on_item_type_and_item_id ON public.version_company_settings USING btree (item_type, item_id);


--
-- TOC entry 3496 (class 1259 OID 62171)
-- Name: index_version_customer_users_on_item_type_and_item_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_version_customer_users_on_item_type_and_item_id ON public.version_customer_users USING btree (item_type, item_id);


--
-- TOC entry 3499 (class 1259 OID 62183)
-- Name: index_version_estimates_on_item_type_and_item_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_version_estimates_on_item_type_and_item_id ON public.version_estimates USING btree (item_type, item_id);


--
-- TOC entry 3502 (class 1259 OID 62195)
-- Name: index_version_imprints_on_item_type_and_item_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_version_imprints_on_item_type_and_item_id ON public.version_imprints USING btree (item_type, item_id);


--
-- TOC entry 3505 (class 1259 OID 62207)
-- Name: index_version_invitations_on_item_type_and_item_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_version_invitations_on_item_type_and_item_id ON public.version_invitations USING btree (item_type, item_id);


--
-- TOC entry 3508 (class 1259 OID 62219)
-- Name: index_version_messages_on_item_type_and_item_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_version_messages_on_item_type_and_item_id ON public.version_messages USING btree (item_type, item_id);


--
-- TOC entry 3511 (class 1259 OID 62231)
-- Name: index_version_notifications_on_item_type_and_item_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_version_notifications_on_item_type_and_item_id ON public.version_notifications USING btree (item_type, item_id);


--
-- TOC entry 3514 (class 1259 OID 62243)
-- Name: index_version_notify_settings_on_item_type_and_item_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_version_notify_settings_on_item_type_and_item_id ON public.version_notify_settings USING btree (item_type, item_id);


--
-- TOC entry 3517 (class 1259 OID 62255)
-- Name: index_version_permissions_on_item_type_and_item_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_version_permissions_on_item_type_and_item_id ON public.version_permissions USING btree (item_type, item_id);


--
-- TOC entry 3520 (class 1259 OID 62267)
-- Name: index_version_remark_templates_on_item_type_and_item_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_version_remark_templates_on_item_type_and_item_id ON public.version_remark_templates USING btree (item_type, item_id);


--
-- TOC entry 3523 (class 1259 OID 62279)
-- Name: index_version_requests_on_item_type_and_item_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_version_requests_on_item_type_and_item_id ON public.version_requests USING btree (item_type, item_id);


--
-- TOC entry 3526 (class 1259 OID 62291)
-- Name: index_version_revisions_on_item_type_and_item_id; Type: INDEX; Schema: public; Owner: ecope
--

CREATE INDEX index_version_revisions_on_item_type_and_item_id ON public.version_revisions USING btree (item_type, item_id);


--
-- TOC entry 3546 (class 2606 OID 62377)
-- Name: estimate_pdfs fk_rails_01de12f5be; Type: FK CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.estimate_pdfs
    ADD CONSTRAINT fk_rails_01de12f5be FOREIGN KEY (estimate_ownership_id) REFERENCES public.estimate_ownerships(id);


--
-- TOC entry 3562 (class 2606 OID 62457)
-- Name: request_estimate_assignments fk_rails_04ca658e99; Type: FK CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.request_estimate_assignments
    ADD CONSTRAINT fk_rails_04ca658e99 FOREIGN KEY (child_ownership_id) REFERENCES public.request_estimate_ownerships(id);


--
-- TOC entry 3536 (class 2606 OID 62327)
-- Name: estimate_assignments fk_rails_0a15a5bddd; Type: FK CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.estimate_assignments
    ADD CONSTRAINT fk_rails_0a15a5bddd FOREIGN KEY (parent_ownership_id) REFERENCES public.estimate_ownerships(id);


--
-- TOC entry 3569 (class 2606 OID 62492)
-- Name: request_estimate_ownerships fk_rails_0aa955b14f; Type: FK CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.request_estimate_ownerships
    ADD CONSTRAINT fk_rails_0aa955b14f FOREIGN KEY (request_estimate_id) REFERENCES public.request_estimates(id);


--
-- TOC entry 3541 (class 2606 OID 62352)
-- Name: estimate_ownership_revisions fk_rails_0cbb401cf4; Type: FK CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.estimate_ownership_revisions
    ADD CONSTRAINT fk_rails_0cbb401cf4 FOREIGN KEY (child_ownership_id) REFERENCES public.estimate_ownerships(id);


--
-- TOC entry 3573 (class 2606 OID 62512)
-- Name: user_permissions fk_rails_0f3275a780; Type: FK CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.user_permissions
    ADD CONSTRAINT fk_rails_0f3275a780 FOREIGN KEY (customer_user_id) REFERENCES public.customer_users(id);


--
-- TOC entry 3545 (class 2606 OID 62372)
-- Name: estimate_ownerships fk_rails_196b4c2581; Type: FK CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.estimate_ownerships
    ADD CONSTRAINT fk_rails_196b4c2581 FOREIGN KEY (request_estimate_ownership_id) REFERENCES public.request_estimate_ownerships(id);


--
-- TOC entry 3566 (class 2606 OID 62477)
-- Name: request_estimate_ownerships fk_rails_1b81050746; Type: FK CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.request_estimate_ownerships
    ADD CONSTRAINT fk_rails_1b81050746 FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- TOC entry 3544 (class 2606 OID 62367)
-- Name: estimate_ownerships fk_rails_1ec792b17f; Type: FK CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.estimate_ownerships
    ADD CONSTRAINT fk_rails_1ec792b17f FOREIGN KEY (estimate_id) REFERENCES public.estimates(id);


--
-- TOC entry 3540 (class 2606 OID 62347)
-- Name: estimate_owner_profiles fk_rails_1fbe2c31a3; Type: FK CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.estimate_owner_profiles
    ADD CONSTRAINT fk_rails_1fbe2c31a3 FOREIGN KEY (estimate_id) REFERENCES public.estimates(id);


--
-- TOC entry 3551 (class 2606 OID 62402)
-- Name: history_estimate_files fk_rails_29866e048a; Type: FK CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.history_estimate_files
    ADD CONSTRAINT fk_rails_29866e048a FOREIGN KEY (history_estimate_id) REFERENCES public.history_estimates(id);


--
-- TOC entry 3565 (class 2606 OID 62472)
-- Name: request_estimate_ownership_progresses fk_rails_3ae4d25abb; Type: FK CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.request_estimate_ownership_progresses
    ADD CONSTRAINT fk_rails_3ae4d25abb FOREIGN KEY (request_estimate_ownership_id) REFERENCES public.request_estimate_ownerships(id);


--
-- TOC entry 3561 (class 2606 OID 62452)
-- Name: read_messages fk_rails_41488d1e8c; Type: FK CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.read_messages
    ADD CONSTRAINT fk_rails_41488d1e8c FOREIGN KEY (message_id) REFERENCES public.messages(id);


--
-- TOC entry 3535 (class 2606 OID 62322)
-- Name: estimate_assignments fk_rails_4363073a1b; Type: FK CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.estimate_assignments
    ADD CONSTRAINT fk_rails_4363073a1b FOREIGN KEY (child_ownership_id) REFERENCES public.estimate_ownerships(id);


--
-- TOC entry 3563 (class 2606 OID 62462)
-- Name: request_estimate_assignments fk_rails_49dc38789e; Type: FK CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.request_estimate_assignments
    ADD CONSTRAINT fk_rails_49dc38789e FOREIGN KEY (parent_ownership_id) REFERENCES public.request_estimate_ownerships(id);


--
-- TOC entry 3549 (class 2606 OID 62392)
-- Name: history_estimate_client_profiles fk_rails_4c1fffd095; Type: FK CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.history_estimate_client_profiles
    ADD CONSTRAINT fk_rails_4c1fffd095 FOREIGN KEY (history_estimate_id) REFERENCES public.history_estimates(id);


--
-- TOC entry 3539 (class 2606 OID 62342)
-- Name: estimate_files fk_rails_4e91696d2a; Type: FK CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.estimate_files
    ADD CONSTRAINT fk_rails_4e91696d2a FOREIGN KEY (estimate_id) REFERENCES public.estimates(id);


--
-- TOC entry 3531 (class 2606 OID 62302)
-- Name: company_settings fk_rails_6434bf6768; Type: FK CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.company_settings
    ADD CONSTRAINT fk_rails_6434bf6768 FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- TOC entry 3557 (class 2606 OID 62432)
-- Name: imprints fk_rails_66eeedfe2c; Type: FK CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.imprints
    ADD CONSTRAINT fk_rails_66eeedfe2c FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- TOC entry 3552 (class 2606 OID 62407)
-- Name: history_estimate_imprints fk_rails_694b6da6a1; Type: FK CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.history_estimate_imprints
    ADD CONSTRAINT fk_rails_694b6da6a1 FOREIGN KEY (history_estimate_id) REFERENCES public.history_estimates(id);


--
-- TOC entry 3530 (class 2606 OID 62297)
-- Name: company_approval_members fk_rails_6992533241; Type: FK CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.company_approval_members
    ADD CONSTRAINT fk_rails_6992533241 FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- TOC entry 3567 (class 2606 OID 62482)
-- Name: request_estimate_ownerships fk_rails_6a54b0c57b; Type: FK CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.request_estimate_ownerships
    ADD CONSTRAINT fk_rails_6a54b0c57b FOREIGN KEY (owner_id) REFERENCES public.companies(id);


--
-- TOC entry 3547 (class 2606 OID 62382)
-- Name: estimates fk_rails_6f2e890232; Type: FK CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.estimates
    ADD CONSTRAINT fk_rails_6f2e890232 FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- TOC entry 3532 (class 2606 OID 62307)
-- Name: customer_users fk_rails_792f3ad9b8; Type: FK CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.customer_users
    ADD CONSTRAINT fk_rails_792f3ad9b8 FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- TOC entry 3555 (class 2606 OID 62422)
-- Name: history_estimate_pdfs fk_rails_82400ab6e3; Type: FK CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.history_estimate_pdfs
    ADD CONSTRAINT fk_rails_82400ab6e3 FOREIGN KEY (history_estimate_id) REFERENCES public.history_estimates(id);


--
-- TOC entry 3554 (class 2606 OID 62417)
-- Name: history_estimate_ownerships fk_rails_88a0f4e01d; Type: FK CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.history_estimate_ownerships
    ADD CONSTRAINT fk_rails_88a0f4e01d FOREIGN KEY (history_estimate_id) REFERENCES public.history_estimates(id);


--
-- TOC entry 3538 (class 2606 OID 62337)
-- Name: estimate_details fk_rails_8c8d3301c8; Type: FK CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.estimate_details
    ADD CONSTRAINT fk_rails_8c8d3301c8 FOREIGN KEY (estimate_id) REFERENCES public.estimates(id);


--
-- TOC entry 3548 (class 2606 OID 62387)
-- Name: history_estimate_approval_members fk_rails_8ce923990e; Type: FK CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.history_estimate_approval_members
    ADD CONSTRAINT fk_rails_8ce923990e FOREIGN KEY (history_estimate_id) REFERENCES public.history_estimates(id);


--
-- TOC entry 3533 (class 2606 OID 62312)
-- Name: desired_request_dates fk_rails_9e8a92058d; Type: FK CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.desired_request_dates
    ADD CONSTRAINT fk_rails_9e8a92058d FOREIGN KEY (request_estimate_id) REFERENCES public.request_estimates(id);


--
-- TOC entry 3570 (class 2606 OID 62497)
-- Name: request_estimate_types fk_rails_9e9a100acb; Type: FK CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.request_estimate_types
    ADD CONSTRAINT fk_rails_9e9a100acb FOREIGN KEY (request_estimate_id) REFERENCES public.request_estimates(id);


--
-- TOC entry 3564 (class 2606 OID 62467)
-- Name: request_estimate_files fk_rails_9eaa4de262; Type: FK CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.request_estimate_files
    ADD CONSTRAINT fk_rails_9eaa4de262 FOREIGN KEY (request_estimate_id) REFERENCES public.request_estimates(id);


--
-- TOC entry 3568 (class 2606 OID 62487)
-- Name: request_estimate_ownerships fk_rails_afd674b288; Type: FK CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.request_estimate_ownerships
    ADD CONSTRAINT fk_rails_afd674b288 FOREIGN KEY (group_id) REFERENCES public.request_estimate_ownership_groups(id);


--
-- TOC entry 3572 (class 2606 OID 62507)
-- Name: request_estimates fk_rails_b70d70a1ba; Type: FK CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.request_estimates
    ADD CONSTRAINT fk_rails_b70d70a1ba FOREIGN KEY (customer_user_id) REFERENCES public.customer_users(id);


--
-- TOC entry 3571 (class 2606 OID 62502)
-- Name: request_estimates fk_rails_bcf4abda5e; Type: FK CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.request_estimates
    ADD CONSTRAINT fk_rails_bcf4abda5e FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- TOC entry 3550 (class 2606 OID 62397)
-- Name: history_estimate_details fk_rails_d41d9b168e; Type: FK CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.history_estimate_details
    ADD CONSTRAINT fk_rails_d41d9b168e FOREIGN KEY (history_estimate_id) REFERENCES public.history_estimates(id);


--
-- TOC entry 3556 (class 2606 OID 62427)
-- Name: history_request_estimates fk_rails_d923b96c88; Type: FK CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.history_request_estimates
    ADD CONSTRAINT fk_rails_d923b96c88 FOREIGN KEY (history_estimate_id) REFERENCES public.history_estimates(id);


--
-- TOC entry 3529 (class 2606 OID 62292)
-- Name: clients fk_rails_db0f958971; Type: FK CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT fk_rails_db0f958971 FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- TOC entry 3559 (class 2606 OID 62442)
-- Name: invitations fk_rails_dba0319d76; Type: FK CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.invitations
    ADD CONSTRAINT fk_rails_dba0319d76 FOREIGN KEY (customer_user_id) REFERENCES public.customer_users(id);


--
-- TOC entry 3574 (class 2606 OID 62517)
-- Name: user_permissions fk_rails_e2cb0687d2; Type: FK CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.user_permissions
    ADD CONSTRAINT fk_rails_e2cb0687d2 FOREIGN KEY (permission_id) REFERENCES public.permissions(id);


--
-- TOC entry 3560 (class 2606 OID 62447)
-- Name: message_files fk_rails_e3988361a1; Type: FK CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.message_files
    ADD CONSTRAINT fk_rails_e3988361a1 FOREIGN KEY (message_id) REFERENCES public.messages(id);


--
-- TOC entry 3537 (class 2606 OID 62332)
-- Name: estimate_client_profiles fk_rails_e80c047077; Type: FK CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.estimate_client_profiles
    ADD CONSTRAINT fk_rails_e80c047077 FOREIGN KEY (estimate_id) REFERENCES public.estimates(id);


--
-- TOC entry 3542 (class 2606 OID 62357)
-- Name: estimate_ownership_revisions fk_rails_eaa290fce8; Type: FK CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.estimate_ownership_revisions
    ADD CONSTRAINT fk_rails_eaa290fce8 FOREIGN KEY (parent_ownership_id) REFERENCES public.estimate_ownerships(id);


--
-- TOC entry 3534 (class 2606 OID 62317)
-- Name: estimate_approval_members fk_rails_eb028b47b8; Type: FK CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.estimate_approval_members
    ADD CONSTRAINT fk_rails_eb028b47b8 FOREIGN KEY (estimate_id) REFERENCES public.estimates(id);


--
-- TOC entry 3558 (class 2606 OID 62437)
-- Name: invitations fk_rails_f16e5a18d7; Type: FK CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.invitations
    ADD CONSTRAINT fk_rails_f16e5a18d7 FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- TOC entry 3553 (class 2606 OID 62412)
-- Name: history_estimate_owner_profiles fk_rails_f3cf760a3e; Type: FK CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.history_estimate_owner_profiles
    ADD CONSTRAINT fk_rails_f3cf760a3e FOREIGN KEY (history_estimate_id) REFERENCES public.history_estimates(id);


--
-- TOC entry 3543 (class 2606 OID 62362)
-- Name: estimate_ownership_status_histories fk_rails_fa9c317eab; Type: FK CONSTRAINT; Schema: public; Owner: ecope
--

ALTER TABLE ONLY public.estimate_ownership_status_histories
    ADD CONSTRAINT fk_rails_fa9c317eab FOREIGN KEY (estimate_ownership_id) REFERENCES public.estimate_ownerships(id);


-- Completed on 2021-10-04 12:35:55

--
-- PostgreSQL database dump complete
--

