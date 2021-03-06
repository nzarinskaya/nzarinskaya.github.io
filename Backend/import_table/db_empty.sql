PGDMP                     
    y            website_advertising    11.13    11.13                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                       1262    40961    website_advertising    DATABASE     ?   CREATE DATABASE website_advertising WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
 #   DROP DATABASE website_advertising;
             postgres    false            ?            1259    40989 
   categories    TABLE     ?   CREATE TABLE public.categories (
    id integer NOT NULL,
    title character varying(255),
    picture character varying(100),
    slug character varying(100)
);
    DROP TABLE public.categories;
       public         postgres    false            ?            1259    40994    category_offer    TABLE     h   CREATE TABLE public.category_offer (
    category_id integer NOT NULL,
    offer_id integer NOT NULL
);
 "   DROP TABLE public.category_offer;
       public         postgres    false            ?            1259    41009    comments    TABLE     ?   CREATE TABLE public.comments (
    id integer NOT NULL,
    created_at timestamp with time zone,
    user_id integer,
    offer_id integer,
    comment_text character varying(100)
);
    DROP TABLE public.comments;
       public         postgres    false            ?            1259    40976    offers    TABLE       CREATE TABLE public.offers (
    id integer NOT NULL,
    created_at timestamp with time zone,
    offer_type character varying,
    title character varying,
    full_text character varying,
    price numeric,
    picture character varying(100),
    user_id integer
);
    DROP TABLE public.offers;
       public         postgres    false            ?            1259    40968    users    TABLE       CREATE TABLE public.users (
    id integer NOT NULL,
    created_at timestamp with time zone,
    first_name character varying(255),
    last_name character varying(255),
    password_hash character varying(255),
    email character varying(100),
    avatar character varying(100)
);
    DROP TABLE public.users;
       public         postgres    false                      0    40989 
   categories 
   TABLE DATA               >   COPY public.categories (id, title, picture, slug) FROM stdin;
    public       postgres    false    198   X                 0    40994    category_offer 
   TABLE DATA               ?   COPY public.category_offer (category_id, offer_id) FROM stdin;
    public       postgres    false    199   u                 0    41009    comments 
   TABLE DATA               S   COPY public.comments (id, created_at, user_id, offer_id, comment_text) FROM stdin;
    public       postgres    false    200   ?                 0    40976    offers 
   TABLE DATA               g   COPY public.offers (id, created_at, offer_type, title, full_text, price, picture, user_id) FROM stdin;
    public       postgres    false    197   ?                 0    40968    users 
   TABLE DATA               d   COPY public.users (id, created_at, first_name, last_name, password_hash, email, avatar) FROM stdin;
    public       postgres    false    196   ?       ?
           2606    40993    categories categories_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public         postgres    false    198            ?
           2606    40998 "   category_offer category_offer_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.category_offer
    ADD CONSTRAINT category_offer_pkey PRIMARY KEY (category_id, offer_id);
 L   ALTER TABLE ONLY public.category_offer DROP CONSTRAINT category_offer_pkey;
       public         postgres    false    199    199            ?
           2606    41013    comments comments_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_pkey;
       public         postgres    false    200            ?
           2606    40983    offers offers_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.offers
    ADD CONSTRAINT offers_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.offers DROP CONSTRAINT offers_pkey;
       public         postgres    false    197            ?
           2606    40975    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         postgres    false    196            ?
           2606    40999 .   category_offer category_offer_category_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.category_offer
    ADD CONSTRAINT category_offer_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id);
 X   ALTER TABLE ONLY public.category_offer DROP CONSTRAINT category_offer_category_id_fkey;
       public       postgres    false    2706    199    198            ?
           2606    41004 +   category_offer category_offer_offer_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.category_offer
    ADD CONSTRAINT category_offer_offer_id_fkey FOREIGN KEY (offer_id) REFERENCES public.offers(id);
 U   ALTER TABLE ONLY public.category_offer DROP CONSTRAINT category_offer_offer_id_fkey;
       public       postgres    false    199    197    2704            ?
           2606    41019    comments comments_offer_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_offer_id_fkey FOREIGN KEY (offer_id) REFERENCES public.offers(id);
 I   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_offer_id_fkey;
       public       postgres    false    200    2704    197            ?
           2606    41014    comments comments_user_id_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 H   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_user_id_fkey;
       public       postgres    false    2702    200    196            ?
           2606    40984    offers offers_user_id_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY public.offers
    ADD CONSTRAINT offers_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 D   ALTER TABLE ONLY public.offers DROP CONSTRAINT offers_user_id_fkey;
       public       postgres    false    197    2702    196                  x?????? ? ?            x?????? ? ?            x?????? ? ?            x?????? ? ?            x?????? ? ?     