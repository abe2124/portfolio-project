PGDMP     8                    z            bug_tracker     14.5 (Ubuntu 14.5-1.pgdg20.04+1)     14.5 (Ubuntu 14.5-1.pgdg20.04+1)                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    25241    bug_tracker    DATABASE     `   CREATE DATABASE bug_tracker WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';
    DROP DATABASE bug_tracker;
                postgres    false            �            1259    25242    alembic_version    TABLE     X   CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);
 #   DROP TABLE public.alembic_version;
       public         heap    postgres    false            �            1259    25266    comments    TABLE     �   CREATE TABLE public.comments (
    id integer NOT NULL,
    user_id integer,
    issue_id integer,
    content character varying(120) NOT NULL
);
    DROP TABLE public.comments;
       public         heap    postgres    false            �            1259    25265    comments_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.comments_id_seq;
       public          postgres    false    215                       0    0    comments_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;
          public          postgres    false    214            �            1259    25248    issues    TABLE     �  CREATE TABLE public.issues (
    id integer NOT NULL,
    name character varying,
    descriprion character varying,
    category character varying(120),
    priority character varying(120),
    assignee character varying(120),
    due_date character varying,
    assigned_date character varying,
    solved_date character varying,
    created_at character varying,
    updated_at character varying
);
    DROP TABLE public.issues;
       public         heap    postgres    false            �            1259    25247    issues_id_seq    SEQUENCE     �   CREATE SEQUENCE public.issues_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.issues_id_seq;
       public          postgres    false    211                       0    0    issues_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.issues_id_seq OWNED BY public.issues.id;
          public          postgres    false    210            �            1259    25257    users    TABLE     �  CREATE TABLE public.users (
    id integer NOT NULL,
    full_name character varying,
    nik_name character varying(120),
    email character varying(120),
    address character varying(120),
    "position" character varying(120),
    role character varying(120),
    user_name character varying(120),
    password character varying,
    last_login character varying,
    created_at character varying,
    updated_at character varying
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    25256    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    213                       0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    212            t           2604    25269    comments id    DEFAULT     j   ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);
 :   ALTER TABLE public.comments ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            r           2604    25251 	   issues id    DEFAULT     f   ALTER TABLE ONLY public.issues ALTER COLUMN id SET DEFAULT nextval('public.issues_id_seq'::regclass);
 8   ALTER TABLE public.issues ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    211    211            s           2604    25260    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    212    213            
          0    25242    alembic_version 
   TABLE DATA           6   COPY public.alembic_version (version_num) FROM stdin;
    public          postgres    false    209   "                 0    25266    comments 
   TABLE DATA           B   COPY public.comments (id, user_id, issue_id, content) FROM stdin;
    public          postgres    false    215   8"                 0    25248    issues 
   TABLE DATA           �   COPY public.issues (id, name, descriprion, category, priority, assignee, due_date, assigned_date, solved_date, created_at, updated_at) FROM stdin;
    public          postgres    false    211   r"                 0    25257    users 
   TABLE DATA           �   COPY public.users (id, full_name, nik_name, email, address, "position", role, user_name, password, last_login, created_at, updated_at) FROM stdin;
    public          postgres    false    213   �"                  0    0    comments_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.comments_id_seq', 1, true);
          public          postgres    false    214                       0    0    issues_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.issues_id_seq', 1, true);
          public          postgres    false    210                       0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 2, true);
          public          postgres    false    212            v           2606    25246 #   alembic_version alembic_version_pkc 
   CONSTRAINT     j   ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);
 M   ALTER TABLE ONLY public.alembic_version DROP CONSTRAINT alembic_version_pkc;
       public            postgres    false    209            |           2606    25271    comments comments_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_pkey;
       public            postgres    false    215            x           2606    25255    issues issues_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.issues
    ADD CONSTRAINT issues_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.issues DROP CONSTRAINT issues_pkey;
       public            postgres    false    211            z           2606    25264    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    213            }           2606    25272    comments comments_issue_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_issue_id_fkey FOREIGN KEY (issue_id) REFERENCES public.issues(id);
 I   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_issue_id_fkey;
       public          postgres    false    3192    211    215            ~           2606    25277    comments comments_user_id_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 H   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_user_id_fkey;
       public          postgres    false    3194    215    213            
      x�KNLN420M�D�=... 2Ag         *   x�3�4��b����l���b����<��̊��=... ��
         O   x�3�,I-.Q�,..M3!��Ē����JΌ���?N###]S]Cs��̌�,�,L,������CȜ+F��� �b            x�e��� D���wA��$^��k/U7�����/W�e^�f�A�O�/�(���'Ns���{xԜ�R`z����HJ�x4�ȑ=YyqZ5ZA0��0@l����!e^��-�Aw�PK4���A���bs�9     