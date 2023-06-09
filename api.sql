PGDMP                 	        {            paymetrustapi    15.3    15.3 )    D           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            E           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            F           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            G           1262    16390    paymetrustapi    DATABASE     �   CREATE DATABASE paymetrustapi WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = icu LOCALE = 'en_US.UTF-8' ICU_LOCALE = 'en-US';
    DROP DATABASE paymetrustapi;
                livideakoto    false            H           0    0    DATABASE paymetrustapi    COMMENT     C   COMMENT ON DATABASE paymetrustapi IS 'DB for Paymetrust API Test';
                   livideakoto    false    3655            I           0    0    SCHEMA public    ACL     -   GRANT USAGE ON SCHEMA public TO livideakoto;
                   pg_database_owner    false    5            �            1259    16429 
   categories    TABLE     �   CREATE TABLE public.categories (
    id integer NOT NULL,
    libelle character varying(100) NOT NULL,
    active integer DEFAULT 1 NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone
);
    DROP TABLE public.categories;
       public         heap    livideakoto    false            �            1259    16428    categories_id_seq    SEQUENCE     �   CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.categories_id_seq;
       public          livideakoto    false    217            J           0    0    categories_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;
          public          livideakoto    false    216            �            1259    16447    category_post    TABLE        CREATE TABLE public.category_post (
    id integer NOT NULL,
    post_id integer NOT NULL,
    category_id integer NOT NULL
);
 !   DROP TABLE public.category_post;
       public         heap    livideakoto    false            �            1259    16446    category_post_id_seq    SEQUENCE     �   CREATE SEQUENCE public.category_post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.category_post_id_seq;
       public          livideakoto    false    221            K           0    0    category_post_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.category_post_id_seq OWNED BY public.category_post.id;
          public          livideakoto    false    220            �            1259    16454    comments    TABLE     �   CREATE TABLE public.comments (
    id integer NOT NULL,
    content text NOT NULL,
    user_id integer NOT NULL,
    post_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone
);
    DROP TABLE public.comments;
       public         heap    livideakoto    false            �            1259    16453    comments_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.comments_id_seq;
       public          livideakoto    false    223            L           0    0    comments_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;
          public          livideakoto    false    222            �            1259    16437    posts    TABLE     �  CREATE TABLE public.posts (
    id integer NOT NULL,
    slug character varying(255) NOT NULL,
    title character varying(200) NOT NULL,
    poster character varying(255),
    published integer DEFAULT 1 NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    content text NOT NULL,
    description text NOT NULL
);
    DROP TABLE public.posts;
       public         heap    livideakoto    false            �            1259    16436    posts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.posts_id_seq;
       public          livideakoto    false    219            M           0    0    posts_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;
          public          livideakoto    false    218            �            1259    16420    users    TABLE     :  CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(255) NOT NULL,
    pseudo character varying(100) NOT NULL,
    token character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone
);
    DROP TABLE public.users;
       public         heap    livideakoto    false            �            1259    16419    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          livideakoto    false    215            N           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          livideakoto    false    214            �           2604    16432    categories id    DEFAULT     n   ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);
 <   ALTER TABLE public.categories ALTER COLUMN id DROP DEFAULT;
       public          livideakoto    false    216    217    217            �           2604    16450    category_post id    DEFAULT     t   ALTER TABLE ONLY public.category_post ALTER COLUMN id SET DEFAULT nextval('public.category_post_id_seq'::regclass);
 ?   ALTER TABLE public.category_post ALTER COLUMN id DROP DEFAULT;
       public          livideakoto    false    221    220    221            �           2604    16457    comments id    DEFAULT     j   ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);
 :   ALTER TABLE public.comments ALTER COLUMN id DROP DEFAULT;
       public          livideakoto    false    222    223    223            �           2604    16440    posts id    DEFAULT     d   ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);
 7   ALTER TABLE public.posts ALTER COLUMN id DROP DEFAULT;
       public          livideakoto    false    219    218    219            �           2604    16423    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          livideakoto    false    214    215    215            ;          0    16429 
   categories 
   TABLE DATA           Q   COPY public.categories (id, libelle, active, created_at, updated_at) FROM stdin;
    public          livideakoto    false    217   -       ?          0    16447    category_post 
   TABLE DATA           A   COPY public.category_post (id, post_id, category_id) FROM stdin;
    public          livideakoto    false    221   �-       A          0    16454    comments 
   TABLE DATA           Y   COPY public.comments (id, content, user_id, post_id, created_at, updated_at) FROM stdin;
    public          livideakoto    false    223   �-       =          0    16437    posts 
   TABLE DATA           z   COPY public.posts (id, slug, title, poster, published, user_id, created_at, updated_at, content, description) FROM stdin;
    public          livideakoto    false    219   '/       9          0    16420    users 
   TABLE DATA           [   COPY public.users (id, email, password, pseudo, token, created_at, updated_at) FROM stdin;
    public          livideakoto    false    215   HJ       O           0    0    categories_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.categories_id_seq', 5, true);
          public          livideakoto    false    216            P           0    0    category_post_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.category_post_id_seq', 33, true);
          public          livideakoto    false    220            Q           0    0    comments_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.comments_id_seq', 9, true);
          public          livideakoto    false    222            R           0    0    posts_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.posts_id_seq', 23, true);
          public          livideakoto    false    218            S           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 9, true);
          public          livideakoto    false    214            �           2606    16435    categories categories_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public            livideakoto    false    217            �           2606    16452     category_post category_post_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.category_post
    ADD CONSTRAINT category_post_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.category_post DROP CONSTRAINT category_post_pkey;
       public            livideakoto    false    221            �           2606    16461    comments comments_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_pkey;
       public            livideakoto    false    223            �           2606    16445    posts posts_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.posts DROP CONSTRAINT posts_pkey;
       public            livideakoto    false    219            �           2606    16427    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            livideakoto    false    215            ;   x   x�m�1�0 ��~���X��V��� ʀ��Q���X[��1�C��y*�cq��kjgk�&y��;
<����3��G�1�e/�Q`>���k�2��U�H���+'��;B�/i�(2      ?   Y   x����@߸�(�ͱ���:⑐��W9%_��h���b$o��X��]������:O'���sd|��d����t����~m>�      A     x���;N�0 ��9ſ1��#ub�t�	��v�Z#���)@��)s.���ة �����������4F�EH�@HG��O�M��yx{��#���X��P�*ΰ�������no��� ^w�w�I��<�L��_�ڪ|��h���Ƌ&���b�6Ek�vЧ7�����ď-��(�1��آ�dl����!��xou��j8f	���ZT�%�Œhc� �O��S'���+�}*��;}{�׹f�ӘSf>O�;��0L���;\U����Q      =      x��\�n�F��v?E%�@TK�-��X��>%��ĝ���,�Y��&Yl��s5��{7���7�����U�X��$�n$�I,�u��,�w�2�ѢV�*JUT�E$#�W�Lt�:�0���(QQ�.�Γ��X�BE����e��^b����:���_
)�y����G$J������$ڙ�[y�5��ޚ�&��h���xz8�9�G{��iuT|�����i������̊�|f�#�����s�Eɸ��Q������_���#Y��)�e|T)��䢔+u$m��#�W8D��*��ɊJ�(�����4Ng4=�ӧR��GNܪ��R��?�e*ء8Ç3�S$F��K��������b��4�>�@"������diEQ�x)u�a�τ_oq�ibIt��[Ŵ޲��s�	�������K���\��"܉V���Yj��*�Ce2ǃe� �K#	�n�<�ڊ�I����9�sO8"\+�P
,oqe+��9�cl��{I�G��{���9hVE/U�� ���Yj>���Z�K7K@̌dd3ɰ��(ae�+		��3ô1�T/�8N뙘�2�u�Un>Sћ��R��fV��t����h|M�pؒ��l����x�^���9�7��j������&�plSt�r��9A���-p����E����J|��B����Y2R?'OP��|R:X����X%:=���La�bn.e��B��&&��r��$��G�8�C1W8�FA�k�l45�n1���h�	���P|��s��]��ʺ2�`����
�kb���/�y��`ޒ�x�W47V&���H����^�:1Ī%�G��Y�C���z�?N���	�1ؤ�NB�.t��謀�y"�$`5VWz�a��1�q$]�a-�oo��Bm9��+�t�Ez���Жۛ>{�}�w�2b"'y,I�xٕ����ۿ�X�V5[g�TY��kv�h��Ux%:_���D� �`>1�U0�$�ɲ�[߶�C��9=+�HN$�7���O?������;��@�'�;0�;��dښFa��T=��cm�#���Ũ���O��#1�"�GU��C�1 .m��?���X
T��J/�U啕�\
'�T
��&���V�#��3�@��옕"8D�d�z����ؼ���-����+m+@�LSC��S��.X2�K��u���U����ب<!hf��Û����j�ȅ��uGSb'�O��f�w���6�B!�4H�/U�����8 �.J(�24�T��Eƹ,�0-�,u�Jum��^����a�q&�c�N����AM�2&]���qt�R]C�e��z;0P�n��Pv b�%B]��3Y�
t%��X#H,`?����CN0���c(^����ٴ�K`�����2V@I�h�>��7�d�$��4I
N�sivj �ΐ��>XB�
F����n�=v�Ȕ��S�ʸ�A� ��%��a�/���n]�xЊ`F�<�Mv�5 y(�u+�u\���靁
���j~Wd�J,�����wA���W�	��J�-̓`Z[@|f�)i���]�A��,$���,7�JI��2a��ñ��l�*B:��m�)�¤� U@�ѽ-�w��kj/��Uo�R��߽�� T+0�xQi���IɝP�C�9�����
�U�m���ݾ���5<e����A�	d�3�ӊ3t�b	(B�B81.L�S�[��5��߱�����4^�a*����d�1$�1�_U�>)2M��c�!Y��ޕq��4Ӆ�a�6nb��d$ �/��g��i��׀[|�]z��h��.�������4�F]�,�O ��d/!X�YY_�l}������6�U&� ��	��o"ɫ� ���*&`$>`{0�[�����N�3b6]zf��OzS�أfF�r����,U�y�+��V �9�(�V } �C��Ł�נ����r606YF��Dρ�~ڊ#F
�!o9��A{��$�B�w<�R-��j-��cLl�܊`ޓ�ۙB2��_je:_n*��V��Z�C�n�Yb�(�K�D�&i�t��Q�����DL i�F�3!Ny�쯝b� ��x��n��y컇ۻ���~���ӥ����T��+h ��Yؔ��&�6�aC��>`�1�;����CYp�0�xs}���w��{&(\����f���+;ϝ��0�ƹJͮbğ�_}xA�Xk�VL��Q�N�Z ��6�v
�ǰM9�{�Ɏb􏬦��jkR8�#�(g J�j(�v�y��RRF,����uƍ����`��G��c��ܜ��}��q���u����.��8w��ځ+غ4h���K�ƟtE�"��z�32�g�e���LuȳQ��g�M'O���R +���%Eֺ����T�;�I�ɍ���Ѐ�&_�l�Hd��(w�2���8����рl��#�'Wu��n�K�mH�& ��'�\K��"���Qe���!��_P���Ak�>!�X���d�?���K2D>��F����������9?*�E���s�Y;|V��]�C��D��4�yo�R`)�� �7O�#�5y):��Cè0Y��2�RQl�A!��9M p��w7��9D;ep�$�'q�N�Rϲ����� �����T57�u�8�?Y��*9p���q2� #���,��,p"�K��i�{����w�FX�oa-)���s°Y��Vz��L�JD�<3%�W)��S�%�W�hkI	���L��I���ޚ�U�]qg����1�g��:x`�)8�:[K`�j�����)����"#no*�Zt �?):��}/ŉN�M��f1���2�Qbbr�#���s([�=�a���0J�qn�}��;��C��e � >�Mj�C�O��^�����W*UXh]��A�f�!6���rQ�:O�f�9�Ӊ�N(���NժV�D����S �>�z}AP�VP�h|�/_�~�� $ꃢ�л���@y��:GtU�P�XA�s��翻�y�tN�Q��?�x����l�P��ߝ8�
�F�<�
¨ڥK��ل��yw�9O��>t�	����Mu+P�b)Y;���,p��0�=�k���f����>��`�P�j׀���G�(�_��(a�>Q��T�$���ڕ3��(�To�癠� 
?�"�pO���Rf�7���-h:2+�|��|�5��p{<ܙN�<�<�M��k§��#2�T�������|�v��0��������>�+�ea���\��{b�8�h�X�{_��b��g�!'t4����ı����L�:�H����P/)��-"F���Q8Z"�\�%Kj[����-� �\���$�Qe^�˟d8�k����{��̓SsQ������E�������`�d�Fn:���4���r�ı��E��煎=��]���$�
q>�}*�c�?��C=S݌�OK�v1a*���HU+k��8nJ�\��H��}o�(�V���� ш�F C[���(Ci�kUzr�2�-����O�|��ixm�
��ɞ�l��'���ыm�����~�'�TK?v�3�ߺ��z{�|�{"_K������?��4�q�T��Oܙڏ�&� ����5�>o}`\I|!�`��Z��6�Cj�h�h2ں���(��P�I�E�i�`���d �S�&r?E��7�+Ո"�_��q�:���C؛>�3��K�7����p�?��mK��^�06��2{/��&�|�ΕI�O��S2��C�ćZ(��Hl��Nn��k��_��ɀ��ug���"���P���-SM��1��Y�(RF'
Nɨ���9<��E�C�mH�M8¬��'�����8G]����b���΂hE%�8����{��� �Ѝ���+z*�)��du�T���ԇ��V��@�ژoR�������?�x1�zE�hvr�_��D�ž��<]M�:�j������|b���e���G�A/f�'�6��g���)��s���Ҁ��]�7���0�8��GI�3����V�SJ���7n�υ�� ZQY�8�,cm35��QZ�G�S��KkW�%�~g��8Jm�8�����   ��am|8���C�Rg��S�%����x��	��i�[��I{���k�^!����R�-6+�Zo��QH�SgW��j]X�>��#�~TK�b'3�M�(�G��\g/K�W�7dc�e������4y�~ ˲�U�����yO����u�S_"�WC��iv�=\\.�uJu����w�}(����ى:m:��|w�M��hHA�`F�y|P�p]��ěT�8��.B@N{$b�R�~�y���5������K�h��T�4#A@�QR�x�se�J����d��i.W5z��JS;G����K�$���K���G�R��S�C%3����8{Ϫ�A�U]>('�*�	�/��dcWV�)=�͡s�HE�hs�>����
����s;��=�U�6u�Yf�%P~WTm]X�IȰ5��:�mڬx}Wb�G��枽��-W��P;�4��!_��d��go<�RHX�u�������5��ؕ��@pNk��+�^��ޥ\��-�y7���
���5gv��0�t8e׬�m<Gfw	��m�9���n��f��a��#7.R��[���i�\֕8��p�[*�Z+!�(j2��Gzj���_�*}���I��������T-r:L�D������׮��o�� c��e�:�"�@�m+e�yy���X9NQ{���.T��qAr.}�n)t=�:nD�t���=%�&}܇F��a���|#��>�X�Y� ���F��wЌ���]�����M&[ԌL�gO��O�L^�	�N-e
(Z��BG�k��N� ��}�vA�t��W<L��a�K��=N��pg8���Ɩq
u���j���Ů����ܭ���^�����e\_^_m_�x����#<S=�ѻ� ���70�s��ѧR�bV*y}��ΎE�k���=����!�0?��}�\-�߽��Zx�^3���o;� _����h��6u�Ҿ~N����1 Gp�/�� :�0�N��T���'\Rr{C$|7��r���������ʚ���y�f����RR��*Д���Z�h���Z:��-���tS2�w�����p�8�9)g��m(0/��
2�+�mV�p��Z�Sy)K��"��E�7&T�y�]�Ђ;r�c�uXʚ�f�:wI����,k�]�Q�*o>�Jt	9�Fc.�2�9�L^���H(iɻ�7���hn�Ud�.�ʹ�,�q}Ԩ2�*��.�ep�g�o�5��)�$�R[F�V��D���jX�T?��Ǵ�%K��ˆ��J1���(�8�t���L��VB}��elḹ��M�y�`���0��Nb�m9E�r�
K��\���M6g�ޛ^R>Ʊ�W� ޿f�[�;J7͸ť���lȊ���:��8��܄�m�Y��Tzc�DjJ��E��ELܙ�~�#i&�C�z���+X!��䆙�r�s#]Ol�O�)�9����~��h~M�{��O�� ��\�uM)����uv0V�L�Y�ó��뛟nNB���X|��$��$黜.04��omSU@$#���[<}P4d�!eS��wk��}9SQSQ��x]��N�-�נ�-V�_�T�uը W*5E��r��3e�	�MJ	�� C��)_+�� q����Tp�]���u��������r'�:���C @nd�1ŭ���U𥣋6S��n����Es9�ޤh����VM��|N���]�5�>ή�W�2*���N����
�EY��E��/�����bC���ƍ�<�,���p���|'�0WՓՓj<��l�FO�{;{ۓ����`�0�F�����hoo{g{{�3�M�?�Ëb��?������GSGa.�͞����3=cu�to{��;�ת֓����;�B�:���s������F�+ҽ?|��Y}�m�?{�6�w޾�����~��lzj����ٻ��e�ߟ}<��~yv����,��͛�����V2����Gg���E�s���ųo���YVO7��}�,��ǣ��O䁊�嶚N���<���ƻ��lM��NG��Nw��۾����=�w�g�n��##%��
K�&HW\����߳�#�m���c�W���t	|��9]���{��L��Wd)9����6�\��]�屌+`1��PӺ���]��q�1�G��-�Q��D˙��)� Jet���R���K-�(�)waG%��P�{T�����1�+0P�;&�4��7:ߴ��f2�'��Yw�7�mN�O����uQz�;��SY~�_H�'|݀���F�N�@�%_�PW|�sA���S_�<��i+�㯏�]�C�^R��N�r��{�&
��<��{�����t����nv�F�م�֯"P�_�Ȧpo�oUp/��5�7۵�mS"��H�:]9����;f)p@�!���hΤ�ܩW�Tj��E����C�{��]�ǻ���>H����m[�C�ӽ�E������u�&��Z��*���<t+ڦy�	�Ad���J����@H9�D/cb�;J�2�}�*
>h@y�d���S�ԻPĵ�"
HWE+òcSb�MZWm�w����9�wd�^�t�r���|WB]��+�|�Ȝ��ky>S�%>W͕Zw�w�ʰ�oa[���u�|-����$ݍ�����mo�s�Rt���TMgZ?	T@�kժ�CJ�/���Z��%����*�뮸ԩi�L9ω�M;���oA����"�;w�K+�g~pw��:нqjK����+C�M�_E{��cx�8����Q�4����

�LEs-���|ٴ6��(��-u4�on����}��>6�'3V���_=���ѣG���ǫ      9     x���K��J�u�)f��.�������[ye� �KQ?��77�Lz��R��/��B/ev��IXT���>���G����h'L����x-��3�^��GE.�!7�uΕa�kVg���úh��!�^~/b�2o����QS�d�G�Y�D��d��/��j������[Ok	/�0��V:��ƒ���^+�����)F R�Gy���S�� �N�5 �i}���Hݽ=*�L+5�3����f�UI�l�jy�SH��<5�JIqff��{����F>o�X���x���`�t	�#��Ei�v/4�����!�a���]^"��#3MP�;(������)u��4>5�..�<~+t�PΫ�ȏX�S,��ȷ�_�3�ǘ5}LVǚ�E�?x3CUl�%��ݳ?��1��:�qSHMi �����z3�37����ϒ��ք�WuΜ�BB�gp�r�*j�yW״�~�t�N�m��i�d�*�&yz�ώ/wr9����ٽyW����wR���~!��M!hDN��I��1f�V��	�2�g G��h���n鉾��m�������WHM�I�n$����}a���[�C�����Ê}i3�暣y٬��O�N!,M�N� � ����I��+�\�۹�Fq�Aaor�Q��t����ںݪ8�v�d3_"���tI�0a����D�ݳW���p���9Q��1݊Z#=h���Ud�?�b�jB~N
+�2�s��-�hm��ͪQE��Yњ3X�����Ԧ�{|�T�����t��	ߩ�F���uΣV����W���m���;P�|�c�R�w��"7�>uT_Q�E�,9�ʣ���j�Kz׷snK�H��^r������~i�~{��(z�1��:+��I��)S(��	qE���R�[�����Ϣܔ� ��a��$`y<��Bj�u�ƊTb�N.~Qt�e4�ޙ]��ֿ�N�/b殉b�%�o�}�GR2x_�Sh��d��6�HZ�~�˜Q�����e���s���	�#�F)� <�����_��-[     