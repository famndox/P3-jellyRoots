PGDMP      
                |        	   yelp_data    16.2    16.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    41857 	   yelp_data    DATABASE     �   CREATE DATABASE yelp_data WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE yelp_data;
                postgres    false            �            1259    41859    hotels    TABLE     �  CREATE TABLE public.hotels (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    address character varying(255),
    city character varying(100),
    state character varying(100),
    zip_code character varying(20),
    country character varying(100),
    phone character varying(20),
    rating numeric(2,1),
    review_count integer,
    latitude numeric(9,6),
    longitude numeric(9,6),
    yelp_id character varying(100)
);
    DROP TABLE public.hotels;
       public         heap    postgres    false            �            1259    41858    hotels_id_seq    SEQUENCE     �   CREATE SEQUENCE public.hotels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.hotels_id_seq;
       public          postgres    false    216            �           0    0    hotels_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.hotels_id_seq OWNED BY public.hotels.id;
          public          postgres    false    215            �            1259    41870    restaurants    TABLE     �  CREATE TABLE public.restaurants (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    address character varying(255),
    city character varying(100),
    state character varying(100),
    zip_code character varying(20),
    country character varying(100),
    phone character varying(20),
    rating numeric(2,1),
    review_count integer,
    latitude numeric(9,6),
    longitude numeric(9,6),
    yelp_id character varying(100)
);
    DROP TABLE public.restaurants;
       public         heap    postgres    false            �            1259    41869    restaurants_id_seq    SEQUENCE     �   CREATE SEQUENCE public.restaurants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.restaurants_id_seq;
       public          postgres    false    218            �           0    0    restaurants_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.restaurants_id_seq OWNED BY public.restaurants.id;
          public          postgres    false    217            U           2604    41862 	   hotels id    DEFAULT     f   ALTER TABLE ONLY public.hotels ALTER COLUMN id SET DEFAULT nextval('public.hotels_id_seq'::regclass);
 8   ALTER TABLE public.hotels ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            V           2604    41873    restaurants id    DEFAULT     p   ALTER TABLE ONLY public.restaurants ALTER COLUMN id SET DEFAULT nextval('public.restaurants_id_seq'::regclass);
 =   ALTER TABLE public.restaurants ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            �          0    41859    hotels 
   TABLE DATA           �   COPY public.hotels (id, name, address, city, state, zip_code, country, phone, rating, review_count, latitude, longitude, yelp_id) FROM stdin;
    public          postgres    false    216   �       �          0    41870    restaurants 
   TABLE DATA           �   COPY public.restaurants (id, name, address, city, state, zip_code, country, phone, rating, review_count, latitude, longitude, yelp_id) FROM stdin;
    public          postgres    false    218   %       �           0    0    hotels_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.hotels_id_seq', 50, true);
          public          postgres    false    215            �           0    0    restaurants_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.restaurants_id_seq', 50, true);
          public          postgres    false    217            X           2606    41866    hotels hotels_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.hotels DROP CONSTRAINT hotels_pkey;
       public            postgres    false    216            Z           2606    41868    hotels hotels_yelp_id_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_yelp_id_key UNIQUE (yelp_id);
 C   ALTER TABLE ONLY public.hotels DROP CONSTRAINT hotels_yelp_id_key;
       public            postgres    false    216            \           2606    41877    restaurants restaurants_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.restaurants
    ADD CONSTRAINT restaurants_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.restaurants DROP CONSTRAINT restaurants_pkey;
       public            postgres    false    218            ^           2606    41879 #   restaurants restaurants_yelp_id_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.restaurants
    ADD CONSTRAINT restaurants_yelp_id_key UNIQUE (yelp_id);
 M   ALTER TABLE ONLY public.restaurants DROP CONSTRAINT restaurants_yelp_id_key;
       public            postgres    false    218            �   M  x��X�r�H}N�BO=S�(S�H����`;& �@�M��|Cχ�M-�r��=�(�
l�սg��Q�s��ǡ��}{�h���"mϴ�Er��k���9�u� pC��=d�3�<BǆnpKX� �x���Ȱ9������[��Lt�m�\O{ޚ���S�_V�A㕣u��٩a���T^��Ԋ�;:Az&�Iz� p�N�>b��P�
f,ԡ�Ѳ8�]-������e��z44��g�y�좕�0Ҧ��	vZz�6t�>2׵R�.W������V�I��u
b�$MB��&@=Bp��ΌՂZe��ve"F�U�O�M�P����Z9\��y�<r����zP�F�P�/퓼|�q��ԡ(5���*�Q�w�c����c\)]���d^�NC,��w^���φ뺆E����(8�ѤB��u|6�Pů��ڨ=�z��m^N�S�'����������_r����[���d��
%����=)EGf
l�<��a��h�t>�t����q7��~f
"�d(�3������� z��znY��J�3MNM�ֽ�@�[bi4��0n�W���`�����C��*�����+'.Z9p�"��V�ۙ���g�:� ,�=fR`à��ba�t�ϗ���4_Bם���u5.2�2�H��G[n����Z1�x[ �O��=n�V	P�mYI�>� pƣ�	P�
�.LZ��i԰�ɻ�����A�S��Pk�L/;{%�9[+�i�_d�V�P�h!�Z��|�����0��0��2+�,�����ᾼ��4�y��Y��	<���f����v8�OφVPC�0JhC���6o�Liɡ�`��Ws2�VƊ���Y�
��T�:p�S�$��OXQl�j�@���E��Zf�0f�p�Ar�0,�qԨ|kN��_�n�h}.�l p�{U���7m�8Hz��m:��ĭ���ݻn%$I����xNF"�5FeY�Ζ�S��^ɸ�l���:���;�̽��J�����{�������L��#���!t�vSo������`�����ȓ��ߐ�C�=��Qŕ�9�,����A�����J�Lu��uT@gZ��+��ú�tZ�x���F�Q����:�_�� A���`���ݴl�f�(a(� ��v��o���E�%nojl��F%�#��6_��+)�CD���T3���J|�� ���T70��HG*#��E�Ż�=^�o��ea��
p�D���9>�Pۊ�Џ�7���Ou���7�a��1���8o��aL��=!F�C��M��k���)������t����B��i0xt�)	L�ȕD��L�_�[~yq4����GӇZwP Wj�[�S��O����`0<+<%Uz���uL���e-/�-�t�~��V{xX(��ǁ6r$��'�`�a�}�PXL�!�d��ܺ���A�^{��J�B�v_�Ųv�ގp<��m�,����àݵ���K�$t��+�����K�'T�cb�$o0�1���p�Vײ�X��T��%�O�0�h҈�#���F���]#`̐�1���@g�"�������u������ó�jRA�h��%���Y�?�İ@����s��d�d�Ĝc�H�!Wm�9&��8�����A+�Ku���錌��a�a���Z   ����q� �vx�hI�e�4�A(�L��@X�}��xV�	D�P�z�]��lŗ�<�S�75�G]�Jx� HW�r���|�-L(��$�ō�&���Z���V�W2��ӻ���,Tk�Q	<Cp��h%x9�����"�ꖸ`/K�8E)����j1!��vo�n�l���wo�`�n���L=�:�;a�_]��C�D!]�J�[��:��>���	~��[��m}l��h��<1�;�C��s�`6AS{�w�/��h�Rp/�M�-�\m��k0�*h�΂ɳ=�VB�/����r�����`ZZ'E�N����2`�P�E�0�9C��9�z˗wk|(����*�p.!��Oj�j�^�7B$�%��4 �50U��kCMW�"���n�V�y���"čt6&�Vl�>����������~�]�+�%��ۑA�5!B�B&�D���&(�B�Kx7�3�h}[A!;$K����6�C7aQ@/����~�G�CP��4%J� �Q��	`�a#����T�>�3(Mr%0Qo�4W�G"@�9Z�&���{���6���R��W���/
i��?i��י6R��=ÁN����q���t�\��:������xj��L:!� 0��PO7Q��?������[w�2�U�U��FR���w�D+�i�̓�8����0ڟ��kH�f�w�?�9�\��`�|!�wc�y��.�voQ�\t���iu��'-���u*0�p���Ck�'�K�ɓ;;D�:S�ʣ\��&� ���.)��N��m�`�f���k��";����y)U��=��R����;9�o=X��p��6L���L]���i�:�J֧�r��m��Nފl�K���`���.G.�2��;�f ��U5��n�i���"!�(�TM���?4/AX �ŧ��8ޚ맭њ?���� �%w�����)$�m���U��[��8���+%͙mZ�(�h
��{�0�(u&�b��]�pr��+-to�MS�`')���`l@�Rʾ���Wr}�&F�n� �8q
b��!�Cq�!���ޢ��{�]��X`����M�I2Ӻ�����W2��̗c+i�������q�������޴}* ������Z��c%���qK�Y� j�Rҗ;�Z����茪��d�HJ3u��e 21�Rh��``�2����ڦʇ�:H��֊=7�Vƿ���?��_�{r6��#�w��sX�3q7A�M��U�4��B��X�ݍ:���ܻ��iI��]�ZRrl��8r�P�J`���U@�;`��(�\�?�B�RןP����`��,�D�����?*�t��F1���!�oʧ�@]k���_}w�\�WW�
0��n�
��C���L��S���kt�M�7�
�����7�(���-뙟0�][P��[&���z6��O'rշ�kP1V�+����R <�%`M1ʮP���0`�O�	�b��B2ĲkH�&�L![h]l��f�YM���H��ohǗ7��(@韬l�5
�2}�/f�Z�o�U�n1w|��و��{(����T ��I7X��g�(d�� ��e{��l�[X��F���J��>$u��:� �l������lM������l���s����X(�x�
      �   �  x��X�r���B��A���Б����y�J�K2B�+�T�+��̓i~��K��v߶�݃����{���#}��F���ۄ)ei��/�ޞܹ~@J�(��z����Ԡ2�=�����)����(e���Sޱ�ʬ�4���fa�-r������N���Z��~������Z�}	���ᛆ��-\�5.������5u���S���������aX�/�)���sl�e�������j�ͲtO/hO����L�f)aQ�l*��ke�n�ʣ�G������NF��n�!J�Mkx{g����ڬ�l���ׂ
�Q����"#���SA3x��+�OQ�.�7�L������|y�IR:��vkwQ�	{�3�ie�t��~�"o-6-L1���4�V0����b���:�*��|��8��T6F�Ӵ�3H�vV���?v�~p��'L7��K��q�o��PR�� �0ʧ&���J�����VU��;����c�$={!�V���r�7P�?�7<�*��-�t����*�V�iIS��V��ž�Z�*��U�k}��)R=��L���V�l��Z���]{�;�Q�lߛ�Q�ٟ�f�-�$M���Y:lS��7�,��Z~i��v�=��Am�u��E�"�0�kw�) ̠TiB���0��&Ѳȝ�KXRf������+��X=6�Gf�<��+��N\=�0�;p���&�Բf~�-*�䃙����Hn2!�Eb<�l�͗V�Ż��������1���_�h��'�Yj��RiM;��n��2'�����`�Ӵ^]Y�m���������~	��oT��0d���dF+�qɷw;��R?���6�UBEns5�C�;�G����.ޮ���z��1�>]X��-]f���wm�z��d��t��H��U*���qF��Fq��
���Z�V�a,-o�GY�]H ��W�k���/�&˚����!�xXn�٦%N���*$ʔ��:+����v�|W��,����ҍ������W&�c�h���,.oJ��A��՚�������yߌ;�	�y�`���]L�	������&+�4dB'����ae�h)�׳��β�Z,>�g���IT6I�_๺`����@�� �^偪����ħ�q՞��x�8��[s1�W�����J��?\�����f�N"t)-�@U�IZ�b�V�̀<Υ��p�ZV{�$r���54�����g{�=���d���|J�ws�Ef:W���`̺�����l8��Q���4����Aܠ�,\?��Q�tl�x�l|��a�BF���L%%7s�\'�V�֜�w�%�[�{-����C08K�P�X�"7�O|�p#���B�3RYܸ�Xr䀵���1�}ko+F�;\����	�4��8�����2��Ԙ]����,IƓ��t;*-j���vҬ��q'Ho^�Bǳ�G��|#9�-v�EJ��8�l�޲R%+��6�={��4�5kD�f��I�	�0{C2�m��+�˨��<�`���� T�q�|�+�t��nuڮ�3/(�$u`�%��p�W���m��>��[�Rgf�|���U�&����ȓjo�����Wq�/��X@�)�g����l����N��Ɏ?�S´D�3����i�bºM��{�5���xRqx���g�����[�r�V�\nP�$�|�#� �%�s�ٝov'��2�	�Z��O�ʲ@3���ÏB��da=?�,`�?�ti@���ܑ.��&��

6^�`�����+�W&�>�l�{{����֛K�`����$�H�Xs�@�7b
	�L�a_���)=/,�P���e�CO����8 L�:����YJOLf�T�k>f��A��0zay�-U۝��0l�<nF
�p������\P)��J�+)7�۹'u�4��M}��q�|b�Z���)������^���Z=ܹ����Y(L%�W��
Kޮ��+����V��뢙�-��I�(���o���������?��x���7�T �!-3S#�Q�WT�%��������ip�W��y���~a���������v��$)<V!��W�4R'|��/W���!o�50�z�>�O��xX�ڛ���������`[�}��aP?��$Ole�Ś�"�u�Sʰ;���Q�ڻs~{?m>������`���I� ��e��_��e��M��'��f|����=���)׭u6I�֚!"�_��z��>��w�0q���8�2����Ȅ��Q�U��q��ɡQp�㹫@�T��˹��Yv��R�������G�����0Sܣ�_o���fDK�n�-W�V)�g��]�۞�P`a��9�/�������Z�k��[�v|(�'���3$3x�6e����;�s�>O;��~4,?����!�W³�=�ŹK�/��D|¢^��5]XJ]�
��];�����4���I���si�
9�!�1��X��]Mh;�34�i�og�e ����M�u�(֦���.
���]��3T-�$����_�X��8��s2s:a���'�I��������1n��?:���a����=��O#�H+���EF��z;܅��/�:+f�b7������Sp݊{\,G��s��$�ur�M-��c6���4I(���-J�B����=(ѓRW��lu,��v�Z뭟�-��$���=Į���y35���Qp��1L�<Iϔ�&��^�l��y� ��at�w�yTi�~��
'�z�<
j�����f�U��LY��QJ���+ux�ε�v����}�=�P_��|��ٛ���n���yw���H�i�WY��U%f	�=�e�{��Vym?:��R��o;����k����hE8�?{,�pY&N�︌�6`�3����cE�C9�tX9(�B% 3e�S�_��di�\�̴�٣UH��:�$�#>�6����XO|��'�9�s�)����<�����]���~K�9��4ƔLԱ󼞳!���x[7�E�/�r����H�:     