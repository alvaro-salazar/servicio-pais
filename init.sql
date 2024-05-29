--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0 (Debian 16.0-1.pgdg120+1)
-- Dumped by pg_dump version 16.0 (Debian 16.0-1.pgdg120+1)

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
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64)
);


ALTER TABLE public.admin_event_entity OWNER TO keycloak;

--
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO keycloak;

--
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE public.authentication_execution OWNER TO keycloak;

--
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE public.authentication_flow OWNER TO keycloak;

--
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO keycloak;

--
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO keycloak;

--
-- Name: broker_link; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public.broker_link OWNER TO keycloak;

--
-- Name: client; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client OWNER TO keycloak;

--
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.client_attributes OWNER TO keycloak;

--
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO keycloak;

--
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO keycloak;

--
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO keycloak;

--
-- Name: client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO keycloak;

--
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO keycloak;

--
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO keycloak;

--
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO keycloak;

--
-- Name: client_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    redirect_uri character varying(255),
    state character varying(255),
    "timestamp" integer,
    session_id character varying(36),
    auth_method character varying(255),
    realm_id character varying(255),
    auth_user_id character varying(36),
    current_action character varying(36)
);


ALTER TABLE public.client_session OWNER TO keycloak;

--
-- Name: client_session_auth_status; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_auth_status (
    authenticator character varying(36) NOT NULL,
    status integer,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_auth_status OWNER TO keycloak;

--
-- Name: client_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_note (
    name character varying(255) NOT NULL,
    value character varying(255),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_note OWNER TO keycloak;

--
-- Name: client_session_prot_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_prot_mapper (
    protocol_mapper_id character varying(36) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_prot_mapper OWNER TO keycloak;

--
-- Name: client_session_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_role (
    role_id character varying(255) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_role OWNER TO keycloak;

--
-- Name: client_user_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_user_session_note (
    name character varying(255) NOT NULL,
    value character varying(2048),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_user_session_note OWNER TO keycloak;

--
-- Name: component; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE public.component OWNER TO keycloak;

--
-- Name: component_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.component_config OWNER TO keycloak;

--
-- Name: composite_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO keycloak;

--
-- Name: credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.credential OWNER TO keycloak;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO keycloak;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO keycloak;

--
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO keycloak;

--
-- Name: event_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255),
    details_json_long_value text
);


ALTER TABLE public.event_entity OWNER TO keycloak;

--
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024),
    long_value_hash bytea,
    long_value_hash_lower_case bytea,
    long_value text
);


ALTER TABLE public.fed_user_attribute OWNER TO keycloak;

--
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.fed_user_consent OWNER TO keycloak;

--
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO keycloak;

--
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.fed_user_credential OWNER TO keycloak;

--
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO keycloak;

--
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO keycloak;

--
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO keycloak;

--
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO keycloak;

--
-- Name: federated_user; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO keycloak;

--
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO keycloak;

--
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO keycloak;

--
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL
);


ALTER TABLE public.identity_provider OWNER TO keycloak;

--
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO keycloak;

--
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO keycloak;

--
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO keycloak;

--
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36)
);


ALTER TABLE public.keycloak_group OWNER TO keycloak;

--
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE public.keycloak_role OWNER TO keycloak;

--
-- Name: migration_model; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.migration_model OWNER TO keycloak;

--
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL
);


ALTER TABLE public.offline_client_session OWNER TO keycloak;

--
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.offline_user_session OWNER TO keycloak;

--
-- Name: policy_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.policy_config OWNER TO keycloak;

--
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO keycloak;

--
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO keycloak;

--
-- Name: realm; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL,
    default_role character varying(255)
);


ALTER TABLE public.realm OWNER TO keycloak;

--
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);


ALTER TABLE public.realm_attribute OWNER TO keycloak;

--
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO keycloak;

--
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO keycloak;

--
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO keycloak;

--
-- Name: realm_localizations; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);


ALTER TABLE public.realm_localizations OWNER TO keycloak;

--
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO keycloak;

--
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO keycloak;

--
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO keycloak;

--
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO keycloak;

--
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO keycloak;

--
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE public.required_action_provider OWNER TO keycloak;

--
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO keycloak;

--
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO keycloak;

--
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO keycloak;

--
-- Name: resource_server; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode smallint NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.resource_server OWNER TO keycloak;

--
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE public.resource_server_perm_ticket OWNER TO keycloak;

--
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy smallint,
    logic smallint,
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE public.resource_server_policy OWNER TO keycloak;

--
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_resource OWNER TO keycloak;

--
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO keycloak;

--
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO keycloak;

--
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO keycloak;

--
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO keycloak;

--
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO keycloak;

--
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    long_value_hash bytea,
    long_value_hash_lower_case bytea,
    long_value text
);


ALTER TABLE public.user_attribute OWNER TO keycloak;

--
-- Name: user_consent; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.user_consent OWNER TO keycloak;

--
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO keycloak;

--
-- Name: user_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_entity OWNER TO keycloak;

--
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO keycloak;

--
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO keycloak;

--
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO keycloak;

--
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.user_federation_provider OWNER TO keycloak;

--
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO keycloak;

--
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO keycloak;

--
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO keycloak;

--
-- Name: user_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_session (
    id character varying(36) NOT NULL,
    auth_method character varying(255),
    ip_address character varying(255),
    last_session_refresh integer,
    login_username character varying(255),
    realm_id character varying(255),
    remember_me boolean DEFAULT false NOT NULL,
    started integer,
    user_id character varying(255),
    user_session_state integer,
    broker_session_id character varying(255),
    broker_user_id character varying(255)
);


ALTER TABLE public.user_session OWNER TO keycloak;

--
-- Name: user_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_session_note (
    user_session character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(2048)
);


ALTER TABLE public.user_session_note OWNER TO keycloak;

--
-- Name: username_login_failure; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);


ALTER TABLE public.username_login_failure OWNER TO keycloak;

--
-- Name: web_origins; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO keycloak;

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type) FROM stdin;
\.


--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
\.


--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
fd390421-ce86-4bfc-8d79-9bcc30414ea7	\N	auth-cookie	d9df55b1-c105-4a3c-96cd-8719a1891442	4c0cfb5d-ef68-43cb-b136-87b6695c26ea	2	10	f	\N	\N
b560481b-309e-4dca-b620-49e53d2cd43a	\N	auth-spnego	d9df55b1-c105-4a3c-96cd-8719a1891442	4c0cfb5d-ef68-43cb-b136-87b6695c26ea	3	20	f	\N	\N
679c2368-4ad5-4e2c-8e9e-58bc21fc4916	\N	identity-provider-redirector	d9df55b1-c105-4a3c-96cd-8719a1891442	4c0cfb5d-ef68-43cb-b136-87b6695c26ea	2	25	f	\N	\N
1dfaa186-06a8-4d59-b2d7-ebaf639b2844	\N	\N	d9df55b1-c105-4a3c-96cd-8719a1891442	4c0cfb5d-ef68-43cb-b136-87b6695c26ea	2	30	t	cc894733-12bc-4156-820d-007a82e871e1	\N
ba05d241-7dfa-45d5-8888-5f59ad143738	\N	auth-username-password-form	d9df55b1-c105-4a3c-96cd-8719a1891442	cc894733-12bc-4156-820d-007a82e871e1	0	10	f	\N	\N
2a2d2824-8a34-46e4-b65e-41fb87598f58	\N	\N	d9df55b1-c105-4a3c-96cd-8719a1891442	cc894733-12bc-4156-820d-007a82e871e1	1	20	t	3a346f4d-9a94-4f96-82fc-c3f5aa2906c5	\N
a08314cf-ca94-4e6f-8683-87464d6f0b02	\N	conditional-user-configured	d9df55b1-c105-4a3c-96cd-8719a1891442	3a346f4d-9a94-4f96-82fc-c3f5aa2906c5	0	10	f	\N	\N
41c535f9-9242-4cbd-8645-55142869fca8	\N	auth-otp-form	d9df55b1-c105-4a3c-96cd-8719a1891442	3a346f4d-9a94-4f96-82fc-c3f5aa2906c5	0	20	f	\N	\N
d9b0d9bd-5a26-456f-a7ed-e3c6cf8a370c	\N	direct-grant-validate-username	d9df55b1-c105-4a3c-96cd-8719a1891442	4cdc455e-d53f-4be8-a640-a837e69bbcda	0	10	f	\N	\N
4693c24c-577c-4ecd-8168-57e598fb23bb	\N	direct-grant-validate-password	d9df55b1-c105-4a3c-96cd-8719a1891442	4cdc455e-d53f-4be8-a640-a837e69bbcda	0	20	f	\N	\N
8cf5d574-ea83-4278-a96f-593b8a17d9e9	\N	\N	d9df55b1-c105-4a3c-96cd-8719a1891442	4cdc455e-d53f-4be8-a640-a837e69bbcda	1	30	t	a6f3ec35-25e6-44fe-9ef9-89d4369de54d	\N
c5c42a1e-95a0-457c-95ad-2710d34c33ca	\N	conditional-user-configured	d9df55b1-c105-4a3c-96cd-8719a1891442	a6f3ec35-25e6-44fe-9ef9-89d4369de54d	0	10	f	\N	\N
50804791-cbb7-4fef-9bc6-a636519ef2b8	\N	direct-grant-validate-otp	d9df55b1-c105-4a3c-96cd-8719a1891442	a6f3ec35-25e6-44fe-9ef9-89d4369de54d	0	20	f	\N	\N
7217474c-8077-487c-a2eb-bce438c14964	\N	registration-page-form	d9df55b1-c105-4a3c-96cd-8719a1891442	d80fedf5-08bf-49ae-b033-9762f4de3340	0	10	t	7644762f-f94b-4b65-b932-309487d950bd	\N
8a5ed137-fce3-4d82-9e0a-1e96d3a1674c	\N	registration-user-creation	d9df55b1-c105-4a3c-96cd-8719a1891442	7644762f-f94b-4b65-b932-309487d950bd	0	20	f	\N	\N
ad32c287-bbbf-4300-b056-2d7112a1ac00	\N	registration-password-action	d9df55b1-c105-4a3c-96cd-8719a1891442	7644762f-f94b-4b65-b932-309487d950bd	0	50	f	\N	\N
1df05c06-cc7b-49eb-a8b0-bbc0a2c18c99	\N	registration-recaptcha-action	d9df55b1-c105-4a3c-96cd-8719a1891442	7644762f-f94b-4b65-b932-309487d950bd	3	60	f	\N	\N
69837be4-01bd-4792-8df0-10a27b166ab6	\N	registration-terms-and-conditions	d9df55b1-c105-4a3c-96cd-8719a1891442	7644762f-f94b-4b65-b932-309487d950bd	3	70	f	\N	\N
c84ee7a6-0d75-4ce6-8a90-07a8078cbf30	\N	reset-credentials-choose-user	d9df55b1-c105-4a3c-96cd-8719a1891442	97e5ea14-ba1c-47e3-b761-6abd61d87fd7	0	10	f	\N	\N
0951caad-9322-4d0f-a185-dfaf64443409	\N	reset-credential-email	d9df55b1-c105-4a3c-96cd-8719a1891442	97e5ea14-ba1c-47e3-b761-6abd61d87fd7	0	20	f	\N	\N
5493d627-41ba-41a7-ba4c-f99644468f3c	\N	reset-password	d9df55b1-c105-4a3c-96cd-8719a1891442	97e5ea14-ba1c-47e3-b761-6abd61d87fd7	0	30	f	\N	\N
ed162e0a-09ff-4667-b5b7-efb5a2bf56ff	\N	\N	d9df55b1-c105-4a3c-96cd-8719a1891442	97e5ea14-ba1c-47e3-b761-6abd61d87fd7	1	40	t	cc6312c5-a3c7-4bc2-abbf-0c45eff0b763	\N
42c9c4f6-a31f-4870-8dac-8a773a70e509	\N	conditional-user-configured	d9df55b1-c105-4a3c-96cd-8719a1891442	cc6312c5-a3c7-4bc2-abbf-0c45eff0b763	0	10	f	\N	\N
9b308c4a-9a4f-4ba6-9d54-e7903bfd4fcc	\N	reset-otp	d9df55b1-c105-4a3c-96cd-8719a1891442	cc6312c5-a3c7-4bc2-abbf-0c45eff0b763	0	20	f	\N	\N
3e0787a4-7ce6-44a8-b971-04e99a62700b	\N	client-secret	d9df55b1-c105-4a3c-96cd-8719a1891442	af7b097d-92de-4e7c-ab74-62c415548cbb	2	10	f	\N	\N
4d70a622-bad9-4bd3-99a3-c469dcac6f73	\N	client-jwt	d9df55b1-c105-4a3c-96cd-8719a1891442	af7b097d-92de-4e7c-ab74-62c415548cbb	2	20	f	\N	\N
28f2a1dd-3a21-4283-8cae-2baac2562fdd	\N	client-secret-jwt	d9df55b1-c105-4a3c-96cd-8719a1891442	af7b097d-92de-4e7c-ab74-62c415548cbb	2	30	f	\N	\N
851b0fab-079f-4d7a-83ed-515afc779bae	\N	client-x509	d9df55b1-c105-4a3c-96cd-8719a1891442	af7b097d-92de-4e7c-ab74-62c415548cbb	2	40	f	\N	\N
56d0af6a-0d23-4a22-b9c1-5bbb29eac118	\N	idp-review-profile	d9df55b1-c105-4a3c-96cd-8719a1891442	8d3ad094-b3d5-4274-aff3-9c5b2cf90ffc	0	10	f	\N	727844b8-214b-4514-b7c0-0431332e3bdb
64bed287-9285-45b1-97ec-0ae6e3b97cb7	\N	\N	d9df55b1-c105-4a3c-96cd-8719a1891442	8d3ad094-b3d5-4274-aff3-9c5b2cf90ffc	0	20	t	656c8447-e8a6-4a9a-b4c2-b699d0596bca	\N
6ca4e1cf-3d65-4ea8-9281-c6b0eeb41391	\N	idp-create-user-if-unique	d9df55b1-c105-4a3c-96cd-8719a1891442	656c8447-e8a6-4a9a-b4c2-b699d0596bca	2	10	f	\N	54a724a8-f502-4c52-90fd-fecefb2ba4d9
258cd168-a5e7-4f96-be54-0fa767788e7e	\N	\N	d9df55b1-c105-4a3c-96cd-8719a1891442	656c8447-e8a6-4a9a-b4c2-b699d0596bca	2	20	t	d81841e1-600b-45f5-8fb2-2fb12c09dc8c	\N
174c14e8-cb41-4723-b7ec-9b0d9d69eb82	\N	idp-confirm-link	d9df55b1-c105-4a3c-96cd-8719a1891442	d81841e1-600b-45f5-8fb2-2fb12c09dc8c	0	10	f	\N	\N
c416fa7a-e1de-40db-b9fc-b9c1e4280fca	\N	\N	d9df55b1-c105-4a3c-96cd-8719a1891442	d81841e1-600b-45f5-8fb2-2fb12c09dc8c	0	20	t	69522a77-081b-4ca8-9841-0b14ba3f01aa	\N
e7788126-d17c-45da-9dff-21ede3cc1f38	\N	idp-email-verification	d9df55b1-c105-4a3c-96cd-8719a1891442	69522a77-081b-4ca8-9841-0b14ba3f01aa	2	10	f	\N	\N
5a4b1e3a-0035-4eda-b530-656ed57373ac	\N	\N	d9df55b1-c105-4a3c-96cd-8719a1891442	69522a77-081b-4ca8-9841-0b14ba3f01aa	2	20	t	29740487-8da3-4adf-a24e-2acd2d70908b	\N
3a5a152b-533b-4f6a-9ade-90353dccbd66	\N	idp-username-password-form	d9df55b1-c105-4a3c-96cd-8719a1891442	29740487-8da3-4adf-a24e-2acd2d70908b	0	10	f	\N	\N
ad74ec61-c1fe-4f83-aac6-e7438ae140e6	\N	\N	d9df55b1-c105-4a3c-96cd-8719a1891442	29740487-8da3-4adf-a24e-2acd2d70908b	1	20	t	4358463b-30e0-432e-bd0c-b8a7ea90da3e	\N
8361425c-40bc-4bfd-8b38-98f231763e8c	\N	conditional-user-configured	d9df55b1-c105-4a3c-96cd-8719a1891442	4358463b-30e0-432e-bd0c-b8a7ea90da3e	0	10	f	\N	\N
e4ad53cc-9b0c-4580-bc6d-19789e7d207a	\N	auth-otp-form	d9df55b1-c105-4a3c-96cd-8719a1891442	4358463b-30e0-432e-bd0c-b8a7ea90da3e	0	20	f	\N	\N
c285f01b-a329-4715-9a08-d64554f66152	\N	http-basic-authenticator	d9df55b1-c105-4a3c-96cd-8719a1891442	f96b4fb3-831c-42ee-98d8-e155850c9ec0	0	10	f	\N	\N
08306604-0730-45e0-af72-c50f03888c0c	\N	docker-http-basic-authenticator	d9df55b1-c105-4a3c-96cd-8719a1891442	ec5feac5-7106-47f7-b123-bcf5da16a3d7	0	10	f	\N	\N
85af2c4c-5333-4b22-8d67-85de87edbf25	\N	auth-cookie	51b23642-b8e2-49b1-a277-da115aec56b8	5b1bcbfe-38bf-4f19-87f9-1e591f916369	2	10	f	\N	\N
638bec0a-86e9-45bc-ab09-ce13a1a0b8f5	\N	auth-spnego	51b23642-b8e2-49b1-a277-da115aec56b8	5b1bcbfe-38bf-4f19-87f9-1e591f916369	3	20	f	\N	\N
11aea763-347a-46ea-add6-12f4654cea19	\N	identity-provider-redirector	51b23642-b8e2-49b1-a277-da115aec56b8	5b1bcbfe-38bf-4f19-87f9-1e591f916369	2	25	f	\N	\N
14b2d3fd-e954-497e-9bb2-ff2a1b4713e3	\N	\N	51b23642-b8e2-49b1-a277-da115aec56b8	5b1bcbfe-38bf-4f19-87f9-1e591f916369	2	30	t	8283c743-e52f-4bda-9244-5df173f04151	\N
77eea7a6-8da0-4e1a-8c04-8ec0ec1fc90f	\N	auth-username-password-form	51b23642-b8e2-49b1-a277-da115aec56b8	8283c743-e52f-4bda-9244-5df173f04151	0	10	f	\N	\N
f9c3dec2-a191-4111-91f1-aee8fcfa5d3f	\N	\N	51b23642-b8e2-49b1-a277-da115aec56b8	8283c743-e52f-4bda-9244-5df173f04151	1	20	t	0c223789-0b25-47e4-8424-5c26ef0a8e9e	\N
a1575eeb-67b3-4114-9cd5-018afc29a0e5	\N	conditional-user-configured	51b23642-b8e2-49b1-a277-da115aec56b8	0c223789-0b25-47e4-8424-5c26ef0a8e9e	0	10	f	\N	\N
c3c97f85-07f3-4639-9858-21df72aeffd3	\N	auth-otp-form	51b23642-b8e2-49b1-a277-da115aec56b8	0c223789-0b25-47e4-8424-5c26ef0a8e9e	0	20	f	\N	\N
81a67fa2-88c4-46e5-9ed6-c128e7ebe991	\N	direct-grant-validate-username	51b23642-b8e2-49b1-a277-da115aec56b8	db60fefb-9021-46f5-aefc-af38f5bc5c31	0	10	f	\N	\N
4d781521-726d-4ee9-ac25-b97785a6a600	\N	direct-grant-validate-password	51b23642-b8e2-49b1-a277-da115aec56b8	db60fefb-9021-46f5-aefc-af38f5bc5c31	0	20	f	\N	\N
cef32db0-a8c6-4974-8254-0b7401c4e8a8	\N	\N	51b23642-b8e2-49b1-a277-da115aec56b8	db60fefb-9021-46f5-aefc-af38f5bc5c31	1	30	t	9d17d0b2-0dc1-4cb7-8d9c-ea2014626511	\N
074797c0-d3b7-49ae-9aa1-3741478608e0	\N	conditional-user-configured	51b23642-b8e2-49b1-a277-da115aec56b8	9d17d0b2-0dc1-4cb7-8d9c-ea2014626511	0	10	f	\N	\N
0b0bab57-54a7-4a95-a97f-4f15749883ce	\N	direct-grant-validate-otp	51b23642-b8e2-49b1-a277-da115aec56b8	9d17d0b2-0dc1-4cb7-8d9c-ea2014626511	0	20	f	\N	\N
9a7cf1cf-0b2c-4ea1-8f0c-74c3b8366d6c	\N	registration-page-form	51b23642-b8e2-49b1-a277-da115aec56b8	b2235c60-3371-4a92-a173-9bd7fe31c6ad	0	10	t	0a43bf16-2678-4d27-adea-92867b1b9abd	\N
7e2ec9b9-6bbd-4b1f-b76f-30ef19c55d1f	\N	registration-user-creation	51b23642-b8e2-49b1-a277-da115aec56b8	0a43bf16-2678-4d27-adea-92867b1b9abd	0	20	f	\N	\N
2364b30a-aad9-45eb-ab44-bbae31da4de8	\N	registration-password-action	51b23642-b8e2-49b1-a277-da115aec56b8	0a43bf16-2678-4d27-adea-92867b1b9abd	0	50	f	\N	\N
c2bf8740-090f-4961-8b6d-1ce3cc61a46f	\N	registration-recaptcha-action	51b23642-b8e2-49b1-a277-da115aec56b8	0a43bf16-2678-4d27-adea-92867b1b9abd	3	60	f	\N	\N
1268fba0-887e-4ae6-80a2-34fe0e5c9bf8	\N	registration-terms-and-conditions	51b23642-b8e2-49b1-a277-da115aec56b8	0a43bf16-2678-4d27-adea-92867b1b9abd	3	70	f	\N	\N
4af8cc70-dfae-425a-9e68-abd6d4d6fb26	\N	reset-credentials-choose-user	51b23642-b8e2-49b1-a277-da115aec56b8	2610a3ad-5dc9-419b-a689-17de4a4e8875	0	10	f	\N	\N
34a42c7a-1aa3-47e8-9cfc-edf13ba3c2c5	\N	reset-credential-email	51b23642-b8e2-49b1-a277-da115aec56b8	2610a3ad-5dc9-419b-a689-17de4a4e8875	0	20	f	\N	\N
5bb96fdc-924d-4c53-a51e-99d32d3170db	\N	reset-password	51b23642-b8e2-49b1-a277-da115aec56b8	2610a3ad-5dc9-419b-a689-17de4a4e8875	0	30	f	\N	\N
8f1527c2-0cfb-4005-b51e-4ab3c8ca53bd	\N	\N	51b23642-b8e2-49b1-a277-da115aec56b8	2610a3ad-5dc9-419b-a689-17de4a4e8875	1	40	t	ef1d1148-1fcd-4002-9829-bf45083ef9be	\N
e90d4217-f22e-40ca-b35e-a3b1c87c13e3	\N	conditional-user-configured	51b23642-b8e2-49b1-a277-da115aec56b8	ef1d1148-1fcd-4002-9829-bf45083ef9be	0	10	f	\N	\N
c4ae7c31-3306-4cfd-987b-15e77c2a5717	\N	reset-otp	51b23642-b8e2-49b1-a277-da115aec56b8	ef1d1148-1fcd-4002-9829-bf45083ef9be	0	20	f	\N	\N
b00c81f4-6609-4fae-90d4-30782020f8d1	\N	client-secret	51b23642-b8e2-49b1-a277-da115aec56b8	a9d6aa8a-6e25-468c-a9b1-4e0f9b841470	2	10	f	\N	\N
682dfeb1-335e-445c-80de-e57dfd3c7057	\N	client-jwt	51b23642-b8e2-49b1-a277-da115aec56b8	a9d6aa8a-6e25-468c-a9b1-4e0f9b841470	2	20	f	\N	\N
56cd0ae0-8b2d-40b6-b195-4df308187d80	\N	client-secret-jwt	51b23642-b8e2-49b1-a277-da115aec56b8	a9d6aa8a-6e25-468c-a9b1-4e0f9b841470	2	30	f	\N	\N
57e4d890-5407-4e2c-b337-56a805ba8e54	\N	client-x509	51b23642-b8e2-49b1-a277-da115aec56b8	a9d6aa8a-6e25-468c-a9b1-4e0f9b841470	2	40	f	\N	\N
f53be995-ded1-4904-9e59-bc6387f0c060	\N	idp-review-profile	51b23642-b8e2-49b1-a277-da115aec56b8	668c5393-d3f1-42e1-a2d2-a8752b858e4b	0	10	f	\N	e9c7ed27-824b-433c-836e-f3da306f2a57
9d8e82c0-29a6-4a8a-b611-e3786c322e45	\N	\N	51b23642-b8e2-49b1-a277-da115aec56b8	668c5393-d3f1-42e1-a2d2-a8752b858e4b	0	20	t	ddecb56c-9ef9-4773-b8f6-23b072328caa	\N
18c66f59-00b7-4dc5-9515-5fd850699338	\N	idp-create-user-if-unique	51b23642-b8e2-49b1-a277-da115aec56b8	ddecb56c-9ef9-4773-b8f6-23b072328caa	2	10	f	\N	42e02bb4-582f-4cdc-b56f-2377c6be78c0
07bb37cc-3e3d-49fb-a93b-bbd0a27687e4	\N	\N	51b23642-b8e2-49b1-a277-da115aec56b8	ddecb56c-9ef9-4773-b8f6-23b072328caa	2	20	t	3612a10b-7eb3-4430-bf62-b88cca7399df	\N
7a5a3547-0686-4f8b-9dfb-0b9afc54db72	\N	idp-confirm-link	51b23642-b8e2-49b1-a277-da115aec56b8	3612a10b-7eb3-4430-bf62-b88cca7399df	0	10	f	\N	\N
86cc6246-57ae-4afd-9a82-c16c52d4242d	\N	\N	51b23642-b8e2-49b1-a277-da115aec56b8	3612a10b-7eb3-4430-bf62-b88cca7399df	0	20	t	b404e1c4-d1f8-4c58-a843-de5b5c5c9ff1	\N
b0cb343a-db0c-4e55-a450-727110098cbb	\N	idp-email-verification	51b23642-b8e2-49b1-a277-da115aec56b8	b404e1c4-d1f8-4c58-a843-de5b5c5c9ff1	2	10	f	\N	\N
862727aa-d967-4ef2-9889-963843e32017	\N	\N	51b23642-b8e2-49b1-a277-da115aec56b8	b404e1c4-d1f8-4c58-a843-de5b5c5c9ff1	2	20	t	4bb4c680-3010-4f24-bbd5-8aaed142bcd1	\N
a253a11e-a80b-4885-b82d-3071484336a3	\N	idp-username-password-form	51b23642-b8e2-49b1-a277-da115aec56b8	4bb4c680-3010-4f24-bbd5-8aaed142bcd1	0	10	f	\N	\N
90f3c2c1-a705-4814-94b4-e06c4ac1c393	\N	\N	51b23642-b8e2-49b1-a277-da115aec56b8	4bb4c680-3010-4f24-bbd5-8aaed142bcd1	1	20	t	c8472038-74fc-430f-9c9c-970c5abf23db	\N
82385083-b932-4ec2-8d05-baacc4f12876	\N	conditional-user-configured	51b23642-b8e2-49b1-a277-da115aec56b8	c8472038-74fc-430f-9c9c-970c5abf23db	0	10	f	\N	\N
7ad375c9-4549-4e22-93ea-ac5a548f7ad3	\N	auth-otp-form	51b23642-b8e2-49b1-a277-da115aec56b8	c8472038-74fc-430f-9c9c-970c5abf23db	0	20	f	\N	\N
891b8bae-db1f-49d8-8b73-c7276064f3f3	\N	http-basic-authenticator	51b23642-b8e2-49b1-a277-da115aec56b8	e6a7dc02-3846-4a20-a9ca-bc095fdde502	0	10	f	\N	\N
7d5625ab-faa7-44d3-bd08-0674f40f3cae	\N	docker-http-basic-authenticator	51b23642-b8e2-49b1-a277-da115aec56b8	0294da60-d9c1-429e-8e56-3b089e984910	0	10	f	\N	\N
\.


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
4c0cfb5d-ef68-43cb-b136-87b6695c26ea	browser	browser based authentication	d9df55b1-c105-4a3c-96cd-8719a1891442	basic-flow	t	t
cc894733-12bc-4156-820d-007a82e871e1	forms	Username, password, otp and other auth forms.	d9df55b1-c105-4a3c-96cd-8719a1891442	basic-flow	f	t
3a346f4d-9a94-4f96-82fc-c3f5aa2906c5	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	d9df55b1-c105-4a3c-96cd-8719a1891442	basic-flow	f	t
4cdc455e-d53f-4be8-a640-a837e69bbcda	direct grant	OpenID Connect Resource Owner Grant	d9df55b1-c105-4a3c-96cd-8719a1891442	basic-flow	t	t
a6f3ec35-25e6-44fe-9ef9-89d4369de54d	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	d9df55b1-c105-4a3c-96cd-8719a1891442	basic-flow	f	t
d80fedf5-08bf-49ae-b033-9762f4de3340	registration	registration flow	d9df55b1-c105-4a3c-96cd-8719a1891442	basic-flow	t	t
7644762f-f94b-4b65-b932-309487d950bd	registration form	registration form	d9df55b1-c105-4a3c-96cd-8719a1891442	form-flow	f	t
97e5ea14-ba1c-47e3-b761-6abd61d87fd7	reset credentials	Reset credentials for a user if they forgot their password or something	d9df55b1-c105-4a3c-96cd-8719a1891442	basic-flow	t	t
cc6312c5-a3c7-4bc2-abbf-0c45eff0b763	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	d9df55b1-c105-4a3c-96cd-8719a1891442	basic-flow	f	t
af7b097d-92de-4e7c-ab74-62c415548cbb	clients	Base authentication for clients	d9df55b1-c105-4a3c-96cd-8719a1891442	client-flow	t	t
8d3ad094-b3d5-4274-aff3-9c5b2cf90ffc	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	d9df55b1-c105-4a3c-96cd-8719a1891442	basic-flow	t	t
656c8447-e8a6-4a9a-b4c2-b699d0596bca	User creation or linking	Flow for the existing/non-existing user alternatives	d9df55b1-c105-4a3c-96cd-8719a1891442	basic-flow	f	t
d81841e1-600b-45f5-8fb2-2fb12c09dc8c	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	d9df55b1-c105-4a3c-96cd-8719a1891442	basic-flow	f	t
69522a77-081b-4ca8-9841-0b14ba3f01aa	Account verification options	Method with which to verity the existing account	d9df55b1-c105-4a3c-96cd-8719a1891442	basic-flow	f	t
29740487-8da3-4adf-a24e-2acd2d70908b	Verify Existing Account by Re-authentication	Reauthentication of existing account	d9df55b1-c105-4a3c-96cd-8719a1891442	basic-flow	f	t
4358463b-30e0-432e-bd0c-b8a7ea90da3e	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	d9df55b1-c105-4a3c-96cd-8719a1891442	basic-flow	f	t
f96b4fb3-831c-42ee-98d8-e155850c9ec0	saml ecp	SAML ECP Profile Authentication Flow	d9df55b1-c105-4a3c-96cd-8719a1891442	basic-flow	t	t
ec5feac5-7106-47f7-b123-bcf5da16a3d7	docker auth	Used by Docker clients to authenticate against the IDP	d9df55b1-c105-4a3c-96cd-8719a1891442	basic-flow	t	t
5b1bcbfe-38bf-4f19-87f9-1e591f916369	browser	browser based authentication	51b23642-b8e2-49b1-a277-da115aec56b8	basic-flow	t	t
8283c743-e52f-4bda-9244-5df173f04151	forms	Username, password, otp and other auth forms.	51b23642-b8e2-49b1-a277-da115aec56b8	basic-flow	f	t
0c223789-0b25-47e4-8424-5c26ef0a8e9e	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	51b23642-b8e2-49b1-a277-da115aec56b8	basic-flow	f	t
db60fefb-9021-46f5-aefc-af38f5bc5c31	direct grant	OpenID Connect Resource Owner Grant	51b23642-b8e2-49b1-a277-da115aec56b8	basic-flow	t	t
9d17d0b2-0dc1-4cb7-8d9c-ea2014626511	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	51b23642-b8e2-49b1-a277-da115aec56b8	basic-flow	f	t
b2235c60-3371-4a92-a173-9bd7fe31c6ad	registration	registration flow	51b23642-b8e2-49b1-a277-da115aec56b8	basic-flow	t	t
0a43bf16-2678-4d27-adea-92867b1b9abd	registration form	registration form	51b23642-b8e2-49b1-a277-da115aec56b8	form-flow	f	t
2610a3ad-5dc9-419b-a689-17de4a4e8875	reset credentials	Reset credentials for a user if they forgot their password or something	51b23642-b8e2-49b1-a277-da115aec56b8	basic-flow	t	t
ef1d1148-1fcd-4002-9829-bf45083ef9be	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	51b23642-b8e2-49b1-a277-da115aec56b8	basic-flow	f	t
a9d6aa8a-6e25-468c-a9b1-4e0f9b841470	clients	Base authentication for clients	51b23642-b8e2-49b1-a277-da115aec56b8	client-flow	t	t
668c5393-d3f1-42e1-a2d2-a8752b858e4b	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	51b23642-b8e2-49b1-a277-da115aec56b8	basic-flow	t	t
ddecb56c-9ef9-4773-b8f6-23b072328caa	User creation or linking	Flow for the existing/non-existing user alternatives	51b23642-b8e2-49b1-a277-da115aec56b8	basic-flow	f	t
3612a10b-7eb3-4430-bf62-b88cca7399df	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	51b23642-b8e2-49b1-a277-da115aec56b8	basic-flow	f	t
b404e1c4-d1f8-4c58-a843-de5b5c5c9ff1	Account verification options	Method with which to verity the existing account	51b23642-b8e2-49b1-a277-da115aec56b8	basic-flow	f	t
4bb4c680-3010-4f24-bbd5-8aaed142bcd1	Verify Existing Account by Re-authentication	Reauthentication of existing account	51b23642-b8e2-49b1-a277-da115aec56b8	basic-flow	f	t
c8472038-74fc-430f-9c9c-970c5abf23db	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	51b23642-b8e2-49b1-a277-da115aec56b8	basic-flow	f	t
e6a7dc02-3846-4a20-a9ca-bc095fdde502	saml ecp	SAML ECP Profile Authentication Flow	51b23642-b8e2-49b1-a277-da115aec56b8	basic-flow	t	t
0294da60-d9c1-429e-8e56-3b089e984910	docker auth	Used by Docker clients to authenticate against the IDP	51b23642-b8e2-49b1-a277-da115aec56b8	basic-flow	t	t
\.


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
727844b8-214b-4514-b7c0-0431332e3bdb	review profile config	d9df55b1-c105-4a3c-96cd-8719a1891442
54a724a8-f502-4c52-90fd-fecefb2ba4d9	create unique user config	d9df55b1-c105-4a3c-96cd-8719a1891442
e9c7ed27-824b-433c-836e-f3da306f2a57	review profile config	51b23642-b8e2-49b1-a277-da115aec56b8
42e02bb4-582f-4cdc-b56f-2377c6be78c0	create unique user config	51b23642-b8e2-49b1-a277-da115aec56b8
\.


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
54a724a8-f502-4c52-90fd-fecefb2ba4d9	false	require.password.update.after.registration
727844b8-214b-4514-b7c0-0431332e3bdb	missing	update.profile.on.first.login
42e02bb4-582f-4cdc-b56f-2377c6be78c0	false	require.password.update.after.registration
e9c7ed27-824b-433c-836e-f3da306f2a57	missing	update.profile.on.first.login
\.


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
5dfa53a6-062d-4982-9f98-c6ea224d97bb	t	t	frontend-paises	0	f	rPw4tNNxTyptOeTc20cvjK5P7qtMm9CK	http://localhost:8080	f	http://localhost:8080	f	51b23642-b8e2-49b1-a277-da115aec56b8	openid-connect	-1	t	f	frontend-paises	t	client-secret	http://localhost:8080		\N	t	f	t	f
f91ace5c-70b3-43a8-8194-a2c0edf64b8e	t	f	master-realm	0	f	\N	\N	t	\N	f	d9df55b1-c105-4a3c-96cd-8719a1891442	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
1724038c-2170-4354-b987-7b1297b3cbc3	t	f	account	0	t	\N	/realms/master/account/	f	\N	f	d9df55b1-c105-4a3c-96cd-8719a1891442	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
6095f23e-2031-4527-ad1a-9be0bf6d064a	t	f	account-console	0	t	\N	/realms/master/account/	f	\N	f	d9df55b1-c105-4a3c-96cd-8719a1891442	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
af724032-dd67-4ff4-8ede-da122d6b0829	t	f	broker	0	f	\N	\N	t	\N	f	d9df55b1-c105-4a3c-96cd-8719a1891442	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
ad0b11ac-4631-453a-8703-51591649e59d	t	f	security-admin-console	0	t	\N	/admin/master/console/	f	\N	f	d9df55b1-c105-4a3c-96cd-8719a1891442	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
96304de6-cc86-4938-b460-aaa3b4dcd35e	t	f	admin-cli	0	t	\N	\N	f	\N	f	d9df55b1-c105-4a3c-96cd-8719a1891442	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
40d799c9-e447-4405-8024-f0f0a4f2c067	t	f	paisesapprealm-realm	0	f	\N	\N	t	\N	f	d9df55b1-c105-4a3c-96cd-8719a1891442	\N	0	f	f	paisesapprealm Realm	f	client-secret	\N	\N	\N	t	f	f	f
5d0f2823-006e-4aec-b9e5-05530c4d5629	t	f	realm-management	0	f	\N	\N	t	\N	f	51b23642-b8e2-49b1-a277-da115aec56b8	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
0854564e-3985-4e47-8eb5-b2643e2ed200	t	f	account	0	t	\N	/realms/paisesapprealm/account/	f	\N	f	51b23642-b8e2-49b1-a277-da115aec56b8	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
a1d47433-c1f2-4ef6-b728-1875088a2ae7	t	f	account-console	0	t	\N	/realms/paisesapprealm/account/	f	\N	f	51b23642-b8e2-49b1-a277-da115aec56b8	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
9477d513-035e-4a78-89ca-3a9365f997d5	t	f	broker	0	f	\N	\N	t	\N	f	51b23642-b8e2-49b1-a277-da115aec56b8	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
1796b1b1-2469-4673-8b70-81d0c65e244d	t	f	security-admin-console	0	t	\N	/admin/paisesapprealm/console/	f	\N	f	51b23642-b8e2-49b1-a277-da115aec56b8	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
fa18861a-5e58-4e59-9916-d15f21779187	t	f	admin-cli	0	t	\N	\N	f	\N	f	51b23642-b8e2-49b1-a277-da115aec56b8	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
\.


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_attributes (client_id, name, value) FROM stdin;
1724038c-2170-4354-b987-7b1297b3cbc3	post.logout.redirect.uris	+
6095f23e-2031-4527-ad1a-9be0bf6d064a	post.logout.redirect.uris	+
6095f23e-2031-4527-ad1a-9be0bf6d064a	pkce.code.challenge.method	S256
ad0b11ac-4631-453a-8703-51591649e59d	post.logout.redirect.uris	+
ad0b11ac-4631-453a-8703-51591649e59d	pkce.code.challenge.method	S256
0854564e-3985-4e47-8eb5-b2643e2ed200	post.logout.redirect.uris	+
a1d47433-c1f2-4ef6-b728-1875088a2ae7	post.logout.redirect.uris	+
a1d47433-c1f2-4ef6-b728-1875088a2ae7	pkce.code.challenge.method	S256
1796b1b1-2469-4673-8b70-81d0c65e244d	post.logout.redirect.uris	+
1796b1b1-2469-4673-8b70-81d0c65e244d	pkce.code.challenge.method	S256
5dfa53a6-062d-4982-9f98-c6ea224d97bb	client.secret.creation.time	1716955951
5dfa53a6-062d-4982-9f98-c6ea224d97bb	oauth2.device.authorization.grant.enabled	false
5dfa53a6-062d-4982-9f98-c6ea224d97bb	oidc.ciba.grant.enabled	false
5dfa53a6-062d-4982-9f98-c6ea224d97bb	post.logout.redirect.uris	http://localhost:8080
5dfa53a6-062d-4982-9f98-c6ea224d97bb	backchannel.logout.session.required	true
5dfa53a6-062d-4982-9f98-c6ea224d97bb	backchannel.logout.revoke.offline.tokens	false
5dfa53a6-062d-4982-9f98-c6ea224d97bb	display.on.consent.screen	false
\.


--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
58d5cdfb-ef6a-44b6-90a1-58fea0fb6342	offline_access	d9df55b1-c105-4a3c-96cd-8719a1891442	OpenID Connect built-in scope: offline_access	openid-connect
ee9b2187-9f5d-4745-b877-7594b5e29fbd	role_list	d9df55b1-c105-4a3c-96cd-8719a1891442	SAML role list	saml
c490792d-85b6-42d6-8588-ea121e045e69	profile	d9df55b1-c105-4a3c-96cd-8719a1891442	OpenID Connect built-in scope: profile	openid-connect
7fca4a9c-37b9-4174-9895-99cfa51cbb39	email	d9df55b1-c105-4a3c-96cd-8719a1891442	OpenID Connect built-in scope: email	openid-connect
3b3015ef-ad48-415b-850c-b0a3bac12e73	address	d9df55b1-c105-4a3c-96cd-8719a1891442	OpenID Connect built-in scope: address	openid-connect
64ec2880-4e98-4aeb-b1e5-5320e794b260	phone	d9df55b1-c105-4a3c-96cd-8719a1891442	OpenID Connect built-in scope: phone	openid-connect
43d907ed-a7dd-4ce2-b78f-a15381d4c623	roles	d9df55b1-c105-4a3c-96cd-8719a1891442	OpenID Connect scope for add user roles to the access token	openid-connect
ad114cee-47e5-4d9f-b7e5-ab4a07a7dd42	web-origins	d9df55b1-c105-4a3c-96cd-8719a1891442	OpenID Connect scope for add allowed web origins to the access token	openid-connect
4c048884-6fa7-4170-b098-02f713aaf92a	microprofile-jwt	d9df55b1-c105-4a3c-96cd-8719a1891442	Microprofile - JWT built-in scope	openid-connect
3cbbd487-a8cb-4205-9925-f96ed5639799	acr	d9df55b1-c105-4a3c-96cd-8719a1891442	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
e619eab0-04fb-4ec5-9e16-8b35130912d2	offline_access	51b23642-b8e2-49b1-a277-da115aec56b8	OpenID Connect built-in scope: offline_access	openid-connect
6c40454a-8ab9-4e3a-8647-be5eb1b33022	role_list	51b23642-b8e2-49b1-a277-da115aec56b8	SAML role list	saml
693d6c40-80d4-4c21-ab17-88f02b759235	profile	51b23642-b8e2-49b1-a277-da115aec56b8	OpenID Connect built-in scope: profile	openid-connect
51e7f951-0387-4f50-bd7c-da6cc7c46301	email	51b23642-b8e2-49b1-a277-da115aec56b8	OpenID Connect built-in scope: email	openid-connect
e73d1212-02c3-4a8a-9ca5-de38c5c74d6d	address	51b23642-b8e2-49b1-a277-da115aec56b8	OpenID Connect built-in scope: address	openid-connect
443d1ce4-9e18-4101-b4ed-8f8919714e0d	phone	51b23642-b8e2-49b1-a277-da115aec56b8	OpenID Connect built-in scope: phone	openid-connect
67a65166-f799-4d85-a7df-f6ff85eeac9b	roles	51b23642-b8e2-49b1-a277-da115aec56b8	OpenID Connect scope for add user roles to the access token	openid-connect
addadab8-9e48-40e6-8544-1b4cc51d68a0	web-origins	51b23642-b8e2-49b1-a277-da115aec56b8	OpenID Connect scope for add allowed web origins to the access token	openid-connect
07483a37-bcd1-4924-bac8-2d3b44eb09fc	microprofile-jwt	51b23642-b8e2-49b1-a277-da115aec56b8	Microprofile - JWT built-in scope	openid-connect
5b310fd5-1d5b-49b5-9edb-ecbf171e9ba9	acr	51b23642-b8e2-49b1-a277-da115aec56b8	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
\.


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
58d5cdfb-ef6a-44b6-90a1-58fea0fb6342	true	display.on.consent.screen
58d5cdfb-ef6a-44b6-90a1-58fea0fb6342	${offlineAccessScopeConsentText}	consent.screen.text
ee9b2187-9f5d-4745-b877-7594b5e29fbd	true	display.on.consent.screen
ee9b2187-9f5d-4745-b877-7594b5e29fbd	${samlRoleListScopeConsentText}	consent.screen.text
c490792d-85b6-42d6-8588-ea121e045e69	true	display.on.consent.screen
c490792d-85b6-42d6-8588-ea121e045e69	${profileScopeConsentText}	consent.screen.text
c490792d-85b6-42d6-8588-ea121e045e69	true	include.in.token.scope
7fca4a9c-37b9-4174-9895-99cfa51cbb39	true	display.on.consent.screen
7fca4a9c-37b9-4174-9895-99cfa51cbb39	${emailScopeConsentText}	consent.screen.text
7fca4a9c-37b9-4174-9895-99cfa51cbb39	true	include.in.token.scope
3b3015ef-ad48-415b-850c-b0a3bac12e73	true	display.on.consent.screen
3b3015ef-ad48-415b-850c-b0a3bac12e73	${addressScopeConsentText}	consent.screen.text
3b3015ef-ad48-415b-850c-b0a3bac12e73	true	include.in.token.scope
64ec2880-4e98-4aeb-b1e5-5320e794b260	true	display.on.consent.screen
64ec2880-4e98-4aeb-b1e5-5320e794b260	${phoneScopeConsentText}	consent.screen.text
64ec2880-4e98-4aeb-b1e5-5320e794b260	true	include.in.token.scope
43d907ed-a7dd-4ce2-b78f-a15381d4c623	true	display.on.consent.screen
43d907ed-a7dd-4ce2-b78f-a15381d4c623	${rolesScopeConsentText}	consent.screen.text
43d907ed-a7dd-4ce2-b78f-a15381d4c623	false	include.in.token.scope
ad114cee-47e5-4d9f-b7e5-ab4a07a7dd42	false	display.on.consent.screen
ad114cee-47e5-4d9f-b7e5-ab4a07a7dd42		consent.screen.text
ad114cee-47e5-4d9f-b7e5-ab4a07a7dd42	false	include.in.token.scope
4c048884-6fa7-4170-b098-02f713aaf92a	false	display.on.consent.screen
4c048884-6fa7-4170-b098-02f713aaf92a	true	include.in.token.scope
3cbbd487-a8cb-4205-9925-f96ed5639799	false	display.on.consent.screen
3cbbd487-a8cb-4205-9925-f96ed5639799	false	include.in.token.scope
e619eab0-04fb-4ec5-9e16-8b35130912d2	true	display.on.consent.screen
e619eab0-04fb-4ec5-9e16-8b35130912d2	${offlineAccessScopeConsentText}	consent.screen.text
6c40454a-8ab9-4e3a-8647-be5eb1b33022	true	display.on.consent.screen
6c40454a-8ab9-4e3a-8647-be5eb1b33022	${samlRoleListScopeConsentText}	consent.screen.text
693d6c40-80d4-4c21-ab17-88f02b759235	true	display.on.consent.screen
693d6c40-80d4-4c21-ab17-88f02b759235	${profileScopeConsentText}	consent.screen.text
693d6c40-80d4-4c21-ab17-88f02b759235	true	include.in.token.scope
51e7f951-0387-4f50-bd7c-da6cc7c46301	true	display.on.consent.screen
51e7f951-0387-4f50-bd7c-da6cc7c46301	${emailScopeConsentText}	consent.screen.text
51e7f951-0387-4f50-bd7c-da6cc7c46301	true	include.in.token.scope
e73d1212-02c3-4a8a-9ca5-de38c5c74d6d	true	display.on.consent.screen
e73d1212-02c3-4a8a-9ca5-de38c5c74d6d	${addressScopeConsentText}	consent.screen.text
e73d1212-02c3-4a8a-9ca5-de38c5c74d6d	true	include.in.token.scope
443d1ce4-9e18-4101-b4ed-8f8919714e0d	true	display.on.consent.screen
443d1ce4-9e18-4101-b4ed-8f8919714e0d	${phoneScopeConsentText}	consent.screen.text
443d1ce4-9e18-4101-b4ed-8f8919714e0d	true	include.in.token.scope
67a65166-f799-4d85-a7df-f6ff85eeac9b	true	display.on.consent.screen
67a65166-f799-4d85-a7df-f6ff85eeac9b	${rolesScopeConsentText}	consent.screen.text
67a65166-f799-4d85-a7df-f6ff85eeac9b	false	include.in.token.scope
addadab8-9e48-40e6-8544-1b4cc51d68a0	false	display.on.consent.screen
addadab8-9e48-40e6-8544-1b4cc51d68a0		consent.screen.text
addadab8-9e48-40e6-8544-1b4cc51d68a0	false	include.in.token.scope
07483a37-bcd1-4924-bac8-2d3b44eb09fc	false	display.on.consent.screen
07483a37-bcd1-4924-bac8-2d3b44eb09fc	true	include.in.token.scope
5b310fd5-1d5b-49b5-9edb-ecbf171e9ba9	false	display.on.consent.screen
5b310fd5-1d5b-49b5-9edb-ecbf171e9ba9	false	include.in.token.scope
\.


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
1724038c-2170-4354-b987-7b1297b3cbc3	ad114cee-47e5-4d9f-b7e5-ab4a07a7dd42	t
1724038c-2170-4354-b987-7b1297b3cbc3	43d907ed-a7dd-4ce2-b78f-a15381d4c623	t
1724038c-2170-4354-b987-7b1297b3cbc3	7fca4a9c-37b9-4174-9895-99cfa51cbb39	t
1724038c-2170-4354-b987-7b1297b3cbc3	3cbbd487-a8cb-4205-9925-f96ed5639799	t
1724038c-2170-4354-b987-7b1297b3cbc3	c490792d-85b6-42d6-8588-ea121e045e69	t
1724038c-2170-4354-b987-7b1297b3cbc3	64ec2880-4e98-4aeb-b1e5-5320e794b260	f
1724038c-2170-4354-b987-7b1297b3cbc3	3b3015ef-ad48-415b-850c-b0a3bac12e73	f
1724038c-2170-4354-b987-7b1297b3cbc3	4c048884-6fa7-4170-b098-02f713aaf92a	f
1724038c-2170-4354-b987-7b1297b3cbc3	58d5cdfb-ef6a-44b6-90a1-58fea0fb6342	f
6095f23e-2031-4527-ad1a-9be0bf6d064a	ad114cee-47e5-4d9f-b7e5-ab4a07a7dd42	t
6095f23e-2031-4527-ad1a-9be0bf6d064a	43d907ed-a7dd-4ce2-b78f-a15381d4c623	t
6095f23e-2031-4527-ad1a-9be0bf6d064a	7fca4a9c-37b9-4174-9895-99cfa51cbb39	t
6095f23e-2031-4527-ad1a-9be0bf6d064a	3cbbd487-a8cb-4205-9925-f96ed5639799	t
6095f23e-2031-4527-ad1a-9be0bf6d064a	c490792d-85b6-42d6-8588-ea121e045e69	t
6095f23e-2031-4527-ad1a-9be0bf6d064a	64ec2880-4e98-4aeb-b1e5-5320e794b260	f
6095f23e-2031-4527-ad1a-9be0bf6d064a	3b3015ef-ad48-415b-850c-b0a3bac12e73	f
6095f23e-2031-4527-ad1a-9be0bf6d064a	4c048884-6fa7-4170-b098-02f713aaf92a	f
6095f23e-2031-4527-ad1a-9be0bf6d064a	58d5cdfb-ef6a-44b6-90a1-58fea0fb6342	f
96304de6-cc86-4938-b460-aaa3b4dcd35e	ad114cee-47e5-4d9f-b7e5-ab4a07a7dd42	t
96304de6-cc86-4938-b460-aaa3b4dcd35e	43d907ed-a7dd-4ce2-b78f-a15381d4c623	t
96304de6-cc86-4938-b460-aaa3b4dcd35e	7fca4a9c-37b9-4174-9895-99cfa51cbb39	t
96304de6-cc86-4938-b460-aaa3b4dcd35e	3cbbd487-a8cb-4205-9925-f96ed5639799	t
96304de6-cc86-4938-b460-aaa3b4dcd35e	c490792d-85b6-42d6-8588-ea121e045e69	t
96304de6-cc86-4938-b460-aaa3b4dcd35e	64ec2880-4e98-4aeb-b1e5-5320e794b260	f
96304de6-cc86-4938-b460-aaa3b4dcd35e	3b3015ef-ad48-415b-850c-b0a3bac12e73	f
96304de6-cc86-4938-b460-aaa3b4dcd35e	4c048884-6fa7-4170-b098-02f713aaf92a	f
96304de6-cc86-4938-b460-aaa3b4dcd35e	58d5cdfb-ef6a-44b6-90a1-58fea0fb6342	f
af724032-dd67-4ff4-8ede-da122d6b0829	ad114cee-47e5-4d9f-b7e5-ab4a07a7dd42	t
af724032-dd67-4ff4-8ede-da122d6b0829	43d907ed-a7dd-4ce2-b78f-a15381d4c623	t
af724032-dd67-4ff4-8ede-da122d6b0829	7fca4a9c-37b9-4174-9895-99cfa51cbb39	t
af724032-dd67-4ff4-8ede-da122d6b0829	3cbbd487-a8cb-4205-9925-f96ed5639799	t
af724032-dd67-4ff4-8ede-da122d6b0829	c490792d-85b6-42d6-8588-ea121e045e69	t
af724032-dd67-4ff4-8ede-da122d6b0829	64ec2880-4e98-4aeb-b1e5-5320e794b260	f
af724032-dd67-4ff4-8ede-da122d6b0829	3b3015ef-ad48-415b-850c-b0a3bac12e73	f
af724032-dd67-4ff4-8ede-da122d6b0829	4c048884-6fa7-4170-b098-02f713aaf92a	f
af724032-dd67-4ff4-8ede-da122d6b0829	58d5cdfb-ef6a-44b6-90a1-58fea0fb6342	f
f91ace5c-70b3-43a8-8194-a2c0edf64b8e	ad114cee-47e5-4d9f-b7e5-ab4a07a7dd42	t
f91ace5c-70b3-43a8-8194-a2c0edf64b8e	43d907ed-a7dd-4ce2-b78f-a15381d4c623	t
f91ace5c-70b3-43a8-8194-a2c0edf64b8e	7fca4a9c-37b9-4174-9895-99cfa51cbb39	t
f91ace5c-70b3-43a8-8194-a2c0edf64b8e	3cbbd487-a8cb-4205-9925-f96ed5639799	t
f91ace5c-70b3-43a8-8194-a2c0edf64b8e	c490792d-85b6-42d6-8588-ea121e045e69	t
f91ace5c-70b3-43a8-8194-a2c0edf64b8e	64ec2880-4e98-4aeb-b1e5-5320e794b260	f
f91ace5c-70b3-43a8-8194-a2c0edf64b8e	3b3015ef-ad48-415b-850c-b0a3bac12e73	f
f91ace5c-70b3-43a8-8194-a2c0edf64b8e	4c048884-6fa7-4170-b098-02f713aaf92a	f
f91ace5c-70b3-43a8-8194-a2c0edf64b8e	58d5cdfb-ef6a-44b6-90a1-58fea0fb6342	f
ad0b11ac-4631-453a-8703-51591649e59d	ad114cee-47e5-4d9f-b7e5-ab4a07a7dd42	t
ad0b11ac-4631-453a-8703-51591649e59d	43d907ed-a7dd-4ce2-b78f-a15381d4c623	t
ad0b11ac-4631-453a-8703-51591649e59d	7fca4a9c-37b9-4174-9895-99cfa51cbb39	t
ad0b11ac-4631-453a-8703-51591649e59d	3cbbd487-a8cb-4205-9925-f96ed5639799	t
ad0b11ac-4631-453a-8703-51591649e59d	c490792d-85b6-42d6-8588-ea121e045e69	t
ad0b11ac-4631-453a-8703-51591649e59d	64ec2880-4e98-4aeb-b1e5-5320e794b260	f
ad0b11ac-4631-453a-8703-51591649e59d	3b3015ef-ad48-415b-850c-b0a3bac12e73	f
ad0b11ac-4631-453a-8703-51591649e59d	4c048884-6fa7-4170-b098-02f713aaf92a	f
ad0b11ac-4631-453a-8703-51591649e59d	58d5cdfb-ef6a-44b6-90a1-58fea0fb6342	f
0854564e-3985-4e47-8eb5-b2643e2ed200	5b310fd5-1d5b-49b5-9edb-ecbf171e9ba9	t
0854564e-3985-4e47-8eb5-b2643e2ed200	67a65166-f799-4d85-a7df-f6ff85eeac9b	t
0854564e-3985-4e47-8eb5-b2643e2ed200	693d6c40-80d4-4c21-ab17-88f02b759235	t
0854564e-3985-4e47-8eb5-b2643e2ed200	addadab8-9e48-40e6-8544-1b4cc51d68a0	t
0854564e-3985-4e47-8eb5-b2643e2ed200	51e7f951-0387-4f50-bd7c-da6cc7c46301	t
0854564e-3985-4e47-8eb5-b2643e2ed200	443d1ce4-9e18-4101-b4ed-8f8919714e0d	f
0854564e-3985-4e47-8eb5-b2643e2ed200	e73d1212-02c3-4a8a-9ca5-de38c5c74d6d	f
0854564e-3985-4e47-8eb5-b2643e2ed200	07483a37-bcd1-4924-bac8-2d3b44eb09fc	f
0854564e-3985-4e47-8eb5-b2643e2ed200	e619eab0-04fb-4ec5-9e16-8b35130912d2	f
a1d47433-c1f2-4ef6-b728-1875088a2ae7	5b310fd5-1d5b-49b5-9edb-ecbf171e9ba9	t
a1d47433-c1f2-4ef6-b728-1875088a2ae7	67a65166-f799-4d85-a7df-f6ff85eeac9b	t
a1d47433-c1f2-4ef6-b728-1875088a2ae7	693d6c40-80d4-4c21-ab17-88f02b759235	t
a1d47433-c1f2-4ef6-b728-1875088a2ae7	addadab8-9e48-40e6-8544-1b4cc51d68a0	t
a1d47433-c1f2-4ef6-b728-1875088a2ae7	51e7f951-0387-4f50-bd7c-da6cc7c46301	t
a1d47433-c1f2-4ef6-b728-1875088a2ae7	443d1ce4-9e18-4101-b4ed-8f8919714e0d	f
a1d47433-c1f2-4ef6-b728-1875088a2ae7	e73d1212-02c3-4a8a-9ca5-de38c5c74d6d	f
a1d47433-c1f2-4ef6-b728-1875088a2ae7	07483a37-bcd1-4924-bac8-2d3b44eb09fc	f
a1d47433-c1f2-4ef6-b728-1875088a2ae7	e619eab0-04fb-4ec5-9e16-8b35130912d2	f
fa18861a-5e58-4e59-9916-d15f21779187	5b310fd5-1d5b-49b5-9edb-ecbf171e9ba9	t
fa18861a-5e58-4e59-9916-d15f21779187	67a65166-f799-4d85-a7df-f6ff85eeac9b	t
fa18861a-5e58-4e59-9916-d15f21779187	693d6c40-80d4-4c21-ab17-88f02b759235	t
fa18861a-5e58-4e59-9916-d15f21779187	addadab8-9e48-40e6-8544-1b4cc51d68a0	t
fa18861a-5e58-4e59-9916-d15f21779187	51e7f951-0387-4f50-bd7c-da6cc7c46301	t
fa18861a-5e58-4e59-9916-d15f21779187	443d1ce4-9e18-4101-b4ed-8f8919714e0d	f
fa18861a-5e58-4e59-9916-d15f21779187	e73d1212-02c3-4a8a-9ca5-de38c5c74d6d	f
fa18861a-5e58-4e59-9916-d15f21779187	07483a37-bcd1-4924-bac8-2d3b44eb09fc	f
fa18861a-5e58-4e59-9916-d15f21779187	e619eab0-04fb-4ec5-9e16-8b35130912d2	f
9477d513-035e-4a78-89ca-3a9365f997d5	5b310fd5-1d5b-49b5-9edb-ecbf171e9ba9	t
9477d513-035e-4a78-89ca-3a9365f997d5	67a65166-f799-4d85-a7df-f6ff85eeac9b	t
9477d513-035e-4a78-89ca-3a9365f997d5	693d6c40-80d4-4c21-ab17-88f02b759235	t
9477d513-035e-4a78-89ca-3a9365f997d5	addadab8-9e48-40e6-8544-1b4cc51d68a0	t
9477d513-035e-4a78-89ca-3a9365f997d5	51e7f951-0387-4f50-bd7c-da6cc7c46301	t
9477d513-035e-4a78-89ca-3a9365f997d5	443d1ce4-9e18-4101-b4ed-8f8919714e0d	f
9477d513-035e-4a78-89ca-3a9365f997d5	e73d1212-02c3-4a8a-9ca5-de38c5c74d6d	f
9477d513-035e-4a78-89ca-3a9365f997d5	07483a37-bcd1-4924-bac8-2d3b44eb09fc	f
9477d513-035e-4a78-89ca-3a9365f997d5	e619eab0-04fb-4ec5-9e16-8b35130912d2	f
5d0f2823-006e-4aec-b9e5-05530c4d5629	5b310fd5-1d5b-49b5-9edb-ecbf171e9ba9	t
5d0f2823-006e-4aec-b9e5-05530c4d5629	67a65166-f799-4d85-a7df-f6ff85eeac9b	t
5d0f2823-006e-4aec-b9e5-05530c4d5629	693d6c40-80d4-4c21-ab17-88f02b759235	t
5d0f2823-006e-4aec-b9e5-05530c4d5629	addadab8-9e48-40e6-8544-1b4cc51d68a0	t
5d0f2823-006e-4aec-b9e5-05530c4d5629	51e7f951-0387-4f50-bd7c-da6cc7c46301	t
5d0f2823-006e-4aec-b9e5-05530c4d5629	443d1ce4-9e18-4101-b4ed-8f8919714e0d	f
5d0f2823-006e-4aec-b9e5-05530c4d5629	e73d1212-02c3-4a8a-9ca5-de38c5c74d6d	f
5d0f2823-006e-4aec-b9e5-05530c4d5629	07483a37-bcd1-4924-bac8-2d3b44eb09fc	f
5d0f2823-006e-4aec-b9e5-05530c4d5629	e619eab0-04fb-4ec5-9e16-8b35130912d2	f
1796b1b1-2469-4673-8b70-81d0c65e244d	5b310fd5-1d5b-49b5-9edb-ecbf171e9ba9	t
1796b1b1-2469-4673-8b70-81d0c65e244d	67a65166-f799-4d85-a7df-f6ff85eeac9b	t
1796b1b1-2469-4673-8b70-81d0c65e244d	693d6c40-80d4-4c21-ab17-88f02b759235	t
1796b1b1-2469-4673-8b70-81d0c65e244d	addadab8-9e48-40e6-8544-1b4cc51d68a0	t
1796b1b1-2469-4673-8b70-81d0c65e244d	51e7f951-0387-4f50-bd7c-da6cc7c46301	t
1796b1b1-2469-4673-8b70-81d0c65e244d	443d1ce4-9e18-4101-b4ed-8f8919714e0d	f
1796b1b1-2469-4673-8b70-81d0c65e244d	e73d1212-02c3-4a8a-9ca5-de38c5c74d6d	f
1796b1b1-2469-4673-8b70-81d0c65e244d	07483a37-bcd1-4924-bac8-2d3b44eb09fc	f
1796b1b1-2469-4673-8b70-81d0c65e244d	e619eab0-04fb-4ec5-9e16-8b35130912d2	f
5dfa53a6-062d-4982-9f98-c6ea224d97bb	5b310fd5-1d5b-49b5-9edb-ecbf171e9ba9	t
5dfa53a6-062d-4982-9f98-c6ea224d97bb	67a65166-f799-4d85-a7df-f6ff85eeac9b	t
5dfa53a6-062d-4982-9f98-c6ea224d97bb	693d6c40-80d4-4c21-ab17-88f02b759235	t
5dfa53a6-062d-4982-9f98-c6ea224d97bb	addadab8-9e48-40e6-8544-1b4cc51d68a0	t
5dfa53a6-062d-4982-9f98-c6ea224d97bb	51e7f951-0387-4f50-bd7c-da6cc7c46301	t
5dfa53a6-062d-4982-9f98-c6ea224d97bb	443d1ce4-9e18-4101-b4ed-8f8919714e0d	f
5dfa53a6-062d-4982-9f98-c6ea224d97bb	e73d1212-02c3-4a8a-9ca5-de38c5c74d6d	f
5dfa53a6-062d-4982-9f98-c6ea224d97bb	07483a37-bcd1-4924-bac8-2d3b44eb09fc	f
5dfa53a6-062d-4982-9f98-c6ea224d97bb	e619eab0-04fb-4ec5-9e16-8b35130912d2	f
\.


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
58d5cdfb-ef6a-44b6-90a1-58fea0fb6342	b30dac96-d59c-49ca-a4ca-35e36e957933
e619eab0-04fb-4ec5-9e16-8b35130912d2	85472bac-0393-40c8-a5e9-b06a15c1ce24
\.


--
-- Data for Name: client_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session (id, client_id, redirect_uri, state, "timestamp", session_id, auth_method, realm_id, auth_user_id, current_action) FROM stdin;
\.


--
-- Data for Name: client_session_auth_status; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_auth_status (authenticator, status, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_prot_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_prot_mapper (protocol_mapper_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_role (role_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_user_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_user_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
f132f157-8d7e-49d8-8ce9-9e16586c03f1	Trusted Hosts	d9df55b1-c105-4a3c-96cd-8719a1891442	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	d9df55b1-c105-4a3c-96cd-8719a1891442	anonymous
104cbbb2-118f-4743-b04a-ad9562fe0253	Consent Required	d9df55b1-c105-4a3c-96cd-8719a1891442	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	d9df55b1-c105-4a3c-96cd-8719a1891442	anonymous
80393260-dc17-4e06-9d6d-2157062cfbcb	Full Scope Disabled	d9df55b1-c105-4a3c-96cd-8719a1891442	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	d9df55b1-c105-4a3c-96cd-8719a1891442	anonymous
4b058f7d-e5fb-4e2c-a7d9-99b9b2f9c139	Max Clients Limit	d9df55b1-c105-4a3c-96cd-8719a1891442	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	d9df55b1-c105-4a3c-96cd-8719a1891442	anonymous
94de0f80-02d6-4569-b7b6-d08d4ee035d2	Allowed Protocol Mapper Types	d9df55b1-c105-4a3c-96cd-8719a1891442	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	d9df55b1-c105-4a3c-96cd-8719a1891442	anonymous
dc6d04be-7331-4a93-96d5-56327210167a	Allowed Client Scopes	d9df55b1-c105-4a3c-96cd-8719a1891442	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	d9df55b1-c105-4a3c-96cd-8719a1891442	anonymous
6e5aa6ea-ef24-425d-867b-6acc1dd96f09	Allowed Protocol Mapper Types	d9df55b1-c105-4a3c-96cd-8719a1891442	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	d9df55b1-c105-4a3c-96cd-8719a1891442	authenticated
021e173f-ee63-4423-b8ab-aae7ea7a9a71	Allowed Client Scopes	d9df55b1-c105-4a3c-96cd-8719a1891442	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	d9df55b1-c105-4a3c-96cd-8719a1891442	authenticated
dff8367f-410f-406f-a6e5-adad7a11074d	rsa-generated	d9df55b1-c105-4a3c-96cd-8719a1891442	rsa-generated	org.keycloak.keys.KeyProvider	d9df55b1-c105-4a3c-96cd-8719a1891442	\N
af0cc92b-9e12-44a7-9b8f-0c645d8ccc44	rsa-enc-generated	d9df55b1-c105-4a3c-96cd-8719a1891442	rsa-enc-generated	org.keycloak.keys.KeyProvider	d9df55b1-c105-4a3c-96cd-8719a1891442	\N
92bd6977-f1d6-4c5f-8dfd-98b0ce9e7983	hmac-generated-hs512	d9df55b1-c105-4a3c-96cd-8719a1891442	hmac-generated	org.keycloak.keys.KeyProvider	d9df55b1-c105-4a3c-96cd-8719a1891442	\N
f6745ae9-5ac2-4893-b3c6-3687def9f581	aes-generated	d9df55b1-c105-4a3c-96cd-8719a1891442	aes-generated	org.keycloak.keys.KeyProvider	d9df55b1-c105-4a3c-96cd-8719a1891442	\N
09414b6e-6754-43d1-8b2a-7b74114e7a82	\N	d9df55b1-c105-4a3c-96cd-8719a1891442	declarative-user-profile	org.keycloak.userprofile.UserProfileProvider	d9df55b1-c105-4a3c-96cd-8719a1891442	\N
685a1410-124d-4f53-8bb5-2ce1255b5499	rsa-generated	51b23642-b8e2-49b1-a277-da115aec56b8	rsa-generated	org.keycloak.keys.KeyProvider	51b23642-b8e2-49b1-a277-da115aec56b8	\N
121a64e2-4ce7-4f06-ac7d-7f9be501c2c9	rsa-enc-generated	51b23642-b8e2-49b1-a277-da115aec56b8	rsa-enc-generated	org.keycloak.keys.KeyProvider	51b23642-b8e2-49b1-a277-da115aec56b8	\N
4ed8e1c3-2136-4564-a464-10a7270e056a	hmac-generated-hs512	51b23642-b8e2-49b1-a277-da115aec56b8	hmac-generated	org.keycloak.keys.KeyProvider	51b23642-b8e2-49b1-a277-da115aec56b8	\N
6a9f0425-6293-48e7-8ff5-d775edad00aa	aes-generated	51b23642-b8e2-49b1-a277-da115aec56b8	aes-generated	org.keycloak.keys.KeyProvider	51b23642-b8e2-49b1-a277-da115aec56b8	\N
7cc865de-bef8-42de-8486-6afb9e380ecd	Trusted Hosts	51b23642-b8e2-49b1-a277-da115aec56b8	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	51b23642-b8e2-49b1-a277-da115aec56b8	anonymous
4a25a38f-ae28-4e66-a1d5-8e3f3e1644d9	Consent Required	51b23642-b8e2-49b1-a277-da115aec56b8	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	51b23642-b8e2-49b1-a277-da115aec56b8	anonymous
08a40b7e-cdd2-40a1-ab06-5f6918741b0f	Full Scope Disabled	51b23642-b8e2-49b1-a277-da115aec56b8	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	51b23642-b8e2-49b1-a277-da115aec56b8	anonymous
6946039e-e6e0-4f44-b085-93c23102a775	Max Clients Limit	51b23642-b8e2-49b1-a277-da115aec56b8	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	51b23642-b8e2-49b1-a277-da115aec56b8	anonymous
acf385d5-0625-4b08-bde0-8943e43f1810	Allowed Protocol Mapper Types	51b23642-b8e2-49b1-a277-da115aec56b8	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	51b23642-b8e2-49b1-a277-da115aec56b8	anonymous
61fff182-7b3b-4901-ba37-9cd1166860e2	Allowed Client Scopes	51b23642-b8e2-49b1-a277-da115aec56b8	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	51b23642-b8e2-49b1-a277-da115aec56b8	anonymous
3ea5c5af-adc4-4995-8c08-dd5ef6b38905	Allowed Protocol Mapper Types	51b23642-b8e2-49b1-a277-da115aec56b8	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	51b23642-b8e2-49b1-a277-da115aec56b8	authenticated
ce56773e-a5b3-4a25-9d02-7fb89cee8023	Allowed Client Scopes	51b23642-b8e2-49b1-a277-da115aec56b8	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	51b23642-b8e2-49b1-a277-da115aec56b8	authenticated
\.


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.component_config (id, component_id, name, value) FROM stdin;
dd53a1d0-35ac-4e77-887b-10bc485a31ad	021e173f-ee63-4423-b8ab-aae7ea7a9a71	allow-default-scopes	true
49634063-f71a-480d-b619-078adb5602b0	f132f157-8d7e-49d8-8ce9-9e16586c03f1	host-sending-registration-request-must-match	true
88770b22-75b1-4fca-ab71-24305bf31f42	f132f157-8d7e-49d8-8ce9-9e16586c03f1	client-uris-must-match	true
31c2de53-3dd9-4bbf-92c5-f9517d4d1053	dc6d04be-7331-4a93-96d5-56327210167a	allow-default-scopes	true
9f4b3ef5-fc06-41cd-b470-0ab001976008	6e5aa6ea-ef24-425d-867b-6acc1dd96f09	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
bd93dbf0-8788-4966-bbde-ad18c10a4a66	6e5aa6ea-ef24-425d-867b-6acc1dd96f09	allowed-protocol-mapper-types	oidc-full-name-mapper
4762f519-5105-4eb8-bbaa-57d59b646e67	6e5aa6ea-ef24-425d-867b-6acc1dd96f09	allowed-protocol-mapper-types	saml-user-attribute-mapper
bf7780d6-d41c-4d60-a98a-9998f6ff3488	6e5aa6ea-ef24-425d-867b-6acc1dd96f09	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
51f9bca3-ae8e-4a75-94ab-957bb638d3b5	6e5aa6ea-ef24-425d-867b-6acc1dd96f09	allowed-protocol-mapper-types	oidc-address-mapper
ef0c4485-a8ad-4c3e-8fb7-9bda73c43fd0	6e5aa6ea-ef24-425d-867b-6acc1dd96f09	allowed-protocol-mapper-types	saml-role-list-mapper
bc7861f5-f11a-42de-b7e2-d3d53bee27eb	6e5aa6ea-ef24-425d-867b-6acc1dd96f09	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
1e6fc02b-7dd7-4db1-a76c-9524ab15331a	6e5aa6ea-ef24-425d-867b-6acc1dd96f09	allowed-protocol-mapper-types	saml-user-property-mapper
70170fa0-2ea6-436e-ba13-ca874b36710e	94de0f80-02d6-4569-b7b6-d08d4ee035d2	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
9e79b60b-597f-407e-a05e-8f8a0a93406f	94de0f80-02d6-4569-b7b6-d08d4ee035d2	allowed-protocol-mapper-types	oidc-address-mapper
371c15e6-5f7e-4688-a6ed-c6bd9507694f	94de0f80-02d6-4569-b7b6-d08d4ee035d2	allowed-protocol-mapper-types	saml-role-list-mapper
ae704e8a-2500-4102-bdd2-7126334284d1	94de0f80-02d6-4569-b7b6-d08d4ee035d2	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
ddebabc2-cc5c-4976-855b-6e1f41484075	94de0f80-02d6-4569-b7b6-d08d4ee035d2	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
5957ae10-bf40-4885-a393-e26ce3b722c0	94de0f80-02d6-4569-b7b6-d08d4ee035d2	allowed-protocol-mapper-types	saml-user-property-mapper
1fa60646-0cdb-4878-a056-e86a6e8ca7b8	94de0f80-02d6-4569-b7b6-d08d4ee035d2	allowed-protocol-mapper-types	saml-user-attribute-mapper
1d123dac-7790-4775-8d56-1dd32592add3	94de0f80-02d6-4569-b7b6-d08d4ee035d2	allowed-protocol-mapper-types	oidc-full-name-mapper
34f738ae-457c-4eae-a38f-6e4a2f1c0e98	4b058f7d-e5fb-4e2c-a7d9-99b9b2f9c139	max-clients	200
27a8e1fd-2510-4f2e-872a-462eafc20165	dff8367f-410f-406f-a6e5-adad7a11074d	priority	100
35a15640-958a-49ce-b48f-b107576c5ac8	dff8367f-410f-406f-a6e5-adad7a11074d	privateKey	MIIEowIBAAKCAQEAqWAu1Brh9sNcT7r2skVDpAsPCDMvGXtcf83Cw+QRlYcDyEcd7C2vDQKwzv+9NVV6XPzUoe3VJUT2F96AErVv/ZUCgjV2AROs4D4KewSBtMxJHX9g3Jtq3Zt1vG/wPx7pBUQ3EZN2tUvieI1ofW1MtsLffaWMoVNVbhB9Cu5T0LHn6HwsN6KADmoC7AJNOlzfl1Rz/ap0Gcpcd1jmxIzNzN4Kr9h05CGuWXrXeOIBmcp6ylzxac/QwSIai1QWeHgzlb1xKZrW0f+lSUiZkui04mpbR9CpmA9ccPUPVo5Uzp6y1gtEet/2JUo+otapthxIHNtkIwV0InCvvYXXlUwIXQIDAQABAoIBACdnIRXGeD12Jt5EhjokS29ZBEL511H0BSmVRmNYhi+1RG+9/avRV+kssFHDpHKJI2mJBvVx1RVxxNd6M2zGyVoipX4BrmVjPKNBQ6JpQrx7DuJeHPxNaq/Jx/rRxsAEcpy/SRldZy8Xi4TUjtOpDwDwdlouXng0YQo1K0XU+mow66OtcveOLE46EUP3GGQTw54KWcvwWjfAK6W09KAMXG9DZdKbAm2Qz3mOsKSKsh+Ts3w2lMQ+XqV2yPaMVOTYEVvVB5bLUEsUQ3hFaygTXqB4d/Il7wNBxt8FsIEEwCgajoIApfmlZCVWYojh/5QkoBR7sanm49CTAjsKksuswRECgYEA6HYfhMPjmhLVWAwYGmZRCxUVVvUBTX9w8xOru1GxsUGy3BzF/IZICa5/d5b2DMRMY8/P0FGmQs00FkCV29GrxatrkCjPTYr86vvGxReOvfWN3SV94lOsWIjqwjQGDph/aXL2aZMuXzjVWjLE9RFmhGjNH+wJlM3g2ToIioQjPG0CgYEAuoa/uiC7lrOSBeTdx6Gu43of2e2JW8uNkgrfCaPPcjwG7Ktydr64z9o3a4gVhzWQtb9iAY9COf8SXchQXdFARorErAjcTxo+rvW4rdd0MnXg6hK5/XPmhkeHm6Z/PN2PAgymu0qAr10DwJ9LGAGMXd5DhEZsHMtftKDm9ybRpbECgYB+tPQVH9kNgDp9lYoFycNe8Q0CquUc4twkApLWtX7PiWn+hEh+jorxjAW6n7RZ3R1uQjWZ7Qdc3hEIGAgXG0AvrHIiz7u/HoUhaD896stJS3EaG3d0R/tm/qpHVKgAiKraRWl+vlTGXmockhO9KNDiV2WHgtbuHxHyFanWJpQ2OQKBgD5+CNxOPSsnbIPnAtrwc4ypDOTRrZSApSTJ2aH8LPNj4xoF8uqPyZFx1eGEDVpoetw5i5dkLNcLe1bKVwqnobZApdXRfiZOb7PkhYRQzBBf6APkVEXzP8e7TVa7uKNmw5P3MyFKu8SFEE3H0LvxQNruLYaypWQcSytUQS2K5vBxAoGBAKp0l7+BHdwXPUwqSQfKGLIXYDd5LneuavnbtJX/oKJnNRsh1yeqByOKMIP/C9QYPY78T5qikgq2cO9YP7kXNII7y6Kxiu/MTC3oAo8Zov8g6FTzALzEbxX3mSQwFLNiC6KOeVk+8kFsVyLl0XUAnrhs2FuByPCLiQovTi30H0yo
4cff7e9c-a1ac-4dc6-9e59-f1290bf5f9a1	dff8367f-410f-406f-a6e5-adad7a11074d	keyUse	SIG
03d1eb06-eb62-4989-86c2-9485b0d19791	dff8367f-410f-406f-a6e5-adad7a11074d	certificate	MIICmzCCAYMCBgGPwn4L9TANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjQwNTI5MDM1NDUxWhcNMzQwNTI5MDM1NjMxWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCpYC7UGuH2w1xPuvayRUOkCw8IMy8Ze1x/zcLD5BGVhwPIRx3sLa8NArDO/701VXpc/NSh7dUlRPYX3oAStW/9lQKCNXYBE6zgPgp7BIG0zEkdf2Dcm2rdm3W8b/A/HukFRDcRk3a1S+J4jWh9bUy2wt99pYyhU1VuEH0K7lPQsefofCw3ooAOagLsAk06XN+XVHP9qnQZylx3WObEjM3M3gqv2HTkIa5Zetd44gGZynrKXPFpz9DBIhqLVBZ4eDOVvXEpmtbR/6VJSJmS6LTialtH0KmYD1xw9Q9WjlTOnrLWC0R63/YlSj6i1qm2HEgc22QjBXQicK+9hdeVTAhdAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAHh1SowiP13YE4g+lLBZQzCqom/zFVvBMjqiSzUfRoMuX20wpjvPBlC8jK5EtvVRgVlP/J++g2MwA9xg6XbYWlei48IypDRd5lrcHkviFFCaXoj1fMeb8zcDsQqHHAD0REItMU1gb0e4TKbUC/3lOt5hlUy4ux3X6miXGTw5D2c5hg3diFQ0VMjqevCQARpKYcueEyBE6YWH7AEfL66HRyjUEscROFXbWIFe/bEumxMUd43PmHQNRfdWp+hQBkEdDJI5ITNsfuBz30isEPEI61p2c5fQQDaZfzsjqgQJnhwKrh8aOHNNy1kkleLg7l/EuUBUS5OcWoBrxP4X1XFMGYY=
b5f5c72a-ed26-4723-a865-a02a289f81d9	f6745ae9-5ac2-4893-b3c6-3687def9f581	priority	100
7fb1ad99-2247-4777-8de6-f94d7b2bcfa6	f6745ae9-5ac2-4893-b3c6-3687def9f581	kid	2a03da6e-8182-4dab-be50-1fb29a1ef4e8
a194ddab-043d-41ed-9e70-64be1aa501ce	f6745ae9-5ac2-4893-b3c6-3687def9f581	secret	yPqkXYzE8q_3i5eQyodtOA
15863721-3abd-4ca1-b5ec-ba554d35a77e	92bd6977-f1d6-4c5f-8dfd-98b0ce9e7983	secret	NarAsH8WNB-IcqI7GOhqz7JeZ8G8V6hCvxELwFtt29vKbTRu6J60xTI_qLvOTvXx1xqZNc0L7JIfd_ZUwu-LaAwfELA4FhkUvsF1vIpt9pzumeiQxhnw0Bsx0J3dhIfrpkC-p3xGPV8-be5FTylISC2rX3AKaxIezY9JX60A1o0
6261f671-2b0b-4e6a-ade1-f400aa8eef39	92bd6977-f1d6-4c5f-8dfd-98b0ce9e7983	priority	100
6854bbc9-39e1-4477-b52e-2ef3e204856d	92bd6977-f1d6-4c5f-8dfd-98b0ce9e7983	algorithm	HS512
13933861-8488-44dc-beaa-4574db09f03b	92bd6977-f1d6-4c5f-8dfd-98b0ce9e7983	kid	b5dbdd12-9f49-4bc4-bc83-c7e864549e8b
915fb7dc-7d3f-47ef-b74e-6a555b4da69f	09414b6e-6754-43d1-8b2a-7b74114e7a82	kc.user.profile.config	{"attributes":[{"name":"username","displayName":"${username}","validations":{"length":{"min":3,"max":255},"username-prohibited-characters":{},"up-username-not-idn-homograph":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"email","displayName":"${email}","validations":{"email":{},"length":{"max":255}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"firstName","displayName":"${firstName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"lastName","displayName":"${lastName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false}],"groups":[{"name":"user-metadata","displayHeader":"User metadata","displayDescription":"Attributes, which refer to user metadata"}]}
8be5e7c9-17b1-4ce0-97d0-2f5c49fde79c	af0cc92b-9e12-44a7-9b8f-0c645d8ccc44	priority	100
78330c5f-f436-4245-a506-114d6a082e4c	af0cc92b-9e12-44a7-9b8f-0c645d8ccc44	keyUse	ENC
1d343a8b-dbc4-4415-9f55-4dabedbc8731	af0cc92b-9e12-44a7-9b8f-0c645d8ccc44	algorithm	RSA-OAEP
4acc735d-8b24-47e0-a9af-c66608ee0169	af0cc92b-9e12-44a7-9b8f-0c645d8ccc44	certificate	MIICmzCCAYMCBgGPwn4NUTANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjQwNTI5MDM1NDUxWhcNMzQwNTI5MDM1NjMxWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCwvX8FVWdJClBNcS7XM3YgbtbzyMN/ogGIPiOpsypKx5EzSaRcrnz5bwDQi0gfxvvscJkmHqPvmBO+PLihx4RrtBvrMbCH8gGN/3kfGKFEziKufWim0zmMmxEzncw3jCvqaspKKN5kvif0SJTJYK/wfpWwTFv5JJOaOnUREPFVbXOiT7suT3KqMHCHtE5f5NomcpJGw5xyxknMfUjsm+8Y9VcbmEg4FWZmZFD/DppQiLlRxJD1BZVbj45PaMHq4tiRXX0Bka/8yQYG8HWAQMpfndOhsvOo1XlT6MysTAiD+1VWAxjIIwvovCnOiDsEVhSMB9gLjMtP140lCG5IlLTxAgMBAAEwDQYJKoZIhvcNAQELBQADggEBADwn9YuTyhoU7OpVjGmOaR0+pXLO+LgVxLWs7pS7KFeY3Bw8AuiXgWH5n2rNLbDOz76lkycNiSj+3jF1ZYQ2OwStU/LnECWY8MWZk3DDY8eh2FWDom8D913xGe+r0GhUkP4aJ3If0Clqwsf95QUP5eIEtLg1XmdAJYFTxdrlKdtd2hCs91l983Wz7BvG2/lrdqk/lan3gAJ65F3mrGB58hVVv19pm0cXXslOocn0HlKe9JhskxuzR2VljL5uF8ClFUkW8UYTDSI5PLWmsuqFarpH2GsnyZJqu6XPs1JtUjWDOZsT9adlVtTMg+u/W8yPzf0F2gjPBFVyLze6FsGbb3Y=
1bea6a98-ce7a-4681-a184-caf41aab69a7	af0cc92b-9e12-44a7-9b8f-0c645d8ccc44	privateKey	MIIEoQIBAAKCAQEAsL1/BVVnSQpQTXEu1zN2IG7W88jDf6IBiD4jqbMqSseRM0mkXK58+W8A0ItIH8b77HCZJh6j75gTvjy4oceEa7Qb6zGwh/IBjf95HxihRM4irn1optM5jJsRM53MN4wr6mrKSijeZL4n9EiUyWCv8H6VsExb+SSTmjp1ERDxVW1zok+7Lk9yqjBwh7ROX+TaJnKSRsOccsZJzH1I7JvvGPVXG5hIOBVmZmRQ/w6aUIi5UcSQ9QWVW4+OT2jB6uLYkV19AZGv/MkGBvB1gEDKX53TobLzqNV5U+jMrEwIg/tVVgMYyCML6Lwpzog7BFYUjAfYC4zLT9eNJQhuSJS08QIDAQABAoH/bGLJb9p0XjUWb8Sgloo0P74Wi3i9dw9wDL69UZYM4NfQnf7kHQPTLvu/hZkTY3UZuu1A5vtPBPic0X1XCHauQBL1eqsFleSyOwQYFjKRqBNH11oUBowFdLNj97ZsLcGPpyKB9I0ND6afOfcrx3wZrzV9gmqAGdzS/zH6RHXA51pwOPFHDymVWtdaRDnjM91icswr3rL9KRBeKIRuw0MuH1coua3LuG5IAN3VgEso4OQMmWkIrj0I00VuEbsa/0cTh/Y18OM1Qb9lJ5KYx443j9cP6YQI80dDS0Tnml3DqQj3H/udyNilE/qNS+qoLULPTGMwpG3b5lPuRVV7Jr/BAoGBAOuq5x6tEYJ/LhYp25TQ/Xu9kL7fNbmGnFvtdjvITKGXlCAPb3siPUWZt3mrSrr4SVJggjSJcwFHcWM3QkNMEPnVFJ0GPu/xcB5+cjgt4tc9UFAnG0GyXu//j3IQhlJUxuYyIsxs8ktHEdJBpzaYAO6kGbADeHIFVB0rV9T0ehyxAoGBAL/9FnfeUEgjbHNWBN8RXCHCmB9O0vbp5B45WCgeYuhonjEhkPN+x8ER9Vhc58ozDyXOs73Sm9qeuTMXOJUFktA7kcaUDajJF3ynkvHI5TSHd2ItTDUGSUW3W5PoWZyIYgtkaFvuErqMItC7VqDbm97xB/prAG+x4jUHPTXINSxBAoGARnWASDGiTIvNsZ6uId4iCz7v6cE+hMt0MB/c+561GpMBHFzBDeV8wDRnIJ9P5nqZIWHtS9vUYIuFoQ5CZ3B0mt1UHmZhpsdeqB9R8u31JjkUrAIlKg00STj1IDtEjZT/Ko/Oy6O/BTaoY15xqebkUHULoQ5Ikn55WYc96VN2tuECgYAVF5kAUkw/oKSphynB2AZnLxnHVsGWntuQ9nvY7H2xSs0WWLm0BpmrfG2X550PecyQOsVEdX7p5cYy9rogpRwcBG9fgaR+hpkt+LsMFSYZP0i+YHue17H1Fs/Y0A4IRHOBDObqMp2cIQkyJWK/CWF2fMSDnn3Nx50ydjkjT3uIAQKBgQChkzSpBu+d39oFOFKFviXoNmxo00xJBIXIKvlwD600hEbehGLIQS+G55wBiIQEkW/PnI2lW4ayHgnhpqOVncFI1y92bMilJhIheaf3jq7WAbBFkZIAVhoBmxclgFZag7sHwoitIa+gQLnXSIUhh6SBTFKNriBmeSSy9xjGe79WCg==
22a6f49d-9e3d-41ac-8c69-9c89d8d82854	6a9f0425-6293-48e7-8ff5-d775edad00aa	kid	7427345e-abbf-4cf5-aa08-306b6534a830
57984f28-20a3-4446-9589-9854b5395d63	6a9f0425-6293-48e7-8ff5-d775edad00aa	priority	100
e22925e8-ec46-4a03-9d16-7739f54b8a6e	6a9f0425-6293-48e7-8ff5-d775edad00aa	secret	Y4wOW5K2IM4DcdBY4D1PKg
3f5423ae-dff2-4ad9-baa8-e8a0ee18f696	685a1410-124d-4f53-8bb5-2ce1255b5499	privateKey	MIIEogIBAAKCAQEAqkXMG0WvBzpn8YlN9r0drEb2F0rtelDiq0GdyCt9HtYUWK5OXRxx7OKUgLMM3CGoIB/HvxQQ1Oa6S1Vssn9dVn6UlS0NWJVGMx2rEXNROmoQ0gAyyfExwVRYgDWgrQmc/5VAfitfOCcmKi0D5PV+nkbfZYVPvj0XwegKGyCWPRDM/QxfYReU0u09QDFjkQVcVBSQozbk9XC3UB3VH0tkiqlrmmoRO8+m0xbEHai0oy9PrVX9AEabF2eBXhNKp0LVyAgOdC2rSNuQrmHIr9VqC+FQI8KqnJD6F5GwVc240hVi6BIYal11lzacyQKmD0nw2XZ4z9uBQZ2fYZ9qB9LUZQIDAQABAoIBAAp33mZiKzJsEP46B/eJRUeVWJrc/0BRCbvSqGh+jU4124FfkgTKc2dHai7cEzMoxI/ZCaxB3Q5hyFv0+rOh/fM2jAb8gpYKyLVAIod2SgJSiV8ye5eLwxh/iYNfCKuqwXgQd9W/RTbhZ/Nu2g7xAuGoj3fL3De2GihQjj0rDIw2IGAD8ksIWi5v1EqrNWFN1atHFvATL15SxMRfXYPBqLNxDSVpQOO3ok5xGlcgEonV2fA6G5IvOuXY/KtTLMFmwSnmpFVLEOWa+uHNm03C7QgJn3ecyqMeNfLi7S6LG6u+q6DmMkKqjYAIjIFTkQuVyYNoW+FPWb80mh1eZOICRbECgYEA0jleOtr4MGQ3NarrXDxPxeBfxkrs5ZQoeUAoZ0N8ilS1kfIJyzXg3KEWrw209owDUP8ILaPugHkOJx/YCu0if4lvIBQPvy3JCURozNSbU9uY9wVsI5kvb30VrV9RNL/dkgH+mSC3AL/Q+bcq1j0UKTXP866s3fjRJWMkgLbTLX0CgYEAz1llCOBNwrEmCnlhhAgPUFe5GOMRDRUM9Pm+hPe4q5GDm2ebVT34fP5O8fcHtC9FFcWApEDw0d/qZ9+CE6CzTcNZOIF4L27lTV2i+DCwu8SBAxBzCh3KSbyksSEkufA/HsTmYvg6rU85YZeq/qt5Ut4aDclOjQLdcRGq6yeQFwkCgYAsu0pCqb8vxNM+lyzXhnnO+AxJDD5WJ21pR26Rcnm4kYfFE0RkOgWrzJcgDoGYCHjYLjwWQhCIw7lwN8Vnpce2bY74u2wSWPKzBxxpoT+f21U0ErJM7NZ8GZiYOHT2DXFfFQ+Qk7Z88VPNHt19kqeMkUe7aUqdPMl79BmbTcunnQKBgAXif5+U3iAcbvv1HfNlVynsk3BFYYKBinCZdfLIJRGZe6a5dgshSyAhB5SOckWG4esQQ+plfXA3bqusCEEOWohmdu3HnuWZvCBJ/AoXN6zcktzHZrxuxAL7u6DbU/ODAgeZhwBgEypACVzftRatPzA+5XZmtDgEUMyYt8UcxlYhAoGAT4tk3zpI+5Yt+Fo1DlzZsbRqaOgjOn6o3o1bf/sNQcgWLRsOPJd4YVpumWKnwLQEJhOg9Ruy9iJMICNa1iImmWCC9Qxp3jdAZHn4281UtgmfcFN0hje51SJj59ZZTf6jWuaa8tCsvXZCTAGKv4k7mIX/IrKhxthWzhuPW8oooqo=
c488fe02-56ab-45d5-bf09-cfe04051e00c	685a1410-124d-4f53-8bb5-2ce1255b5499	priority	100
c653606c-ecdf-45da-bd87-eb3211b50f58	685a1410-124d-4f53-8bb5-2ce1255b5499	certificate	MIICqzCCAZMCBgGPwoeSaTANBgkqhkiG9w0BAQsFADAZMRcwFQYDVQQDDA5wYWlzZXNhcHByZWFsbTAeFw0yNDA1MjkwNDA1MTVaFw0zNDA1MjkwNDA2NTVaMBkxFzAVBgNVBAMMDnBhaXNlc2FwcHJlYWxtMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqkXMG0WvBzpn8YlN9r0drEb2F0rtelDiq0GdyCt9HtYUWK5OXRxx7OKUgLMM3CGoIB/HvxQQ1Oa6S1Vssn9dVn6UlS0NWJVGMx2rEXNROmoQ0gAyyfExwVRYgDWgrQmc/5VAfitfOCcmKi0D5PV+nkbfZYVPvj0XwegKGyCWPRDM/QxfYReU0u09QDFjkQVcVBSQozbk9XC3UB3VH0tkiqlrmmoRO8+m0xbEHai0oy9PrVX9AEabF2eBXhNKp0LVyAgOdC2rSNuQrmHIr9VqC+FQI8KqnJD6F5GwVc240hVi6BIYal11lzacyQKmD0nw2XZ4z9uBQZ2fYZ9qB9LUZQIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQA2AxOAdLeH9mbwe6ia+m15eAMzmpgH6ySwh2oAmqcPLp22iVySYc/LS+8AE+sBsZPuqWjvmLRgaKi6gC/6gEXhezx5BkgqWpKz9VWedGMtfUdkyItdGlOG1UcFC1EswgtXQpkh2WAhZ/8kFvZnaU6f3CdMC02IKtGCGZKIsuMZW5vGu3RpUH5sQnckztXHhOTFqeoCfexrX+ceL8Qo2x/yhP7+7taGpoQGEa/N3PCVJyCLN5LY2x1T4/Ez0pz8DWinDMGUGngIo2ZL9JAvmoh1VEngiCE8b3VS557YwizR3bYz9wlV45sHaVelEatw3aPr9pV67FTs327AbjBdNWqE
99848415-60f5-4e99-9581-7eeaeacdff89	685a1410-124d-4f53-8bb5-2ce1255b5499	keyUse	SIG
229a5d78-1644-4569-adfb-f075b73e615d	121a64e2-4ce7-4f06-ac7d-7f9be501c2c9	keyUse	ENC
8ee3abe7-2bb3-409e-8d89-1aa38594c42b	121a64e2-4ce7-4f06-ac7d-7f9be501c2c9	priority	100
b209c5ec-2944-4b89-ad8c-bcb5f3cf305e	121a64e2-4ce7-4f06-ac7d-7f9be501c2c9	algorithm	RSA-OAEP
4adca2e4-3d62-4355-92b6-4067f3ee8007	121a64e2-4ce7-4f06-ac7d-7f9be501c2c9	certificate	MIICqzCCAZMCBgGPwoeUdTANBgkqhkiG9w0BAQsFADAZMRcwFQYDVQQDDA5wYWlzZXNhcHByZWFsbTAeFw0yNDA1MjkwNDA1MTZaFw0zNDA1MjkwNDA2NTZaMBkxFzAVBgNVBAMMDnBhaXNlc2FwcHJlYWxtMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAkF2l+scU+vNdPLvu57zqts6zOE/K1Qk/+3uln+l1zGaHpVs+FWwUHwAM/zgUZRUjeEr0BkK4W3p3InVR42kAy13O+0nBANDRMRz4QtFFpV1gj1sIlQjVQZpwnx5ggZ27VmHhTb+DRsvJYef5eYa17rTSn0qdVgtDm3ySvyJeDoEIDCwsKRHyebCCD+UuZee/CilnEfp8ziJfFtrwPNI1aXQjdCcxnCteRE0gD8obje3MKZjy8UJJ4mDjOer8g1Sx5UhO4KMNHTArSOTA8G+j5/f/bfPG4Qf7fyx5OHiLyEQRrfxLsUI2ohU2rHLbtrlKKassr6gn9wp9A7/pNfyHVwIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQAXBwvTk3Lbherbpp3G/wC0XrtGOGC5l54h/nQ6FjYBr6jQP+wzMOMN1TykjPpdnNWWqT7ZdauFu10ZgpsaU5Gt2RGxFNOdSCahDQtrOa997SGQ1GLDt6HHgG7Sk0xJhMIbMpEM1PWPd2EWtaFD52eoGgxX8acoMU74kwGpertQeezHqMuWDLNMqvF8g6YoEqdmVQr3D46AwLHw/D4sFYs7m1sqtJiruH0ZypNL+hYNp1YPI8w3SyB40S5AX93PVv4b4wRp8c8r+y7vMzGO8K8SQeBiJgg9GEKes08H9+ylPs/b2fL9cgBhDabpiMWHFDkkjZ4vAYXMtXG+31UWHH7s
89947db7-6516-4868-b5a0-44bf3b7d913f	121a64e2-4ce7-4f06-ac7d-7f9be501c2c9	privateKey	MIIEogIBAAKCAQEAkF2l+scU+vNdPLvu57zqts6zOE/K1Qk/+3uln+l1zGaHpVs+FWwUHwAM/zgUZRUjeEr0BkK4W3p3InVR42kAy13O+0nBANDRMRz4QtFFpV1gj1sIlQjVQZpwnx5ggZ27VmHhTb+DRsvJYef5eYa17rTSn0qdVgtDm3ySvyJeDoEIDCwsKRHyebCCD+UuZee/CilnEfp8ziJfFtrwPNI1aXQjdCcxnCteRE0gD8obje3MKZjy8UJJ4mDjOer8g1Sx5UhO4KMNHTArSOTA8G+j5/f/bfPG4Qf7fyx5OHiLyEQRrfxLsUI2ohU2rHLbtrlKKassr6gn9wp9A7/pNfyHVwIDAQABAoIBABanc2/eb2w6kKjYBD3o7IYiT90S0bf2JcxaE1v8NTLi61SnSZ9FS1paq4TIm+le1Kbq+s8ZXOJnXdbnmnbkAoQR5PSUQXgAzLWhylLQkdbIx+nHCxo5Usm4KVshglsPUZdVGxdpvvkhlSj1ejW3+MhhfLm9ajeB41U8ylm5qWZ/XFGoHT0C7DjHq+/TJdiWkqHyk3WY+HSB4wXEN3cbua1IuN2FWE3Rw9V/XqE4eyITdZiE2k3aT8ECZzQZe8fkTiv1aw9xPHW6YIZ6AGLzToIvB8wdtNxiH1P010GC/r5X5N/dg7lKeXbUhALGsix2LgVZEIljGz2xMaG+R7re55kCgYEAxsUZNFoOS4YuILitdu3nSy7y4GbzZrFLPq2uKXY3gzVDB4QpIxaYNsTsSCw/ZChEZKRGPeD0sQgecnLqJqtEA9gxzQKjB0C8y9CcHsF0JBTYcQzB3e10flTzXclc3Cy8KzVykRMX475mhJdJYFstyh1WBBQKjuy1bRTiuIXc4zkCgYEAue6Ke/sz9oP1ssGcXaRXeuJBriXKpl/TghTh6yX2lZXdX/imWhVba4XJh7+39l/Ch3q1KGxpSZhAt7eXDptBI96j4nEO8s6E3bur69RfYLz55OLff9PgMtiUTvlG2guSxd8j0PnsRcWM5Tix/Xvr45jnQ8EmcA9FW/+LVegx7w8CgYB2tZfL8EzBRi2eVS0j7glImY1r/5A2MIRjto5hLL0Sm2igwIlg70mQzCLhJ6vkQTg3cvSQWB1K7TJh38d/uKEyOpfjfEOpPTyD7N6Qb7DRK7HoMlpGFF6SZGHEDVJsHDt1AsKdae3Gkhvf7ApihZHfN437eYyktzHTJ7oPwcKd4QKBgGp12Ft3EWDEXCmXTEYd9G0LIhppzygGVF/2Pwlael9aKSBriiyob+kX+LW+o8HxQLw8GYBk2sBl6iCHgXm+kcTNFT9yBuImN9OSQrVMq7QDYH6bHOffVE8ozXqOpu/wkoCz7JkakRu+KpeRJ/EBRKbUBQ85iB2/0LIFly2APx8nAoGAB3wgtE5fMybtfngCZZ1cnKk65/i5yo+XHC6z0qBGgS7/HZxIyc8fxHlCsxu2gjbp/QHeT9mOMZfGEMvXfNd5MbGostAK973JJB/Bq2rMo3P50r4w/hS17TBWmvArtv2td3Ql67KEj9eryTwesDMKB8MzkjDY26CIGSJbvXXlWRo=
324f4c9f-12d6-4e84-be45-a2528252b173	4ed8e1c3-2136-4564-a464-10a7270e056a	algorithm	HS512
c6233b33-6f03-4ac6-950b-1590f311b996	4ed8e1c3-2136-4564-a464-10a7270e056a	secret	kCvvqbOqXQ5c8Wvg5xFuKKXqI5da68e-vy2QbZ-HoIVXi84stOGob3dGTxRaV7bUwaM2jNy7YZ_AcU3ka1oZ1Bgw2m_Bu78rMHgTg9WSLPPb6aUBSH4CpVdLbOmu6GnR9OxBKOPgH8pfn6I9yLS2yQRPg-3MjUcwTV-iHISFsYY
d76d68c9-162d-4cb4-b6be-c0e6eac4f846	4ed8e1c3-2136-4564-a464-10a7270e056a	priority	100
8da44917-430c-4ca6-8422-abca96035e5c	4ed8e1c3-2136-4564-a464-10a7270e056a	kid	54a70b62-f69e-4063-b852-f4acfc5627d8
30f32db3-de67-43fb-96e1-09837c013148	ce56773e-a5b3-4a25-9d02-7fb89cee8023	allow-default-scopes	true
93a81bcf-7a62-49f2-95b5-c0d0dec45614	61fff182-7b3b-4901-ba37-9cd1166860e2	allow-default-scopes	true
126f5c6e-5d81-4245-86a9-2bfa2755f867	7cc865de-bef8-42de-8486-6afb9e380ecd	client-uris-must-match	true
9f0c3987-6c56-47f9-b41d-efcc126b69c6	7cc865de-bef8-42de-8486-6afb9e380ecd	host-sending-registration-request-must-match	true
58568c75-9e85-457d-bcee-6a3d2872f131	3ea5c5af-adc4-4995-8c08-dd5ef6b38905	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
009442f8-0a0a-4f5d-8fb6-a2ca3a0fd36b	3ea5c5af-adc4-4995-8c08-dd5ef6b38905	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
8f744027-5b84-4db3-9c2d-7f917a0bf570	3ea5c5af-adc4-4995-8c08-dd5ef6b38905	allowed-protocol-mapper-types	saml-user-property-mapper
ce990fe2-eb9e-4a00-bd13-4efb0cf0a6f0	3ea5c5af-adc4-4995-8c08-dd5ef6b38905	allowed-protocol-mapper-types	saml-role-list-mapper
a9a1885a-5d89-4469-987e-c20c59419f2e	3ea5c5af-adc4-4995-8c08-dd5ef6b38905	allowed-protocol-mapper-types	saml-user-attribute-mapper
c5598faf-aa42-47ab-8963-059b37e4648a	3ea5c5af-adc4-4995-8c08-dd5ef6b38905	allowed-protocol-mapper-types	oidc-address-mapper
a3bb8af5-6759-4425-ac9f-132ab158fa71	3ea5c5af-adc4-4995-8c08-dd5ef6b38905	allowed-protocol-mapper-types	oidc-full-name-mapper
73dd5fcb-5d1f-465d-8a99-643d0e6a0f5d	3ea5c5af-adc4-4995-8c08-dd5ef6b38905	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
27ebc0f5-a8e8-4352-897a-df669a03e64d	6946039e-e6e0-4f44-b085-93c23102a775	max-clients	200
88c03298-521b-4fb1-a08d-c4480ca3a1c6	acf385d5-0625-4b08-bde0-8943e43f1810	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
4289fa2c-c47b-4b68-a1fb-84c8518740eb	acf385d5-0625-4b08-bde0-8943e43f1810	allowed-protocol-mapper-types	saml-user-property-mapper
5ab5343c-6746-44f6-81e1-8ac22cec1a76	acf385d5-0625-4b08-bde0-8943e43f1810	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
f26e9cd0-7c09-49e1-a5d2-3113d521a635	acf385d5-0625-4b08-bde0-8943e43f1810	allowed-protocol-mapper-types	saml-user-attribute-mapper
3859c5fd-28d6-4ef9-a2c8-b1b9fb5b033f	acf385d5-0625-4b08-bde0-8943e43f1810	allowed-protocol-mapper-types	oidc-address-mapper
6d94a80f-7a73-495d-9e73-aaf37968e7bf	acf385d5-0625-4b08-bde0-8943e43f1810	allowed-protocol-mapper-types	saml-role-list-mapper
b71e06bc-7291-4f2f-9a1e-44a02d1d615c	acf385d5-0625-4b08-bde0-8943e43f1810	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
61059556-0e91-4833-8009-46aa749b073c	acf385d5-0625-4b08-bde0-8943e43f1810	allowed-protocol-mapper-types	oidc-full-name-mapper
\.


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.composite_role (composite, child_role) FROM stdin;
d349b8e2-c315-40b1-8df4-d671f4fc3cd7	a364ed9c-516e-4ab9-8f07-38ef77379b2f
d349b8e2-c315-40b1-8df4-d671f4fc3cd7	d1ddde8c-169f-4139-b6cb-cfbcc58879f5
d349b8e2-c315-40b1-8df4-d671f4fc3cd7	bce93f0b-c8c0-4bd2-b537-be1b7ad29ba5
d349b8e2-c315-40b1-8df4-d671f4fc3cd7	d08d9b8f-c80b-4928-94c6-f9d6af4230db
d349b8e2-c315-40b1-8df4-d671f4fc3cd7	054513df-991a-49fd-85e8-8a67f230f008
d349b8e2-c315-40b1-8df4-d671f4fc3cd7	3dcb6ba1-0f53-4b88-ac17-5d67f7670a77
d349b8e2-c315-40b1-8df4-d671f4fc3cd7	0836c860-599f-497a-922f-536e79ccc904
d349b8e2-c315-40b1-8df4-d671f4fc3cd7	95c28ca5-b577-4b6f-92e5-d5a66099bc0f
d349b8e2-c315-40b1-8df4-d671f4fc3cd7	41d9cbbe-99f9-488f-83ae-1f2316fcdd6c
d349b8e2-c315-40b1-8df4-d671f4fc3cd7	e7dd61f9-a3e1-4db7-a714-fa59f157eeaa
d349b8e2-c315-40b1-8df4-d671f4fc3cd7	d4ce0d1c-cd6e-4388-8288-01304702c3e2
d349b8e2-c315-40b1-8df4-d671f4fc3cd7	5b95b8d3-e242-4cfb-81d3-f1c1a4a1d2b3
d349b8e2-c315-40b1-8df4-d671f4fc3cd7	59c02967-8a01-4709-a889-f821f1ecef32
d349b8e2-c315-40b1-8df4-d671f4fc3cd7	282196c7-a549-4bcf-8a91-ab7830a034ff
d349b8e2-c315-40b1-8df4-d671f4fc3cd7	4aa4c47b-4bd9-40c3-96ac-74118a7285d9
d349b8e2-c315-40b1-8df4-d671f4fc3cd7	be40b32c-88b6-4241-a7dc-64310f22fdff
d349b8e2-c315-40b1-8df4-d671f4fc3cd7	5dc0933b-223c-44bb-8c10-815efb02c223
d349b8e2-c315-40b1-8df4-d671f4fc3cd7	76f8b443-4be4-4ba8-a53f-4896cea90faf
054513df-991a-49fd-85e8-8a67f230f008	be40b32c-88b6-4241-a7dc-64310f22fdff
b65eb93d-5eb3-482a-984d-edb8b63f2b16	ae580874-5295-40b8-950c-a9666eff7e22
d08d9b8f-c80b-4928-94c6-f9d6af4230db	4aa4c47b-4bd9-40c3-96ac-74118a7285d9
d08d9b8f-c80b-4928-94c6-f9d6af4230db	76f8b443-4be4-4ba8-a53f-4896cea90faf
b65eb93d-5eb3-482a-984d-edb8b63f2b16	aa26e5ce-2c2f-4cfa-951b-362d65a6a7ef
aa26e5ce-2c2f-4cfa-951b-362d65a6a7ef	8a80628b-b479-4d6b-9406-046a68cd1fa8
a0bed86e-5cd2-4498-8c23-78940a5ae920	c0ca3356-d13b-4765-a718-8b3a37d61ce0
d349b8e2-c315-40b1-8df4-d671f4fc3cd7	dbcbcc69-1f1a-4cbb-807c-07c95b46afa8
b65eb93d-5eb3-482a-984d-edb8b63f2b16	b30dac96-d59c-49ca-a4ca-35e36e957933
b65eb93d-5eb3-482a-984d-edb8b63f2b16	70591957-fa9e-43e2-8dde-ce03ee733ce4
d349b8e2-c315-40b1-8df4-d671f4fc3cd7	7b2f091a-c2ea-4c22-ba4f-c314b3b0f9b4
d349b8e2-c315-40b1-8df4-d671f4fc3cd7	eaefafdd-c18a-4c78-b712-2f41c5319ec2
d349b8e2-c315-40b1-8df4-d671f4fc3cd7	26aa4e3b-5ee2-41ac-8662-bb3e026d7ee3
d349b8e2-c315-40b1-8df4-d671f4fc3cd7	f56a72b4-9a73-4c91-acf0-df76047223ac
d349b8e2-c315-40b1-8df4-d671f4fc3cd7	b943b2d5-853e-42f3-8e45-eb392f891ee1
d349b8e2-c315-40b1-8df4-d671f4fc3cd7	dd2bf7e2-6e13-41a8-926f-f6c07c889fd2
d349b8e2-c315-40b1-8df4-d671f4fc3cd7	85d93397-366d-4444-8d43-64407d4fa0a5
d349b8e2-c315-40b1-8df4-d671f4fc3cd7	8ea6e850-7c21-462f-ba57-850367f4937f
d349b8e2-c315-40b1-8df4-d671f4fc3cd7	d3e6cf2b-4b02-4e2a-9395-582d204e528e
d349b8e2-c315-40b1-8df4-d671f4fc3cd7	9bfab82c-85a3-41e9-bc22-d93427bb8c44
d349b8e2-c315-40b1-8df4-d671f4fc3cd7	cc13385f-1905-4f19-b059-c6da008fb684
d349b8e2-c315-40b1-8df4-d671f4fc3cd7	fb9086b0-3a6a-4ff8-b327-d4a812382d4e
d349b8e2-c315-40b1-8df4-d671f4fc3cd7	a0736da6-62e2-4c25-b94f-a308a370650c
d349b8e2-c315-40b1-8df4-d671f4fc3cd7	cf06e808-ddd0-4208-88f0-68a51b56ef05
d349b8e2-c315-40b1-8df4-d671f4fc3cd7	fc83c34d-97ec-4a23-8a02-65cfe835cd22
d349b8e2-c315-40b1-8df4-d671f4fc3cd7	5c806358-7819-43a9-aa97-931ab522252b
d349b8e2-c315-40b1-8df4-d671f4fc3cd7	4e0e9eb8-e56a-4dab-ad08-b092c45a46b7
26aa4e3b-5ee2-41ac-8662-bb3e026d7ee3	cf06e808-ddd0-4208-88f0-68a51b56ef05
26aa4e3b-5ee2-41ac-8662-bb3e026d7ee3	4e0e9eb8-e56a-4dab-ad08-b092c45a46b7
f56a72b4-9a73-4c91-acf0-df76047223ac	fc83c34d-97ec-4a23-8a02-65cfe835cd22
3eccaf55-c542-47f1-a882-49f2ed7dc1f1	1b1d1b15-b8d3-4b8f-a783-4fb881806524
3eccaf55-c542-47f1-a882-49f2ed7dc1f1	be666772-0820-4162-8be6-66312b9dabe0
3eccaf55-c542-47f1-a882-49f2ed7dc1f1	cbf0983c-5d33-4cd0-96c5-ef70fc326a5c
3eccaf55-c542-47f1-a882-49f2ed7dc1f1	91f97774-7216-4ac5-bf70-55a83ccd6e2b
3eccaf55-c542-47f1-a882-49f2ed7dc1f1	5207b023-477a-4ceb-bc27-55004d0e42cc
3eccaf55-c542-47f1-a882-49f2ed7dc1f1	5f1e6e0c-647a-4860-b0fa-495c5e45ac15
3eccaf55-c542-47f1-a882-49f2ed7dc1f1	d47ae3c3-6249-4476-8c62-5a3e8b4898c8
3eccaf55-c542-47f1-a882-49f2ed7dc1f1	f7d0ce71-ee35-4e0d-a3be-283a52c041de
3eccaf55-c542-47f1-a882-49f2ed7dc1f1	f1078c89-ef1d-4b1b-8080-12c0b6c20939
3eccaf55-c542-47f1-a882-49f2ed7dc1f1	3f4414fc-b1a3-4168-b402-ab3958ac028b
3eccaf55-c542-47f1-a882-49f2ed7dc1f1	757d6875-8d37-47fa-8fd0-30a219b05376
3eccaf55-c542-47f1-a882-49f2ed7dc1f1	63a04bcb-6278-4966-b41b-01f77703b098
3eccaf55-c542-47f1-a882-49f2ed7dc1f1	336e1934-0d0c-48b9-b1fe-7fe1b31976c4
3eccaf55-c542-47f1-a882-49f2ed7dc1f1	b267258f-a4d4-47c9-9b1b-e2de7d4bda60
3eccaf55-c542-47f1-a882-49f2ed7dc1f1	6c663d53-6ca8-43b7-8079-8c1896ea2dbc
3eccaf55-c542-47f1-a882-49f2ed7dc1f1	227fb8a7-134f-4076-ae28-cdcabb380fb4
3eccaf55-c542-47f1-a882-49f2ed7dc1f1	94c21666-934d-4c31-b6d0-b043048710b3
1fcd614d-bb2d-4386-8f5c-219a1e3776de	91df3f3d-267c-463a-bc23-2eda515316fa
91f97774-7216-4ac5-bf70-55a83ccd6e2b	6c663d53-6ca8-43b7-8079-8c1896ea2dbc
cbf0983c-5d33-4cd0-96c5-ef70fc326a5c	b267258f-a4d4-47c9-9b1b-e2de7d4bda60
cbf0983c-5d33-4cd0-96c5-ef70fc326a5c	94c21666-934d-4c31-b6d0-b043048710b3
1fcd614d-bb2d-4386-8f5c-219a1e3776de	f63f91e9-b6b6-41bc-8aa4-75e4bdc11e5b
f63f91e9-b6b6-41bc-8aa4-75e4bdc11e5b	596a3392-1d66-484b-9ea4-06476b610243
c3685623-a824-4bf2-b67e-4c3a9a5a37fb	490b6b09-37e8-4700-85cc-8361fdc169c8
d349b8e2-c315-40b1-8df4-d671f4fc3cd7	15ca025a-02fd-4745-8ae2-01c6eef46703
3eccaf55-c542-47f1-a882-49f2ed7dc1f1	af2f314e-24cb-4253-b674-615fcfc09ce4
1fcd614d-bb2d-4386-8f5c-219a1e3776de	85472bac-0393-40c8-a5e9-b06a15c1ce24
1fcd614d-bb2d-4386-8f5c-219a1e3776de	72ca0ef5-70ea-48a4-bbac-dfc467dfa1ef
dbba9965-679a-420d-8802-f13926702de2	6dac1c89-1910-47ad-ade7-59fa35b18f86
bf6e9d5e-437a-44a7-91ed-b4078bb78b30	4e607d72-939b-40c8-8573-d6679391d333
\.


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
8e280464-0a26-4ff6-b0b0-e2b7f15b06d2	\N	password	738b857d-b15e-45d6-9811-270e820ecc83	1716955511497	\N	{"value":"ogSyjIvAvJEoAgDiv0H59jD2C973wVcjch0c3xnZMqxsslkEhjpxygrdw0mAKv7nUvrHkOwg1cE/2PZBW3+F1Q==","salt":"qeAckl7iMbjdvhjaO+hSFQ==","additionalParameters":{}}	{"hashIterations":210000,"algorithm":"pbkdf2-sha512","additionalParameters":{}}	10
86848ea3-dcd6-4631-8dab-ef3fe5191c07	\N	password	e150e382-e132-4a0f-bcbb-3ecd3c4dc8a7	1716956423589	My password	{"value":"0wE4Hs6OogkEFQA8XMSPH/OvWSPYBfhJaXs+7NdJUzQfWs/BU/1MuN47aAFno9JfT9LWUOujt0e8S5rxxxQwCQ==","salt":"Oq6ZCTV6e2/nn01nz0O5/Q==","additionalParameters":{}}	{"hashIterations":210000,"algorithm":"pbkdf2-sha512","additionalParameters":{}}	10
6e8de46b-77a6-49f9-a81c-126c75e027d0	\N	password	26b4b752-b82c-4594-a2a7-31a41279052d	1716956623210	My password	{"value":"DCo2chqGuI/dgzQ7v86ByAdVFu2cJYK2tcLmCZYsnfPbM5Z7wVgvt78jTKNe8zjD+uq/97Q6e+WUr+zX9X3G1Q==","salt":"EfI6rlV32udmpzpUDkweWw==","additionalParameters":{}}	{"hashIterations":210000,"algorithm":"pbkdf2-sha512","additionalParameters":{}}	10
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2024-05-29 03:52:57.330976	1	EXECUTED	9:6f1016664e21e16d26517a4418f5e3df	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.25.1	\N	\N	6954775712
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2024-05-29 03:52:57.533865	2	MARK_RAN	9:828775b1596a07d1200ba1d49e5e3941	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.25.1	\N	\N	6954775712
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2024-05-29 03:52:58.442004	3	EXECUTED	9:5f090e44a7d595883c1fb61f4b41fd38	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	4.25.1	\N	\N	6954775712
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2024-05-29 03:52:58.479872	4	EXECUTED	9:c07e577387a3d2c04d1adc9aaad8730e	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	4.25.1	\N	\N	6954775712
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2024-05-29 03:52:58.815073	5	EXECUTED	9:b68ce996c655922dbcd2fe6b6ae72686	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.25.1	\N	\N	6954775712
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2024-05-29 03:52:58.830392	6	MARK_RAN	9:543b5c9989f024fe35c6f6c5a97de88e	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.25.1	\N	\N	6954775712
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2024-05-29 03:52:59.679598	7	EXECUTED	9:765afebbe21cf5bbca048e632df38336	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.25.1	\N	\N	6954775712
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2024-05-29 03:52:59.717496	8	MARK_RAN	9:db4a145ba11a6fdaefb397f6dbf829a1	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.25.1	\N	\N	6954775712
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2024-05-29 03:52:59.7929	9	EXECUTED	9:9d05c7be10cdb873f8bcb41bc3a8ab23	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	4.25.1	\N	\N	6954775712
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2024-05-29 03:53:00.916844	10	EXECUTED	9:18593702353128d53111f9b1ff0b82b8	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	4.25.1	\N	\N	6954775712
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2024-05-29 03:53:02.963418	11	EXECUTED	9:6122efe5f090e41a85c0f1c9e52cbb62	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.25.1	\N	\N	6954775712
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2024-05-29 03:53:02.974177	12	MARK_RAN	9:e1ff28bf7568451453f844c5d54bb0b5	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.25.1	\N	\N	6954775712
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2024-05-29 03:53:03.083261	13	EXECUTED	9:7af32cd8957fbc069f796b61217483fd	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.25.1	\N	\N	6954775712
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-05-29 03:53:03.254767	14	EXECUTED	9:6005e15e84714cd83226bf7879f54190	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	4.25.1	\N	\N	6954775712
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-05-29 03:53:03.276807	15	MARK_RAN	9:bf656f5a2b055d07f314431cae76f06c	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	4.25.1	\N	\N	6954775712
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-05-29 03:53:03.287862	16	MARK_RAN	9:f8dadc9284440469dcf71e25ca6ab99b	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	4.25.1	\N	\N	6954775712
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-05-29 03:53:03.311812	17	EXECUTED	9:d41d8cd98f00b204e9800998ecf8427e	empty		\N	4.25.1	\N	\N	6954775712
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2024-05-29 03:53:03.542003	18	EXECUTED	9:3368ff0be4c2855ee2dd9ca813b38d8e	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	4.25.1	\N	\N	6954775712
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2024-05-29 03:53:03.78456	19	EXECUTED	9:8ac2fb5dd030b24c0570a763ed75ed20	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.25.1	\N	\N	6954775712
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2024-05-29 03:53:03.804391	20	EXECUTED	9:f91ddca9b19743db60e3057679810e6c	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.25.1	\N	\N	6954775712
24.0.0-9758-2	keycloak	META-INF/jpa-changelog-24.0.0.xml	2024-05-29 03:53:13.417591	119	EXECUTED	9:bf0fdee10afdf597a987adbf291db7b2	customChange		\N	4.25.1	\N	\N	6954775712
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2024-05-29 03:53:03.815943	21	MARK_RAN	9:831e82914316dc8a57dc09d755f23c51	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.25.1	\N	\N	6954775712
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2024-05-29 03:53:03.831195	22	MARK_RAN	9:f91ddca9b19743db60e3057679810e6c	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.25.1	\N	\N	6954775712
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2024-05-29 03:53:03.956994	23	EXECUTED	9:bc3d0f9e823a69dc21e23e94c7a94bb1	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	4.25.1	\N	\N	6954775712
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2024-05-29 03:53:03.985549	24	EXECUTED	9:c9999da42f543575ab790e76439a2679	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.25.1	\N	\N	6954775712
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2024-05-29 03:53:04.001772	25	MARK_RAN	9:0d6c65c6f58732d81569e77b10ba301d	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.25.1	\N	\N	6954775712
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2024-05-29 03:53:04.213077	26	EXECUTED	9:fc576660fc016ae53d2d4778d84d86d0	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	4.25.1	\N	\N	6954775712
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2024-05-29 03:53:04.914784	27	EXECUTED	9:43ed6b0da89ff77206289e87eaa9c024	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	4.25.1	\N	\N	6954775712
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2024-05-29 03:53:04.931514	28	EXECUTED	9:44bae577f551b3738740281eceb4ea70	update tableName=RESOURCE_SERVER_POLICY		\N	4.25.1	\N	\N	6954775712
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2024-05-29 03:53:05.449647	29	EXECUTED	9:bd88e1f833df0420b01e114533aee5e8	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	4.25.1	\N	\N	6954775712
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2024-05-29 03:53:05.535973	30	EXECUTED	9:a7022af5267f019d020edfe316ef4371	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	4.25.1	\N	\N	6954775712
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2024-05-29 03:53:05.62944	31	EXECUTED	9:fc155c394040654d6a79227e56f5e25a	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	4.25.1	\N	\N	6954775712
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2024-05-29 03:53:05.661087	32	EXECUTED	9:eac4ffb2a14795e5dc7b426063e54d88	customChange		\N	4.25.1	\N	\N	6954775712
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-05-29 03:53:05.695312	33	EXECUTED	9:54937c05672568c4c64fc9524c1e9462	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	4.25.1	\N	\N	6954775712
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-05-29 03:53:05.700934	34	MARK_RAN	9:3a32bace77c84d7678d035a7f5a8084e	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.25.1	\N	\N	6954775712
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-05-29 03:53:05.821501	35	EXECUTED	9:33d72168746f81f98ae3a1e8e0ca3554	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.25.1	\N	\N	6954775712
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2024-05-29 03:53:05.83278	36	EXECUTED	9:61b6d3d7a4c0e0024b0c839da283da0c	addColumn tableName=REALM		\N	4.25.1	\N	\N	6954775712
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-05-29 03:53:05.850457	37	EXECUTED	9:8dcac7bdf7378e7d823cdfddebf72fda	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.25.1	\N	\N	6954775712
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2024-05-29 03:53:05.864225	38	EXECUTED	9:a2b870802540cb3faa72098db5388af3	addColumn tableName=FED_USER_CONSENT		\N	4.25.1	\N	\N	6954775712
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2024-05-29 03:53:05.882484	39	EXECUTED	9:132a67499ba24bcc54fb5cbdcfe7e4c0	addColumn tableName=IDENTITY_PROVIDER		\N	4.25.1	\N	\N	6954775712
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2024-05-29 03:53:05.894155	40	MARK_RAN	9:938f894c032f5430f2b0fafb1a243462	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	4.25.1	\N	\N	6954775712
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2024-05-29 03:53:05.901097	41	MARK_RAN	9:845c332ff1874dc5d35974b0babf3006	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	4.25.1	\N	\N	6954775712
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2024-05-29 03:53:05.921691	42	EXECUTED	9:fc86359c079781adc577c5a217e4d04c	customChange		\N	4.25.1	\N	\N	6954775712
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2024-05-29 03:53:06.894059	43	EXECUTED	9:59a64800e3c0d09b825f8a3b444fa8f4	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	4.25.1	\N	\N	6954775712
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2024-05-29 03:53:06.909611	44	EXECUTED	9:d48d6da5c6ccf667807f633fe489ce88	addColumn tableName=USER_ENTITY		\N	4.25.1	\N	\N	6954775712
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-05-29 03:53:06.928883	45	EXECUTED	9:dde36f7973e80d71fceee683bc5d2951	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	4.25.1	\N	\N	6954775712
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-05-29 03:53:06.949322	46	EXECUTED	9:b855e9b0a406b34fa323235a0cf4f640	customChange		\N	4.25.1	\N	\N	6954775712
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-05-29 03:53:06.962429	47	MARK_RAN	9:51abbacd7b416c50c4421a8cabf7927e	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	4.25.1	\N	\N	6954775712
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-05-29 03:53:07.089998	48	EXECUTED	9:bdc99e567b3398bac83263d375aad143	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	4.25.1	\N	\N	6954775712
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-05-29 03:53:07.103989	49	EXECUTED	9:d198654156881c46bfba39abd7769e69	addColumn tableName=REALM		\N	4.25.1	\N	\N	6954775712
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2024-05-29 03:53:10.160303	50	EXECUTED	9:cfdd8736332ccdd72c5256ccb42335db	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	4.25.1	\N	\N	6954775712
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2024-05-29 03:53:11.778454	51	EXECUTED	9:7c84de3d9bd84d7f077607c1a4dcb714	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	4.25.1	\N	\N	6954775712
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2024-05-29 03:53:11.786283	52	EXECUTED	9:5a6bb36cbefb6a9d6928452c0852af2d	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	6954775712
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2024-05-29 03:53:11.792594	53	EXECUTED	9:8f23e334dbc59f82e0a328373ca6ced0	update tableName=REALM		\N	4.25.1	\N	\N	6954775712
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2024-05-29 03:53:11.801072	54	EXECUTED	9:9156214268f09d970cdf0e1564d866af	update tableName=CLIENT		\N	4.25.1	\N	\N	6954775712
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-05-29 03:53:11.825188	55	EXECUTED	9:db806613b1ed154826c02610b7dbdf74	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	4.25.1	\N	\N	6954775712
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-05-29 03:53:11.836514	56	EXECUTED	9:229a041fb72d5beac76bb94a5fa709de	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	4.25.1	\N	\N	6954775712
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-05-29 03:53:11.892361	57	EXECUTED	9:079899dade9c1e683f26b2aa9ca6ff04	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	4.25.1	\N	\N	6954775712
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-05-29 03:53:12.16756	58	EXECUTED	9:139b79bcbbfe903bb1c2d2a4dbf001d9	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	4.25.1	\N	\N	6954775712
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2024-05-29 03:53:12.238752	59	EXECUTED	9:b55738ad889860c625ba2bf483495a04	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	4.25.1	\N	\N	6954775712
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2024-05-29 03:53:12.250537	60	EXECUTED	9:e0057eac39aa8fc8e09ac6cfa4ae15fe	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	4.25.1	\N	\N	6954775712
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2024-05-29 03:53:12.273252	61	EXECUTED	9:42a33806f3a0443fe0e7feeec821326c	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	4.25.1	\N	\N	6954775712
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2024-05-29 03:53:12.299087	62	EXECUTED	9:9968206fca46eecc1f51db9c024bfe56	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	4.25.1	\N	\N	6954775712
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2024-05-29 03:53:12.307935	63	EXECUTED	9:92143a6daea0a3f3b8f598c97ce55c3d	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	4.25.1	\N	\N	6954775712
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2024-05-29 03:53:12.320245	64	EXECUTED	9:82bab26a27195d889fb0429003b18f40	update tableName=REQUIRED_ACTION_PROVIDER		\N	4.25.1	\N	\N	6954775712
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2024-05-29 03:53:12.334147	65	EXECUTED	9:e590c88ddc0b38b0ae4249bbfcb5abc3	update tableName=RESOURCE_SERVER_RESOURCE		\N	4.25.1	\N	\N	6954775712
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2024-05-29 03:53:12.369177	66	EXECUTED	9:5c1f475536118dbdc38d5d7977950cc0	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	4.25.1	\N	\N	6954775712
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2024-05-29 03:53:12.388607	67	EXECUTED	9:e7c9f5f9c4d67ccbbcc215440c718a17	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	4.25.1	\N	\N	6954775712
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2024-05-29 03:53:12.409785	68	EXECUTED	9:88e0bfdda924690d6f4e430c53447dd5	addColumn tableName=REALM		\N	4.25.1	\N	\N	6954775712
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2024-05-29 03:53:12.435854	69	EXECUTED	9:f53177f137e1c46b6a88c59ec1cb5218	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	4.25.1	\N	\N	6954775712
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2024-05-29 03:53:12.447307	70	EXECUTED	9:a74d33da4dc42a37ec27121580d1459f	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	4.25.1	\N	\N	6954775712
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2024-05-29 03:53:12.457227	71	EXECUTED	9:fd4ade7b90c3b67fae0bfcfcb42dfb5f	addColumn tableName=RESOURCE_SERVER		\N	4.25.1	\N	\N	6954775712
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-05-29 03:53:12.472008	72	EXECUTED	9:aa072ad090bbba210d8f18781b8cebf4	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	4.25.1	\N	\N	6954775712
8.0.0-updating-credential-data-not-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-05-29 03:53:12.490578	73	EXECUTED	9:1ae6be29bab7c2aa376f6983b932be37	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.25.1	\N	\N	6954775712
8.0.0-updating-credential-data-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-05-29 03:53:12.495084	74	MARK_RAN	9:14706f286953fc9a25286dbd8fb30d97	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.25.1	\N	\N	6954775712
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-05-29 03:53:12.540578	75	EXECUTED	9:2b9cc12779be32c5b40e2e67711a218b	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	4.25.1	\N	\N	6954775712
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-05-29 03:53:12.565317	76	EXECUTED	9:91fa186ce7a5af127a2d7a91ee083cc5	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	4.25.1	\N	\N	6954775712
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-05-29 03:53:12.573919	77	EXECUTED	9:6335e5c94e83a2639ccd68dd24e2e5ad	addColumn tableName=CLIENT		\N	4.25.1	\N	\N	6954775712
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-05-29 03:53:12.576967	78	MARK_RAN	9:6bdb5658951e028bfe16fa0a8228b530	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	4.25.1	\N	\N	6954775712
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-05-29 03:53:12.623613	79	EXECUTED	9:d5bc15a64117ccad481ce8792d4c608f	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	4.25.1	\N	\N	6954775712
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-05-29 03:53:12.629469	80	MARK_RAN	9:077cba51999515f4d3e7ad5619ab592c	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	4.25.1	\N	\N	6954775712
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-05-29 03:53:12.646327	81	EXECUTED	9:be969f08a163bf47c6b9e9ead8ac2afb	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	4.25.1	\N	\N	6954775712
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-05-29 03:53:12.649883	82	MARK_RAN	9:6d3bb4408ba5a72f39bd8a0b301ec6e3	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.25.1	\N	\N	6954775712
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-05-29 03:53:12.666172	83	EXECUTED	9:966bda61e46bebf3cc39518fbed52fa7	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	4.25.1	\N	\N	6954775712
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-05-29 03:53:12.675993	84	MARK_RAN	9:8dcac7bdf7378e7d823cdfddebf72fda	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.25.1	\N	\N	6954775712
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-05-29 03:53:12.693243	85	EXECUTED	9:7d93d602352a30c0c317e6a609b56599	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	4.25.1	\N	\N	6954775712
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2024-05-29 03:53:12.705963	86	EXECUTED	9:71c5969e6cdd8d7b6f47cebc86d37627	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	4.25.1	\N	\N	6954775712
map-remove-ri	keycloak	META-INF/jpa-changelog-12.0.0.xml	2024-05-29 03:53:12.718518	87	EXECUTED	9:a9ba7d47f065f041b7da856a81762021	dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...		\N	4.25.1	\N	\N	6954775712
12.1.0-add-realm-localization-table	keycloak	META-INF/jpa-changelog-12.0.0.xml	2024-05-29 03:53:12.7473	88	EXECUTED	9:fffabce2bc01e1a8f5110d5278500065	createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS		\N	4.25.1	\N	\N	6954775712
default-roles	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-05-29 03:53:12.763097	89	EXECUTED	9:fa8a5b5445e3857f4b010bafb5009957	addColumn tableName=REALM; customChange		\N	4.25.1	\N	\N	6954775712
default-roles-cleanup	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-05-29 03:53:12.774737	90	EXECUTED	9:67ac3241df9a8582d591c5ed87125f39	dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES		\N	4.25.1	\N	\N	6954775712
13.0.0-KEYCLOAK-16844	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-05-29 03:53:12.796732	91	EXECUTED	9:ad1194d66c937e3ffc82386c050ba089	createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.25.1	\N	\N	6954775712
map-remove-ri-13.0.0	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-05-29 03:53:12.815504	92	EXECUTED	9:d9be619d94af5a2f5d07b9f003543b91	dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...		\N	4.25.1	\N	\N	6954775712
13.0.0-KEYCLOAK-17992-drop-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-05-29 03:53:12.820332	93	MARK_RAN	9:544d201116a0fcc5a5da0925fbbc3bde	dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT		\N	4.25.1	\N	\N	6954775712
13.0.0-increase-column-size-federated	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-05-29 03:53:12.837297	94	EXECUTED	9:43c0c1055b6761b4b3e89de76d612ccf	modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT		\N	4.25.1	\N	\N	6954775712
13.0.0-KEYCLOAK-17992-recreate-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-05-29 03:53:12.840435	95	MARK_RAN	9:8bd711fd0330f4fe980494ca43ab1139	addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...		\N	4.25.1	\N	\N	6954775712
json-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-05-29 03:53:12.857517	96	EXECUTED	9:e07d2bc0970c348bb06fb63b1f82ddbf	addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE		\N	4.25.1	\N	\N	6954775712
14.0.0-KEYCLOAK-11019	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-05-29 03:53:12.897612	97	EXECUTED	9:24fb8611e97f29989bea412aa38d12b7	createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.25.1	\N	\N	6954775712
14.0.0-KEYCLOAK-18286	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-05-29 03:53:12.902008	98	MARK_RAN	9:259f89014ce2506ee84740cbf7163aa7	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	6954775712
14.0.0-KEYCLOAK-18286-revert	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-05-29 03:53:12.924968	99	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	6954775712
14.0.0-KEYCLOAK-18286-supported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-05-29 03:53:12.9508	100	EXECUTED	9:60ca84a0f8c94ec8c3504a5a3bc88ee8	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	6954775712
14.0.0-KEYCLOAK-18286-unsupported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-05-29 03:53:12.955177	101	MARK_RAN	9:d3d977031d431db16e2c181ce49d73e9	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	6954775712
KEYCLOAK-17267-add-index-to-user-attributes	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-05-29 03:53:12.970019	102	EXECUTED	9:0b305d8d1277f3a89a0a53a659ad274c	createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE		\N	4.25.1	\N	\N	6954775712
KEYCLOAK-18146-add-saml-art-binding-identifier	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-05-29 03:53:12.984598	103	EXECUTED	9:2c374ad2cdfe20e2905a84c8fac48460	customChange		\N	4.25.1	\N	\N	6954775712
15.0.0-KEYCLOAK-18467	keycloak	META-INF/jpa-changelog-15.0.0.xml	2024-05-29 03:53:13.008654	104	EXECUTED	9:47a760639ac597360a8219f5b768b4de	addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...		\N	4.25.1	\N	\N	6954775712
17.0.0-9562	keycloak	META-INF/jpa-changelog-17.0.0.xml	2024-05-29 03:53:13.025803	105	EXECUTED	9:a6272f0576727dd8cad2522335f5d99e	createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY		\N	4.25.1	\N	\N	6954775712
18.0.0-10625-IDX_ADMIN_EVENT_TIME	keycloak	META-INF/jpa-changelog-18.0.0.xml	2024-05-29 03:53:13.038134	106	EXECUTED	9:015479dbd691d9cc8669282f4828c41d	createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY		\N	4.25.1	\N	\N	6954775712
19.0.0-10135	keycloak	META-INF/jpa-changelog-19.0.0.xml	2024-05-29 03:53:13.052738	107	EXECUTED	9:9518e495fdd22f78ad6425cc30630221	customChange		\N	4.25.1	\N	\N	6954775712
20.0.0-12964-supported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2024-05-29 03:53:13.080571	108	EXECUTED	9:e5f243877199fd96bcc842f27a1656ac	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.25.1	\N	\N	6954775712
20.0.0-12964-unsupported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2024-05-29 03:53:13.086909	109	MARK_RAN	9:1a6fcaa85e20bdeae0a9ce49b41946a5	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.25.1	\N	\N	6954775712
client-attributes-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-20.0.0.xml	2024-05-29 03:53:13.106359	110	EXECUTED	9:3f332e13e90739ed0c35b0b25b7822ca	addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	6954775712
21.0.2-17277	keycloak	META-INF/jpa-changelog-21.0.2.xml	2024-05-29 03:53:13.127694	111	EXECUTED	9:7ee1f7a3fb8f5588f171fb9a6ab623c0	customChange		\N	4.25.1	\N	\N	6954775712
21.1.0-19404	keycloak	META-INF/jpa-changelog-21.1.0.xml	2024-05-29 03:53:13.237051	112	EXECUTED	9:3d7e830b52f33676b9d64f7f2b2ea634	modifyDataType columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=LOGIC, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=POLICY_ENFORCE_MODE, tableName=RESOURCE_SERVER		\N	4.25.1	\N	\N	6954775712
21.1.0-19404-2	keycloak	META-INF/jpa-changelog-21.1.0.xml	2024-05-29 03:53:13.244133	113	MARK_RAN	9:627d032e3ef2c06c0e1f73d2ae25c26c	addColumn tableName=RESOURCE_SERVER_POLICY; update tableName=RESOURCE_SERVER_POLICY; dropColumn columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; renameColumn newColumnName=DECISION_STRATEGY, oldColumnName=DECISION_STRATEGY_NEW, tabl...		\N	4.25.1	\N	\N	6954775712
22.0.0-17484-updated	keycloak	META-INF/jpa-changelog-22.0.0.xml	2024-05-29 03:53:13.279656	114	EXECUTED	9:90af0bfd30cafc17b9f4d6eccd92b8b3	customChange		\N	4.25.1	\N	\N	6954775712
22.0.5-24031	keycloak	META-INF/jpa-changelog-22.0.0.xml	2024-05-29 03:53:13.287155	115	MARK_RAN	9:a60d2d7b315ec2d3eba9e2f145f9df28	customChange		\N	4.25.1	\N	\N	6954775712
23.0.0-12062	keycloak	META-INF/jpa-changelog-23.0.0.xml	2024-05-29 03:53:13.305623	116	EXECUTED	9:2168fbe728fec46ae9baf15bf80927b8	addColumn tableName=COMPONENT_CONFIG; update tableName=COMPONENT_CONFIG; dropColumn columnName=VALUE, tableName=COMPONENT_CONFIG; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=COMPONENT_CONFIG		\N	4.25.1	\N	\N	6954775712
23.0.0-17258	keycloak	META-INF/jpa-changelog-23.0.0.xml	2024-05-29 03:53:13.319204	117	EXECUTED	9:36506d679a83bbfda85a27ea1864dca8	addColumn tableName=EVENT_ENTITY		\N	4.25.1	\N	\N	6954775712
24.0.0-9758	keycloak	META-INF/jpa-changelog-24.0.0.xml	2024-05-29 03:53:13.392211	118	EXECUTED	9:502c557a5189f600f0f445a9b49ebbce	addColumn tableName=USER_ATTRIBUTE; addColumn tableName=FED_USER_ATTRIBUTE; createIndex indexName=USER_ATTR_LONG_VALUES, tableName=USER_ATTRIBUTE; createIndex indexName=FED_USER_ATTR_LONG_VALUES, tableName=FED_USER_ATTRIBUTE; createIndex indexName...		\N	4.25.1	\N	\N	6954775712
24.0.0-26618-drop-index-if-present	keycloak	META-INF/jpa-changelog-24.0.0.xml	2024-05-29 03:53:13.430722	120	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	6954775712
24.0.0-26618-reindex	keycloak	META-INF/jpa-changelog-24.0.0.xml	2024-05-29 03:53:13.473173	121	EXECUTED	9:08707c0f0db1cef6b352db03a60edc7f	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	6954775712
24.0.2-27228	keycloak	META-INF/jpa-changelog-24.0.2.xml	2024-05-29 03:53:13.497669	122	EXECUTED	9:eaee11f6b8aa25d2cc6a84fb86fc6238	customChange		\N	4.25.1	\N	\N	6954775712
24.0.2-27967-drop-index-if-present	keycloak	META-INF/jpa-changelog-24.0.2.xml	2024-05-29 03:53:13.50862	123	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	6954775712
24.0.2-27967-reindex	keycloak	META-INF/jpa-changelog-24.0.2.xml	2024-05-29 03:53:13.515792	124	MARK_RAN	9:d3d977031d431db16e2c181ce49d73e9	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	6954775712
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
1001	f	\N	\N
\.


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
d9df55b1-c105-4a3c-96cd-8719a1891442	58d5cdfb-ef6a-44b6-90a1-58fea0fb6342	f
d9df55b1-c105-4a3c-96cd-8719a1891442	ee9b2187-9f5d-4745-b877-7594b5e29fbd	t
d9df55b1-c105-4a3c-96cd-8719a1891442	c490792d-85b6-42d6-8588-ea121e045e69	t
d9df55b1-c105-4a3c-96cd-8719a1891442	7fca4a9c-37b9-4174-9895-99cfa51cbb39	t
d9df55b1-c105-4a3c-96cd-8719a1891442	3b3015ef-ad48-415b-850c-b0a3bac12e73	f
d9df55b1-c105-4a3c-96cd-8719a1891442	64ec2880-4e98-4aeb-b1e5-5320e794b260	f
d9df55b1-c105-4a3c-96cd-8719a1891442	43d907ed-a7dd-4ce2-b78f-a15381d4c623	t
d9df55b1-c105-4a3c-96cd-8719a1891442	ad114cee-47e5-4d9f-b7e5-ab4a07a7dd42	t
d9df55b1-c105-4a3c-96cd-8719a1891442	4c048884-6fa7-4170-b098-02f713aaf92a	f
d9df55b1-c105-4a3c-96cd-8719a1891442	3cbbd487-a8cb-4205-9925-f96ed5639799	t
51b23642-b8e2-49b1-a277-da115aec56b8	e619eab0-04fb-4ec5-9e16-8b35130912d2	f
51b23642-b8e2-49b1-a277-da115aec56b8	6c40454a-8ab9-4e3a-8647-be5eb1b33022	t
51b23642-b8e2-49b1-a277-da115aec56b8	693d6c40-80d4-4c21-ab17-88f02b759235	t
51b23642-b8e2-49b1-a277-da115aec56b8	51e7f951-0387-4f50-bd7c-da6cc7c46301	t
51b23642-b8e2-49b1-a277-da115aec56b8	e73d1212-02c3-4a8a-9ca5-de38c5c74d6d	f
51b23642-b8e2-49b1-a277-da115aec56b8	443d1ce4-9e18-4101-b4ed-8f8919714e0d	f
51b23642-b8e2-49b1-a277-da115aec56b8	67a65166-f799-4d85-a7df-f6ff85eeac9b	t
51b23642-b8e2-49b1-a277-da115aec56b8	addadab8-9e48-40e6-8544-1b4cc51d68a0	t
51b23642-b8e2-49b1-a277-da115aec56b8	07483a37-bcd1-4924-bac8-2d3b44eb09fc	f
51b23642-b8e2-49b1-a277-da115aec56b8	5b310fd5-1d5b-49b5-9edb-ecbf171e9ba9	t
\.


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id, details_json_long_value) FROM stdin;
\.


--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value, long_value_hash, long_value_hash_lower_case, long_value) FROM stdin;
\.


--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.


--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.group_role_mapping (role_id, group_id) FROM stdin;
\.


--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only) FROM stdin;
\.


--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.keycloak_group (id, name, parent_group, realm_id) FROM stdin;
\.


--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
b65eb93d-5eb3-482a-984d-edb8b63f2b16	d9df55b1-c105-4a3c-96cd-8719a1891442	f	${role_default-roles}	default-roles-master	d9df55b1-c105-4a3c-96cd-8719a1891442	\N	\N
a364ed9c-516e-4ab9-8f07-38ef77379b2f	d9df55b1-c105-4a3c-96cd-8719a1891442	f	${role_create-realm}	create-realm	d9df55b1-c105-4a3c-96cd-8719a1891442	\N	\N
d349b8e2-c315-40b1-8df4-d671f4fc3cd7	d9df55b1-c105-4a3c-96cd-8719a1891442	f	${role_admin}	admin	d9df55b1-c105-4a3c-96cd-8719a1891442	\N	\N
d1ddde8c-169f-4139-b6cb-cfbcc58879f5	f91ace5c-70b3-43a8-8194-a2c0edf64b8e	t	${role_create-client}	create-client	d9df55b1-c105-4a3c-96cd-8719a1891442	f91ace5c-70b3-43a8-8194-a2c0edf64b8e	\N
bce93f0b-c8c0-4bd2-b537-be1b7ad29ba5	f91ace5c-70b3-43a8-8194-a2c0edf64b8e	t	${role_view-realm}	view-realm	d9df55b1-c105-4a3c-96cd-8719a1891442	f91ace5c-70b3-43a8-8194-a2c0edf64b8e	\N
d08d9b8f-c80b-4928-94c6-f9d6af4230db	f91ace5c-70b3-43a8-8194-a2c0edf64b8e	t	${role_view-users}	view-users	d9df55b1-c105-4a3c-96cd-8719a1891442	f91ace5c-70b3-43a8-8194-a2c0edf64b8e	\N
054513df-991a-49fd-85e8-8a67f230f008	f91ace5c-70b3-43a8-8194-a2c0edf64b8e	t	${role_view-clients}	view-clients	d9df55b1-c105-4a3c-96cd-8719a1891442	f91ace5c-70b3-43a8-8194-a2c0edf64b8e	\N
3dcb6ba1-0f53-4b88-ac17-5d67f7670a77	f91ace5c-70b3-43a8-8194-a2c0edf64b8e	t	${role_view-events}	view-events	d9df55b1-c105-4a3c-96cd-8719a1891442	f91ace5c-70b3-43a8-8194-a2c0edf64b8e	\N
0836c860-599f-497a-922f-536e79ccc904	f91ace5c-70b3-43a8-8194-a2c0edf64b8e	t	${role_view-identity-providers}	view-identity-providers	d9df55b1-c105-4a3c-96cd-8719a1891442	f91ace5c-70b3-43a8-8194-a2c0edf64b8e	\N
95c28ca5-b577-4b6f-92e5-d5a66099bc0f	f91ace5c-70b3-43a8-8194-a2c0edf64b8e	t	${role_view-authorization}	view-authorization	d9df55b1-c105-4a3c-96cd-8719a1891442	f91ace5c-70b3-43a8-8194-a2c0edf64b8e	\N
41d9cbbe-99f9-488f-83ae-1f2316fcdd6c	f91ace5c-70b3-43a8-8194-a2c0edf64b8e	t	${role_manage-realm}	manage-realm	d9df55b1-c105-4a3c-96cd-8719a1891442	f91ace5c-70b3-43a8-8194-a2c0edf64b8e	\N
e7dd61f9-a3e1-4db7-a714-fa59f157eeaa	f91ace5c-70b3-43a8-8194-a2c0edf64b8e	t	${role_manage-users}	manage-users	d9df55b1-c105-4a3c-96cd-8719a1891442	f91ace5c-70b3-43a8-8194-a2c0edf64b8e	\N
d4ce0d1c-cd6e-4388-8288-01304702c3e2	f91ace5c-70b3-43a8-8194-a2c0edf64b8e	t	${role_manage-clients}	manage-clients	d9df55b1-c105-4a3c-96cd-8719a1891442	f91ace5c-70b3-43a8-8194-a2c0edf64b8e	\N
5b95b8d3-e242-4cfb-81d3-f1c1a4a1d2b3	f91ace5c-70b3-43a8-8194-a2c0edf64b8e	t	${role_manage-events}	manage-events	d9df55b1-c105-4a3c-96cd-8719a1891442	f91ace5c-70b3-43a8-8194-a2c0edf64b8e	\N
59c02967-8a01-4709-a889-f821f1ecef32	f91ace5c-70b3-43a8-8194-a2c0edf64b8e	t	${role_manage-identity-providers}	manage-identity-providers	d9df55b1-c105-4a3c-96cd-8719a1891442	f91ace5c-70b3-43a8-8194-a2c0edf64b8e	\N
282196c7-a549-4bcf-8a91-ab7830a034ff	f91ace5c-70b3-43a8-8194-a2c0edf64b8e	t	${role_manage-authorization}	manage-authorization	d9df55b1-c105-4a3c-96cd-8719a1891442	f91ace5c-70b3-43a8-8194-a2c0edf64b8e	\N
4aa4c47b-4bd9-40c3-96ac-74118a7285d9	f91ace5c-70b3-43a8-8194-a2c0edf64b8e	t	${role_query-users}	query-users	d9df55b1-c105-4a3c-96cd-8719a1891442	f91ace5c-70b3-43a8-8194-a2c0edf64b8e	\N
be40b32c-88b6-4241-a7dc-64310f22fdff	f91ace5c-70b3-43a8-8194-a2c0edf64b8e	t	${role_query-clients}	query-clients	d9df55b1-c105-4a3c-96cd-8719a1891442	f91ace5c-70b3-43a8-8194-a2c0edf64b8e	\N
5dc0933b-223c-44bb-8c10-815efb02c223	f91ace5c-70b3-43a8-8194-a2c0edf64b8e	t	${role_query-realms}	query-realms	d9df55b1-c105-4a3c-96cd-8719a1891442	f91ace5c-70b3-43a8-8194-a2c0edf64b8e	\N
76f8b443-4be4-4ba8-a53f-4896cea90faf	f91ace5c-70b3-43a8-8194-a2c0edf64b8e	t	${role_query-groups}	query-groups	d9df55b1-c105-4a3c-96cd-8719a1891442	f91ace5c-70b3-43a8-8194-a2c0edf64b8e	\N
ae580874-5295-40b8-950c-a9666eff7e22	1724038c-2170-4354-b987-7b1297b3cbc3	t	${role_view-profile}	view-profile	d9df55b1-c105-4a3c-96cd-8719a1891442	1724038c-2170-4354-b987-7b1297b3cbc3	\N
aa26e5ce-2c2f-4cfa-951b-362d65a6a7ef	1724038c-2170-4354-b987-7b1297b3cbc3	t	${role_manage-account}	manage-account	d9df55b1-c105-4a3c-96cd-8719a1891442	1724038c-2170-4354-b987-7b1297b3cbc3	\N
8a80628b-b479-4d6b-9406-046a68cd1fa8	1724038c-2170-4354-b987-7b1297b3cbc3	t	${role_manage-account-links}	manage-account-links	d9df55b1-c105-4a3c-96cd-8719a1891442	1724038c-2170-4354-b987-7b1297b3cbc3	\N
6db8c1d3-e8b8-4f81-bd35-cb7eaadfd46a	1724038c-2170-4354-b987-7b1297b3cbc3	t	${role_view-applications}	view-applications	d9df55b1-c105-4a3c-96cd-8719a1891442	1724038c-2170-4354-b987-7b1297b3cbc3	\N
c0ca3356-d13b-4765-a718-8b3a37d61ce0	1724038c-2170-4354-b987-7b1297b3cbc3	t	${role_view-consent}	view-consent	d9df55b1-c105-4a3c-96cd-8719a1891442	1724038c-2170-4354-b987-7b1297b3cbc3	\N
a0bed86e-5cd2-4498-8c23-78940a5ae920	1724038c-2170-4354-b987-7b1297b3cbc3	t	${role_manage-consent}	manage-consent	d9df55b1-c105-4a3c-96cd-8719a1891442	1724038c-2170-4354-b987-7b1297b3cbc3	\N
83c7a3d7-799a-4260-b128-6b94583f26c8	1724038c-2170-4354-b987-7b1297b3cbc3	t	${role_view-groups}	view-groups	d9df55b1-c105-4a3c-96cd-8719a1891442	1724038c-2170-4354-b987-7b1297b3cbc3	\N
e8edae5f-f3c0-4730-9cac-bca5f0440f78	1724038c-2170-4354-b987-7b1297b3cbc3	t	${role_delete-account}	delete-account	d9df55b1-c105-4a3c-96cd-8719a1891442	1724038c-2170-4354-b987-7b1297b3cbc3	\N
e8573f96-7219-4113-ba7a-fef676cf3e01	af724032-dd67-4ff4-8ede-da122d6b0829	t	${role_read-token}	read-token	d9df55b1-c105-4a3c-96cd-8719a1891442	af724032-dd67-4ff4-8ede-da122d6b0829	\N
dbcbcc69-1f1a-4cbb-807c-07c95b46afa8	f91ace5c-70b3-43a8-8194-a2c0edf64b8e	t	${role_impersonation}	impersonation	d9df55b1-c105-4a3c-96cd-8719a1891442	f91ace5c-70b3-43a8-8194-a2c0edf64b8e	\N
b30dac96-d59c-49ca-a4ca-35e36e957933	d9df55b1-c105-4a3c-96cd-8719a1891442	f	${role_offline-access}	offline_access	d9df55b1-c105-4a3c-96cd-8719a1891442	\N	\N
70591957-fa9e-43e2-8dde-ce03ee733ce4	d9df55b1-c105-4a3c-96cd-8719a1891442	f	${role_uma_authorization}	uma_authorization	d9df55b1-c105-4a3c-96cd-8719a1891442	\N	\N
1fcd614d-bb2d-4386-8f5c-219a1e3776de	51b23642-b8e2-49b1-a277-da115aec56b8	f	${role_default-roles}	default-roles-paisesapprealm	51b23642-b8e2-49b1-a277-da115aec56b8	\N	\N
7b2f091a-c2ea-4c22-ba4f-c314b3b0f9b4	40d799c9-e447-4405-8024-f0f0a4f2c067	t	${role_create-client}	create-client	d9df55b1-c105-4a3c-96cd-8719a1891442	40d799c9-e447-4405-8024-f0f0a4f2c067	\N
eaefafdd-c18a-4c78-b712-2f41c5319ec2	40d799c9-e447-4405-8024-f0f0a4f2c067	t	${role_view-realm}	view-realm	d9df55b1-c105-4a3c-96cd-8719a1891442	40d799c9-e447-4405-8024-f0f0a4f2c067	\N
26aa4e3b-5ee2-41ac-8662-bb3e026d7ee3	40d799c9-e447-4405-8024-f0f0a4f2c067	t	${role_view-users}	view-users	d9df55b1-c105-4a3c-96cd-8719a1891442	40d799c9-e447-4405-8024-f0f0a4f2c067	\N
f56a72b4-9a73-4c91-acf0-df76047223ac	40d799c9-e447-4405-8024-f0f0a4f2c067	t	${role_view-clients}	view-clients	d9df55b1-c105-4a3c-96cd-8719a1891442	40d799c9-e447-4405-8024-f0f0a4f2c067	\N
b943b2d5-853e-42f3-8e45-eb392f891ee1	40d799c9-e447-4405-8024-f0f0a4f2c067	t	${role_view-events}	view-events	d9df55b1-c105-4a3c-96cd-8719a1891442	40d799c9-e447-4405-8024-f0f0a4f2c067	\N
dd2bf7e2-6e13-41a8-926f-f6c07c889fd2	40d799c9-e447-4405-8024-f0f0a4f2c067	t	${role_view-identity-providers}	view-identity-providers	d9df55b1-c105-4a3c-96cd-8719a1891442	40d799c9-e447-4405-8024-f0f0a4f2c067	\N
85d93397-366d-4444-8d43-64407d4fa0a5	40d799c9-e447-4405-8024-f0f0a4f2c067	t	${role_view-authorization}	view-authorization	d9df55b1-c105-4a3c-96cd-8719a1891442	40d799c9-e447-4405-8024-f0f0a4f2c067	\N
8ea6e850-7c21-462f-ba57-850367f4937f	40d799c9-e447-4405-8024-f0f0a4f2c067	t	${role_manage-realm}	manage-realm	d9df55b1-c105-4a3c-96cd-8719a1891442	40d799c9-e447-4405-8024-f0f0a4f2c067	\N
d3e6cf2b-4b02-4e2a-9395-582d204e528e	40d799c9-e447-4405-8024-f0f0a4f2c067	t	${role_manage-users}	manage-users	d9df55b1-c105-4a3c-96cd-8719a1891442	40d799c9-e447-4405-8024-f0f0a4f2c067	\N
9bfab82c-85a3-41e9-bc22-d93427bb8c44	40d799c9-e447-4405-8024-f0f0a4f2c067	t	${role_manage-clients}	manage-clients	d9df55b1-c105-4a3c-96cd-8719a1891442	40d799c9-e447-4405-8024-f0f0a4f2c067	\N
cc13385f-1905-4f19-b059-c6da008fb684	40d799c9-e447-4405-8024-f0f0a4f2c067	t	${role_manage-events}	manage-events	d9df55b1-c105-4a3c-96cd-8719a1891442	40d799c9-e447-4405-8024-f0f0a4f2c067	\N
fb9086b0-3a6a-4ff8-b327-d4a812382d4e	40d799c9-e447-4405-8024-f0f0a4f2c067	t	${role_manage-identity-providers}	manage-identity-providers	d9df55b1-c105-4a3c-96cd-8719a1891442	40d799c9-e447-4405-8024-f0f0a4f2c067	\N
a0736da6-62e2-4c25-b94f-a308a370650c	40d799c9-e447-4405-8024-f0f0a4f2c067	t	${role_manage-authorization}	manage-authorization	d9df55b1-c105-4a3c-96cd-8719a1891442	40d799c9-e447-4405-8024-f0f0a4f2c067	\N
cf06e808-ddd0-4208-88f0-68a51b56ef05	40d799c9-e447-4405-8024-f0f0a4f2c067	t	${role_query-users}	query-users	d9df55b1-c105-4a3c-96cd-8719a1891442	40d799c9-e447-4405-8024-f0f0a4f2c067	\N
fc83c34d-97ec-4a23-8a02-65cfe835cd22	40d799c9-e447-4405-8024-f0f0a4f2c067	t	${role_query-clients}	query-clients	d9df55b1-c105-4a3c-96cd-8719a1891442	40d799c9-e447-4405-8024-f0f0a4f2c067	\N
5c806358-7819-43a9-aa97-931ab522252b	40d799c9-e447-4405-8024-f0f0a4f2c067	t	${role_query-realms}	query-realms	d9df55b1-c105-4a3c-96cd-8719a1891442	40d799c9-e447-4405-8024-f0f0a4f2c067	\N
4e0e9eb8-e56a-4dab-ad08-b092c45a46b7	40d799c9-e447-4405-8024-f0f0a4f2c067	t	${role_query-groups}	query-groups	d9df55b1-c105-4a3c-96cd-8719a1891442	40d799c9-e447-4405-8024-f0f0a4f2c067	\N
3eccaf55-c542-47f1-a882-49f2ed7dc1f1	5d0f2823-006e-4aec-b9e5-05530c4d5629	t	${role_realm-admin}	realm-admin	51b23642-b8e2-49b1-a277-da115aec56b8	5d0f2823-006e-4aec-b9e5-05530c4d5629	\N
1b1d1b15-b8d3-4b8f-a783-4fb881806524	5d0f2823-006e-4aec-b9e5-05530c4d5629	t	${role_create-client}	create-client	51b23642-b8e2-49b1-a277-da115aec56b8	5d0f2823-006e-4aec-b9e5-05530c4d5629	\N
be666772-0820-4162-8be6-66312b9dabe0	5d0f2823-006e-4aec-b9e5-05530c4d5629	t	${role_view-realm}	view-realm	51b23642-b8e2-49b1-a277-da115aec56b8	5d0f2823-006e-4aec-b9e5-05530c4d5629	\N
cbf0983c-5d33-4cd0-96c5-ef70fc326a5c	5d0f2823-006e-4aec-b9e5-05530c4d5629	t	${role_view-users}	view-users	51b23642-b8e2-49b1-a277-da115aec56b8	5d0f2823-006e-4aec-b9e5-05530c4d5629	\N
91f97774-7216-4ac5-bf70-55a83ccd6e2b	5d0f2823-006e-4aec-b9e5-05530c4d5629	t	${role_view-clients}	view-clients	51b23642-b8e2-49b1-a277-da115aec56b8	5d0f2823-006e-4aec-b9e5-05530c4d5629	\N
5207b023-477a-4ceb-bc27-55004d0e42cc	5d0f2823-006e-4aec-b9e5-05530c4d5629	t	${role_view-events}	view-events	51b23642-b8e2-49b1-a277-da115aec56b8	5d0f2823-006e-4aec-b9e5-05530c4d5629	\N
5f1e6e0c-647a-4860-b0fa-495c5e45ac15	5d0f2823-006e-4aec-b9e5-05530c4d5629	t	${role_view-identity-providers}	view-identity-providers	51b23642-b8e2-49b1-a277-da115aec56b8	5d0f2823-006e-4aec-b9e5-05530c4d5629	\N
d47ae3c3-6249-4476-8c62-5a3e8b4898c8	5d0f2823-006e-4aec-b9e5-05530c4d5629	t	${role_view-authorization}	view-authorization	51b23642-b8e2-49b1-a277-da115aec56b8	5d0f2823-006e-4aec-b9e5-05530c4d5629	\N
f7d0ce71-ee35-4e0d-a3be-283a52c041de	5d0f2823-006e-4aec-b9e5-05530c4d5629	t	${role_manage-realm}	manage-realm	51b23642-b8e2-49b1-a277-da115aec56b8	5d0f2823-006e-4aec-b9e5-05530c4d5629	\N
f1078c89-ef1d-4b1b-8080-12c0b6c20939	5d0f2823-006e-4aec-b9e5-05530c4d5629	t	${role_manage-users}	manage-users	51b23642-b8e2-49b1-a277-da115aec56b8	5d0f2823-006e-4aec-b9e5-05530c4d5629	\N
3f4414fc-b1a3-4168-b402-ab3958ac028b	5d0f2823-006e-4aec-b9e5-05530c4d5629	t	${role_manage-clients}	manage-clients	51b23642-b8e2-49b1-a277-da115aec56b8	5d0f2823-006e-4aec-b9e5-05530c4d5629	\N
757d6875-8d37-47fa-8fd0-30a219b05376	5d0f2823-006e-4aec-b9e5-05530c4d5629	t	${role_manage-events}	manage-events	51b23642-b8e2-49b1-a277-da115aec56b8	5d0f2823-006e-4aec-b9e5-05530c4d5629	\N
63a04bcb-6278-4966-b41b-01f77703b098	5d0f2823-006e-4aec-b9e5-05530c4d5629	t	${role_manage-identity-providers}	manage-identity-providers	51b23642-b8e2-49b1-a277-da115aec56b8	5d0f2823-006e-4aec-b9e5-05530c4d5629	\N
336e1934-0d0c-48b9-b1fe-7fe1b31976c4	5d0f2823-006e-4aec-b9e5-05530c4d5629	t	${role_manage-authorization}	manage-authorization	51b23642-b8e2-49b1-a277-da115aec56b8	5d0f2823-006e-4aec-b9e5-05530c4d5629	\N
b267258f-a4d4-47c9-9b1b-e2de7d4bda60	5d0f2823-006e-4aec-b9e5-05530c4d5629	t	${role_query-users}	query-users	51b23642-b8e2-49b1-a277-da115aec56b8	5d0f2823-006e-4aec-b9e5-05530c4d5629	\N
6c663d53-6ca8-43b7-8079-8c1896ea2dbc	5d0f2823-006e-4aec-b9e5-05530c4d5629	t	${role_query-clients}	query-clients	51b23642-b8e2-49b1-a277-da115aec56b8	5d0f2823-006e-4aec-b9e5-05530c4d5629	\N
227fb8a7-134f-4076-ae28-cdcabb380fb4	5d0f2823-006e-4aec-b9e5-05530c4d5629	t	${role_query-realms}	query-realms	51b23642-b8e2-49b1-a277-da115aec56b8	5d0f2823-006e-4aec-b9e5-05530c4d5629	\N
94c21666-934d-4c31-b6d0-b043048710b3	5d0f2823-006e-4aec-b9e5-05530c4d5629	t	${role_query-groups}	query-groups	51b23642-b8e2-49b1-a277-da115aec56b8	5d0f2823-006e-4aec-b9e5-05530c4d5629	\N
91df3f3d-267c-463a-bc23-2eda515316fa	0854564e-3985-4e47-8eb5-b2643e2ed200	t	${role_view-profile}	view-profile	51b23642-b8e2-49b1-a277-da115aec56b8	0854564e-3985-4e47-8eb5-b2643e2ed200	\N
f63f91e9-b6b6-41bc-8aa4-75e4bdc11e5b	0854564e-3985-4e47-8eb5-b2643e2ed200	t	${role_manage-account}	manage-account	51b23642-b8e2-49b1-a277-da115aec56b8	0854564e-3985-4e47-8eb5-b2643e2ed200	\N
596a3392-1d66-484b-9ea4-06476b610243	0854564e-3985-4e47-8eb5-b2643e2ed200	t	${role_manage-account-links}	manage-account-links	51b23642-b8e2-49b1-a277-da115aec56b8	0854564e-3985-4e47-8eb5-b2643e2ed200	\N
bf007529-ad57-4a32-a863-5fc45e87d523	0854564e-3985-4e47-8eb5-b2643e2ed200	t	${role_view-applications}	view-applications	51b23642-b8e2-49b1-a277-da115aec56b8	0854564e-3985-4e47-8eb5-b2643e2ed200	\N
490b6b09-37e8-4700-85cc-8361fdc169c8	0854564e-3985-4e47-8eb5-b2643e2ed200	t	${role_view-consent}	view-consent	51b23642-b8e2-49b1-a277-da115aec56b8	0854564e-3985-4e47-8eb5-b2643e2ed200	\N
c3685623-a824-4bf2-b67e-4c3a9a5a37fb	0854564e-3985-4e47-8eb5-b2643e2ed200	t	${role_manage-consent}	manage-consent	51b23642-b8e2-49b1-a277-da115aec56b8	0854564e-3985-4e47-8eb5-b2643e2ed200	\N
dc76f81a-d7b3-42c6-b5b1-10fdcfcfc035	0854564e-3985-4e47-8eb5-b2643e2ed200	t	${role_view-groups}	view-groups	51b23642-b8e2-49b1-a277-da115aec56b8	0854564e-3985-4e47-8eb5-b2643e2ed200	\N
18819403-9a01-4656-b61b-3a66c49d36f1	0854564e-3985-4e47-8eb5-b2643e2ed200	t	${role_delete-account}	delete-account	51b23642-b8e2-49b1-a277-da115aec56b8	0854564e-3985-4e47-8eb5-b2643e2ed200	\N
15ca025a-02fd-4745-8ae2-01c6eef46703	40d799c9-e447-4405-8024-f0f0a4f2c067	t	${role_impersonation}	impersonation	d9df55b1-c105-4a3c-96cd-8719a1891442	40d799c9-e447-4405-8024-f0f0a4f2c067	\N
af2f314e-24cb-4253-b674-615fcfc09ce4	5d0f2823-006e-4aec-b9e5-05530c4d5629	t	${role_impersonation}	impersonation	51b23642-b8e2-49b1-a277-da115aec56b8	5d0f2823-006e-4aec-b9e5-05530c4d5629	\N
43fcf31d-7647-4940-8e42-12e7a656feb0	9477d513-035e-4a78-89ca-3a9365f997d5	t	${role_read-token}	read-token	51b23642-b8e2-49b1-a277-da115aec56b8	9477d513-035e-4a78-89ca-3a9365f997d5	\N
85472bac-0393-40c8-a5e9-b06a15c1ce24	51b23642-b8e2-49b1-a277-da115aec56b8	f	${role_offline-access}	offline_access	51b23642-b8e2-49b1-a277-da115aec56b8	\N	\N
72ca0ef5-70ea-48a4-bbac-dfc467dfa1ef	51b23642-b8e2-49b1-a277-da115aec56b8	f	${role_uma_authorization}	uma_authorization	51b23642-b8e2-49b1-a277-da115aec56b8	\N	\N
dbba9965-679a-420d-8802-f13926702de2	51b23642-b8e2-49b1-a277-da115aec56b8	f	Admin Realm Role	admin	51b23642-b8e2-49b1-a277-da115aec56b8	\N	\N
bf6e9d5e-437a-44a7-91ed-b4078bb78b30	51b23642-b8e2-49b1-a277-da115aec56b8	f	User Realm Role	user	51b23642-b8e2-49b1-a277-da115aec56b8	\N	\N
6dac1c89-1910-47ad-ade7-59fa35b18f86	5dfa53a6-062d-4982-9f98-c6ea224d97bb	t	Admin Client Role	admin_client_role	51b23642-b8e2-49b1-a277-da115aec56b8	5dfa53a6-062d-4982-9f98-c6ea224d97bb	\N
4e607d72-939b-40c8-8573-d6679391d333	5dfa53a6-062d-4982-9f98-c6ea224d97bb	t	User Client Role	user_client_role	51b23642-b8e2-49b1-a277-da115aec56b8	5dfa53a6-062d-4982-9f98-c6ea224d97bb	\N
\.


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.migration_model (id, version, update_time) FROM stdin;
4v1bt	24.0.4	1716954794
\.


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh) FROM stdin;
\.


--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.policy_config (policy_id, name, value) FROM stdin;
\.


--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
f1728ab3-e459-4d01-a6e8-f3838600163a	audience resolve	openid-connect	oidc-audience-resolve-mapper	6095f23e-2031-4527-ad1a-9be0bf6d064a	\N
20097aa6-1a61-40bc-89f6-bd9bee434aed	locale	openid-connect	oidc-usermodel-attribute-mapper	ad0b11ac-4631-453a-8703-51591649e59d	\N
e408cf88-ba08-43be-837e-523d520abcec	role list	saml	saml-role-list-mapper	\N	ee9b2187-9f5d-4745-b877-7594b5e29fbd
84af0584-e415-4033-ad82-53f453538f1e	full name	openid-connect	oidc-full-name-mapper	\N	c490792d-85b6-42d6-8588-ea121e045e69
eb999494-59e8-4571-a78c-1764c8c374f8	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	c490792d-85b6-42d6-8588-ea121e045e69
8a2b5420-99ae-447e-a8aa-796a29aa3b5e	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	c490792d-85b6-42d6-8588-ea121e045e69
48068278-6356-48cb-b684-424a58a6fc5e	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	c490792d-85b6-42d6-8588-ea121e045e69
a60878f9-8cf4-4c65-bd5a-ba1893544ce5	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	c490792d-85b6-42d6-8588-ea121e045e69
35310ab5-9aad-49a3-b524-92a2f52f334c	username	openid-connect	oidc-usermodel-attribute-mapper	\N	c490792d-85b6-42d6-8588-ea121e045e69
ca8fb867-ca20-492e-84de-f4eafdff7247	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	c490792d-85b6-42d6-8588-ea121e045e69
8e88e1ff-9afa-4073-8385-aea023139ee6	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	c490792d-85b6-42d6-8588-ea121e045e69
1e2f22aa-0053-4d6a-afda-2ba881a610ee	website	openid-connect	oidc-usermodel-attribute-mapper	\N	c490792d-85b6-42d6-8588-ea121e045e69
3b4221c9-0a8a-423a-9344-703b0918db8b	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	c490792d-85b6-42d6-8588-ea121e045e69
8ae6fc33-8777-4fa1-8bd7-f4a57d0e5327	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	c490792d-85b6-42d6-8588-ea121e045e69
761b6689-61f3-41c8-b555-93a8a01d7b9d	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	c490792d-85b6-42d6-8588-ea121e045e69
7339e2ef-a1bc-41f7-ab51-f5f2e00ca260	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	c490792d-85b6-42d6-8588-ea121e045e69
224308ca-4d5b-42ce-aa3a-8b88b742083d	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	c490792d-85b6-42d6-8588-ea121e045e69
48f9cd6b-6413-46d2-bc8c-e4f771547b4a	email	openid-connect	oidc-usermodel-attribute-mapper	\N	7fca4a9c-37b9-4174-9895-99cfa51cbb39
fbd3edb1-e949-4b4f-ab86-5a771afd0d36	email verified	openid-connect	oidc-usermodel-property-mapper	\N	7fca4a9c-37b9-4174-9895-99cfa51cbb39
3f6431f7-085b-4fa4-905b-52df4f2e817b	address	openid-connect	oidc-address-mapper	\N	3b3015ef-ad48-415b-850c-b0a3bac12e73
3a075bcb-0621-4dd6-9a4d-2f56e9d8bff9	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	64ec2880-4e98-4aeb-b1e5-5320e794b260
5618f9fc-f8e5-4a0f-bf6f-e43384e17bda	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	64ec2880-4e98-4aeb-b1e5-5320e794b260
bf25eb74-f9b0-437f-ac80-26d42b261015	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	43d907ed-a7dd-4ce2-b78f-a15381d4c623
48ff6300-737b-4382-a795-05812ab6ca74	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	43d907ed-a7dd-4ce2-b78f-a15381d4c623
5af8e610-c357-479c-95c2-943157f5726d	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	43d907ed-a7dd-4ce2-b78f-a15381d4c623
44cb9ddb-5116-4b75-adb4-af64783e866c	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	ad114cee-47e5-4d9f-b7e5-ab4a07a7dd42
c5707d5a-70a0-4c0c-a71e-4d6bee65bfb2	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	4c048884-6fa7-4170-b098-02f713aaf92a
c4352010-f60d-429b-8dd2-09d0477d6c88	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	4c048884-6fa7-4170-b098-02f713aaf92a
5782d376-ec14-4a83-8f18-0f525a4b378e	acr loa level	openid-connect	oidc-acr-mapper	\N	3cbbd487-a8cb-4205-9925-f96ed5639799
f877f134-40d2-4d73-997e-4d39d464d3e6	audience resolve	openid-connect	oidc-audience-resolve-mapper	a1d47433-c1f2-4ef6-b728-1875088a2ae7	\N
cdc55dcf-2109-462f-b1cf-e6ad348e9715	role list	saml	saml-role-list-mapper	\N	6c40454a-8ab9-4e3a-8647-be5eb1b33022
e5b8951a-692f-4241-a6e1-764d11564800	full name	openid-connect	oidc-full-name-mapper	\N	693d6c40-80d4-4c21-ab17-88f02b759235
2cdc10ab-d58c-4667-ac65-1ec420cc17d4	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	693d6c40-80d4-4c21-ab17-88f02b759235
ee6d16a8-57e9-486d-9292-3b59f9c1ef38	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	693d6c40-80d4-4c21-ab17-88f02b759235
ff13136a-c8b2-46d2-b47a-baef2df386b3	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	693d6c40-80d4-4c21-ab17-88f02b759235
fdb8891f-a4ea-48a4-84c5-10035ddc1f20	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	693d6c40-80d4-4c21-ab17-88f02b759235
db5bcd96-d0a5-4935-950c-41189545210c	username	openid-connect	oidc-usermodel-attribute-mapper	\N	693d6c40-80d4-4c21-ab17-88f02b759235
57917c38-a137-48fc-ad95-6d147876a521	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	693d6c40-80d4-4c21-ab17-88f02b759235
45ca298e-2e4f-4f61-95de-830d64524de9	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	693d6c40-80d4-4c21-ab17-88f02b759235
176f5969-1ee1-4c4c-ba1e-09bdf74b30ba	website	openid-connect	oidc-usermodel-attribute-mapper	\N	693d6c40-80d4-4c21-ab17-88f02b759235
c5271a35-9816-42c4-b6de-c1f8fc339e89	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	693d6c40-80d4-4c21-ab17-88f02b759235
be855eeb-c862-4e3d-82e0-d867571c1c5c	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	693d6c40-80d4-4c21-ab17-88f02b759235
adcc3ac3-861c-4f8c-939a-71111bebf457	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	693d6c40-80d4-4c21-ab17-88f02b759235
91c7432b-4e8f-486a-b008-3d65221059b5	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	693d6c40-80d4-4c21-ab17-88f02b759235
38f7d3df-a12a-46d6-889f-56f1c6d301ee	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	693d6c40-80d4-4c21-ab17-88f02b759235
87329cf0-2d72-4baf-8bb6-007025dff4f2	email	openid-connect	oidc-usermodel-attribute-mapper	\N	51e7f951-0387-4f50-bd7c-da6cc7c46301
de493d8d-9f95-48ff-b0c0-c0cdde278496	email verified	openid-connect	oidc-usermodel-property-mapper	\N	51e7f951-0387-4f50-bd7c-da6cc7c46301
17b5f10e-0ada-4d99-b7e5-686cd948f506	address	openid-connect	oidc-address-mapper	\N	e73d1212-02c3-4a8a-9ca5-de38c5c74d6d
91ac7ad8-6be8-45bb-b571-79d1c4c0d181	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	443d1ce4-9e18-4101-b4ed-8f8919714e0d
8626d7b7-3344-4674-8cdf-88bcd3d93f07	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	443d1ce4-9e18-4101-b4ed-8f8919714e0d
beb90ef6-fe1b-4b63-8171-fd1108d7c906	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	67a65166-f799-4d85-a7df-f6ff85eeac9b
0efa0b22-b558-4825-bd20-a271d121b4fd	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	67a65166-f799-4d85-a7df-f6ff85eeac9b
ca6dced1-8da3-412e-af34-8ee5c79b68b2	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	67a65166-f799-4d85-a7df-f6ff85eeac9b
e6dc6448-bb14-4e59-a95b-08d45b96ad1f	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	addadab8-9e48-40e6-8544-1b4cc51d68a0
a7864775-be94-4deb-a3cd-e4b4a911b353	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	07483a37-bcd1-4924-bac8-2d3b44eb09fc
96aabdb4-fef5-4e1b-a899-5918b023cc9a	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	07483a37-bcd1-4924-bac8-2d3b44eb09fc
5838c511-8bde-42ef-a4bf-bf30470aea73	acr loa level	openid-connect	oidc-acr-mapper	\N	5b310fd5-1d5b-49b5-9edb-ecbf171e9ba9
5cf4e3e4-c4e8-4443-ad3f-6248bbf01730	locale	openid-connect	oidc-usermodel-attribute-mapper	1796b1b1-2469-4673-8b70-81d0c65e244d	\N
31882e81-28df-4fee-b496-7ee226be7dbf	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	5dfa53a6-062d-4982-9f98-c6ea224d97bb	\N
d2a55b22-048b-457e-ab64-1d2adcf00920	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	5dfa53a6-062d-4982-9f98-c6ea224d97bb	\N
e43326d0-fed3-46b6-88f2-9931495254da	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	5dfa53a6-062d-4982-9f98-c6ea224d97bb	\N
\.


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
20097aa6-1a61-40bc-89f6-bd9bee434aed	true	introspection.token.claim
20097aa6-1a61-40bc-89f6-bd9bee434aed	true	userinfo.token.claim
20097aa6-1a61-40bc-89f6-bd9bee434aed	locale	user.attribute
20097aa6-1a61-40bc-89f6-bd9bee434aed	true	id.token.claim
20097aa6-1a61-40bc-89f6-bd9bee434aed	true	access.token.claim
20097aa6-1a61-40bc-89f6-bd9bee434aed	locale	claim.name
20097aa6-1a61-40bc-89f6-bd9bee434aed	String	jsonType.label
e408cf88-ba08-43be-837e-523d520abcec	false	single
e408cf88-ba08-43be-837e-523d520abcec	Basic	attribute.nameformat
e408cf88-ba08-43be-837e-523d520abcec	Role	attribute.name
1e2f22aa-0053-4d6a-afda-2ba881a610ee	true	introspection.token.claim
1e2f22aa-0053-4d6a-afda-2ba881a610ee	true	userinfo.token.claim
1e2f22aa-0053-4d6a-afda-2ba881a610ee	website	user.attribute
1e2f22aa-0053-4d6a-afda-2ba881a610ee	true	id.token.claim
1e2f22aa-0053-4d6a-afda-2ba881a610ee	true	access.token.claim
1e2f22aa-0053-4d6a-afda-2ba881a610ee	website	claim.name
1e2f22aa-0053-4d6a-afda-2ba881a610ee	String	jsonType.label
224308ca-4d5b-42ce-aa3a-8b88b742083d	true	introspection.token.claim
224308ca-4d5b-42ce-aa3a-8b88b742083d	true	userinfo.token.claim
224308ca-4d5b-42ce-aa3a-8b88b742083d	updatedAt	user.attribute
224308ca-4d5b-42ce-aa3a-8b88b742083d	true	id.token.claim
224308ca-4d5b-42ce-aa3a-8b88b742083d	true	access.token.claim
224308ca-4d5b-42ce-aa3a-8b88b742083d	updated_at	claim.name
224308ca-4d5b-42ce-aa3a-8b88b742083d	long	jsonType.label
35310ab5-9aad-49a3-b524-92a2f52f334c	true	introspection.token.claim
35310ab5-9aad-49a3-b524-92a2f52f334c	true	userinfo.token.claim
35310ab5-9aad-49a3-b524-92a2f52f334c	username	user.attribute
35310ab5-9aad-49a3-b524-92a2f52f334c	true	id.token.claim
35310ab5-9aad-49a3-b524-92a2f52f334c	true	access.token.claim
35310ab5-9aad-49a3-b524-92a2f52f334c	preferred_username	claim.name
35310ab5-9aad-49a3-b524-92a2f52f334c	String	jsonType.label
3b4221c9-0a8a-423a-9344-703b0918db8b	true	introspection.token.claim
3b4221c9-0a8a-423a-9344-703b0918db8b	true	userinfo.token.claim
3b4221c9-0a8a-423a-9344-703b0918db8b	gender	user.attribute
3b4221c9-0a8a-423a-9344-703b0918db8b	true	id.token.claim
3b4221c9-0a8a-423a-9344-703b0918db8b	true	access.token.claim
3b4221c9-0a8a-423a-9344-703b0918db8b	gender	claim.name
3b4221c9-0a8a-423a-9344-703b0918db8b	String	jsonType.label
48068278-6356-48cb-b684-424a58a6fc5e	true	introspection.token.claim
48068278-6356-48cb-b684-424a58a6fc5e	true	userinfo.token.claim
48068278-6356-48cb-b684-424a58a6fc5e	middleName	user.attribute
48068278-6356-48cb-b684-424a58a6fc5e	true	id.token.claim
48068278-6356-48cb-b684-424a58a6fc5e	true	access.token.claim
48068278-6356-48cb-b684-424a58a6fc5e	middle_name	claim.name
48068278-6356-48cb-b684-424a58a6fc5e	String	jsonType.label
7339e2ef-a1bc-41f7-ab51-f5f2e00ca260	true	introspection.token.claim
7339e2ef-a1bc-41f7-ab51-f5f2e00ca260	true	userinfo.token.claim
7339e2ef-a1bc-41f7-ab51-f5f2e00ca260	locale	user.attribute
7339e2ef-a1bc-41f7-ab51-f5f2e00ca260	true	id.token.claim
7339e2ef-a1bc-41f7-ab51-f5f2e00ca260	true	access.token.claim
7339e2ef-a1bc-41f7-ab51-f5f2e00ca260	locale	claim.name
7339e2ef-a1bc-41f7-ab51-f5f2e00ca260	String	jsonType.label
761b6689-61f3-41c8-b555-93a8a01d7b9d	true	introspection.token.claim
761b6689-61f3-41c8-b555-93a8a01d7b9d	true	userinfo.token.claim
761b6689-61f3-41c8-b555-93a8a01d7b9d	zoneinfo	user.attribute
761b6689-61f3-41c8-b555-93a8a01d7b9d	true	id.token.claim
761b6689-61f3-41c8-b555-93a8a01d7b9d	true	access.token.claim
761b6689-61f3-41c8-b555-93a8a01d7b9d	zoneinfo	claim.name
761b6689-61f3-41c8-b555-93a8a01d7b9d	String	jsonType.label
84af0584-e415-4033-ad82-53f453538f1e	true	introspection.token.claim
84af0584-e415-4033-ad82-53f453538f1e	true	userinfo.token.claim
84af0584-e415-4033-ad82-53f453538f1e	true	id.token.claim
84af0584-e415-4033-ad82-53f453538f1e	true	access.token.claim
8a2b5420-99ae-447e-a8aa-796a29aa3b5e	true	introspection.token.claim
8a2b5420-99ae-447e-a8aa-796a29aa3b5e	true	userinfo.token.claim
8a2b5420-99ae-447e-a8aa-796a29aa3b5e	firstName	user.attribute
8a2b5420-99ae-447e-a8aa-796a29aa3b5e	true	id.token.claim
8a2b5420-99ae-447e-a8aa-796a29aa3b5e	true	access.token.claim
8a2b5420-99ae-447e-a8aa-796a29aa3b5e	given_name	claim.name
8a2b5420-99ae-447e-a8aa-796a29aa3b5e	String	jsonType.label
8ae6fc33-8777-4fa1-8bd7-f4a57d0e5327	true	introspection.token.claim
8ae6fc33-8777-4fa1-8bd7-f4a57d0e5327	true	userinfo.token.claim
8ae6fc33-8777-4fa1-8bd7-f4a57d0e5327	birthdate	user.attribute
8ae6fc33-8777-4fa1-8bd7-f4a57d0e5327	true	id.token.claim
8ae6fc33-8777-4fa1-8bd7-f4a57d0e5327	true	access.token.claim
8ae6fc33-8777-4fa1-8bd7-f4a57d0e5327	birthdate	claim.name
8ae6fc33-8777-4fa1-8bd7-f4a57d0e5327	String	jsonType.label
8e88e1ff-9afa-4073-8385-aea023139ee6	true	introspection.token.claim
8e88e1ff-9afa-4073-8385-aea023139ee6	true	userinfo.token.claim
8e88e1ff-9afa-4073-8385-aea023139ee6	picture	user.attribute
8e88e1ff-9afa-4073-8385-aea023139ee6	true	id.token.claim
8e88e1ff-9afa-4073-8385-aea023139ee6	true	access.token.claim
8e88e1ff-9afa-4073-8385-aea023139ee6	picture	claim.name
8e88e1ff-9afa-4073-8385-aea023139ee6	String	jsonType.label
a60878f9-8cf4-4c65-bd5a-ba1893544ce5	true	introspection.token.claim
a60878f9-8cf4-4c65-bd5a-ba1893544ce5	true	userinfo.token.claim
a60878f9-8cf4-4c65-bd5a-ba1893544ce5	nickname	user.attribute
a60878f9-8cf4-4c65-bd5a-ba1893544ce5	true	id.token.claim
a60878f9-8cf4-4c65-bd5a-ba1893544ce5	true	access.token.claim
a60878f9-8cf4-4c65-bd5a-ba1893544ce5	nickname	claim.name
a60878f9-8cf4-4c65-bd5a-ba1893544ce5	String	jsonType.label
ca8fb867-ca20-492e-84de-f4eafdff7247	true	introspection.token.claim
ca8fb867-ca20-492e-84de-f4eafdff7247	true	userinfo.token.claim
ca8fb867-ca20-492e-84de-f4eafdff7247	profile	user.attribute
ca8fb867-ca20-492e-84de-f4eafdff7247	true	id.token.claim
ca8fb867-ca20-492e-84de-f4eafdff7247	true	access.token.claim
ca8fb867-ca20-492e-84de-f4eafdff7247	profile	claim.name
ca8fb867-ca20-492e-84de-f4eafdff7247	String	jsonType.label
eb999494-59e8-4571-a78c-1764c8c374f8	true	introspection.token.claim
eb999494-59e8-4571-a78c-1764c8c374f8	true	userinfo.token.claim
eb999494-59e8-4571-a78c-1764c8c374f8	lastName	user.attribute
eb999494-59e8-4571-a78c-1764c8c374f8	true	id.token.claim
eb999494-59e8-4571-a78c-1764c8c374f8	true	access.token.claim
eb999494-59e8-4571-a78c-1764c8c374f8	family_name	claim.name
eb999494-59e8-4571-a78c-1764c8c374f8	String	jsonType.label
48f9cd6b-6413-46d2-bc8c-e4f771547b4a	true	introspection.token.claim
48f9cd6b-6413-46d2-bc8c-e4f771547b4a	true	userinfo.token.claim
48f9cd6b-6413-46d2-bc8c-e4f771547b4a	email	user.attribute
48f9cd6b-6413-46d2-bc8c-e4f771547b4a	true	id.token.claim
48f9cd6b-6413-46d2-bc8c-e4f771547b4a	true	access.token.claim
48f9cd6b-6413-46d2-bc8c-e4f771547b4a	email	claim.name
48f9cd6b-6413-46d2-bc8c-e4f771547b4a	String	jsonType.label
fbd3edb1-e949-4b4f-ab86-5a771afd0d36	true	introspection.token.claim
fbd3edb1-e949-4b4f-ab86-5a771afd0d36	true	userinfo.token.claim
fbd3edb1-e949-4b4f-ab86-5a771afd0d36	emailVerified	user.attribute
fbd3edb1-e949-4b4f-ab86-5a771afd0d36	true	id.token.claim
fbd3edb1-e949-4b4f-ab86-5a771afd0d36	true	access.token.claim
fbd3edb1-e949-4b4f-ab86-5a771afd0d36	email_verified	claim.name
fbd3edb1-e949-4b4f-ab86-5a771afd0d36	boolean	jsonType.label
3f6431f7-085b-4fa4-905b-52df4f2e817b	formatted	user.attribute.formatted
3f6431f7-085b-4fa4-905b-52df4f2e817b	country	user.attribute.country
3f6431f7-085b-4fa4-905b-52df4f2e817b	true	introspection.token.claim
3f6431f7-085b-4fa4-905b-52df4f2e817b	postal_code	user.attribute.postal_code
3f6431f7-085b-4fa4-905b-52df4f2e817b	true	userinfo.token.claim
3f6431f7-085b-4fa4-905b-52df4f2e817b	street	user.attribute.street
3f6431f7-085b-4fa4-905b-52df4f2e817b	true	id.token.claim
3f6431f7-085b-4fa4-905b-52df4f2e817b	region	user.attribute.region
3f6431f7-085b-4fa4-905b-52df4f2e817b	true	access.token.claim
3f6431f7-085b-4fa4-905b-52df4f2e817b	locality	user.attribute.locality
3a075bcb-0621-4dd6-9a4d-2f56e9d8bff9	true	introspection.token.claim
3a075bcb-0621-4dd6-9a4d-2f56e9d8bff9	true	userinfo.token.claim
3a075bcb-0621-4dd6-9a4d-2f56e9d8bff9	phoneNumber	user.attribute
3a075bcb-0621-4dd6-9a4d-2f56e9d8bff9	true	id.token.claim
3a075bcb-0621-4dd6-9a4d-2f56e9d8bff9	true	access.token.claim
3a075bcb-0621-4dd6-9a4d-2f56e9d8bff9	phone_number	claim.name
3a075bcb-0621-4dd6-9a4d-2f56e9d8bff9	String	jsonType.label
5618f9fc-f8e5-4a0f-bf6f-e43384e17bda	true	introspection.token.claim
5618f9fc-f8e5-4a0f-bf6f-e43384e17bda	true	userinfo.token.claim
5618f9fc-f8e5-4a0f-bf6f-e43384e17bda	phoneNumberVerified	user.attribute
5618f9fc-f8e5-4a0f-bf6f-e43384e17bda	true	id.token.claim
5618f9fc-f8e5-4a0f-bf6f-e43384e17bda	true	access.token.claim
5618f9fc-f8e5-4a0f-bf6f-e43384e17bda	phone_number_verified	claim.name
5618f9fc-f8e5-4a0f-bf6f-e43384e17bda	boolean	jsonType.label
48ff6300-737b-4382-a795-05812ab6ca74	true	introspection.token.claim
48ff6300-737b-4382-a795-05812ab6ca74	true	multivalued
48ff6300-737b-4382-a795-05812ab6ca74	foo	user.attribute
48ff6300-737b-4382-a795-05812ab6ca74	true	access.token.claim
48ff6300-737b-4382-a795-05812ab6ca74	resource_access.${client_id}.roles	claim.name
48ff6300-737b-4382-a795-05812ab6ca74	String	jsonType.label
5af8e610-c357-479c-95c2-943157f5726d	true	introspection.token.claim
5af8e610-c357-479c-95c2-943157f5726d	true	access.token.claim
bf25eb74-f9b0-437f-ac80-26d42b261015	true	introspection.token.claim
bf25eb74-f9b0-437f-ac80-26d42b261015	true	multivalued
bf25eb74-f9b0-437f-ac80-26d42b261015	foo	user.attribute
bf25eb74-f9b0-437f-ac80-26d42b261015	true	access.token.claim
bf25eb74-f9b0-437f-ac80-26d42b261015	realm_access.roles	claim.name
bf25eb74-f9b0-437f-ac80-26d42b261015	String	jsonType.label
44cb9ddb-5116-4b75-adb4-af64783e866c	true	introspection.token.claim
44cb9ddb-5116-4b75-adb4-af64783e866c	true	access.token.claim
c4352010-f60d-429b-8dd2-09d0477d6c88	true	introspection.token.claim
c4352010-f60d-429b-8dd2-09d0477d6c88	true	multivalued
c4352010-f60d-429b-8dd2-09d0477d6c88	foo	user.attribute
c4352010-f60d-429b-8dd2-09d0477d6c88	true	id.token.claim
c4352010-f60d-429b-8dd2-09d0477d6c88	true	access.token.claim
c4352010-f60d-429b-8dd2-09d0477d6c88	groups	claim.name
c4352010-f60d-429b-8dd2-09d0477d6c88	String	jsonType.label
c5707d5a-70a0-4c0c-a71e-4d6bee65bfb2	true	introspection.token.claim
c5707d5a-70a0-4c0c-a71e-4d6bee65bfb2	true	userinfo.token.claim
c5707d5a-70a0-4c0c-a71e-4d6bee65bfb2	username	user.attribute
c5707d5a-70a0-4c0c-a71e-4d6bee65bfb2	true	id.token.claim
c5707d5a-70a0-4c0c-a71e-4d6bee65bfb2	true	access.token.claim
c5707d5a-70a0-4c0c-a71e-4d6bee65bfb2	upn	claim.name
c5707d5a-70a0-4c0c-a71e-4d6bee65bfb2	String	jsonType.label
5782d376-ec14-4a83-8f18-0f525a4b378e	true	introspection.token.claim
5782d376-ec14-4a83-8f18-0f525a4b378e	true	id.token.claim
5782d376-ec14-4a83-8f18-0f525a4b378e	true	access.token.claim
cdc55dcf-2109-462f-b1cf-e6ad348e9715	false	single
cdc55dcf-2109-462f-b1cf-e6ad348e9715	Basic	attribute.nameformat
cdc55dcf-2109-462f-b1cf-e6ad348e9715	Role	attribute.name
176f5969-1ee1-4c4c-ba1e-09bdf74b30ba	true	introspection.token.claim
176f5969-1ee1-4c4c-ba1e-09bdf74b30ba	true	userinfo.token.claim
176f5969-1ee1-4c4c-ba1e-09bdf74b30ba	website	user.attribute
176f5969-1ee1-4c4c-ba1e-09bdf74b30ba	true	id.token.claim
176f5969-1ee1-4c4c-ba1e-09bdf74b30ba	true	access.token.claim
176f5969-1ee1-4c4c-ba1e-09bdf74b30ba	website	claim.name
176f5969-1ee1-4c4c-ba1e-09bdf74b30ba	String	jsonType.label
2cdc10ab-d58c-4667-ac65-1ec420cc17d4	true	introspection.token.claim
2cdc10ab-d58c-4667-ac65-1ec420cc17d4	true	userinfo.token.claim
2cdc10ab-d58c-4667-ac65-1ec420cc17d4	lastName	user.attribute
2cdc10ab-d58c-4667-ac65-1ec420cc17d4	true	id.token.claim
2cdc10ab-d58c-4667-ac65-1ec420cc17d4	true	access.token.claim
2cdc10ab-d58c-4667-ac65-1ec420cc17d4	family_name	claim.name
2cdc10ab-d58c-4667-ac65-1ec420cc17d4	String	jsonType.label
38f7d3df-a12a-46d6-889f-56f1c6d301ee	true	introspection.token.claim
38f7d3df-a12a-46d6-889f-56f1c6d301ee	true	userinfo.token.claim
38f7d3df-a12a-46d6-889f-56f1c6d301ee	updatedAt	user.attribute
38f7d3df-a12a-46d6-889f-56f1c6d301ee	true	id.token.claim
38f7d3df-a12a-46d6-889f-56f1c6d301ee	true	access.token.claim
38f7d3df-a12a-46d6-889f-56f1c6d301ee	updated_at	claim.name
38f7d3df-a12a-46d6-889f-56f1c6d301ee	long	jsonType.label
45ca298e-2e4f-4f61-95de-830d64524de9	true	introspection.token.claim
45ca298e-2e4f-4f61-95de-830d64524de9	true	userinfo.token.claim
45ca298e-2e4f-4f61-95de-830d64524de9	picture	user.attribute
45ca298e-2e4f-4f61-95de-830d64524de9	true	id.token.claim
45ca298e-2e4f-4f61-95de-830d64524de9	true	access.token.claim
45ca298e-2e4f-4f61-95de-830d64524de9	picture	claim.name
45ca298e-2e4f-4f61-95de-830d64524de9	String	jsonType.label
57917c38-a137-48fc-ad95-6d147876a521	true	introspection.token.claim
57917c38-a137-48fc-ad95-6d147876a521	true	userinfo.token.claim
57917c38-a137-48fc-ad95-6d147876a521	profile	user.attribute
57917c38-a137-48fc-ad95-6d147876a521	true	id.token.claim
57917c38-a137-48fc-ad95-6d147876a521	true	access.token.claim
57917c38-a137-48fc-ad95-6d147876a521	profile	claim.name
57917c38-a137-48fc-ad95-6d147876a521	String	jsonType.label
91c7432b-4e8f-486a-b008-3d65221059b5	true	introspection.token.claim
91c7432b-4e8f-486a-b008-3d65221059b5	true	userinfo.token.claim
91c7432b-4e8f-486a-b008-3d65221059b5	locale	user.attribute
91c7432b-4e8f-486a-b008-3d65221059b5	true	id.token.claim
91c7432b-4e8f-486a-b008-3d65221059b5	true	access.token.claim
91c7432b-4e8f-486a-b008-3d65221059b5	locale	claim.name
91c7432b-4e8f-486a-b008-3d65221059b5	String	jsonType.label
adcc3ac3-861c-4f8c-939a-71111bebf457	true	introspection.token.claim
adcc3ac3-861c-4f8c-939a-71111bebf457	true	userinfo.token.claim
adcc3ac3-861c-4f8c-939a-71111bebf457	zoneinfo	user.attribute
adcc3ac3-861c-4f8c-939a-71111bebf457	true	id.token.claim
adcc3ac3-861c-4f8c-939a-71111bebf457	true	access.token.claim
adcc3ac3-861c-4f8c-939a-71111bebf457	zoneinfo	claim.name
adcc3ac3-861c-4f8c-939a-71111bebf457	String	jsonType.label
be855eeb-c862-4e3d-82e0-d867571c1c5c	true	introspection.token.claim
be855eeb-c862-4e3d-82e0-d867571c1c5c	true	userinfo.token.claim
be855eeb-c862-4e3d-82e0-d867571c1c5c	birthdate	user.attribute
be855eeb-c862-4e3d-82e0-d867571c1c5c	true	id.token.claim
be855eeb-c862-4e3d-82e0-d867571c1c5c	true	access.token.claim
be855eeb-c862-4e3d-82e0-d867571c1c5c	birthdate	claim.name
be855eeb-c862-4e3d-82e0-d867571c1c5c	String	jsonType.label
c5271a35-9816-42c4-b6de-c1f8fc339e89	true	introspection.token.claim
c5271a35-9816-42c4-b6de-c1f8fc339e89	true	userinfo.token.claim
c5271a35-9816-42c4-b6de-c1f8fc339e89	gender	user.attribute
c5271a35-9816-42c4-b6de-c1f8fc339e89	true	id.token.claim
c5271a35-9816-42c4-b6de-c1f8fc339e89	true	access.token.claim
c5271a35-9816-42c4-b6de-c1f8fc339e89	gender	claim.name
c5271a35-9816-42c4-b6de-c1f8fc339e89	String	jsonType.label
db5bcd96-d0a5-4935-950c-41189545210c	true	introspection.token.claim
db5bcd96-d0a5-4935-950c-41189545210c	true	userinfo.token.claim
db5bcd96-d0a5-4935-950c-41189545210c	username	user.attribute
db5bcd96-d0a5-4935-950c-41189545210c	true	id.token.claim
db5bcd96-d0a5-4935-950c-41189545210c	true	access.token.claim
db5bcd96-d0a5-4935-950c-41189545210c	preferred_username	claim.name
db5bcd96-d0a5-4935-950c-41189545210c	String	jsonType.label
e5b8951a-692f-4241-a6e1-764d11564800	true	introspection.token.claim
e5b8951a-692f-4241-a6e1-764d11564800	true	userinfo.token.claim
e5b8951a-692f-4241-a6e1-764d11564800	true	id.token.claim
e5b8951a-692f-4241-a6e1-764d11564800	true	access.token.claim
ee6d16a8-57e9-486d-9292-3b59f9c1ef38	true	introspection.token.claim
ee6d16a8-57e9-486d-9292-3b59f9c1ef38	true	userinfo.token.claim
ee6d16a8-57e9-486d-9292-3b59f9c1ef38	firstName	user.attribute
ee6d16a8-57e9-486d-9292-3b59f9c1ef38	true	id.token.claim
ee6d16a8-57e9-486d-9292-3b59f9c1ef38	true	access.token.claim
ee6d16a8-57e9-486d-9292-3b59f9c1ef38	given_name	claim.name
ee6d16a8-57e9-486d-9292-3b59f9c1ef38	String	jsonType.label
fdb8891f-a4ea-48a4-84c5-10035ddc1f20	true	introspection.token.claim
fdb8891f-a4ea-48a4-84c5-10035ddc1f20	true	userinfo.token.claim
fdb8891f-a4ea-48a4-84c5-10035ddc1f20	nickname	user.attribute
fdb8891f-a4ea-48a4-84c5-10035ddc1f20	true	id.token.claim
fdb8891f-a4ea-48a4-84c5-10035ddc1f20	true	access.token.claim
fdb8891f-a4ea-48a4-84c5-10035ddc1f20	nickname	claim.name
fdb8891f-a4ea-48a4-84c5-10035ddc1f20	String	jsonType.label
ff13136a-c8b2-46d2-b47a-baef2df386b3	true	introspection.token.claim
ff13136a-c8b2-46d2-b47a-baef2df386b3	true	userinfo.token.claim
ff13136a-c8b2-46d2-b47a-baef2df386b3	middleName	user.attribute
ff13136a-c8b2-46d2-b47a-baef2df386b3	true	id.token.claim
ff13136a-c8b2-46d2-b47a-baef2df386b3	true	access.token.claim
ff13136a-c8b2-46d2-b47a-baef2df386b3	middle_name	claim.name
ff13136a-c8b2-46d2-b47a-baef2df386b3	String	jsonType.label
87329cf0-2d72-4baf-8bb6-007025dff4f2	true	introspection.token.claim
87329cf0-2d72-4baf-8bb6-007025dff4f2	true	userinfo.token.claim
87329cf0-2d72-4baf-8bb6-007025dff4f2	email	user.attribute
87329cf0-2d72-4baf-8bb6-007025dff4f2	true	id.token.claim
87329cf0-2d72-4baf-8bb6-007025dff4f2	true	access.token.claim
87329cf0-2d72-4baf-8bb6-007025dff4f2	email	claim.name
87329cf0-2d72-4baf-8bb6-007025dff4f2	String	jsonType.label
de493d8d-9f95-48ff-b0c0-c0cdde278496	true	introspection.token.claim
de493d8d-9f95-48ff-b0c0-c0cdde278496	true	userinfo.token.claim
de493d8d-9f95-48ff-b0c0-c0cdde278496	emailVerified	user.attribute
de493d8d-9f95-48ff-b0c0-c0cdde278496	true	id.token.claim
de493d8d-9f95-48ff-b0c0-c0cdde278496	true	access.token.claim
de493d8d-9f95-48ff-b0c0-c0cdde278496	email_verified	claim.name
de493d8d-9f95-48ff-b0c0-c0cdde278496	boolean	jsonType.label
17b5f10e-0ada-4d99-b7e5-686cd948f506	formatted	user.attribute.formatted
17b5f10e-0ada-4d99-b7e5-686cd948f506	country	user.attribute.country
17b5f10e-0ada-4d99-b7e5-686cd948f506	true	introspection.token.claim
17b5f10e-0ada-4d99-b7e5-686cd948f506	postal_code	user.attribute.postal_code
17b5f10e-0ada-4d99-b7e5-686cd948f506	true	userinfo.token.claim
17b5f10e-0ada-4d99-b7e5-686cd948f506	street	user.attribute.street
17b5f10e-0ada-4d99-b7e5-686cd948f506	true	id.token.claim
17b5f10e-0ada-4d99-b7e5-686cd948f506	region	user.attribute.region
17b5f10e-0ada-4d99-b7e5-686cd948f506	true	access.token.claim
17b5f10e-0ada-4d99-b7e5-686cd948f506	locality	user.attribute.locality
8626d7b7-3344-4674-8cdf-88bcd3d93f07	true	introspection.token.claim
8626d7b7-3344-4674-8cdf-88bcd3d93f07	true	userinfo.token.claim
8626d7b7-3344-4674-8cdf-88bcd3d93f07	phoneNumberVerified	user.attribute
8626d7b7-3344-4674-8cdf-88bcd3d93f07	true	id.token.claim
8626d7b7-3344-4674-8cdf-88bcd3d93f07	true	access.token.claim
8626d7b7-3344-4674-8cdf-88bcd3d93f07	phone_number_verified	claim.name
8626d7b7-3344-4674-8cdf-88bcd3d93f07	boolean	jsonType.label
91ac7ad8-6be8-45bb-b571-79d1c4c0d181	true	introspection.token.claim
91ac7ad8-6be8-45bb-b571-79d1c4c0d181	true	userinfo.token.claim
91ac7ad8-6be8-45bb-b571-79d1c4c0d181	phoneNumber	user.attribute
91ac7ad8-6be8-45bb-b571-79d1c4c0d181	true	id.token.claim
91ac7ad8-6be8-45bb-b571-79d1c4c0d181	true	access.token.claim
91ac7ad8-6be8-45bb-b571-79d1c4c0d181	phone_number	claim.name
91ac7ad8-6be8-45bb-b571-79d1c4c0d181	String	jsonType.label
0efa0b22-b558-4825-bd20-a271d121b4fd	true	introspection.token.claim
0efa0b22-b558-4825-bd20-a271d121b4fd	true	multivalued
0efa0b22-b558-4825-bd20-a271d121b4fd	foo	user.attribute
0efa0b22-b558-4825-bd20-a271d121b4fd	true	access.token.claim
0efa0b22-b558-4825-bd20-a271d121b4fd	resource_access.${client_id}.roles	claim.name
0efa0b22-b558-4825-bd20-a271d121b4fd	String	jsonType.label
beb90ef6-fe1b-4b63-8171-fd1108d7c906	true	introspection.token.claim
beb90ef6-fe1b-4b63-8171-fd1108d7c906	true	multivalued
beb90ef6-fe1b-4b63-8171-fd1108d7c906	foo	user.attribute
beb90ef6-fe1b-4b63-8171-fd1108d7c906	true	access.token.claim
beb90ef6-fe1b-4b63-8171-fd1108d7c906	realm_access.roles	claim.name
beb90ef6-fe1b-4b63-8171-fd1108d7c906	String	jsonType.label
ca6dced1-8da3-412e-af34-8ee5c79b68b2	true	introspection.token.claim
ca6dced1-8da3-412e-af34-8ee5c79b68b2	true	access.token.claim
e6dc6448-bb14-4e59-a95b-08d45b96ad1f	true	introspection.token.claim
e6dc6448-bb14-4e59-a95b-08d45b96ad1f	true	access.token.claim
96aabdb4-fef5-4e1b-a899-5918b023cc9a	true	introspection.token.claim
96aabdb4-fef5-4e1b-a899-5918b023cc9a	true	multivalued
96aabdb4-fef5-4e1b-a899-5918b023cc9a	foo	user.attribute
96aabdb4-fef5-4e1b-a899-5918b023cc9a	true	id.token.claim
96aabdb4-fef5-4e1b-a899-5918b023cc9a	true	access.token.claim
96aabdb4-fef5-4e1b-a899-5918b023cc9a	groups	claim.name
96aabdb4-fef5-4e1b-a899-5918b023cc9a	String	jsonType.label
a7864775-be94-4deb-a3cd-e4b4a911b353	true	introspection.token.claim
a7864775-be94-4deb-a3cd-e4b4a911b353	true	userinfo.token.claim
a7864775-be94-4deb-a3cd-e4b4a911b353	username	user.attribute
a7864775-be94-4deb-a3cd-e4b4a911b353	true	id.token.claim
a7864775-be94-4deb-a3cd-e4b4a911b353	true	access.token.claim
a7864775-be94-4deb-a3cd-e4b4a911b353	upn	claim.name
a7864775-be94-4deb-a3cd-e4b4a911b353	String	jsonType.label
5838c511-8bde-42ef-a4bf-bf30470aea73	true	introspection.token.claim
5838c511-8bde-42ef-a4bf-bf30470aea73	true	id.token.claim
5838c511-8bde-42ef-a4bf-bf30470aea73	true	access.token.claim
5cf4e3e4-c4e8-4443-ad3f-6248bbf01730	true	introspection.token.claim
5cf4e3e4-c4e8-4443-ad3f-6248bbf01730	true	userinfo.token.claim
5cf4e3e4-c4e8-4443-ad3f-6248bbf01730	locale	user.attribute
5cf4e3e4-c4e8-4443-ad3f-6248bbf01730	true	id.token.claim
5cf4e3e4-c4e8-4443-ad3f-6248bbf01730	true	access.token.claim
5cf4e3e4-c4e8-4443-ad3f-6248bbf01730	locale	claim.name
5cf4e3e4-c4e8-4443-ad3f-6248bbf01730	String	jsonType.label
31882e81-28df-4fee-b496-7ee226be7dbf	client_id	user.session.note
31882e81-28df-4fee-b496-7ee226be7dbf	true	introspection.token.claim
31882e81-28df-4fee-b496-7ee226be7dbf	true	id.token.claim
31882e81-28df-4fee-b496-7ee226be7dbf	true	access.token.claim
31882e81-28df-4fee-b496-7ee226be7dbf	client_id	claim.name
31882e81-28df-4fee-b496-7ee226be7dbf	String	jsonType.label
d2a55b22-048b-457e-ab64-1d2adcf00920	clientHost	user.session.note
d2a55b22-048b-457e-ab64-1d2adcf00920	true	introspection.token.claim
d2a55b22-048b-457e-ab64-1d2adcf00920	true	id.token.claim
d2a55b22-048b-457e-ab64-1d2adcf00920	true	access.token.claim
d2a55b22-048b-457e-ab64-1d2adcf00920	clientHost	claim.name
d2a55b22-048b-457e-ab64-1d2adcf00920	String	jsonType.label
e43326d0-fed3-46b6-88f2-9931495254da	clientAddress	user.session.note
e43326d0-fed3-46b6-88f2-9931495254da	true	introspection.token.claim
e43326d0-fed3-46b6-88f2-9931495254da	true	id.token.claim
e43326d0-fed3-46b6-88f2-9931495254da	true	access.token.claim
e43326d0-fed3-46b6-88f2-9931495254da	clientAddress	claim.name
e43326d0-fed3-46b6-88f2-9931495254da	String	jsonType.label
\.


--
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) FROM stdin;
51b23642-b8e2-49b1-a277-da115aec56b8	60	300	300	\N	\N	\N	t	f	0	\N	paisesapprealm	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	40d799c9-e447-4405-8024-f0f0a4f2c067	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	5b1bcbfe-38bf-4f19-87f9-1e591f916369	b2235c60-3371-4a92-a173-9bd7fe31c6ad	db60fefb-9021-46f5-aefc-af38f5bc5c31	2610a3ad-5dc9-419b-a689-17de4a4e8875	a9d6aa8a-6e25-468c-a9b1-4e0f9b841470	2592000	f	900	t	f	0294da60-d9c1-429e-8e56-3b089e984910	0	f	0	0	1fcd614d-bb2d-4386-8f5c-219a1e3776de
d9df55b1-c105-4a3c-96cd-8719a1891442	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	f91ace5c-70b3-43a8-8194-a2c0edf64b8e	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	4c0cfb5d-ef68-43cb-b136-87b6695c26ea	d80fedf5-08bf-49ae-b033-9762f4de3340	4cdc455e-d53f-4be8-a640-a837e69bbcda	97e5ea14-ba1c-47e3-b761-6abd61d87fd7	af7b097d-92de-4e7c-ab74-62c415548cbb	2592000	f	900	t	f	ec5feac5-7106-47f7-b123-bcf5da16a3d7	0	f	0	0	b65eb93d-5eb3-482a-984d-edb8b63f2b16
\.


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_attribute (name, realm_id, value) FROM stdin;
_browser_header.contentSecurityPolicyReportOnly	d9df55b1-c105-4a3c-96cd-8719a1891442	
_browser_header.xContentTypeOptions	d9df55b1-c105-4a3c-96cd-8719a1891442	nosniff
_browser_header.referrerPolicy	d9df55b1-c105-4a3c-96cd-8719a1891442	no-referrer
_browser_header.xRobotsTag	d9df55b1-c105-4a3c-96cd-8719a1891442	none
_browser_header.xFrameOptions	d9df55b1-c105-4a3c-96cd-8719a1891442	SAMEORIGIN
_browser_header.contentSecurityPolicy	d9df55b1-c105-4a3c-96cd-8719a1891442	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	d9df55b1-c105-4a3c-96cd-8719a1891442	1; mode=block
_browser_header.strictTransportSecurity	d9df55b1-c105-4a3c-96cd-8719a1891442	max-age=31536000; includeSubDomains
bruteForceProtected	d9df55b1-c105-4a3c-96cd-8719a1891442	false
permanentLockout	d9df55b1-c105-4a3c-96cd-8719a1891442	false
maxTemporaryLockouts	d9df55b1-c105-4a3c-96cd-8719a1891442	0
maxFailureWaitSeconds	d9df55b1-c105-4a3c-96cd-8719a1891442	900
minimumQuickLoginWaitSeconds	d9df55b1-c105-4a3c-96cd-8719a1891442	60
waitIncrementSeconds	d9df55b1-c105-4a3c-96cd-8719a1891442	60
quickLoginCheckMilliSeconds	d9df55b1-c105-4a3c-96cd-8719a1891442	1000
maxDeltaTimeSeconds	d9df55b1-c105-4a3c-96cd-8719a1891442	43200
failureFactor	d9df55b1-c105-4a3c-96cd-8719a1891442	30
realmReusableOtpCode	d9df55b1-c105-4a3c-96cd-8719a1891442	false
firstBrokerLoginFlowId	d9df55b1-c105-4a3c-96cd-8719a1891442	8d3ad094-b3d5-4274-aff3-9c5b2cf90ffc
displayName	d9df55b1-c105-4a3c-96cd-8719a1891442	Keycloak
displayNameHtml	d9df55b1-c105-4a3c-96cd-8719a1891442	<div class="kc-logo-text"><span>Keycloak</span></div>
defaultSignatureAlgorithm	d9df55b1-c105-4a3c-96cd-8719a1891442	RS256
offlineSessionMaxLifespanEnabled	d9df55b1-c105-4a3c-96cd-8719a1891442	false
offlineSessionMaxLifespan	d9df55b1-c105-4a3c-96cd-8719a1891442	5184000
bruteForceProtected	51b23642-b8e2-49b1-a277-da115aec56b8	false
permanentLockout	51b23642-b8e2-49b1-a277-da115aec56b8	false
maxTemporaryLockouts	51b23642-b8e2-49b1-a277-da115aec56b8	0
maxFailureWaitSeconds	51b23642-b8e2-49b1-a277-da115aec56b8	900
minimumQuickLoginWaitSeconds	51b23642-b8e2-49b1-a277-da115aec56b8	60
waitIncrementSeconds	51b23642-b8e2-49b1-a277-da115aec56b8	60
quickLoginCheckMilliSeconds	51b23642-b8e2-49b1-a277-da115aec56b8	1000
maxDeltaTimeSeconds	51b23642-b8e2-49b1-a277-da115aec56b8	43200
failureFactor	51b23642-b8e2-49b1-a277-da115aec56b8	30
realmReusableOtpCode	51b23642-b8e2-49b1-a277-da115aec56b8	false
defaultSignatureAlgorithm	51b23642-b8e2-49b1-a277-da115aec56b8	RS256
offlineSessionMaxLifespanEnabled	51b23642-b8e2-49b1-a277-da115aec56b8	false
offlineSessionMaxLifespan	51b23642-b8e2-49b1-a277-da115aec56b8	5184000
actionTokenGeneratedByAdminLifespan	51b23642-b8e2-49b1-a277-da115aec56b8	43200
actionTokenGeneratedByUserLifespan	51b23642-b8e2-49b1-a277-da115aec56b8	300
oauth2DeviceCodeLifespan	51b23642-b8e2-49b1-a277-da115aec56b8	600
oauth2DevicePollingInterval	51b23642-b8e2-49b1-a277-da115aec56b8	5
webAuthnPolicyRpEntityName	51b23642-b8e2-49b1-a277-da115aec56b8	keycloak
webAuthnPolicySignatureAlgorithms	51b23642-b8e2-49b1-a277-da115aec56b8	ES256
webAuthnPolicyRpId	51b23642-b8e2-49b1-a277-da115aec56b8	
webAuthnPolicyAttestationConveyancePreference	51b23642-b8e2-49b1-a277-da115aec56b8	not specified
webAuthnPolicyAuthenticatorAttachment	51b23642-b8e2-49b1-a277-da115aec56b8	not specified
webAuthnPolicyRequireResidentKey	51b23642-b8e2-49b1-a277-da115aec56b8	not specified
webAuthnPolicyUserVerificationRequirement	51b23642-b8e2-49b1-a277-da115aec56b8	not specified
webAuthnPolicyCreateTimeout	51b23642-b8e2-49b1-a277-da115aec56b8	0
webAuthnPolicyAvoidSameAuthenticatorRegister	51b23642-b8e2-49b1-a277-da115aec56b8	false
webAuthnPolicyRpEntityNamePasswordless	51b23642-b8e2-49b1-a277-da115aec56b8	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	51b23642-b8e2-49b1-a277-da115aec56b8	ES256
webAuthnPolicyRpIdPasswordless	51b23642-b8e2-49b1-a277-da115aec56b8	
webAuthnPolicyAttestationConveyancePreferencePasswordless	51b23642-b8e2-49b1-a277-da115aec56b8	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	51b23642-b8e2-49b1-a277-da115aec56b8	not specified
webAuthnPolicyRequireResidentKeyPasswordless	51b23642-b8e2-49b1-a277-da115aec56b8	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	51b23642-b8e2-49b1-a277-da115aec56b8	not specified
webAuthnPolicyCreateTimeoutPasswordless	51b23642-b8e2-49b1-a277-da115aec56b8	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	51b23642-b8e2-49b1-a277-da115aec56b8	false
cibaBackchannelTokenDeliveryMode	51b23642-b8e2-49b1-a277-da115aec56b8	poll
cibaExpiresIn	51b23642-b8e2-49b1-a277-da115aec56b8	120
cibaInterval	51b23642-b8e2-49b1-a277-da115aec56b8	5
cibaAuthRequestedUserHint	51b23642-b8e2-49b1-a277-da115aec56b8	login_hint
parRequestUriLifespan	51b23642-b8e2-49b1-a277-da115aec56b8	60
firstBrokerLoginFlowId	51b23642-b8e2-49b1-a277-da115aec56b8	668c5393-d3f1-42e1-a2d2-a8752b858e4b
frontendUrl	51b23642-b8e2-49b1-a277-da115aec56b8	http://keycloak:8080
acr.loa.map	51b23642-b8e2-49b1-a277-da115aec56b8	{}
displayName	51b23642-b8e2-49b1-a277-da115aec56b8	
displayNameHtml	51b23642-b8e2-49b1-a277-da115aec56b8	
clientSessionIdleTimeout	51b23642-b8e2-49b1-a277-da115aec56b8	0
clientSessionMaxLifespan	51b23642-b8e2-49b1-a277-da115aec56b8	0
clientOfflineSessionIdleTimeout	51b23642-b8e2-49b1-a277-da115aec56b8	0
clientOfflineSessionMaxLifespan	51b23642-b8e2-49b1-a277-da115aec56b8	0
client-policies.profiles	51b23642-b8e2-49b1-a277-da115aec56b8	{"profiles":[]}
client-policies.policies	51b23642-b8e2-49b1-a277-da115aec56b8	{"policies":[]}
_browser_header.contentSecurityPolicyReportOnly	51b23642-b8e2-49b1-a277-da115aec56b8	
_browser_header.xContentTypeOptions	51b23642-b8e2-49b1-a277-da115aec56b8	nosniff
_browser_header.referrerPolicy	51b23642-b8e2-49b1-a277-da115aec56b8	no-referrer
_browser_header.xRobotsTag	51b23642-b8e2-49b1-a277-da115aec56b8	none
_browser_header.xFrameOptions	51b23642-b8e2-49b1-a277-da115aec56b8	SAMEORIGIN
_browser_header.contentSecurityPolicy	51b23642-b8e2-49b1-a277-da115aec56b8	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	51b23642-b8e2-49b1-a277-da115aec56b8	1; mode=block
_browser_header.strictTransportSecurity	51b23642-b8e2-49b1-a277-da115aec56b8	max-age=31536000; includeSubDomains
\.


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
\.


--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
\.


--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_events_listeners (realm_id, value) FROM stdin;
d9df55b1-c105-4a3c-96cd-8719a1891442	jboss-logging
51b23642-b8e2-49b1-a277-da115aec56b8	jboss-logging
\.


--
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_localizations (realm_id, locale, texts) FROM stdin;
\.


--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	d9df55b1-c105-4a3c-96cd-8719a1891442
password	password	t	t	51b23642-b8e2-49b1-a277-da115aec56b8
\.


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
\.


--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_supported_locales (realm_id, value) FROM stdin;
\.


--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.redirect_uris (client_id, value) FROM stdin;
1724038c-2170-4354-b987-7b1297b3cbc3	/realms/master/account/*
6095f23e-2031-4527-ad1a-9be0bf6d064a	/realms/master/account/*
ad0b11ac-4631-453a-8703-51591649e59d	/admin/master/console/*
0854564e-3985-4e47-8eb5-b2643e2ed200	/realms/paisesapprealm/account/*
a1d47433-c1f2-4ef6-b728-1875088a2ae7	/realms/paisesapprealm/account/*
1796b1b1-2469-4673-8b70-81d0c65e244d	/admin/paisesapprealm/console/*
5dfa53a6-062d-4982-9f98-c6ea224d97bb	http://localhost:8080/*
\.


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
61e8aa48-a664-4096-ad04-9cc5639b98d1	VERIFY_EMAIL	Verify Email	d9df55b1-c105-4a3c-96cd-8719a1891442	t	f	VERIFY_EMAIL	50
6ce2f726-3fe7-4a29-b05b-5a212bb8e52e	UPDATE_PROFILE	Update Profile	d9df55b1-c105-4a3c-96cd-8719a1891442	t	f	UPDATE_PROFILE	40
4e1bed7a-2155-4ecd-b760-efc23d6307ae	CONFIGURE_TOTP	Configure OTP	d9df55b1-c105-4a3c-96cd-8719a1891442	t	f	CONFIGURE_TOTP	10
91845a2e-f567-43f1-8b7d-057bad12490b	UPDATE_PASSWORD	Update Password	d9df55b1-c105-4a3c-96cd-8719a1891442	t	f	UPDATE_PASSWORD	30
74aa842d-a461-4756-9222-9f63db7057a7	TERMS_AND_CONDITIONS	Terms and Conditions	d9df55b1-c105-4a3c-96cd-8719a1891442	f	f	TERMS_AND_CONDITIONS	20
26a32473-676b-42a4-85ac-06dfcf8e4c24	delete_account	Delete Account	d9df55b1-c105-4a3c-96cd-8719a1891442	f	f	delete_account	60
bab7bf95-466c-47c9-9c99-1ae6550e3229	delete_credential	Delete Credential	d9df55b1-c105-4a3c-96cd-8719a1891442	t	f	delete_credential	100
802ea5e7-56c1-4a07-890e-37996f973da7	update_user_locale	Update User Locale	d9df55b1-c105-4a3c-96cd-8719a1891442	t	f	update_user_locale	1000
ddca166e-8a83-4ddc-9ff2-593eddb6c2b1	webauthn-register	Webauthn Register	d9df55b1-c105-4a3c-96cd-8719a1891442	t	f	webauthn-register	70
57be871b-5871-4fdf-8ff8-7503d27aab48	webauthn-register-passwordless	Webauthn Register Passwordless	d9df55b1-c105-4a3c-96cd-8719a1891442	t	f	webauthn-register-passwordless	80
f37a09ed-d642-44f5-be2c-4c4917841a5f	VERIFY_PROFILE	Verify Profile	d9df55b1-c105-4a3c-96cd-8719a1891442	t	f	VERIFY_PROFILE	90
5bf9c4f5-d515-4170-acc1-60e170e772fd	VERIFY_EMAIL	Verify Email	51b23642-b8e2-49b1-a277-da115aec56b8	t	f	VERIFY_EMAIL	50
c0f58586-9560-4db6-96b3-e26c33910355	UPDATE_PROFILE	Update Profile	51b23642-b8e2-49b1-a277-da115aec56b8	t	f	UPDATE_PROFILE	40
db295473-cd2b-4d93-8b7c-359ccdfafb3e	CONFIGURE_TOTP	Configure OTP	51b23642-b8e2-49b1-a277-da115aec56b8	t	f	CONFIGURE_TOTP	10
83a02c40-75e5-463c-adc5-68683d7d1081	UPDATE_PASSWORD	Update Password	51b23642-b8e2-49b1-a277-da115aec56b8	t	f	UPDATE_PASSWORD	30
8db95395-42cd-49d6-b9f3-c414f9c6102b	TERMS_AND_CONDITIONS	Terms and Conditions	51b23642-b8e2-49b1-a277-da115aec56b8	f	f	TERMS_AND_CONDITIONS	20
6b10c2f7-904b-41aa-a31e-19777afc79b1	delete_account	Delete Account	51b23642-b8e2-49b1-a277-da115aec56b8	f	f	delete_account	60
5f512643-03c5-4615-a664-650f4ceb3592	delete_credential	Delete Credential	51b23642-b8e2-49b1-a277-da115aec56b8	t	f	delete_credential	100
4aed617c-bbf2-4a92-b80c-b9a935bcfc94	update_user_locale	Update User Locale	51b23642-b8e2-49b1-a277-da115aec56b8	t	f	update_user_locale	1000
c46f12ac-92b0-40ce-947a-5d99eeabfa27	webauthn-register	Webauthn Register	51b23642-b8e2-49b1-a277-da115aec56b8	t	f	webauthn-register	70
a6b1381d-2d61-45a8-98cb-62987ed8e8dd	webauthn-register-passwordless	Webauthn Register Passwordless	51b23642-b8e2-49b1-a277-da115aec56b8	t	f	webauthn-register-passwordless	80
35e7e567-e114-4ed3-97f5-45d5ed2b23a9	VERIFY_PROFILE	Verify Profile	51b23642-b8e2-49b1-a277-da115aec56b8	t	f	VERIFY_PROFILE	90
\.


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
\.


--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
\.


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
\.


--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
\.


--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_uris (resource_id, value) FROM stdin;
\.


--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.scope_mapping (client_id, role_id) FROM stdin;
6095f23e-2031-4527-ad1a-9be0bf6d064a	83c7a3d7-799a-4260-b128-6b94583f26c8
6095f23e-2031-4527-ad1a-9be0bf6d064a	aa26e5ce-2c2f-4cfa-951b-362d65a6a7ef
a1d47433-c1f2-4ef6-b728-1875088a2ae7	f63f91e9-b6b6-41bc-8aa4-75e4bdc11e5b
a1d47433-c1f2-4ef6-b728-1875088a2ae7	dc76f81a-d7b3-42c6-b5b1-10fdcfcfc035
\.


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_attribute (name, value, user_id, id, long_value_hash, long_value_hash_lower_case, long_value) FROM stdin;
\.


--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
738b857d-b15e-45d6-9811-270e820ecc83	\N	cda7ad15-c6e2-42f8-9d6b-c8da56d24867	f	t	\N	\N	\N	d9df55b1-c105-4a3c-96cd-8719a1891442	admin	1716955510573	\N	0
b81a9e3a-2a0a-4611-b5d3-c586f4758e7d	\N	31c74ab5-adc5-4e6e-ba5b-b8e3c6e20662	f	t	\N	\N	\N	51b23642-b8e2-49b1-a277-da115aec56b8	service-account-frontend-paises	1716955951102	5dfa53a6-062d-4982-9f98-c6ea224d97bb	0
e150e382-e132-4a0f-bcbb-3ecd3c4dc8a7	usuario1@gmail.com	usuario1@gmail.com	t	t	\N	Alvaro	Salazar	51b23642-b8e2-49b1-a277-da115aec56b8	usuario1	1716956350116	\N	0
26b4b752-b82c-4594-a2a7-31a41279052d	usuario2@gmail.com	usuario2@gmail.com	t	t	\N	Diana	Cardona	51b23642-b8e2-49b1-a277-da115aec56b8	usuario2	1716956542417	\N	0
\.


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_group_membership (group_id, user_id) FROM stdin;
\.


--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_required_action (user_id, required_action) FROM stdin;
\.


--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_role_mapping (role_id, user_id) FROM stdin;
b65eb93d-5eb3-482a-984d-edb8b63f2b16	738b857d-b15e-45d6-9811-270e820ecc83
d349b8e2-c315-40b1-8df4-d671f4fc3cd7	738b857d-b15e-45d6-9811-270e820ecc83
7b2f091a-c2ea-4c22-ba4f-c314b3b0f9b4	738b857d-b15e-45d6-9811-270e820ecc83
eaefafdd-c18a-4c78-b712-2f41c5319ec2	738b857d-b15e-45d6-9811-270e820ecc83
26aa4e3b-5ee2-41ac-8662-bb3e026d7ee3	738b857d-b15e-45d6-9811-270e820ecc83
f56a72b4-9a73-4c91-acf0-df76047223ac	738b857d-b15e-45d6-9811-270e820ecc83
b943b2d5-853e-42f3-8e45-eb392f891ee1	738b857d-b15e-45d6-9811-270e820ecc83
dd2bf7e2-6e13-41a8-926f-f6c07c889fd2	738b857d-b15e-45d6-9811-270e820ecc83
85d93397-366d-4444-8d43-64407d4fa0a5	738b857d-b15e-45d6-9811-270e820ecc83
8ea6e850-7c21-462f-ba57-850367f4937f	738b857d-b15e-45d6-9811-270e820ecc83
d3e6cf2b-4b02-4e2a-9395-582d204e528e	738b857d-b15e-45d6-9811-270e820ecc83
9bfab82c-85a3-41e9-bc22-d93427bb8c44	738b857d-b15e-45d6-9811-270e820ecc83
cc13385f-1905-4f19-b059-c6da008fb684	738b857d-b15e-45d6-9811-270e820ecc83
fb9086b0-3a6a-4ff8-b327-d4a812382d4e	738b857d-b15e-45d6-9811-270e820ecc83
a0736da6-62e2-4c25-b94f-a308a370650c	738b857d-b15e-45d6-9811-270e820ecc83
cf06e808-ddd0-4208-88f0-68a51b56ef05	738b857d-b15e-45d6-9811-270e820ecc83
fc83c34d-97ec-4a23-8a02-65cfe835cd22	738b857d-b15e-45d6-9811-270e820ecc83
5c806358-7819-43a9-aa97-931ab522252b	738b857d-b15e-45d6-9811-270e820ecc83
4e0e9eb8-e56a-4dab-ad08-b092c45a46b7	738b857d-b15e-45d6-9811-270e820ecc83
1fcd614d-bb2d-4386-8f5c-219a1e3776de	b81a9e3a-2a0a-4611-b5d3-c586f4758e7d
1fcd614d-bb2d-4386-8f5c-219a1e3776de	e150e382-e132-4a0f-bcbb-3ecd3c4dc8a7
1fcd614d-bb2d-4386-8f5c-219a1e3776de	26b4b752-b82c-4594-a2a7-31a41279052d
dbba9965-679a-420d-8802-f13926702de2	e150e382-e132-4a0f-bcbb-3ecd3c4dc8a7
bf6e9d5e-437a-44a7-91ed-b4078bb78b30	26b4b752-b82c-4594-a2a7-31a41279052d
\.


--
-- Data for Name: user_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_session (id, auth_method, ip_address, last_session_refresh, login_username, realm_id, remember_me, started, user_id, user_session_state, broker_session_id, broker_user_id) FROM stdin;
\.


--
-- Data for Name: user_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_session_note (user_session, name, value) FROM stdin;
\.


--
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.username_login_failure (realm_id, username, failed_login_not_before, last_failure, last_ip_failure, num_failures) FROM stdin;
\.


--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.web_origins (client_id, value) FROM stdin;
ad0b11ac-4631-453a-8703-51591649e59d	+
1796b1b1-2469-4673-8b70-81d0c65e244d	+
5dfa53a6-062d-4982-9f98-c6ea224d97bb	*
\.


--
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- Name: client_user_session_note constr_cl_usr_ses_note; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);


--
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- Name: client_session_role constraint_5; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);


--
-- Name: user_session constraint_57; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);


--
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client_session_note constraint_5e; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- Name: client_session constraint_8; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);


--
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- Name: client_session_auth_status constraint_auth_status_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);


--
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- Name: client_session_prot_mapper constraint_cs_pmp_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);


--
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: user_session_note constraint_usn_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);


--
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: user_consent uk_jkuwuvd56ontgsuhogm8uewrt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt UNIQUE (client_id, client_storage_provider, external_client_id, user_id);


--
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- Name: fed_user_attr_long_values; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX fed_user_attr_long_values ON public.fed_user_attribute USING btree (long_value_hash, name);


--
-- Name: fed_user_attr_long_values_lower_case; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX fed_user_attr_long_values_lower_case ON public.fed_user_attribute USING btree (long_value_hash_lower_case, name);


--
-- Name: idx_admin_event_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_admin_event_time ON public.admin_event_entity USING btree (realm_id, admin_event_time);


--
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- Name: idx_client_att_by_name_value; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_att_by_name_value ON public.client_attributes USING btree (name, substr(value, 1, 255));


--
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- Name: idx_client_session_session; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_session_session ON public.client_session USING btree (session_id);


--
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- Name: idx_event_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);


--
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- Name: idx_group_att_by_name_value; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_att_by_name_value ON public.group_attribute USING btree (name, ((value)::character varying(250)));


--
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- Name: idx_offline_css_preload; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_css_preload ON public.offline_client_session USING btree (client_id, offline_flag);


--
-- Name: idx_offline_uss_by_user; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_by_user ON public.offline_user_session USING btree (user_id, realm_id, offline_flag);


--
-- Name: idx_offline_uss_by_usersess; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_by_usersess ON public.offline_user_session USING btree (realm_id, offline_flag, user_session_id);


--
-- Name: idx_offline_uss_createdon; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_createdon ON public.offline_user_session USING btree (created_on);


--
-- Name: idx_offline_uss_preload; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_preload ON public.offline_user_session USING btree (offline_flag, created_on, user_session_id);


--
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- Name: idx_us_sess_id_on_cl_sess; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_us_sess_id_on_cl_sess ON public.offline_client_session USING btree (user_session_id);


--
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- Name: idx_user_attribute_name; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_attribute_name ON public.user_attribute USING btree (name, value);


--
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- Name: idx_user_service_account; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_service_account ON public.user_entity USING btree (realm_id, service_account_client_link);


--
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- Name: user_attr_long_values; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX user_attr_long_values ON public.user_attribute USING btree (long_value_hash, name);


--
-- Name: user_attr_long_values_lower_case; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX user_attr_long_values_lower_case ON public.user_attribute USING btree (long_value_hash_lower_case, name);


--
-- Name: client_session_auth_status auth_status_constraint; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_session_note fk5edfb00ff51c2736; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: user_session_note fk5edfb00ff51d3472; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES public.user_session(id);


--
-- Name: client_session_role fk_11b7sgqw18i532811v7o2dv76; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session fk_b4ao2vcvat6ukau74wbwtfqo1; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES public.user_session(id);


--
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_user_session_note fk_cl_usr_ses_note; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


--
-- PostgreSQL database dump complete
--

