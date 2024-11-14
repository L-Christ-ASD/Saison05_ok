-- Adminer 4.8.1 PostgreSQL 17.0 (Debian 17.0-1.pgdg120+1) dump

\connect "enloused";

CREATE TABLE "public"."directus_access" (
    "id" uuid NOT NULL,
    "role" uuid,
    "user" uuid,
    "policy" uuid NOT NULL,
    "sort" integer,
    CONSTRAINT "directus_access_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "directus_access" ("id", "role", "user", "policy", "sort") VALUES
('a03db64d-ce3f-4138-98aa-7b84f13da9e3',	NULL,	NULL,	'abf8a154-5b1c-4a46-ac9c-7300570f4f17',	1),
('d0af3f9f-a146-4df9-86fc-1fa5f67b54e2',	'833d5806-dad3-42e0-8323-fc0bf3c7af15',	NULL,	'56005a1e-6400-444e-a9cf-7b23dae4ad5f',	NULL);

CREATE SEQUENCE directus_activity_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 6 CACHE 1;

CREATE TABLE "public"."directus_activity" (
    "id" integer DEFAULT nextval('directus_activity_id_seq') NOT NULL,
    "action" character varying(45) NOT NULL,
    "user" uuid,
    "timestamp" timestamptz DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "ip" character varying(50),
    "user_agent" text,
    "collection" character varying(64) NOT NULL,
    "item" character varying(255) NOT NULL,
    "comment" text,
    "origin" character varying(255),
    CONSTRAINT "directus_activity_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "directus_activity" ("id", "action", "user", "timestamp", "ip", "user_agent", "collection", "item", "comment", "origin") VALUES
(1,	'login',	'baedcabe-36e4-4c18-b7f0-fd595bd0919f',	'2024-11-06 13:58:22.496+00',	'172.19.0.1',	'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:132.0) Gecko/20100101 Firefox/132.0',	'directus_users',	'baedcabe-36e4-4c18-b7f0-fd595bd0919f',	NULL,	'http://localhost:8055'),
(2,	'create',	'baedcabe-36e4-4c18-b7f0-fd595bd0919f',	'2024-11-06 14:01:47.945+00',	'172.19.0.1',	'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:132.0) Gecko/20100101 Firefox/132.0',	'directus_roles',	'a5f71f1c-36b8-4241-a4fe-d39c1d424446',	NULL,	'http://localhost:8055'),
(3,	'create',	'baedcabe-36e4-4c18-b7f0-fd595bd0919f',	'2024-11-06 14:01:48.362+00',	'172.19.0.1',	'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:132.0) Gecko/20100101 Firefox/132.0',	'directus_users',	'784f4dc7-2b78-465b-930c-7db965492a69',	NULL,	'http://localhost:8055'),
(4,	'create',	'baedcabe-36e4-4c18-b7f0-fd595bd0919f',	'2024-11-06 14:06:50.095+00',	'172.19.0.1',	'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:132.0) Gecko/20100101 Firefox/132.0',	'directus_users',	'921874fa-57d2-46bf-82e7-dca1e4a18e00',	NULL,	'http://localhost:8055'),
(5,	'create',	'baedcabe-36e4-4c18-b7f0-fd595bd0919f',	'2024-11-06 14:10:55.966+00',	'172.19.0.1',	'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:132.0) Gecko/20100101 Firefox/132.0',	'directus_users',	'2aed51b6-9ec1-4304-a7c0-fc9365eddb20',	NULL,	'http://localhost:8055'),
(6,	'create',	'baedcabe-36e4-4c18-b7f0-fd595bd0919f',	'2024-11-06 14:14:29.874+00',	'172.19.0.1',	'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:132.0) Gecko/20100101 Firefox/132.0',	'directus_users',	'd7c70400-e666-4132-aa4c-ee75a69e82a5',	NULL,	'http://localhost:8055');

CREATE TABLE "public"."directus_collections" (
    "collection" character varying(64) NOT NULL,
    "icon" character varying(64),
    "note" text,
    "display_template" character varying(255),
    "hidden" boolean DEFAULT false NOT NULL,
    "singleton" boolean DEFAULT false NOT NULL,
    "translations" json,
    "archive_field" character varying(64),
    "archive_app_filter" boolean DEFAULT true NOT NULL,
    "archive_value" character varying(255),
    "unarchive_value" character varying(255),
    "sort_field" character varying(64),
    "accountability" character varying(255) DEFAULT 'all',
    "color" character varying(255),
    "item_duplication_fields" json,
    "sort" integer,
    "group" character varying(64),
    "collapse" character varying(255) DEFAULT 'open' NOT NULL,
    "preview_url" character varying(255),
    "versioning" boolean DEFAULT false NOT NULL,
    CONSTRAINT "directus_collections_pkey" PRIMARY KEY ("collection")
) WITH (oids = false);


CREATE TABLE "public"."directus_comments" (
    "id" uuid NOT NULL,
    "collection" character varying(64) NOT NULL,
    "item" character varying(255) NOT NULL,
    "comment" text NOT NULL,
    "date_created" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "date_updated" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "user_created" uuid,
    "user_updated" uuid,
    CONSTRAINT "directus_comments_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE TABLE "public"."directus_dashboards" (
    "id" uuid NOT NULL,
    "name" character varying(255) NOT NULL,
    "icon" character varying(64) DEFAULT 'dashboard' NOT NULL,
    "note" text,
    "date_created" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "user_created" uuid,
    "color" character varying(255),
    CONSTRAINT "directus_dashboards_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE TABLE "public"."directus_extensions" (
    "enabled" boolean DEFAULT true NOT NULL,
    "id" uuid NOT NULL,
    "folder" character varying(255) NOT NULL,
    "source" character varying(255) NOT NULL,
    "bundle" uuid,
    CONSTRAINT "directus_extensions_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE SEQUENCE directus_fields_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."directus_fields" (
    "id" integer DEFAULT nextval('directus_fields_id_seq') NOT NULL,
    "collection" character varying(64) NOT NULL,
    "field" character varying(64) NOT NULL,
    "special" character varying(64),
    "interface" character varying(64),
    "options" json,
    "display" character varying(64),
    "display_options" json,
    "readonly" boolean DEFAULT false NOT NULL,
    "hidden" boolean DEFAULT false NOT NULL,
    "sort" integer,
    "width" character varying(30) DEFAULT 'full',
    "translations" json,
    "note" text,
    "conditions" json,
    "required" boolean DEFAULT false,
    "group" character varying(64),
    "validation" json,
    "validation_message" text,
    CONSTRAINT "directus_fields_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE TABLE "public"."directus_files" (
    "id" uuid NOT NULL,
    "storage" character varying(255) NOT NULL,
    "filename_disk" character varying(255),
    "filename_download" character varying(255) NOT NULL,
    "title" character varying(255),
    "type" character varying(255),
    "folder" uuid,
    "uploaded_by" uuid,
    "created_on" timestamptz DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "modified_by" uuid,
    "modified_on" timestamptz DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "charset" character varying(50),
    "filesize" bigint,
    "width" integer,
    "height" integer,
    "duration" integer,
    "embed" character varying(200),
    "description" text,
    "location" text,
    "tags" text,
    "metadata" json,
    "focal_point_x" integer,
    "focal_point_y" integer,
    "tus_id" character varying(64),
    "tus_data" json,
    "uploaded_on" timestamptz,
    CONSTRAINT "directus_files_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE TABLE "public"."directus_flows" (
    "id" uuid NOT NULL,
    "name" character varying(255) NOT NULL,
    "icon" character varying(64),
    "color" character varying(255),
    "description" text,
    "status" character varying(255) DEFAULT 'active' NOT NULL,
    "trigger" character varying(255),
    "accountability" character varying(255) DEFAULT 'all',
    "options" json,
    "operation" uuid,
    "date_created" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "user_created" uuid,
    CONSTRAINT "directus_flows_operation_unique" UNIQUE ("operation"),
    CONSTRAINT "directus_flows_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE TABLE "public"."directus_folders" (
    "id" uuid NOT NULL,
    "name" character varying(255) NOT NULL,
    "parent" uuid,
    CONSTRAINT "directus_folders_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE TABLE "public"."directus_migrations" (
    "version" character varying(255) NOT NULL,
    "name" character varying(255) NOT NULL,
    "timestamp" timestamptz DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "directus_migrations_pkey" PRIMARY KEY ("version")
) WITH (oids = false);

INSERT INTO "directus_migrations" ("version", "name", "timestamp") VALUES
('20201028A',	'Remove Collection Foreign Keys',	'2024-11-06 13:57:24.712934+00'),
('20201029A',	'Remove System Relations',	'2024-11-06 13:57:24.725567+00'),
('20201029B',	'Remove System Collections',	'2024-11-06 13:57:24.737154+00'),
('20201029C',	'Remove System Fields',	'2024-11-06 13:57:24.764094+00'),
('20201105A',	'Add Cascade System Relations',	'2024-11-06 13:57:24.84202+00'),
('20201105B',	'Change Webhook URL Type',	'2024-11-06 13:57:24.855479+00'),
('20210225A',	'Add Relations Sort Field',	'2024-11-06 13:57:24.868193+00'),
('20210304A',	'Remove Locked Fields',	'2024-11-06 13:57:24.875746+00'),
('20210312A',	'Webhooks Collections Text',	'2024-11-06 13:57:24.887558+00'),
('20210331A',	'Add Refresh Interval',	'2024-11-06 13:57:24.893659+00'),
('20210415A',	'Make Filesize Nullable',	'2024-11-06 13:57:24.90714+00'),
('20210416A',	'Add Collections Accountability',	'2024-11-06 13:57:24.916549+00'),
('20210422A',	'Remove Files Interface',	'2024-11-06 13:57:24.922475+00'),
('20210506A',	'Rename Interfaces',	'2024-11-06 13:57:24.964594+00'),
('20210510A',	'Restructure Relations',	'2024-11-06 13:57:24.99413+00'),
('20210518A',	'Add Foreign Key Constraints',	'2024-11-06 13:57:25.01142+00'),
('20210519A',	'Add System Fk Triggers',	'2024-11-06 13:57:25.06614+00'),
('20210521A',	'Add Collections Icon Color',	'2024-11-06 13:57:25.072164+00'),
('20210525A',	'Add Insights',	'2024-11-06 13:57:25.095156+00'),
('20210608A',	'Add Deep Clone Config',	'2024-11-06 13:57:25.101143+00'),
('20210626A',	'Change Filesize Bigint',	'2024-11-06 13:57:25.118847+00'),
('20210716A',	'Add Conditions to Fields',	'2024-11-06 13:57:25.126333+00'),
('20210721A',	'Add Default Folder',	'2024-11-06 13:57:25.137785+00'),
('20210802A',	'Replace Groups',	'2024-11-06 13:57:25.146646+00'),
('20210803A',	'Add Required to Fields',	'2024-11-06 13:57:25.152635+00'),
('20210805A',	'Update Groups',	'2024-11-06 13:57:25.160538+00'),
('20210805B',	'Change Image Metadata Structure',	'2024-11-06 13:57:25.168582+00'),
('20210811A',	'Add Geometry Config',	'2024-11-06 13:57:25.174968+00'),
('20210831A',	'Remove Limit Column',	'2024-11-06 13:57:25.188306+00'),
('20210903A',	'Add Auth Provider',	'2024-11-06 13:57:25.24152+00'),
('20210907A',	'Webhooks Collections Not Null',	'2024-11-06 13:57:25.273166+00'),
('20210910A',	'Move Module Setup',	'2024-11-06 13:57:25.285177+00'),
('20210920A',	'Webhooks URL Not Null',	'2024-11-06 13:57:25.308803+00'),
('20210924A',	'Add Collection Organization',	'2024-11-06 13:57:25.331923+00'),
('20210927A',	'Replace Fields Group',	'2024-11-06 13:57:25.359816+00'),
('20210927B',	'Replace M2M Interface',	'2024-11-06 13:57:25.369902+00'),
('20210929A',	'Rename Login Action',	'2024-11-06 13:57:25.387509+00'),
('20211007A',	'Update Presets',	'2024-11-06 13:57:25.424489+00'),
('20211009A',	'Add Auth Data',	'2024-11-06 13:57:25.452793+00'),
('20211016A',	'Add Webhook Headers',	'2024-11-06 13:57:25.47795+00'),
('20211103A',	'Set Unique to User Token',	'2024-11-06 13:57:25.492549+00'),
('20211103B',	'Update Special Geometry',	'2024-11-06 13:57:25.510149+00'),
('20211104A',	'Remove Collections Listing',	'2024-11-06 13:57:25.532577+00'),
('20211118A',	'Add Notifications',	'2024-11-06 13:57:25.573848+00'),
('20211211A',	'Add Shares',	'2024-11-06 13:57:25.620454+00'),
('20211230A',	'Add Project Descriptor',	'2024-11-06 13:57:25.638469+00'),
('20220303A',	'Remove Default Project Color',	'2024-11-06 13:57:25.665224+00'),
('20220308A',	'Add Bookmark Icon and Color',	'2024-11-06 13:57:25.674752+00'),
('20220314A',	'Add Translation Strings',	'2024-11-06 13:57:25.683507+00'),
('20220322A',	'Rename Field Typecast Flags',	'2024-11-06 13:57:25.695092+00'),
('20220323A',	'Add Field Validation',	'2024-11-06 13:57:25.705396+00'),
('20220325A',	'Fix Typecast Flags',	'2024-11-06 13:57:25.720902+00'),
('20220325B',	'Add Default Language',	'2024-11-06 13:57:25.748591+00'),
('20220402A',	'Remove Default Value Panel Icon',	'2024-11-06 13:57:25.765004+00'),
('20220429A',	'Add Flows',	'2024-11-06 13:57:25.819402+00'),
('20220429B',	'Add Color to Insights Icon',	'2024-11-06 13:57:25.826103+00'),
('20220429C',	'Drop Non Null From IP of Activity',	'2024-11-06 13:57:25.838049+00'),
('20220429D',	'Drop Non Null From Sender of Notifications',	'2024-11-06 13:57:25.848376+00'),
('20220614A',	'Rename Hook Trigger to Event',	'2024-11-06 13:57:25.853016+00'),
('20220801A',	'Update Notifications Timestamp Column',	'2024-11-06 13:57:25.869903+00'),
('20220802A',	'Add Custom Aspect Ratios',	'2024-11-06 13:57:25.877558+00'),
('20220826A',	'Add Origin to Accountability',	'2024-11-06 13:57:25.895853+00'),
('20230401A',	'Update Material Icons',	'2024-11-06 13:57:25.925+00'),
('20230525A',	'Add Preview Settings',	'2024-11-06 13:57:25.933286+00'),
('20230526A',	'Migrate Translation Strings',	'2024-11-06 13:57:25.961335+00'),
('20230721A',	'Require Shares Fields',	'2024-11-06 13:57:25.976281+00'),
('20230823A',	'Add Content Versioning',	'2024-11-06 13:57:26.012285+00'),
('20230927A',	'Themes',	'2024-11-06 13:57:26.049867+00'),
('20231009A',	'Update CSV Fields to Text',	'2024-11-06 13:57:26.062374+00'),
('20231009B',	'Update Panel Options',	'2024-11-06 13:57:26.071379+00'),
('20231010A',	'Add Extensions',	'2024-11-06 13:57:26.089966+00'),
('20231215A',	'Add Focalpoints',	'2024-11-06 13:57:26.098286+00'),
('20240122A',	'Add Report URL Fields',	'2024-11-06 13:57:26.106814+00'),
('20240204A',	'Marketplace',	'2024-11-06 13:57:26.166736+00'),
('20240305A',	'Change Useragent Type',	'2024-11-06 13:57:26.193737+00'),
('20240311A',	'Deprecate Webhooks',	'2024-11-06 13:57:26.217459+00'),
('20240422A',	'Public Registration',	'2024-11-06 13:57:26.227973+00'),
('20240515A',	'Add Session Window',	'2024-11-06 13:57:26.236106+00'),
('20240701A',	'Add Tus Data',	'2024-11-06 13:57:26.272383+00'),
('20240716A',	'Update Files Date Fields',	'2024-11-06 13:57:26.299218+00'),
('20240806A',	'Permissions Policies',	'2024-11-06 13:57:26.430082+00'),
('20240817A',	'Update Icon Fields Length',	'2024-11-06 13:57:26.517378+00'),
('20240909A',	'Separate Comments',	'2024-11-06 13:57:26.549657+00'),
('20240909B',	'Consolidate Content Versioning',	'2024-11-06 13:57:26.564769+00');

CREATE SEQUENCE directus_notifications_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."directus_notifications" (
    "id" integer DEFAULT nextval('directus_notifications_id_seq') NOT NULL,
    "timestamp" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "status" character varying(255) DEFAULT 'inbox',
    "recipient" uuid NOT NULL,
    "sender" uuid,
    "subject" character varying(255) NOT NULL,
    "message" text,
    "collection" character varying(64),
    "item" character varying(255),
    CONSTRAINT "directus_notifications_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE TABLE "public"."directus_operations" (
    "id" uuid NOT NULL,
    "name" character varying(255),
    "key" character varying(255) NOT NULL,
    "type" character varying(255) NOT NULL,
    "position_x" integer NOT NULL,
    "position_y" integer NOT NULL,
    "options" json,
    "resolve" uuid,
    "reject" uuid,
    "flow" uuid NOT NULL,
    "date_created" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "user_created" uuid,
    CONSTRAINT "directus_operations_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "directus_operations_reject_unique" UNIQUE ("reject"),
    CONSTRAINT "directus_operations_resolve_unique" UNIQUE ("resolve")
) WITH (oids = false);


CREATE TABLE "public"."directus_panels" (
    "id" uuid NOT NULL,
    "dashboard" uuid NOT NULL,
    "name" character varying(255),
    "icon" character varying(64),
    "color" character varying(10),
    "show_header" boolean DEFAULT false NOT NULL,
    "note" text,
    "type" character varying(255) NOT NULL,
    "position_x" integer NOT NULL,
    "position_y" integer NOT NULL,
    "width" integer NOT NULL,
    "height" integer NOT NULL,
    "options" json,
    "date_created" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "user_created" uuid,
    CONSTRAINT "directus_panels_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE SEQUENCE directus_permissions_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."directus_permissions" (
    "id" integer DEFAULT nextval('directus_permissions_id_seq') NOT NULL,
    "collection" character varying(64) NOT NULL,
    "action" character varying(10) NOT NULL,
    "permissions" json,
    "validation" json,
    "presets" json,
    "fields" text,
    "policy" uuid NOT NULL,
    CONSTRAINT "directus_permissions_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE TABLE "public"."directus_policies" (
    "id" uuid NOT NULL,
    "name" character varying(100) NOT NULL,
    "icon" character varying(64) DEFAULT 'badge' NOT NULL,
    "description" text,
    "ip_access" text,
    "enforce_tfa" boolean DEFAULT false NOT NULL,
    "admin_access" boolean DEFAULT false NOT NULL,
    "app_access" boolean DEFAULT false NOT NULL,
    CONSTRAINT "directus_policies_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "directus_policies" ("id", "name", "icon", "description", "ip_access", "enforce_tfa", "admin_access", "app_access") VALUES
('abf8a154-5b1c-4a46-ac9c-7300570f4f17',	'$t:public_label',	'public',	'$t:public_description',	NULL,	'f',	'f',	'f'),
('56005a1e-6400-444e-a9cf-7b23dae4ad5f',	'Administrator',	'verified',	'$t:admin_description',	NULL,	'f',	't',	't');

CREATE SEQUENCE directus_presets_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."directus_presets" (
    "id" integer DEFAULT nextval('directus_presets_id_seq') NOT NULL,
    "bookmark" character varying(255),
    "user" uuid,
    "role" uuid,
    "collection" character varying(64),
    "search" character varying(100),
    "layout" character varying(100) DEFAULT 'tabular',
    "layout_query" json,
    "layout_options" json,
    "refresh_interval" integer,
    "filter" json,
    "icon" character varying(64) DEFAULT 'bookmark',
    "color" character varying(255),
    CONSTRAINT "directus_presets_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE SEQUENCE directus_relations_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."directus_relations" (
    "id" integer DEFAULT nextval('directus_relations_id_seq') NOT NULL,
    "many_collection" character varying(64) NOT NULL,
    "many_field" character varying(64) NOT NULL,
    "one_collection" character varying(64),
    "one_field" character varying(64),
    "one_collection_field" character varying(64),
    "one_allowed_collections" text,
    "junction_field" character varying(64),
    "sort_field" character varying(64),
    "one_deselect_action" character varying(255) DEFAULT 'nullify' NOT NULL,
    CONSTRAINT "directus_relations_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE SEQUENCE directus_revisions_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 5 CACHE 1;

CREATE TABLE "public"."directus_revisions" (
    "id" integer DEFAULT nextval('directus_revisions_id_seq') NOT NULL,
    "activity" integer NOT NULL,
    "collection" character varying(64) NOT NULL,
    "item" character varying(255) NOT NULL,
    "data" json,
    "delta" json,
    "parent" integer,
    "version" uuid,
    CONSTRAINT "directus_revisions_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "directus_revisions" ("id", "activity", "collection", "item", "data", "delta", "parent", "version") VALUES
(2,	3,	'directus_users',	'784f4dc7-2b78-465b-930c-7db965492a69',	'{"first_name":"Ray","last_name":"Act","email":"ray.act@enloused.com","password":"**********","role":{"name":"Staff","icon":"stars","description":"Team''s members"}}',	'{"first_name":"Ray","last_name":"Act","email":"ray.act@enloused.com","password":"**********","role":{"name":"Staff","icon":"stars","description":"Team''s members"}}',	NULL,	NULL),
(1,	2,	'directus_roles',	'a5f71f1c-36b8-4241-a4fe-d39c1d424446',	'{"name":"Staff","icon":"stars","description":"Team''s members"}',	'{"name":"Staff","icon":"stars","description":"Team''s members"}',	2,	NULL),
(3,	4,	'directus_users',	'921874fa-57d2-46bf-82e7-dca1e4a18e00',	'{"first_name":"Dave","last_name":"Lopper","email":"dave.lopper@enloused.com","password":"**********","role":"a5f71f1c-36b8-4241-a4fe-d39c1d424446"}',	'{"first_name":"Dave","last_name":"Lopper","email":"dave.lopper@enloused.com","password":"**********","role":"a5f71f1c-36b8-4241-a4fe-d39c1d424446"}',	NULL,	NULL),
(4,	5,	'directus_users',	'2aed51b6-9ec1-4304-a7c0-fc9365eddb20',	'{"first_name":"Maude","last_name":"Élisation","email":"maude.elisation@enloused.com","password":"**********","role":"a5f71f1c-36b8-4241-a4fe-d39c1d424446"}',	'{"first_name":"Maude","last_name":"Élisation","email":"maude.elisation@enloused.com","password":"**********","role":"a5f71f1c-36b8-4241-a4fe-d39c1d424446"}',	NULL,	NULL),
(5,	6,	'directus_users',	'd7c70400-e666-4132-aa4c-ee75a69e82a5',	'{"first_name":"Jay","last_name":"Son","email":"jay.son@enloused.com","password":"**********","role":"a5f71f1c-36b8-4241-a4fe-d39c1d424446"}',	'{"first_name":"Jay","last_name":"Son","email":"jay.son@enloused.com","password":"**********","role":"a5f71f1c-36b8-4241-a4fe-d39c1d424446"}',	NULL,	NULL);

CREATE TABLE "public"."directus_roles" (
    "id" uuid NOT NULL,
    "name" character varying(100) NOT NULL,
    "icon" character varying(64) DEFAULT 'supervised_user_circle' NOT NULL,
    "description" text,
    "parent" uuid,
    CONSTRAINT "directus_roles_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "directus_roles" ("id", "name", "icon", "description", "parent") VALUES
('833d5806-dad3-42e0-8323-fc0bf3c7af15',	'Administrator',	'verified',	'$t:admin_description',	NULL),
('a5f71f1c-36b8-4241-a4fe-d39c1d424446',	'Staff',	'stars',	'Team''s members',	NULL);

CREATE TABLE "public"."directus_sessions" (
    "token" character varying(64) NOT NULL,
    "user" uuid,
    "expires" timestamptz NOT NULL,
    "ip" character varying(255),
    "user_agent" text,
    "share" uuid,
    "origin" character varying(255),
    "next_token" character varying(64),
    CONSTRAINT "directus_sessions_pkey" PRIMARY KEY ("token")
) WITH (oids = false);

INSERT INTO "directus_sessions" ("token", "user", "expires", "ip", "user_agent", "share", "origin", "next_token") VALUES
('NZlsw17yoKCnIZZgMC3n0DqmqZ2ftASQQ1EUVK9CIPt7WOgIT-0XldeZ5C2NJ4dP',	'baedcabe-36e4-4c18-b7f0-fd595bd0919f',	'2024-11-13 13:58:22.473+00',	'172.19.0.1',	'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:132.0) Gecko/20100101 Firefox/132.0',	NULL,	'http://localhost:8055',	NULL);

CREATE SEQUENCE directus_settings_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."directus_settings" (
    "id" integer DEFAULT nextval('directus_settings_id_seq') NOT NULL,
    "project_name" character varying(100) DEFAULT 'Directus' NOT NULL,
    "project_url" character varying(255),
    "project_color" character varying(255) DEFAULT '#6644FF' NOT NULL,
    "project_logo" uuid,
    "public_foreground" uuid,
    "public_background" uuid,
    "public_note" text,
    "auth_login_attempts" integer DEFAULT '25',
    "auth_password_policy" character varying(100),
    "storage_asset_transform" character varying(7) DEFAULT 'all',
    "storage_asset_presets" json,
    "custom_css" text,
    "storage_default_folder" uuid,
    "basemaps" json,
    "mapbox_key" character varying(255),
    "module_bar" json,
    "project_descriptor" character varying(100),
    "default_language" character varying(255) DEFAULT 'en-US' NOT NULL,
    "custom_aspect_ratios" json,
    "public_favicon" uuid,
    "default_appearance" character varying(255) DEFAULT 'auto' NOT NULL,
    "default_theme_light" character varying(255),
    "theme_light_overrides" json,
    "default_theme_dark" character varying(255),
    "theme_dark_overrides" json,
    "report_error_url" character varying(255),
    "report_bug_url" character varying(255),
    "report_feature_url" character varying(255),
    "public_registration" boolean DEFAULT false NOT NULL,
    "public_registration_verify_email" boolean DEFAULT true NOT NULL,
    "public_registration_role" uuid,
    "public_registration_email_filter" json,
    CONSTRAINT "directus_settings_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE TABLE "public"."directus_shares" (
    "id" uuid NOT NULL,
    "name" character varying(255),
    "collection" character varying(64) NOT NULL,
    "item" character varying(255) NOT NULL,
    "role" uuid,
    "password" character varying(255),
    "user_created" uuid,
    "date_created" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "date_start" timestamptz,
    "date_end" timestamptz,
    "times_used" integer DEFAULT '0',
    "max_uses" integer,
    CONSTRAINT "directus_shares_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE TABLE "public"."directus_translations" (
    "id" uuid NOT NULL,
    "language" character varying(255) NOT NULL,
    "key" character varying(255) NOT NULL,
    "value" text NOT NULL,
    CONSTRAINT "directus_translations_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE TABLE "public"."directus_users" (
    "id" uuid NOT NULL,
    "first_name" character varying(50),
    "last_name" character varying(50),
    "email" character varying(128),
    "password" character varying(255),
    "location" character varying(255),
    "title" character varying(50),
    "description" text,
    "tags" json,
    "avatar" uuid,
    "language" character varying(255),
    "tfa_secret" character varying(255),
    "status" character varying(16) DEFAULT 'active' NOT NULL,
    "role" uuid,
    "token" character varying(255),
    "last_access" timestamptz,
    "last_page" character varying(255),
    "provider" character varying(128) DEFAULT 'default' NOT NULL,
    "external_identifier" character varying(255),
    "auth_data" json,
    "email_notifications" boolean DEFAULT true,
    "appearance" character varying(255),
    "theme_dark" character varying(255),
    "theme_light" character varying(255),
    "theme_light_overrides" json,
    "theme_dark_overrides" json,
    CONSTRAINT "directus_users_email_unique" UNIQUE ("email"),
    CONSTRAINT "directus_users_external_identifier_unique" UNIQUE ("external_identifier"),
    CONSTRAINT "directus_users_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "directus_users_token_unique" UNIQUE ("token")
) WITH (oids = false);

INSERT INTO "directus_users" ("id", "first_name", "last_name", "email", "password", "location", "title", "description", "tags", "avatar", "language", "tfa_secret", "status", "role", "token", "last_access", "last_page", "provider", "external_identifier", "auth_data", "email_notifications", "appearance", "theme_dark", "theme_light", "theme_light_overrides", "theme_dark_overrides") VALUES
('784f4dc7-2b78-465b-930c-7db965492a69',	'Ray',	'Act',	'ray.act@enloused.com',	'$argon2id$v=19$m=65536,t=3,p=4$9CNaUkxQWynnqnDEiJPl5A$LVSRE8PkXMx5AihQ85H/8Z+/41VLQ7MGBtvjQ+Qrz9U',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'active',	'a5f71f1c-36b8-4241-a4fe-d39c1d424446',	NULL,	NULL,	NULL,	'default',	NULL,	NULL,	't',	NULL,	NULL,	NULL,	NULL,	NULL),
('921874fa-57d2-46bf-82e7-dca1e4a18e00',	'Dave',	'Lopper',	'dave.lopper@enloused.com',	'$argon2id$v=19$m=65536,t=3,p=4$5iItMQ1ZbrvVGrzJYwv4YA$LQYZOKnrZIHAaOCsatX9hBjA9JhPbElKWQ5HXt7SJOw',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'active',	'a5f71f1c-36b8-4241-a4fe-d39c1d424446',	NULL,	NULL,	NULL,	'default',	NULL,	NULL,	't',	NULL,	NULL,	NULL,	NULL,	NULL),
('2aed51b6-9ec1-4304-a7c0-fc9365eddb20',	'Maude',	'Élisation',	'maude.elisation@enloused.com',	'$argon2id$v=19$m=65536,t=3,p=4$4vGcfACFcAeOBx7x1BPqqQ$1aA0Qxekz+bT64H4AI/1weuk/orsIZXvwnjOnWtYhII',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'active',	'a5f71f1c-36b8-4241-a4fe-d39c1d424446',	NULL,	NULL,	NULL,	'default',	NULL,	NULL,	't',	NULL,	NULL,	NULL,	NULL,	NULL),
('d7c70400-e666-4132-aa4c-ee75a69e82a5',	'Jay',	'Son',	'jay.son@enloused.com',	'$argon2id$v=19$m=65536,t=3,p=4$ziw02BSmamkKCfK+uDJ17Q$CbDpEL877+22ekmmpvcMRA/iem9mtwPuPseNdThhCyk',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'active',	'a5f71f1c-36b8-4241-a4fe-d39c1d424446',	NULL,	NULL,	NULL,	'default',	NULL,	NULL,	't',	NULL,	NULL,	NULL,	NULL,	NULL),
('baedcabe-36e4-4c18-b7f0-fd595bd0919f',	'Admin',	'User',	'admin@enloused.com',	'$argon2id$v=19$m=65536,t=3,p=4$VUTmYqzTON/nwyeS1Lbllg$xoo/top0QAd8fVCwww5/YiXZwvyqqjeou9upIfs5fss',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'active',	'833d5806-dad3-42e0-8323-fc0bf3c7af15',	NULL,	'2024-11-06 13:58:22.509+00',	'/users',	'default',	NULL,	NULL,	't',	NULL,	NULL,	NULL,	NULL,	NULL);

CREATE TABLE "public"."directus_versions" (
    "id" uuid NOT NULL,
    "key" character varying(64) NOT NULL,
    "name" character varying(255),
    "collection" character varying(64) NOT NULL,
    "item" character varying(255) NOT NULL,
    "hash" character varying(255),
    "date_created" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "date_updated" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "user_created" uuid,
    "user_updated" uuid,
    "delta" json,
    CONSTRAINT "directus_versions_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE SEQUENCE directus_webhooks_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."directus_webhooks" (
    "id" integer DEFAULT nextval('directus_webhooks_id_seq') NOT NULL,
    "name" character varying(255) NOT NULL,
    "method" character varying(10) DEFAULT 'POST' NOT NULL,
    "url" character varying(255) NOT NULL,
    "status" character varying(10) DEFAULT 'active' NOT NULL,
    "data" boolean DEFAULT true NOT NULL,
    "actions" character varying(100) NOT NULL,
    "collections" character varying(255) NOT NULL,
    "headers" json,
    "was_active_before_deprecation" boolean DEFAULT false NOT NULL,
    "migrated_flow" uuid,
    CONSTRAINT "directus_webhooks_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


ALTER TABLE ONLY "public"."directus_access" ADD CONSTRAINT "directus_access_policy_foreign" FOREIGN KEY (policy) REFERENCES directus_policies(id) ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_access" ADD CONSTRAINT "directus_access_role_foreign" FOREIGN KEY (role) REFERENCES directus_roles(id) ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_access" ADD CONSTRAINT "directus_access_user_foreign" FOREIGN KEY ("user") REFERENCES directus_users(id) ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."directus_collections" ADD CONSTRAINT "directus_collections_group_foreign" FOREIGN KEY ("group") REFERENCES directus_collections(collection) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."directus_comments" ADD CONSTRAINT "directus_comments_collection_foreign" FOREIGN KEY (collection) REFERENCES directus_collections(collection) ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_comments" ADD CONSTRAINT "directus_comments_user_created_foreign" FOREIGN KEY (user_created) REFERENCES directus_users(id) ON DELETE SET NULL NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_comments" ADD CONSTRAINT "directus_comments_user_updated_foreign" FOREIGN KEY (user_updated) REFERENCES directus_users(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."directus_dashboards" ADD CONSTRAINT "directus_dashboards_user_created_foreign" FOREIGN KEY (user_created) REFERENCES directus_users(id) ON DELETE SET NULL NOT DEFERRABLE;

ALTER TABLE ONLY "public"."directus_files" ADD CONSTRAINT "directus_files_folder_foreign" FOREIGN KEY (folder) REFERENCES directus_folders(id) ON DELETE SET NULL NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_files" ADD CONSTRAINT "directus_files_modified_by_foreign" FOREIGN KEY (modified_by) REFERENCES directus_users(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_files" ADD CONSTRAINT "directus_files_uploaded_by_foreign" FOREIGN KEY (uploaded_by) REFERENCES directus_users(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."directus_flows" ADD CONSTRAINT "directus_flows_user_created_foreign" FOREIGN KEY (user_created) REFERENCES directus_users(id) ON DELETE SET NULL NOT DEFERRABLE;

ALTER TABLE ONLY "public"."directus_folders" ADD CONSTRAINT "directus_folders_parent_foreign" FOREIGN KEY (parent) REFERENCES directus_folders(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."directus_notifications" ADD CONSTRAINT "directus_notifications_recipient_foreign" FOREIGN KEY (recipient) REFERENCES directus_users(id) ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_notifications" ADD CONSTRAINT "directus_notifications_sender_foreign" FOREIGN KEY (sender) REFERENCES directus_users(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."directus_operations" ADD CONSTRAINT "directus_operations_flow_foreign" FOREIGN KEY (flow) REFERENCES directus_flows(id) ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_operations" ADD CONSTRAINT "directus_operations_reject_foreign" FOREIGN KEY (reject) REFERENCES directus_operations(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_operations" ADD CONSTRAINT "directus_operations_resolve_foreign" FOREIGN KEY (resolve) REFERENCES directus_operations(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_operations" ADD CONSTRAINT "directus_operations_user_created_foreign" FOREIGN KEY (user_created) REFERENCES directus_users(id) ON DELETE SET NULL NOT DEFERRABLE;

ALTER TABLE ONLY "public"."directus_panels" ADD CONSTRAINT "directus_panels_dashboard_foreign" FOREIGN KEY (dashboard) REFERENCES directus_dashboards(id) ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_panels" ADD CONSTRAINT "directus_panels_user_created_foreign" FOREIGN KEY (user_created) REFERENCES directus_users(id) ON DELETE SET NULL NOT DEFERRABLE;

ALTER TABLE ONLY "public"."directus_permissions" ADD CONSTRAINT "directus_permissions_policy_foreign" FOREIGN KEY (policy) REFERENCES directus_policies(id) ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."directus_presets" ADD CONSTRAINT "directus_presets_role_foreign" FOREIGN KEY (role) REFERENCES directus_roles(id) ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_presets" ADD CONSTRAINT "directus_presets_user_foreign" FOREIGN KEY ("user") REFERENCES directus_users(id) ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."directus_revisions" ADD CONSTRAINT "directus_revisions_activity_foreign" FOREIGN KEY (activity) REFERENCES directus_activity(id) ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_revisions" ADD CONSTRAINT "directus_revisions_parent_foreign" FOREIGN KEY (parent) REFERENCES directus_revisions(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_revisions" ADD CONSTRAINT "directus_revisions_version_foreign" FOREIGN KEY (version) REFERENCES directus_versions(id) ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."directus_roles" ADD CONSTRAINT "directus_roles_parent_foreign" FOREIGN KEY (parent) REFERENCES directus_roles(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."directus_sessions" ADD CONSTRAINT "directus_sessions_share_foreign" FOREIGN KEY (share) REFERENCES directus_shares(id) ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_sessions" ADD CONSTRAINT "directus_sessions_user_foreign" FOREIGN KEY ("user") REFERENCES directus_users(id) ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."directus_settings" ADD CONSTRAINT "directus_settings_project_logo_foreign" FOREIGN KEY (project_logo) REFERENCES directus_files(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_settings" ADD CONSTRAINT "directus_settings_public_background_foreign" FOREIGN KEY (public_background) REFERENCES directus_files(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_settings" ADD CONSTRAINT "directus_settings_public_favicon_foreign" FOREIGN KEY (public_favicon) REFERENCES directus_files(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_settings" ADD CONSTRAINT "directus_settings_public_foreground_foreign" FOREIGN KEY (public_foreground) REFERENCES directus_files(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_settings" ADD CONSTRAINT "directus_settings_public_registration_role_foreign" FOREIGN KEY (public_registration_role) REFERENCES directus_roles(id) ON DELETE SET NULL NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_settings" ADD CONSTRAINT "directus_settings_storage_default_folder_foreign" FOREIGN KEY (storage_default_folder) REFERENCES directus_folders(id) ON DELETE SET NULL NOT DEFERRABLE;

ALTER TABLE ONLY "public"."directus_shares" ADD CONSTRAINT "directus_shares_collection_foreign" FOREIGN KEY (collection) REFERENCES directus_collections(collection) ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_shares" ADD CONSTRAINT "directus_shares_role_foreign" FOREIGN KEY (role) REFERENCES directus_roles(id) ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_shares" ADD CONSTRAINT "directus_shares_user_created_foreign" FOREIGN KEY (user_created) REFERENCES directus_users(id) ON DELETE SET NULL NOT DEFERRABLE;

ALTER TABLE ONLY "public"."directus_users" ADD CONSTRAINT "directus_users_role_foreign" FOREIGN KEY (role) REFERENCES directus_roles(id) ON DELETE SET NULL NOT DEFERRABLE;

ALTER TABLE ONLY "public"."directus_versions" ADD CONSTRAINT "directus_versions_collection_foreign" FOREIGN KEY (collection) REFERENCES directus_collections(collection) ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_versions" ADD CONSTRAINT "directus_versions_user_created_foreign" FOREIGN KEY (user_created) REFERENCES directus_users(id) ON DELETE SET NULL NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_versions" ADD CONSTRAINT "directus_versions_user_updated_foreign" FOREIGN KEY (user_updated) REFERENCES directus_users(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."directus_webhooks" ADD CONSTRAINT "directus_webhooks_migrated_flow_foreign" FOREIGN KEY (migrated_flow) REFERENCES directus_flows(id) ON DELETE SET NULL NOT DEFERRABLE;

-- 2024-11-06 14:15:13.518241+00
