-- public.attachments definition

-- Drop table

-- DROP TABLE public.attachments;

CREATE TABLE public.attachments (

attachment_id serial4 NOT NULL,

created_at timestamp NOT NULL DEFAULT now(),

"postPostId" int4 NULL,

"commentCommentId" int4 NULL,

file_size int4 NULL,

file_url varchar(500) NOT NULL,

file_name varchar(255) NULL,

file_type varchar(50) NULL,

CONSTRAINT "PK_0f0c0f540cbf0f2e9499f9a082e" PRIMARY KEY (attachment_id)

);

-- public.attachments foreign keys

ALTER TABLE public.attachments ADD CONSTRAINT "FK_3b3b8411ccdacf51dc8e1300b3b" FOREIGN KEY ("commentCommentId") REFERENCES public."comments"(comment_id) ON DELETE CASCADE;

ALTER TABLE public.attachments ADD CONSTRAINT "FK_e1d07c69a20145b08acdebd0b1b" FOREIGN KEY ("postPostId") REFERENCES public.posts(post_id) ON DELETE CASCADE;

-- public."comments" definition

-- Drop table

-- DROP TABLE public."comments";

CREATE TABLE public."comments" (

comment_id serial4 NOT NULL,

"content" text NOT NULL,

created_at timestamp NOT NULL DEFAULT now(),

"postPostId" int4 NULL,

"userUserId" int4 NULL,

"parentCommentCommentId" int4 NULL,

CONSTRAINT "PK_eb0d76f2ca45d66a7de04c7c72b" PRIMARY KEY (comment_id)

);

-- public."comments" foreign keys

ALTER TABLE public."comments" ADD CONSTRAINT "FK_0ddfafc6ae13de3ae3e24b36dd4" FOREIGN KEY ("postPostId") REFERENCES public.posts(post_id);

ALTER TABLE public."comments" ADD CONSTRAINT "FK_1a1d776480039886645c32c0e15" FOREIGN KEY ("userUserId") REFERENCES public.users(user_id);

ALTER TABLE public."comments" ADD CONSTRAINT "FK_68d075d1b7f130d80906984ae3d" FOREIGN KEY ("parentCommentCommentId") REFERENCES public."comments"(comment_id);

-- public.department definition

-- Drop table

-- DROP TABLE public.department;

CREATE TABLE public.department (

	department_id serial4 NOT NULL,

	"name" varchar(100) NOT NULL,

	created_at timestamp NOT NULL DEFAULT now(),

	updated_at timestamp NOT NULL DEFAULT now(),

	CONSTRAINT "PK_28a598987c3302c0b4dfc71f868" PRIMARY KEY (department_id)

);

-- public.notifications definition

-- Drop table

-- DROP TABLE public.notifications;

CREATE TABLE public.notifications (

	notification_id serial4 NOT NULL,

	message varchar(255) NOT NULL,

	notification_type varchar(50) NOT NULL DEFAULT 'system_alert'::character varying,

	reference_type varchar(50) NULL,

	reference_id int8 NULL,

	extra_data json NULL,

	is_read bool NOT NULL DEFAULT false,

	priority public.notifications_priority_enum NOT NULL DEFAULT 'medium'::notifications_priority_enum,

	created_at timestamp NOT NULL DEFAULT now(),

	updated_at timestamp NOT NULL DEFAULT now(),

	"userUserId" int4 NULL,

	"senderUserId" int4 NULL,

	CONSTRAINT "PK_eaedfe19f0f765d26afafa85956" PRIMARY KEY (notification_id)

);

-- public.notifications foreign keys

ALTER TABLE public.notifications ADD CONSTRAINT "FK_531a507781db11f6f66b4e92a92" FOREIGN KEY ("senderUserId") REFERENCES public.users(user_id) ON DELETE CASCADE;

ALTER TABLE public.notifications ADD CONSTRAINT "FK_c5cc52b42fde832d730c437e40f" FOREIGN KEY ("userUserId") REFERENCES public.users(user_id) ON DELETE CASCADE;

-- public.posts definition

-- Drop table

-- DROP TABLE public.posts;

CREATE TABLE public.posts (

	post_id serial4 NOT NULL,

	title varchar NULL,

	"content" text NOT NULL,

	post_type varchar NULL,

	visibility_scope varchar NULL,

	created_at timestamp NOT NULL DEFAULT now(),

	updated_at timestamp NOT NULL DEFAULT now(),

	"userUserId" int4 NULL,

	CONSTRAINT "PK_e55cc433639d0e21c3dbf637bce" PRIMARY KEY (post_id)

);

-- public.posts foreign keys

ALTER TABLE public.posts ADD CONSTRAINT "FK_b4855b3fc6710c40dc4eef9cf96" FOREIGN KEY ("userUserId") REFERENCES public.users(user_id) ON DELETE CASCADE;

-- public.reactions definition

-- Drop table

-- DROP TABLE public.reactions;

CREATE TABLE public.reactions (

	reaction_id serial4 NOT NULL,

	reaction_type varchar NOT NULL,

	created_at timestamp NOT NULL DEFAULT now(),

	"postPostId" int4 NULL,

	"userUserId" int4 NULL,

	CONSTRAINT "PK_74284e58c3f69f9a643d2957a7f" PRIMARY KEY (reaction_id)

);

-- public.reactions foreign keys

ALTER TABLE public.reactions ADD CONSTRAINT "FK_a842eaf5a538b78f02c0ca796a2" FOREIGN KEY ("postPostId") REFERENCES public.posts(post_id);

ALTER TABLE public.reactions ADD CONSTRAINT "FK_c138db4dc2bb0f76bbed079461d" FOREIGN KEY ("userUserId") REFERENCES public.users(user_id);

-- public."role" definition

-- Drop table

-- DROP TABLE public."role";

CREATE TABLE public."role" (

	role_id serial4 NOT NULL,

	"name" varchar(100) NOT NULL,

	description varchar(255) NULL,

	created_at timestamp NOT NULL DEFAULT now(),

	updated_at timestamp NOT NULL DEFAULT now(),

	CONSTRAINT "PK_df46160e6aa79943b83c81e496e" PRIMARY KEY (role_id),

	CONSTRAINT "UQ_ae4578dcaed5adff96595e61660" UNIQUE (name)

);

-- public.team definition

-- Drop table

-- DROP TABLE public.team;

CREATE TABLE public.team (

	team_id serial4 NOT NULL,

	"name" varchar(100) NOT NULL,

	created_at timestamp NOT NULL DEFAULT now(),

	updated_at timestamp NOT NULL DEFAULT now(),

	"departmentDepartmentId" int4 NULL,

	"leadUserId" int4 NULL,

	CONSTRAINT "PK_a35a345d4436b82adf6bb76f3ce" PRIMARY KEY (team_id)

);

-- public.team foreign keys

ALTER TABLE public.team ADD CONSTRAINT "FK_5c5d2451a551a02f286dabf1644" FOREIGN KEY ("departmentDepartmentId") REFERENCES public.department(department_id) ON DELETE SET NULL;

ALTER TABLE public.team ADD CONSTRAINT "FK_b6066ea7e557d9287ae212fce56" FOREIGN KEY ("leadUserId") REFERENCES public.users(user_id) ON DELETE SET NULL;

-- public.team definition

-- Drop table

-- DROP TABLE public.team;

CREATE TABLE public.team (

	team_id serial4 NOT NULL,

	"name" varchar(100) NOT NULL,

	created_at timestamp NOT NULL DEFAULT now(),

	updated_at timestamp NOT NULL DEFAULT now(),

	"departmentDepartmentId" int4 NULL,

	"leadUserId" int4 NULL,

	CONSTRAINT "PK_a35a345d4436b82adf6bb76f3ce" PRIMARY KEY (team_id)

);

-- public.team foreign keys

ALTER TABLE public.team ADD CONSTRAINT "FK_5c5d2451a551a02f286dabf1644" FOREIGN KEY ("departmentDepartmentId") REFERENCES public.department(department_id) ON DELETE SET NULL;

ALTER TABLE public.team ADD CONSTRAINT "FK_b6066ea7e557d9287ae212fce56" FOREIGN KEY ("leadUserId") REFERENCES public.users(user_id) ON DELETE SET NULL;

-- public.user_role definition

-- Drop table

-- DROP TABLE public.user_role;

CREATE TABLE public.user_role (

	user_id int4 NOT NULL,

	role_id int4 NOT NULL,

	assigned_at timestamp NOT NULL DEFAULT now(),

	CONSTRAINT "PK_f634684acb47c1a158b83af5150" PRIMARY KEY (user_id, role_id)

);

CREATE INDEX "IDX_32a6fc2fcb019d8e3a8ace0f55" ON public.user_role USING btree (role_id);

CREATE INDEX "IDX_d0e5815877f7395a198a4cb0a4" ON public.user_role USING btree (user_id);

-- public.user_role foreign keys

ALTER TABLE public.user_role ADD CONSTRAINT "FK_32a6fc2fcb019d8e3a8ace0f55f" FOREIGN KEY (role_id) REFERENCES public."role"(role_id) ON DELETE CASCADE;

ALTER TABLE public.user_role ADD CONSTRAINT "FK_d0e5815877f7395a198a4cb0a46" FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;

-- public.user_team definition

-- Drop table

-- DROP TABLE public.user_team;

CREATE TABLE public.user_team (

	user_id int4 NOT NULL,

	team_id int4 NOT NULL,

	CONSTRAINT "PK_86121d56b6426f7da1f521e3c21" PRIMARY KEY (user_id, team_id)

);

-- public.user_team foreign keys

ALTER TABLE public.user_team ADD CONSTRAINT "FK_66f79a319649fbcc7d5bd1f6901" FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;

ALTER TABLE public.user_team ADD CONSTRAINT "FK_ab79684958e64041b68533a9343" FOREIGN KEY (team_id) REFERENCES public.team(team_id) ON DELETE CASCADE;

-- public.users definition

-- Drop table

-- DROP TABLE public.users;

CREATE TABLE public.users (

	user_id serial4 NOT NULL,

	email varchar(255) NOT NULL,

	"password" varchar(255) NOT NULL,

	first_name varchar(100) NOT NULL,

	last_name varchar(100) NOT NULL,

	office_id int4 NULL,

	status varchar(20) NOT NULL DEFAULT 'active'::character varying,

	profile_picture_url varchar(500) NULL,

	created_at timestamp NOT NULL DEFAULT now(),

	updated_at timestamp NOT NULL DEFAULT now(),

	CONSTRAINT "PK_96aac72f1574b88752e9fb00089" PRIMARY KEY (user_id),

	CONSTRAINT "UQ_97672ac88f789774dd47f7c8be3" UNIQUE (email)

);