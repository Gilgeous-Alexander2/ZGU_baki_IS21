PGDMP                         {         
   lab1 v 2.0    15.2    15.2 3    X           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            Y           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            Z           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            [           1262    49152 
   lab1 v 2.0    DATABASE     �   CREATE DATABASE "lab1 v 2.0" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "lab1 v 2.0";
                postgres    false            �            1259    49156    produser    TABLE     t   CREATE TABLE public.produser (
    id_produser integer NOT NULL,
    name character varying(64),
    inn integer
);
    DROP TABLE public.produser;
       public         heap    postgres    false            �            1259    49162    provider    TABLE     �   CREATE TABLE public.provider (
    id_provider integer NOT NULL,
    name character varying(64),
    inn integer,
    adress character varying(64)
);
    DROP TABLE public.provider;
       public         heap    postgres    false            �            1259    57352    allpro    MATERIALIZED VIEW     �   CREATE MATERIALIZED VIEW public.allpro AS
 SELECT produser.name
   FROM public.produser
UNION ALL
 SELECT provider.name
   FROM public.provider
  WITH NO DATA;
 &   DROP MATERIALIZED VIEW public.allpro;
       public         heap    postgres    false    214    216            �            1259    49172    drug    TABLE     �   CREATE TABLE public.drug (
    id_drug integer NOT NULL,
    name character varying(64),
    price integer NOT NULL,
    fk_producer_id integer,
    fk_provider_id integer,
    CONSTRAINT drug_price_check CHECK ((price > 0))
);
    DROP TABLE public.drug;
       public         heap    postgres    false            �            1259    49187    drug_on_recipe    TABLE     v   CREATE TABLE public.drug_on_recipe (
    id_recipe integer NOT NULL,
    numrecipe integer,
    fk_drug_id integer
);
 "   DROP TABLE public.drug_on_recipe;
       public         heap    postgres    false            �            1259    49182    personal    TABLE     �   CREATE TABLE public.personal (
    id_personal integer NOT NULL,
    firstname character varying(64) DEFAULT 'Иван'::character varying,
    secondname character varying(64) DEFAULT 'Иванов'::character varying,
    fk_post_id integer
);
    DROP TABLE public.personal;
       public         heap    postgres    false            �            1259    57344 	   onefamily    VIEW     �   CREATE VIEW public.onefamily AS
 SELECT personal.secondname,
    count(*) AS count
   FROM public.personal
  GROUP BY personal.secondname
  ORDER BY (count(*)) DESC;
    DROP VIEW public.onefamily;
       public          postgres    false    219            �            1259    49197 
   persindrug    TABLE     g   CREATE TABLE public.persindrug (
    fk_person_id integer NOT NULL,
    fk_drug_id integer NOT NULL
);
    DROP TABLE public.persindrug;
       public         heap    postgres    false            �            1259    49212    persinservice    TABLE     m   CREATE TABLE public.persinservice (
    fk_person_id integer NOT NULL,
    fk_service_id integer NOT NULL
);
 !   DROP TABLE public.persinservice;
       public         heap    postgres    false            �            1259    49159    post    TABLE     �   CREATE TABLE public.post (
    id_post integer NOT NULL,
    name character varying(64),
    pay integer NOT NULL,
    important integer
);
    DROP TABLE public.post;
       public         heap    postgres    false            �            1259    49256    postik    TABLE     e   CREATE TABLE public.postik (
    id_post integer,
    name character varying(64),
    pay integer
);
    DROP TABLE public.postik;
       public         heap    postgres    false            �            1259    57360    provi    VIEW     ]   CREATE VIEW public.provi AS
 SELECT provider.name,
    provider.inn
   FROM public.provider;
    DROP VIEW public.provi;
       public          postgres    false    216    216            �            1259    49167    service    TABLE     t   CREATE TABLE public.service (
    id_service integer NOT NULL,
    name character varying(64),
    price integer
);
    DROP TABLE public.service;
       public         heap    postgres    false            O          0    49172    drug 
   TABLE DATA           T   COPY public.drug (id_drug, name, price, fk_producer_id, fk_provider_id) FROM stdin;
    public          postgres    false    218   z:       Q          0    49187    drug_on_recipe 
   TABLE DATA           J   COPY public.drug_on_recipe (id_recipe, numrecipe, fk_drug_id) FROM stdin;
    public          postgres    false    220   8;       R          0    49197 
   persindrug 
   TABLE DATA           >   COPY public.persindrug (fk_person_id, fk_drug_id) FROM stdin;
    public          postgres    false    221   o;       S          0    49212    persinservice 
   TABLE DATA           D   COPY public.persinservice (fk_person_id, fk_service_id) FROM stdin;
    public          postgres    false    222   �;       P          0    49182    personal 
   TABLE DATA           R   COPY public.personal (id_personal, firstname, secondname, fk_post_id) FROM stdin;
    public          postgres    false    219   �;       L          0    49159    post 
   TABLE DATA           =   COPY public.post (id_post, name, pay, important) FROM stdin;
    public          postgres    false    215   W<       T          0    49256    postik 
   TABLE DATA           4   COPY public.postik (id_post, name, pay) FROM stdin;
    public          postgres    false    223   �<       K          0    49156    produser 
   TABLE DATA           :   COPY public.produser (id_produser, name, inn) FROM stdin;
    public          postgres    false    214   �<       M          0    49162    provider 
   TABLE DATA           B   COPY public.provider (id_provider, name, inn, adress) FROM stdin;
    public          postgres    false    216   \=       N          0    49167    service 
   TABLE DATA           :   COPY public.service (id_service, name, price) FROM stdin;
    public          postgres    false    217   �=       �           2606    49191 "   drug_on_recipe drug_on_recipe_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.drug_on_recipe
    ADD CONSTRAINT drug_on_recipe_pkey PRIMARY KEY (id_recipe);
 L   ALTER TABLE ONLY public.drug_on_recipe DROP CONSTRAINT drug_on_recipe_pkey;
       public            postgres    false    220            �           2606    49176    drug drug_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.drug
    ADD CONSTRAINT drug_pkey PRIMARY KEY (id_drug);
 8   ALTER TABLE ONLY public.drug DROP CONSTRAINT drug_pkey;
       public            postgres    false    218            �           2606    49228    provider inn_unique 
   CONSTRAINT     M   ALTER TABLE ONLY public.provider
    ADD CONSTRAINT inn_unique UNIQUE (inn);
 =   ALTER TABLE ONLY public.provider DROP CONSTRAINT inn_unique;
       public            postgres    false    216            �           2606    49230    drug_on_recipe numrecipe_unique 
   CONSTRAINT     _   ALTER TABLE ONLY public.drug_on_recipe
    ADD CONSTRAINT numrecipe_unique UNIQUE (numrecipe);
 I   ALTER TABLE ONLY public.drug_on_recipe DROP CONSTRAINT numrecipe_unique;
       public            postgres    false    220            �           2606    49246    post pay_uniq 
   CONSTRAINT     G   ALTER TABLE ONLY public.post
    ADD CONSTRAINT pay_uniq UNIQUE (pay);
 7   ALTER TABLE ONLY public.post DROP CONSTRAINT pay_uniq;
       public            postgres    false    215            �           2606    49201    persindrug persindrug_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.persindrug
    ADD CONSTRAINT persindrug_pkey PRIMARY KEY (fk_person_id, fk_drug_id);
 D   ALTER TABLE ONLY public.persindrug DROP CONSTRAINT persindrug_pkey;
       public            postgres    false    221    221            �           2606    49216     persinservice persinservice_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public.persinservice
    ADD CONSTRAINT persinservice_pkey PRIMARY KEY (fk_person_id, fk_service_id);
 J   ALTER TABLE ONLY public.persinservice DROP CONSTRAINT persinservice_pkey;
       public            postgres    false    222    222            �           2606    49186    personal personal_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.personal
    ADD CONSTRAINT personal_pkey PRIMARY KEY (id_personal);
 @   ALTER TABLE ONLY public.personal DROP CONSTRAINT personal_pkey;
       public            postgres    false    219            �           2606    49239    post post_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (id_post);
 8   ALTER TABLE ONLY public.post DROP CONSTRAINT post_pkey;
       public            postgres    false    215            �           2606    49232    produser produser_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.produser
    ADD CONSTRAINT produser_pkey PRIMARY KEY (id_produser);
 @   ALTER TABLE ONLY public.produser DROP CONSTRAINT produser_pkey;
       public            postgres    false    214            �           2606    49166    provider provider_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.provider
    ADD CONSTRAINT provider_pkey PRIMARY KEY (id_provider);
 @   ALTER TABLE ONLY public.provider DROP CONSTRAINT provider_pkey;
       public            postgres    false    216            �           2606    49171    service service_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_pkey PRIMARY KEY (id_service);
 >   ALTER TABLE ONLY public.service DROP CONSTRAINT service_pkey;
       public            postgres    false    217            �           1259    57372    idxwh    INDEX     O   CREATE INDEX idxwh ON public.post USING btree (name, pay) WHERE (pay > 60000);
    DROP INDEX public.idxwh;
       public            postgres    false    215    215    215            �           1259    57374    indx4    INDEX     B   CREATE INDEX indx4 ON public.drug USING btree (name, price DESC);
    DROP INDEX public.indx4;
       public            postgres    false    218    218            �           1259    57373    indxpred    INDEX     B   CREATE UNIQUE INDEX indxpred ON public.allpro USING btree (name);
    DROP INDEX public.indxpred;
       public            postgres    false    225            �           2606    49233    drug drug_fk_producer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.drug
    ADD CONSTRAINT drug_fk_producer_id_fkey FOREIGN KEY (fk_producer_id) REFERENCES public.produser(id_produser);
 G   ALTER TABLE ONLY public.drug DROP CONSTRAINT drug_fk_producer_id_fkey;
       public          postgres    false    3224    218    214            �           2606    49177    drug drug_fk_provider_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.drug
    ADD CONSTRAINT drug_fk_provider_id_fkey FOREIGN KEY (fk_provider_id) REFERENCES public.provider(id_provider);
 G   ALTER TABLE ONLY public.drug DROP CONSTRAINT drug_fk_provider_id_fkey;
       public          postgres    false    3233    218    216            �           2606    49192 -   drug_on_recipe drug_on_recipe_fk_drug_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.drug_on_recipe
    ADD CONSTRAINT drug_on_recipe_fk_drug_id_fkey FOREIGN KEY (fk_drug_id) REFERENCES public.drug(id_drug);
 W   ALTER TABLE ONLY public.drug_on_recipe DROP CONSTRAINT drug_on_recipe_fk_drug_id_fkey;
       public          postgres    false    3237    218    220            �           2606    49207 %   persindrug persindrug_fk_drug_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.persindrug
    ADD CONSTRAINT persindrug_fk_drug_id_fkey FOREIGN KEY (fk_drug_id) REFERENCES public.drug(id_drug);
 O   ALTER TABLE ONLY public.persindrug DROP CONSTRAINT persindrug_fk_drug_id_fkey;
       public          postgres    false    218    3237    221            �           2606    49202 '   persindrug persindrug_fk_person_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.persindrug
    ADD CONSTRAINT persindrug_fk_person_id_fkey FOREIGN KEY (fk_person_id) REFERENCES public.personal(id_personal);
 Q   ALTER TABLE ONLY public.persindrug DROP CONSTRAINT persindrug_fk_person_id_fkey;
       public          postgres    false    3240    219    221            �           2606    49217 -   persinservice persinservice_fk_person_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.persinservice
    ADD CONSTRAINT persinservice_fk_person_id_fkey FOREIGN KEY (fk_person_id) REFERENCES public.personal(id_personal);
 W   ALTER TABLE ONLY public.persinservice DROP CONSTRAINT persinservice_fk_person_id_fkey;
       public          postgres    false    219    222    3240            �           2606    49222 .   persinservice persinservice_fk_service_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.persinservice
    ADD CONSTRAINT persinservice_fk_service_id_fkey FOREIGN KEY (fk_service_id) REFERENCES public.service(id_service);
 X   ALTER TABLE ONLY public.persinservice DROP CONSTRAINT persinservice_fk_service_id_fkey;
       public          postgres    false    3235    217    222            �           2606    49240 !   personal personal_fk_post_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.personal
    ADD CONSTRAINT personal_fk_post_id_fkey FOREIGN KEY (fk_post_id) REFERENCES public.post(id_post);
 K   ALTER TABLE ONLY public.personal DROP CONSTRAINT personal_fk_post_id_fkey;
       public          postgres    false    215    219    3229            U           0    57352    allpro    MATERIALIZED VIEW DATA     )   REFRESH MATERIALIZED VIEW public.allpro;
          public          postgres    false    225    3415            O   �   x�5�A
�PD��)����k=���D�(���JE�-m�0���!0/3!<����Р���;GB�=�
��?�`,����n0D;:ZM(pB��n�T����v�^K|gZ�eB�q�-.%�c�������%�a1�9��0�:�Y�	g��	'͵�=z�hI��`�����\p      Q   '   x�3�447��4�2�4426�4�2�Xrr��qqq N��      R   ,   x�3�4�2�4b 6�2�4bS �H��!� �W� �i�      S      x�3�4�2�4b#.C m���b���� 4�t      P   n   x�m�;�0D���DJ�q8IK$D���ɲc����P��b>oz�E$�Hb�4
�k��(��í/�4�&g�	w�V�Mv���2�i�9����V����H�s��?�vR�      L   f   x���@PDϳ��~��&T� Jp�!D�Y�0���	�ȋ�w��Ĩ�hj�����nN��X��_� 7�u�#��������������m2y^ 32      T      x������ � �      K   b   x���	�0@��.�&����6R�D��"�D��mO��	�^V}�^�K �#�oɽ��Ȳu�P�ܽ~ek�#�t�G=�g���q���,"      M   �   x�%�1
�@E뙻�8�j�G�v�=��F��� �F���g�s#'�}��pA���&��yQ��P�#zt�"s$�m���N3\�����QS�RB�f��o{�,�oFǃ���V�R�r��j�~�y����M�      N   p   x�m���0D�x
&@|�aDZ
6`�����pވ **���.5�Ɓ�3h�m���ǎ o�$�엚������Hm�l8��1�Z�e������,F���,�*�{GhR     