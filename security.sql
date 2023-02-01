PGDMP         "            	    z         	   mbd_tucil    13.1    13.1 *    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    109226 	   mbd_tucil    DATABASE     m   CREATE DATABASE mbd_tucil WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE mbd_tucil;
                postgres    false            �            1259    109251 	   customers    TABLE     �  CREATE TABLE public.customers (
    customernumber integer NOT NULL,
    customername character varying(50) NOT NULL,
    contactlastname character varying(50) NOT NULL,
    contactfirstname character varying(50) NOT NULL,
    phone character varying(50) NOT NULL,
    addressline1 character varying(50) NOT NULL,
    addressline2 character varying(50) DEFAULT NULL::character varying,
    city character varying(50) NOT NULL,
    state character varying(50) DEFAULT NULL::character varying,
    postalcode character varying(15) DEFAULT NULL::character varying,
    country character varying(50) NOT NULL,
    salesrepemployeenumber integer,
    creditlimit numeric(10,2) DEFAULT NULL::numeric
);
    DROP TABLE public.customers;
       public         heap    postgres    false            �            1259    109234 	   employees    TABLE     n  CREATE TABLE public.employees (
    employeenumber integer NOT NULL,
    lastname character varying(50) NOT NULL,
    firstname character varying(50) NOT NULL,
    extension character varying(10) NOT NULL,
    email character varying(100) NOT NULL,
    officecode character varying(10) NOT NULL,
    reportsto integer,
    jobtitle character varying(50) NOT NULL
);
    DROP TABLE public.employees;
       public         heap    postgres    false            �            1259    109227    offices    TABLE     �  CREATE TABLE public.offices (
    officecode character varying(10) NOT NULL,
    city character varying(50) NOT NULL,
    phone character varying(50) NOT NULL,
    addressline1 character varying(50) NOT NULL,
    addressline2 character varying(50) DEFAULT NULL::character varying,
    state character varying(50) DEFAULT NULL::character varying,
    country character varying(50) NOT NULL,
    postalcode character varying(15) NOT NULL,
    territory character varying(10) NOT NULL
);
    DROP TABLE public.offices;
       public         heap    postgres    false            �            1259    109303    orderdetails    TABLE     �   CREATE TABLE public.orderdetails (
    ordernumber integer NOT NULL,
    productcode character varying(15) NOT NULL,
    quantityordered integer NOT NULL,
    priceeach numeric(10,2) NOT NULL,
    orderlinenumber smallint NOT NULL
);
     DROP TABLE public.orderdetails;
       public         heap    postgres    false            �            1259    109266    orders    TABLE     �   CREATE TABLE public.orders (
    ordernumber integer NOT NULL,
    orderdate date NOT NULL,
    requireddate date NOT NULL,
    shippeddate date,
    status character varying(15) NOT NULL,
    comments text,
    customernumber integer NOT NULL
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    109319    payments    TABLE     �   CREATE TABLE public.payments (
    customernumber integer NOT NULL,
    checknumber character varying(50) NOT NULL,
    paymentdate date NOT NULL,
    amount numeric(10,2) NOT NULL
);
    DROP TABLE public.payments;
       public         heap    postgres    false            �            1259    109280    productlines    TABLE     �   CREATE TABLE public.productlines (
    productline character varying(50) NOT NULL,
    textdescription character varying(4000) DEFAULT NULL::character varying,
    htmldescription text,
    image text
);
     DROP TABLE public.productlines;
       public         heap    postgres    false            �            1259    109289    products    TABLE     �  CREATE TABLE public.products (
    productcode character varying(15) NOT NULL,
    productname character varying(70) NOT NULL,
    productline character varying(50) NOT NULL,
    productscale character varying(10) NOT NULL,
    productvendor character varying(50) NOT NULL,
    productdescription text NOT NULL,
    quantityinstock smallint NOT NULL,
    buyprice numeric(10,2) NOT NULL,
    msrp numeric(10,2) NOT NULL
);
    DROP TABLE public.products;
       public         heap    postgres    false            �          0    109251 	   customers 
   TABLE DATA           �   COPY public.customers (customernumber, customername, contactlastname, contactfirstname, phone, addressline1, addressline2, city, state, postalcode, country, salesrepemployeenumber, creditlimit) FROM stdin;
    public          postgres    false    202   .8       �          0    109234 	   employees 
   TABLE DATA           {   COPY public.employees (employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle) FROM stdin;
    public          postgres    false    201   �R       �          0    109227    offices 
   TABLE DATA           }   COPY public.offices (officecode, city, phone, addressline1, addressline2, state, country, postalcode, territory) FROM stdin;
    public          postgres    false    200   IU       �          0    109303    orderdetails 
   TABLE DATA           m   COPY public.orderdetails (ordernumber, productcode, quantityordered, priceeach, orderlinenumber) FROM stdin;
    public          postgres    false    206   �V       �          0    109266    orders 
   TABLE DATA           u   COPY public.orders (ordernumber, orderdate, requireddate, shippeddate, status, comments, customernumber) FROM stdin;
    public          postgres    false    203   �       �          0    109319    payments 
   TABLE DATA           T   COPY public.payments (customernumber, checknumber, paymentdate, amount) FROM stdin;
    public          postgres    false    207   ��       �          0    109280    productlines 
   TABLE DATA           \   COPY public.productlines (productline, textdescription, htmldescription, image) FROM stdin;
    public          postgres    false    204   �       �          0    109289    products 
   TABLE DATA           �   COPY public.products (productcode, productname, productline, productscale, productvendor, productdescription, quantityinstock, buyprice, msrp) FROM stdin;
    public          postgres    false    205   =�       M           2606    109259    customers customers_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customernumber);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public            postgres    false    202            I           2606    109238    employees employees_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employeenumber);
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_pkey;
       public            postgres    false    201            G           2606    109233    offices offices_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.offices
    ADD CONSTRAINT offices_pkey PRIMARY KEY (officecode);
 >   ALTER TABLE ONLY public.offices DROP CONSTRAINT offices_pkey;
       public            postgres    false    200            X           2606    109307    orderdetails orderdetails_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.orderdetails
    ADD CONSTRAINT orderdetails_pkey PRIMARY KEY (ordernumber, productcode);
 H   ALTER TABLE ONLY public.orderdetails DROP CONSTRAINT orderdetails_pkey;
       public            postgres    false    206    206            Q           2606    109273    orders orders_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (ordernumber);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    203            [           2606    109323    payments payments_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (customernumber, checknumber);
 @   ALTER TABLE ONLY public.payments DROP CONSTRAINT payments_pkey;
       public            postgres    false    207    207            S           2606    109288    productlines productlines_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.productlines
    ADD CONSTRAINT productlines_pkey PRIMARY KEY (productline);
 H   ALTER TABLE ONLY public.productlines DROP CONSTRAINT productlines_pkey;
       public            postgres    false    204            V           2606    109296    products products_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (productcode);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    205            O           1259    109279    customernumber    INDEX     K   CREATE INDEX customernumber ON public.orders USING btree (customernumber);
 "   DROP INDEX public.customernumber;
       public            postgres    false    203            J           1259    109250 
   officecode    INDEX     F   CREATE INDEX officecode ON public.employees USING btree (officecode);
    DROP INDEX public.officecode;
       public            postgres    false    201            Y           1259    109318    productcode    INDEX     K   CREATE INDEX productcode ON public.orderdetails USING btree (productcode);
    DROP INDEX public.productcode;
       public            postgres    false    206            T           1259    109302    productline    INDEX     G   CREATE INDEX productline ON public.products USING btree (productline);
    DROP INDEX public.productline;
       public            postgres    false    205            K           1259    109249 	   reportsto    INDEX     D   CREATE INDEX reportsto ON public.employees USING btree (reportsto);
    DROP INDEX public.reportsto;
       public            postgres    false    201            N           1259    109265    salesrepemployeenumber    INDEX     ^   CREATE INDEX salesrepemployeenumber ON public.customers USING btree (salesrepemployeenumber);
 *   DROP INDEX public.salesrepemployeenumber;
       public            postgres    false    202            ^           2606    109260    customers customers_ibfk_1    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_ibfk_1 FOREIGN KEY (salesrepemployeenumber) REFERENCES public.employees(employeenumber);
 D   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_ibfk_1;
       public          postgres    false    2889    202    201            \           2606    109239    employees employees_ibfk_1    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_ibfk_1 FOREIGN KEY (reportsto) REFERENCES public.employees(employeenumber);
 D   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_ibfk_1;
       public          postgres    false    2889    201    201            ]           2606    109244    employees employees_ibfk_2    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_ibfk_2 FOREIGN KEY (officecode) REFERENCES public.offices(officecode);
 D   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_ibfk_2;
       public          postgres    false    201    2887    200            a           2606    109308     orderdetails orderdetails_ibfk_1    FK CONSTRAINT     �   ALTER TABLE ONLY public.orderdetails
    ADD CONSTRAINT orderdetails_ibfk_1 FOREIGN KEY (ordernumber) REFERENCES public.orders(ordernumber);
 J   ALTER TABLE ONLY public.orderdetails DROP CONSTRAINT orderdetails_ibfk_1;
       public          postgres    false    203    2897    206            b           2606    109313     orderdetails orderdetails_ibfk_2    FK CONSTRAINT     �   ALTER TABLE ONLY public.orderdetails
    ADD CONSTRAINT orderdetails_ibfk_2 FOREIGN KEY (productcode) REFERENCES public.products(productcode);
 J   ALTER TABLE ONLY public.orderdetails DROP CONSTRAINT orderdetails_ibfk_2;
       public          postgres    false    206    2902    205            _           2606    109274    orders orders_ibfk_1    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_ibfk_1 FOREIGN KEY (customernumber) REFERENCES public.customers(customernumber);
 >   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_ibfk_1;
       public          postgres    false    2893    202    203            c           2606    109324    payments payments_ibfk_1    FK CONSTRAINT     �   ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_ibfk_1 FOREIGN KEY (customernumber) REFERENCES public.customers(customernumber);
 B   ALTER TABLE ONLY public.payments DROP CONSTRAINT payments_ibfk_1;
       public          postgres    false    207    202    2893            `           2606    109297    products products_ibfk_1    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_ibfk_1 FOREIGN KEY (productline) REFERENCES public.productlines(productline);
 B   ALTER TABLE ONLY public.products DROP CONSTRAINT products_ibfk_1;
       public          postgres    false    204    205    2899            �      x��[�r#��]���;��N�;���ңԢJr;��H�D3��������c���l&&&����|ɜ$R$��q��T� .�=��s!�lԨ\���+�^�_Z�&��J7�J����Џ��E�G^��ߖ[�+��kv-�F��Uz��N+YLA�1_����}'��&z^Ȝ�駆O���]�b�>+Y�ģǋ4HY��P���ɗ���j.kv}���<�u2bB�1KD��٨��J�Z|\湚b��#��SU�ۺ,؍jTż�g���v1��:�IlM�إڨ��J�e[��kz��,𼝅����'I�)2|\<d�P� f�5^y�Z<�,\D�d���љ��X��O���s�ߊ���-�v$%�}��?��e�u�h��S�
��,E�%�,�ֱ�I�k��R.�X|.�n��J�FnTU�E���uY=�-v���-2���"?ֈ�~l)����ٵ�)ޓ���"�#�Eq��v+����xĲ$�}w�eQ䖌ع������q[��%Ζ�h��_T�ճ��0�-�;?�=�C��~�|�Ou���%��FdU��gI_{b�!Mo�\3�]2eG�lQ �����t�4
��ڷ3㿘g7�r�-U�sy�����Om��?b/�T��E�(����>,BhV�j��b�>�(UG3IFqO��7���&)�J5.�&]t=-M`C_$���ø[1H�b��'~Wnk���Q�]<K���rř%��n�+J1>ڨ��@���g(y�;���P�u�����U��O�zM�7^Ȣ@O+��;�j^��2�{�y�0d��U�Z{�Ջ�?�4�ծ�����C�'k��u���?~_�O�!kn�:�Si��F���Ƌ
�����|1>�M�l��?������s�2�m��ʿ� �(����Y�Pc��V��1
�^�$�\�t:�2
���6�;�ֽ��#V�[ި�˝��Q�1%	�	ٱ*V�Z2z��%c�:
DmQ"窨t��|�^F�-gIJ�NY��Z�m�R�Ԝ&��IԌ�� a��M�q%�e�'e���#���/��3@�I���C!N��B<B��G����ѺA���;Uo�Roу��2�K����5�8�*��"�Wr� �E�������'�¡����O[*����3@(�2G��a�&��P�P�"�>�e]�i_,�
�B�A��h�I����\���E�Cє��E#�|qW���ii���`wj�(h�0�R�^�Uٔ��Jwh�^������a����\�w  �! ���s���S�t=�(��e۝b��΄�K] �M��@������eY�!2	�{�@�,q�� ��j�l���E�4��j[!>�	V� ���X)ON���A�.��]��U&{�y�"}m���h��A!�	}W&�6�K��{��?||�� �
�DG8��]�T�z�ԝ
6���R�_�B�z�KՔLa�#���}��#P���D����	��WK������2U���RZP�b��v.���@�B_hѡU
V�t�-�'Hh-񽡈��tS0��B�uM�!~�� &�~`�mvE�!)I}w��OTh\�>�c�X�?�]�pF�����іC��f�q���x�j#��	�Da���J"j׻Ȕ���%���b�������.TՖł �D:��G�z�1��?�]�X��*'MY�cn1Cj�պll�Zbk��M?��EY@���<B>^f�#�ĳ$Zj2�g?�@w6��/�\���H� ��$J4���ͮ� ���?�ɔ������b<
��0 7]�������T `jU����)�e	���@aZ`E]a{q�r�yMXw;۫�w�5�]�C<@@NuA��cYH�̹@�4�f�7  2��B�˶^ʦ�����-�bi�+D^�gQ�ԽCq��}��v�Q�x&�� �|L,	�j8�m��*�X��R�����1~}Ǿ^��D��L��q^�Q�T�eѭ;�d=&�!��P�`��LS:��)f0\o����G`��'�T)����E4�����(z՝���KU6i* �G©wح��ר
� �^ەt
�ǖ�^��Z���T�$�/@7D�5����x�G0X�r�jW���|3�0����� ���/_#���[�G 9#�gJ��Wdg�ڿV�u�-��W�T�u`c/���G `�/r�v|O؏��ј��ܿvikdĭ�/E�����>�X%�f���)e�lP�A��@��i��ȔJxS|]��i�rT���'�y��9�Y��B7�&�������t����(

h�ֻX�� �%ŧ���p�R�&�Ţ�h����r���v+Y��)����.�i�1��ٲ1�D��|��菊�
��t{�g�hY�\N�����2!�dM*~nmrذ"G#}(y�/~A
g?��X�d��T �����A�r�$"̶��r��	cb&2��e�t�$�X���+�O��BN�=Y��U���Z<�h���-����W��Q4��¿ˏK�%A��b7% �D((�Ki���O�� &��m~�v�R!�����	:K;���y�[j�ˏ@b����� ���n:]Y]����k��R,H���RTo�%1�?�I-Ŵg4�g��lڈ�KzE��O�R��>`�I|�H�1`�&F{MVr^�����������ja�ܖ}�F�'؏�M�)��rH�օ�{��N�0�^�U1F��R���t��C����`��3�G&�a�C��3Hޚ|($�1�Q�~F��d'��0��%����Cʈ7���҇�R��c��@#!�^��A�S�!���P!��X &uĎN!Y��A[��Bxܮ�΁~�v	:	z�4DE���*�ǺR</�y	�l�M��8F�"jl5��狆�|�On>���y��G��sT(�%�ڰ�Yx�a�MD�9�Q^��eU!|f� ҹ�,��܂}<��pk%�J�uA��a.u�`� rZ�j@���7�/�xVs��?�S�a-%d�*~Ë�S�"�B)s��'� b[���Kf呦��YwV0�$��	@��E�l!�ðCe�S�D�i<�|��e}k�ɫQ�R��V��F�iy�4�SS�$B>��rJ��w�W���e����,��Q�j�J�t��dc�����K�Bv���,�o�(��WP�k��e�	��ڨ°$v�$��+fL�J�hA>%¢�78OZ��<���)��KP�{�"Щ��~�1���(�C� �e�C�v���0~��j�6�z"�f0��ӝ�ӫp�0��kl�&�ej֊�^����"��$�L8�W��e��C�ʮ�s�6O��ۄNb*JI�9,;�M��rRa���,b+(�a�b���D�c 1k�N��t�z��"��S /q� In�l��)�_P��F@J4�h ��J鲝��2�9��%يԵU5�+SO~������H��Q1�"%f�������МT���Z�]��5��2�Q����TD�FN��F7{[Ȧ~.˙�~r��,p��<��9��s��@�Q/��NyЇ2��[J�-n�2��n�,`Ggߟ�wx2������s�CH����mc'.#�`A,9�`�R�L�l������mu�g�+2RlN��9���&F�&/mWU�iʊИ�2q$U	�A�{�>&Bᢙe������-�¼ȹT���,u&����q%W+����(6��#vs�#z����uɀ��Ku��Ǜ.�-Յ��P rF����i���%�<�Ռ�M�,��+�3���\�얡�-���>��䎱�y�DvK"��c~E!6�EbB�<ߌ=�<J���Ա�IHBC�d���-�[>i�HQ�@�ܔ�R��h�T-�%�R��0@C7����1���w�ьl�jp�@��j�1�zF�@αe�������t����z18"��W�Z�� r���� w�[ͩ�N�wfͤ��RQ�Br��$J�96zX�k��EM��s��D�s�;�n�JY|�m伅�f�"�� �
  �I����F��gz�f�(�������BF��qI'�:F���V�H��D@�RB��1�o�^Y&m���_)���d�+/��V�!�x ������'ヽ����钲��N ������2�Ӵ�!�m����zi�X�D��������Y�Xp�L���Nr�bfg9x|�Г�$�ׂ�R���]�禱c�H:� �-	�M����g�B���3�!D��1��}4�Έޜ㮫0F � ��a��4�L_���8�G
��brg���'��U(ѐ�ǃ.��}�-!��u��#?(���t�Q��S�}*�>�ۨ���=�pr2�_��^�XO?]�T�D�C���A��eػ��~��,t�נ�M5]��4�@/�,JPk-]�
�7�G��b�Nٜ�jc���� +�3��|~�I��"}.	��^ �4�����M��	h�;:����'�Ui�����'~jb|�*����d�}��Vn��)�l�̈/
��B�p�m�uDI���aċ����}�k\�ī�p���=�,J&�i����;���B弑@���Y������EQ�H��Qy�un������5U+b�V}[�R=j*"k L�e21�ái���nrTZ[�j��I&yP���F��-dH}@���k���x&֓��n9����<�<�hʐ�N�3j���f@⢝��F�� v��@=��(K~S)[��N����	�J�~���Y�=�p'����ԧeu�W�`�����-Y��p�A@F.��e�{�����3tp�-�O�����j�Q���+X&P�y���т�#/[dj?L_���D�!����G�7�
Gy>�+��=s�d�������q�K�X.ާ?q�P8����=9x5�!p�Ŗ\GR 1����WKd�h%�>g��A�j �nᬛ��iַ%�b�m�oK7^f��YV3��3zU������f�q�����)���__QR���F��KL;���1��gK5]9�1���-�g��	�/Uݵ��N�+� ��!|��p!q��
k(NS���l+�L�e0V�k�.��~L{����H� [ȊFf��֘��=���ݑz�����H����f��p`����3������:����;]N߰c�o��m�¿G�t�H��%��CpC�( �߫)Iޮ�\�����` �<`T��n���H��U׵QC�H7V�7�� �P&;̃d���W�E���䁛���k 7U����ttϠ�|�w��tn}��?4
|��@��]�ܖo�6Y���$-5����EȍK��A
l[�Q��T�tdS�0�<���@��|vf�Y�-z��F�P��Yq��:&�en��� �0����G�aQ7�~/�{$s�*��4m�̑û����7��a��|t9R�%8ф�U�@���QR�<���q6D5���|Y�޾k?]MQbHZh $sf%3�*v�z$�`N�>	�@�Q1�6��lp�搮�H����ȗ�t��Z�-��F��.1����+�粨��,aj��-�fk��i��6�r"D^:�y�����Ү�ewy ���D{�g{w ������n�0 ���]�qs}s���A3�_�r�B;Vz���L�Vۥ��mP�E��7C�z�Y���׳&��nz �������u0f�x���~���h ����,:W���-$��� ����R-�*l�C�hb�����VR�1��Tsu��0�-hb%�ug3=@�,��L�fh�|��^#�s�Sw���5��w�u�nd����B�U�x ��&-g	NvX	�N�27w>!�_l����=���kT�]Y�m/�v��1eQ�M�o� �u�?얋�|�^W/��~j�͘d2�3���l��߼z�v+�$	*�M�^��6W7Mn��عE���u�U�|�8y3���O����蒴��=l~i�M64k��P�f� 7�;��:~ҙ����o�hRz��p&�'��GP^ؽ.sH��C2\C$i�F�~�C"��F.���QA�);h^#��RŮ���?�:��,���_�G���G:�oǱ�a"������;,H�k����pC�v6K(��܀+nw~'�|ht����\Z�Bh��(Z޴�+U�U�A�=��`/{^�9ۼ���ŋBaG뚆�%�/stLA鏲����v�G̒�Ҩ�7��ܔؚ��vA�� �{�Ye��ӻLF��E�@����g�]޶�̫���@a�z��Lj�S�r����+��0�8����N��@�G�y����(7���C�S���S(�QͶ|�K+�n���۫ὑ���E;�;���K�b�ݍp(�'��U�m��g�ωbdv� ֠c z�r�Ж_uLb?b����b!����h]?ze�oK��O�T|x��Od�'u�s[�ʏ<0����<�K
��-�WQ"�i�T���e�7LԂ��	����7Y������zp�;���~W�]�3�j���:gza��}�	�M�:C�_��K3�@�Z"�����w~=�C�]A�*�_�yu{kwx8���-��2<�{G������|.̢�[�r��w_�JJ�1]v����z��s��0��B|���]-�5��3����vֹ�}�8���i�)F�ʷss�Ȭ���w�}��;�o      �   M  x���O��0��ç��^V��[a��څꮶZi/��Đؑm��8�BE�>˿y�y�y�]�{�.��σ���o��#�Jy�`��-T	>�a��)��G�0���k�$L���.���j�k�ʿ��/��Aqc�5/
�|��݀�>���x�����
�!+I�L�x���+�	l��d;0��M�+dJ�q��2����R#%Ӎ�\3�b�/�l^����D<�C|na(m����hl��ן{��FE!�MJ쀁	7����t@�X5�U��q`��CE𚫲r�;���;�p��nj%��J/H��'���Og��07F��J�����J���ƹ�AK��v���o8���t���d������TM�F�.
>72�
�Cb~r-�L����)��++��3c��(�y���8@�h䮨Q#e-L�v�����iֶ�B �Jr��WN�p�h,v��hi� ���r}`r�cP��L3�@���tJw� ���+�}�Z\K[�uJ�Y�\��RQJ'���]�BxbV���[����W��&\�\��H)�Y-v���]����B      �   s  x�=��j�0���)�8h���{T�%�u��!rQ�
kb� �)~�J٦ :̧~��Nx�t泇�V	dڡ�5	�G�\�.�"t�VB@c�3���К�����OaRXWE�
H%��K�x���3H0��`:���+����	P\���U�� �=ޠ2i��HI�3!�d�0æ��$�4+�� +��8����k�+~�//v����Z	Ұ?�M���[S%5a��%�F�����σ�eX}o�����N)�����Yl�[�ɭ�٦�p�[�,�*���M����M������e��6��m��,H�9�����>7-&P�Z�[��c�����E=�7������H����7EQ��_�u      �      x�m}[�-���w�`�=��{�3�Yt�eFV��f�����h�*Oy���W�����=?������?%�Z����������n�P���������c�8~��)@�[�����<���Z��O�ˠ���}����O�����9R�� ���6������O;?g����|�����[Z���"��wރ~����޳�X?��K����k�O�����~f��Z~g��	��9�=?����<�ު���[���~N�-���B�7���?����e�v���fS�������`����=�{=��� s�4=���D�7�Ly�z�ױq��=]%���g�������W���i�.����]�Ed=������{�����8魼����V~;¡�W�#/��������=>���=O\���{��v����|�v�Z�k���|?6xr��{��o�����~����ޟ4��{�MA���y�����?�������I��U�s�}GQz��GnL��;�������{��M=N�ހFy����������쎭�n����}v���g���Ǝ�}
�a����s�����Z�Ƽ�GX}��=�{��7�:n��Uf�L�x��=��W���1;�����]��M��2�����<��Ji�e��"8>б���4���,������j����|��7 ![Oޟv�����]�R�z״�������3���;ñ��+�<����"�y��Y����g��Ӡ��+�ٽ���ln<���zo�b���0�Wˡw�Źx����d���H��埱j,��ܷ��m���5������ga�m�D�;���$��5߻�V�b��R�>�E����Y�|��+��������|���w�-E�V�u���:�B�y���]ϯ=�Ob��o�z_B��C��-4�d�X�;͑������;�.�~�ϳ�Z���_x(�5���4,l~�M3�u|l�z�b��?�I�>v��=Z�}���
�ֻT<���ں}�x.����Wˡ��c�������9﷼��}R7�G�|�H�*�a�?"{c%yIĚq�v�1q�����"��+V��_�3��z�w�yO��Ρ�*��w}�݋7�7�|��Xއ@��bW�]-^�A�0>8��N�����i�;�> �j׸	������8%������>�p����'���g�T� [U�U�'�^u�]pw�w��~o �T�x+��g�x�D����m��S����Sx.�{2Jܚ%��Klg|c��`Fd������.�@d�eW애)�r�qU�H)8S3���w�c�.7[��~�{�����1��ރ ~�͊7̻ �c<2��� u�KU?��>"�і�>"�]��wWwQh�W��G�v��n
��@���]�ˢ����@�A]q���;��z���U��ز��_�w��g�qߓa�0*�@@q�e���\�k/�bg�IF:m�_�T�*l�=9g�۹$D��C|����\�B�������~\���!�}��[�xlJ���z�e�;���xL{�5��*ml��NA�1|�y��B ::�����>�h�P�8�˥���zR��* V�"�⵷[������{�B�'	�H(�A�#�%:!���.~)q^�q)�-�N�!�e{ ���/�R�z�1�E@֥Ķ�����?G �)�Q;
��Y�e���+�]vB$��و5��q������{�� �DlE���ӻ.�~/���V����E�O�b�
67Yo���h ��T��=�����~*��q���qI�ReԨ����Z$�++*.��Nﻪ7>	�������{�\�k�����$�-xo�	>������͕�\���7A��"Vk�zo��څV�m�\a��!��6�������Qv1?�0����������=���@>�)\��\�i����}�&Ȧ][����s�#Q�%���ޟ5b�����n�'GBV�غތ-�������w��ırb��hH2T�	繿��������K+� %m��%�R�4�POTTd�o�Ĭ����(ʉyA�@����Hi���b$H>
�i���P�QM�]X�� �K���!?�8��4 ��ʃa�������̚U[!��j��-���`��hm��i%\�Nl�U���g�}�Z(CD�R�b?r��ql�qBvӼ�����P�n �z(�4=X��8P ؛���1�[�^�Q�.�����������B��{�>��c}�;�%~m�H�%��B�	tk.V�&8;�ɻ�D�Y��Is������:/���w�=��HslŨx�o^�~ɷih�K#���̙�{�|W��䶄(0?F��6�=S�&b���ޥx���/ö窙Nw�~OŚ�v������>�`�@��t�-Ar��]�]��.�(m��G��|��L�k<�yig��Ʌd~����[�u��m/�7̣�>
/����o~�g�!7��C_���j��@x�>��N�6k�)�/��j���@��/���H���g~ޒ�Vi_.��Ȍ�,�\q�Ec��u*3~o���p�i���`�@%�N�Gк*�Ӟ�w�Q�����#w��=H���[���%/
	�ot�~P�����������>Xg�l��x�.M������T�-=�Q{�Kș�1f���ʣp9rl|�����^��ZI�(Bj��D
�u����;-����jW{��H�����U�������8�8�
�G-P���8�ED������ȇB`�ܸ�{|��m�汷��@�o{ ���s�[@rq��#R�c,mG�@�^�V{�?8�Vn�`k���N,h�\�o��c�C��Fg�D(cc7�����;���q���_��=�s��y	n�3�����ZzR*l���_��6[k�K��?V}���}I!��&���םr�s簊�	����E$�r�X�xi�R���O���6�cWP/R�;#���P��]��i�=!*���x�Z�U�{O�J�I�*�_g���o%b��3�w|ɲ��
��Q�p�#d\��|�`с8U6᧙��"��{�Kn�-�۶wIa��1[;�v���BP���v ���6�Ç�f��&��5K��e���������>��sޅ|��䜷٭��WoPr�����] ��+�L��+�5�Ư�+2E�īB�6�D�2Eq+T���K�Q��U�@�QD=)��Ի�$�|N���kE��m_�m��J�Z�/���ć"��7��=��~/�B��!����n�R�*ipk��m��+��6��h�'�zWlAMn�2�m��IG����n���������CȘ�oCl�<�0��{}��{� ySpr�a|+d��,�7f	:�Ȁ�?P�4A���������&� ��8$�������޷T�yY0�n��� ����돔���
r�?���j�:b>��$�����B;���\�m; �ָ&�s�?¹��X���"���8qn{��ݗQ�w@ya�~B���f+�!�/\q��`l��Ku���'j�^D~��Z	v܋�e,��^��U���M8�EF��y��~��R�Wa�V<�C[!�۸e6�퀼X�o�p)��J;^��^"�{1	�Djj�E�W��ԨJ~(y�m��J��?�������;���(�\K�D�I���^ D�lK��)�T4��^�5OS�d،u���s�if��>!��Nr]	�BۦH3	i�V�fk���U����8�
�,�&�I$���_�]I�op��Sr<�I�>;�Y�2M�����h!�]a��QW���eZe�kB*oW�\ѴwQ���(��!�w�<��^[���#��^��&��ڍ��3��U���X�}W���8�q)1$��{Q�Pl<v��n�9]�-s��ӕ=bˎ��@P��?�5�����K�M�d_��X�[q�{����7� 5��>�Dy��8�/cw�E�����<> ����Ɠ�V]��^>�!��٪|�֭�T,;=�(*�n깝��i߶�IE�ʃ��t��v	��?f5    z�����NE���j�J@4���AsX�½� �o��v�"!������m�/Ů�Oa�#���+_��(�˿mIm�ԥ�a�"���%J�O(�y�H�2c	M��|7�3I]�o	��+��Y@7��}��«2����o@��	�F� s��
Gj��l1���H�����H��`b�Ѕ1�yW��]͐�kT�ܚ�b�����f�0�0q�?QmpEU����0bWca6�m�ͽr��`���C��C}$D�܃//A�<X���2p5���@^L[��I����~�	��kޓH�O��N$����a���P��I�/DEٖ�jFU!�崸L�`D:a�?���\p��`7�H}P!~�H¤m��"׉d�~v�3��j2�hy¤���x��\FX�BI�!��x�qI���Т��R�ba7�O_����G�h�3Pa,�sĶɶ���26t#U��.�@�O�͎ ����!>�&��{��=���K��}�M)6ST>:.Q��<�[!Pl_�ʸg��a	6����U���פ�¡��^C�]��4��=�!�zp�sw��^��Y�B��y9^,Y��5�����b���=N�bޣU`)��V��_���!��C8�oAN.MC)6N��iB�{�w
�m��m:OS�莧����+��iFj7�J�X�z��|�����Wx�� $��ۜ�>C��� X��şD�R��?ɏn_�l��;�@�'��(�� } .p�qS�<�312QS�w
��l���jy�R���y��-|��~�(�Ӥ�����+�܄�5,4q9�[5f��8��l���Z#��"(����*B�y�F�	�RcD�q�R��<�~bP��$�������!s
�?|�{���%�m�����q�&��|.�7)��*����ˌrl!��f�Bl�3Ƕӟ�#d��n;K$+�9)w�C��u�	g|�B�9����w>���z��Mb9w�� ή�x�5E�Ӂ��XFr���%�D@U��YC	�Ҟ�w���A&�(}�͔�
�rǳ}rr��I��T�[
���Fo�u:��j�Nin�Uȵ9a�N�8��`BP	��>�O��\����4aOi���л��=-�����=!�N��)�7�P/��m!�L�Z�]��SL��<�-r�_oTɝ�3!��	]d�	P���Aa�ؗЄ��k�E$yh7�Ǜ 2r3U�{�W��%<�ƞ��g��ˠ��(�*�}?�}��z������%��j m�����'��{g�Tã�]u+�s��̪��]P��&6�=���?���v�!��s|��L���l@���^�A�_Ve6sL1��4���g�C�/] �;��([���q�'�G1�e�V��)��?4��>���e�u0�EWX�*o�%�r���$$>l7Y��+�$�!����Z�'�th�x�b"��D���m^(�B���~T����;�¹���Dg_��ш����@����U��s�����T*1�5D���sI���vW+�� h��������"]�F�)����/Y��yJ�xD���OJ4s_�g�*����"����)H��x��W.
[,,۬A�"7�xX�����jK{i��[l��[\߶���$��u�l���b�EZ��)󃡍t�&�V�ˡM��P̷�h�	m7f;QV���:��moh��|ƅ��O��)�$l����	zG��Ĺy�
?b�q
�n0�tZa���mJ��S�wG-�5\���w��#�[>P�ͼ�¿;�Xr[f)�vg[ʖ�^���D��?F��d�r�N.�ߴ�K�fw�4�
�\2 �<��)ש#	�4�O5��*��U0�r�ɡ�e	�]�����Pr�j�1vn1�m�-���9v�}�WwU!Ҹ�'�v"�a�m,��	��4!��tS%&�RL`N�g���B\� ������
�	ul	[��Y
Kت-3ߚKȪ�4���{�)6 ��Y-�ʨ���'k�}(��Gw�/��(A��,dr)[M�@�=_�K#@j�K��������RP[J���y,!��>;���3��ȍ�R>��Rzp��{�Kx,�[�	��n�fy��Tm��������h�y��9�[IHg�=����{y֐*��3*�s�C�q�ˡ�!��ӎ	�e\�����*�k�=/O�BV?���֔��S�c暹���)�Bۗ=�=6�q����+
Υ]��)Q��)�}�-�����c|�/�6j���x7i�&�?%�%ݘ�8�t.a�v�ʰ����*����ׄ2��Ü�>P�ⶦrc)SuV��vQ�j��6ՠ ��<u$d��*@��ڷt��֓�ѵ�v�XUٛ�K�(g����x�}+�Qr� �-L�v/MEP�����i\�Sш\��x�TZ�m,ɾ��93�B��S�<�ȅ�~��}��H�M�'��u.'��{��u.%�#��Zu�;#vH��8pz�]�u�����
�gb�K��YBnb?ab���-]��t��9ܢ�ڕj�!=%1Z_��b��w6�RsFa�H����Жn���Z��--��7,xkv����c:qʋ��~Dr6�m�vA\r�.��;i?��F[t,���Z���.�p����^d��=��_�'�%.��^�	=�M[�
�U!0lt�M
![�2��NgmՖ����[x4���Į�A<n�/�uMѣw������._R|�ݭ����qs|3��>���7`�d��}ق�Z�8[����+�2��2���ހ8
�K��`��k���O���?�1�N�v�o�F�6!�t{~*���B�Me���V���|�?��ü�d(��N���I��aaX�`�A�B��m�`:��嶨�V��4�oU���k#-H�j��5��%���A��Ԗ��y�L/�j��݀~>��	�NR�������t�-ɂ5���$4w�Y�WD��e;�;�����o��֔@�ka,і(��/���-Q�h���K���["<�{#���)KW����	|����Д����T��bH	��K�-!��Mzn�n�,��G7�4�<?iV$�[���B�aK|�5���O�l#��ԓ�K���`5ܢ޲� �x�J�PC7V~�olQ���7�a��o+n㋧_�������6_�fl�l��թe��i�����B�X��N�%1g��V5���<e�)��O~`��������fOa�aM���h����Ǵ%?��Oo�pp��2RkKD`��޼-	�Ω�M�|�j{��'�-9z�c�2���a�҃�"ɘ��^�K�.�ƌ�G��}��{}D��1!5�� r=���H���r�0�G��3�*�R�k��K+� FH]���"�-X|�e# ��,����'RM DH}=O��0[$}�2Jn�l�{��E�ǮS��O���v)z2�i��`f���'�]v')O����mq�-��&�K�ހ�f�#\�A �r�l"�b���(�t���+�"�Ъ��聤)������;��*J�Nu��hF��v�#-!|҃#z3t�'�]�_u�W�RBp��T��\������w2���+G%����CHm"���Є}҂s�F�2oe�-���h�o9o�?�(z�6N[����������m�
-��L�g��/���3���}�h��tD�N�L<5q��[�h��+C����=���O9�lag��4��}_�-��Q��ۙ���Zn�!��K�����	܏@.��c���#�����}�*PZ�k�3���b=��"5�x�o��1�4�/�#z9(>�'q��o��_J$�R4;*�[̕�C$M��`��h��n�&x|�.2jY�34g� �0�02����E�x(��DDNh�G�y�Y]�������j]�O����dP�#�w�ӕpD~�����_��%�G���tf/�ލy���*	��a�?������~!M"Ν�(ؿ>p�<i�	�^��ؖMHcQ�=E�,qo�
u�Y2py���>���ԏ�dO�b"�[y���T�C�:����������oE�Ê{bW�|�w��)b"k}���ʻ�    �3���{$P�f�Q��!_��j!��֖�먲|E�e��G{�q�X=����↣�?*:���H���?��{��GL�c����~�ʭ⣒sG�.+��ѕ�C�r�T��~��㿖����;�@��=$����+b�'��9sRI��^�h!$↝�1'���[�-��zBd����m��Y�U���s_�1x�����tRQ�C�{,�D\'oxO��z��x��s
��� DîS�&�Y�0c��	�_x.��5���/�@�w{s�Xqt�R����%�O�)S������4"�;͝�V��	���{f;���h�,�3� 髁�w)���w^�.:}��˥�zo��Ac��ɮP�7���`n��K�}ąfW��g���Ǎ��\�i�9;<Ѵ�A 5c�a��ꁦ�H��R0�G�b�%�RS�������bXyd�R�Q��]�'�	�x�x��G������4��j"n#���n��CC'��u��>=�%�\�/�.�\�5^Ћ��!�������V��A�����lq5$&�*��ݔ�ܟm��jίxP���>���N㒧�)�X?���%��i76oYI�s�yN�^�����
A�vkCm<�uk���h7�2.5�F�`��v_�F9%!z[�OF�#In��械���nȧG�\_|z4���Aae�GQ�Bx�sPVp�#��#<�yiI�_�-��=�5��sV>�۲+��q$,��%D0���c��m���{TSG��7�T�}�p��ٗ��Eu����Ǯ����7��P�/�����`�b�nؤW(�n�>�
��A��=��}H�4��r'�l��͖��x���\h4o��&����U���a?7�ki�*'m�Hn�3����vq�l����VH�X��3V���/�@��o~'S7���(H��@	!��Fzț5GDx���P�`{�c��T�`�VV�q���ހRtoaS)y&�O���%��`^�BN����2�b�>O8I������"\?#㯉�l%�*L !����ts�Fo��G��"��]G��� -��3ق8�/i�n-R<�I���?�~˂�����G��0���*��@R����7����2��"Hk�'�Nj���R�"�wt��kp$F�;m��T������(�~Wx����W����<��Q�6!/#o�?<���=�P�6���l��/�M�6����V�gE�n�z�<�j�^b�N$n,'��������]�]�9� ��u�]��8���\ӴXy`i���� )�Z9AA�[�2��k�3j��q�զ-7A��$U���N�c\>mc�<ʻ%D�t��y"��	�}�J�D�Fɔ���]��%2�z���1Opܡ�1�]�����^��[9�<��֨Ej��5f,�"d��D�����D\�4�B��~�G�*=�h�>A����N�E�xĐ�Z�Y|g�<��	ed���?�#R9��c�&�D�J�I���OD/c#"3'�b|��e�h�:�aB�����H't��P�1�""�*���=!a�
�aޗZ�k��p�7���3��H�㳬`j9���N�}���S�5���G��ި�(#���Ξ�ʩ���ۂ�!s�*B�����Q�=�pt�\D?�le�J(�mh_�G9�6jưA"�#7�+Խ�zflf"ƅ-_�k��V��E�ǎ��X����?��=T��u�h�l��_�
/�B��X垚�,��=	a�VI,�hP���8����K�������Ág�kܾB�W -!Zau1v\�vY�i$�޹Mt�J}UhEC�g��8r"�n
�^������?ӹp�{�d�Wl�p$/ �ּEG��4�e�-��M%���hG$BV��*����̒1&�d��§����'���va�-�� P}k��/y���Gb���^w=��q0�B�PB�,p�\4g��T�t8R�f[�ni�����C׎}�IW#0���>�tS>��E�Kѿ���kq/��4njQg3�Rw�A:���͇>GB኉;m�a��^a�GW��K W�;�N�@N�'T��w�ݹDX`Q���M���Y1x#����v<�~>�|<zL��;���p�����G�Ǹ���⁤��ٺ����*��է��$��ǅv����e� ��sF$�꜊�Hh��'�t����7��i�6�����;������|�ӻ�}y<��{���ߕ<��.�Έ���|Kݶ������M���nqַ�ɴ�Y:�E��|���}|ۢR��ڎ��������i�K�} (��*�d��f�(gX���|�����-/^�s�<�0[��B�	_��c@����[�('y�
�	�zɯ�``(��j&�T��"�?�`�	��\��H��фI�b��D�S>0�<�&D��0�t"I�c^P�^�0�pBV(��\^uj��o8 �����>��(�/��ɱ�9\H��I��	]�=è���-c*/Do^.5!:�{P=�M�4)����;#}�)
�C6X�r���`�0Ҝ��<�'�����ho�E�:��%&+��@G�%_���Sm��.o��;^��+��Nl��9$�'9��6	�����P��OGA��.9��E��!�P�n�.���N�Zq�A�D���Cp�|��6����M�f�X��h<��]b�Bט�qb(y������Pb���X�H��D��O��Զn�b���~"�;q80�$DI�S1O�ĺN��!�:�C�y�2���ф4�UA2�r[�0�ce�}��n��s�'����=N�A2-CD0����n[\C�lC�6�M(5u$���d�|��J\��_�$Dn?#٤�i\-V�P:Q u�`��\�]]ǈ��ʙ!�{��SE#��b�w�]�c��w�&��:�bhyL�s�;�RD�D"��{κ�O�t��M��'�
;�d�5�[�*���?HNO�{�d��Ag�K��]�
g�̗"�n��1��rJ�>ɻ���{�Ā�J(�!���ƀ�[yX��a��E��u����	ū����οF򋄑�[e�q#9�jy�]��}F��	�!�5�A�g�	[�_X�;:�~HRH�;rW�?cL��v?���	���m��y�@���nh�V�ݯ��pi���h�@�C�d��
ۧH�&J~H>��v{u��r����u��Qrܻ7g�]bA�L'!����!A�b�}���� ΋}e�{�ϯ8>���&Rh�c	��웬�Yd��΄R7�q:	��oZq�d��¢��:�M�#�]�:\��6 �L����E�*-�y���Wɑ>] �����,��I�7+q�ıҐ�!��l��G>�w�����°�ѓP�b�r���1�<!���A��b1���5A�'}�?��l�'2� B��c$)u�I:<pq����*`a`o�R:��m�!=���b�ƙj�a)��揎�N�v��Y��P�:�K�z�����]�;�����q%8���0K�����n ����n�����a�e*dĜ�o�T�SS��AL׋�K���^�M�\𷭈숯C|"�g�UNO�ޯ5vn�1o�
m�u��v��#b�"��0�!���)'p�ӏ;�CL����������Б:�����CL�>�{�����WلT99��SK�S]�5U����`
J�y���wE�l��á�	��^���`i����ÚP���<���V��̡#���N�8s�]	y:RgBg_��Ύ!��*�L�A冘0bs�b�h�늀�R�ͩC��5~b�Hp����w��{�
������خ	��� $R0]"�"����`�
2�A�~Q�w$�qK����� CL�0�Nͨ�^�a�ܺ�ێ=���"s�tdRNT��ȧ2E�"�s=��{0B�a��L����	P1����0<����!݈�Z��䢸I�%D�L�t��}ٳ�`��2>�+���V�<"|�σ�X�    |0PM��g�ܨ��n ��s�sB�r�L�^
�@#�0n$��$[���=���K#Ǝ��"HN���£���16;�'W��Ā��Y��]�˧����'$�S<)v�g~��1EIo��T�sǠ�oRN ���I	}��� �ٰ�q�g���8W��UVx��L)j��P��b荟�"<�lO��)�w|��d�-�]�[�@n��?؈\j���r�7����t&aĸ��v��9΄H�O^�����S�1�d����C���ः�98�+�8�1�2.�`f�r�$q6vBt��{֫�Y"��I�� �5h�Bl}�"5sB^����cNzNS,����@DJ%�v ��+��g�K�>���!_��9�����B-.G���&�7��KB2�Xbi�)TZ��_")9f$�f�[��ǥ�r��&��r������hت��V�%~[PD�p���X9��Nr.w2,m���Gq�!D��m����+���E�:��a��-�x:�n�R-��2o[�}Q<��˼}f�J�2���)��A�Ħ�;u�{A$$9�T[��X\��%ޭq���|ۇ�m�@n��6I/St�zZ��;�"�l�����pN{'��a�[����֕���<Bl�TK��+/������9����$O�M�x�f;vU��><�o�%�)�Y^c�+�G��/�F.og��pB�Z���[��)'G+2�?m#v��n���1�E1#��W&����T8ϴB"nP��ȐzK�Y��O�oΕb&�A��Y�)Z2ղz�I��d�e�`NZ~�L��٨��S��r�l{-Ҏ�p��.��Jȫ����%�+��:��V��XDR��X� �K���pf"���x\�%c-]��ֽd�%6�W�2����
��B�Z�]vn��F��O��N�d>|aq��8o�O9��8�U�!�̎�u���*��{&1��v/G�t����P�ȥ��IC�)O+9l0*	�Y��E|�o�&��&u��L��ڥȨ�fW��2��DTE���3�WRb��=m��"B����s��j�Ɠ�|���F���C����D�41J�V����G?hBǡ�
�9��B�@	�%�!����}Y^�M�%�5:p[D��9��(M'OXҫ ��w5�������MY��N:C8z=&,
��	d�C�r���"e�QtI�^��79�0�_�o�r�J�	l�̤="^cNN�eP��C(��M��ɩ��A_j��'e�	Q�KCl`%�*��������X��r�蝞���'%fŹo	�GrwNE'�~�4�l�\BF�7u�K��.z?D��6'	w��tOO1�8�*������#�;?�������V����uX���xi�/���2�x�����y�$f�k��C�%����]9	���Q#S��7�B�I���'�U� u�o�>�<-���4�\�:F:!��%#�꒑퍻�E��%�"� ��0l�/�Ļ"5�����Sh➐�ě�����PfVî����q5�PDLr��[�^�hBA�3P�|�bL`"��O�2s����L�	5_TQ���!�P�_��Q��+�/2��[�*�H��t��OZv��@�I���P��S�@^�� J�K ������QQ�r�U��ySwu��	�2u�Kܢ���oa?���Po�5)�D2e�dC 7�$]L^*B���K4�T�<c	�B�sD'Э��1���V�kթ�rM�w9����u1��ϒ�b4��]l�������W��p~���#.�ئ�8Q�B����B���W�3mB�p�⸿�Ń׻���-���T��]�x�[��t��s��բ�[pU��p��S���pz��e��rN�O����n
�a��r��H�J�*=2U�"0A�ȩzo����#K0!'�؂g���P�e���l�����q+7�;����rm�x�6��v�7r���}d�x��o���D��V���+d�^<�ʛ����ۉ�j�^�=9~r�[bN~��Gp�:�d�-D�A�ڸ{��S!;ᝐ������3U��k�_l)G����~K9rB�C>��;��4��n�ጄh��ia,�$��Ad	�E��`���<�4�n�,l߷ޜ���ұ�ى
0�tL�ѝPS�����?��`�7�rlĄM�u�8xrr$1�M�q��-:F�T��ܷq �IH|ϥ1�5!��1��D���j/̿�K��E�4O��<>��>}�A�2sP��8Bx�/�NM���/bɌ� a�j
�TJQ;v~��TbI������ă�i��o�(\9r�}��C9R�'�+��=K�MQ}���ɖ�b<�C������L����<��(�� ���k��J����k<��K>�x�>��7��2Q'�����1{��	�9j��ڞ�B:B;&!1N��b,,���5�[�d%�C�B��N��Hμ���w����D$�U	\e2}rE�J�e��\5�ܿ��5��$��O")�M����EQL� ����x��"r�������$;��� å
5H.>�����
��E���{���'"E� .��
N��KEK����)�����+��5�~>B~c�����侮�Ǔ}���㲲_$�� ���<.�S���}D����]!x\|�ap�#���Ь����aW=��m	�YV
�@�0Վ����p���H�=;�	4�3�g��
ѭ�$6r�w�I������%+��s�B_���J,�%%��� �|�'|�e|���p��Z1/'v6�a��#`{2E����Ԙ�Xʱ�'-^1z���us*���>�r� �3��䪇d�m�#~���N$�;4���~��#��B}<2��z�KE�%�󹈬�>�}��pN�ڊI��su����]��p�D�yΏvWޙ�D����Kǘ���	��L��ڑ���&eˣH_L����D��w� nޮ��b�c�{��� �-��/�ڎ15�ޞ�2v{���P6e�ؾ�����l�'B�~��[!%�sX�\q}� =^�'�A>�ȹ��6�A?~+�G��/j�[!�T�'k��8B�zO�)��YiF���Q�;
}�ZNBd�n�$�D`S���D��[�7xkl*�Q��r"�A��~�"h޽�~
eR`��(�`�҈��>
�����O�=,�.)����9H������ux�;���0&�r��!�{�������]B����)w�	��}p�C;˜��������XH�7��"ٗn"�igL�܊4�����+/�iАc(!�#��<�B�G7ge�m�!�zoe��:E�K���7�ȧ��X�p��z�w�Me�^B0|�M|�8O�V��{ϓd0�B2�rr��#�����pF��*HN�|�m
���rG`��E���Le���DƇJ3��� HRh7j>�:��`�ݞ<�2,c�05;~�L˩��:D��4���x�ʸ�Z�`������hF.|_L!҇�j�@./��'P�Z&�J~(K�-�q�O������Y��iމ9_n��(�|����Eq�M<�
��ݘ��_5٤E޼���Vȅ���S��u�72=�C�(���$�H�|_�K�-9�ӎ������D>d9����Gз�!%���Wr�����#~�>��/E����^�*���{s��V�]I�$S �P���7���=Z7� �p�1?3�-�!*%�fy��%��&��ͽ彤S%#�j��Z� 6�\�]>�O�P�IcqW�=A�&��0�
�(�����_3��*=s@�o��-8�#�
�����	�.�$�:��9+�L���h̚'[���	1�:�D�QyE�;�0��B�YZO6)%�&s��a���"�j����=���E�Hc�=��Cu� N�]!��D8��!7K�΅�C'~~�����R?��dr`�g.!W�[���`��kf��<��p>�"w<b4���Y0�L����j�O8D���s�K%    J&±��:z+Uh�f�^KH��`&�
�J�y~+O1߱���X"��O}x�(fz�Y�-ϩw<6%�~J=�;�.jb�	�OA'A��o�F�2�P$o 7������7��Ü~b�Oiy�"�.��GNd�@�'��\��Z�ye�}O�B��x�G<��H�rș��&�=3ۺV�E\����Jȩ�ϛ-;NS�ܻ�sMh�d����"7�� �E�>���q�{Ӣ�����q�zIyt�d��T�^Bn�Ll�C\*x��뱰tsc���͒ӱab�9-�	-Q�1%�38}(z(�y�,C /.|�u�w������^�9��>�{��b��X�ێ���������N���E��>D��⚈`�"�ԩ`�!�u��e�%Xv�@`�+z({B�����'P&ķ��X�D�>#��{������b�����~�_s� ,"n�`�`\F�;�d�O$|��&�\U�}�7o�)
.�V	�UDo=�C��a�ƶ�[)!�İ�V��|��^Ө�˧����^�[1w7o?�r]ݼ#U������«Q�a:���閎�ǦI�����w�T$��n�x+R�xO��J1$n��b,C����U@9%\H4."$��x�6ފ���xx������a��8}�d7B��Ô	\D��})���2~"�p����a�_����Y�8CU���VwB>�fd��B��c�eO�Z�P�z�B��2��&j���ˍC�������W�s�BC�Ǎs�BY1६qy�j��	~K ��6Sj��&���K�q�p���o�)N�è:q�<}Ѳ���4΀ABn�8�Li?��>��ť�r^�2�RU�� 2��0�M��Mr��9�G1�W��5iv\�/ώ�3�Mx':\SC��}��/=!NpY��-E!4fN���B�Dm.�U��)���r�8�f�<���gN�&�ǫ<��5љ���(F�pξ�z"�����}Bn�pc�
�\����8o[��%��Ȅb��.�8K��Pa�2�I��)�Hz�٭W�_2�
�����W���<�$��I묢���>�:��\��C��[P��tٔ���i�[�k��Y7���squ�*
yxVb#�V�d�&�g�l�[	D����A_d{u�"e7�ZM�z �6�M�j,�!�r/F����R6�i������mOn+V�{Q#w�S �t2b���)*�ԥD���Iȓ���~�=����B������-��������}y2�Q�}lD��������gH�bתJ�H�{on�TUo[��;ʒa[D�%w�-/"W�]1�e+�,�DO��@��t�H��1*�=��o�_��d�A�*�V�C�[==e��ɨ�b�r����k��k��vF�@�'��'�ot��'��hBo>ꇌJ"�-%>{ˈ�v �K/��zHaɳ/�5�&w��1e�T�9*�|`I��\u�i3'n�&�2r�WhxM��zB����~�To;!��^c�<��)�X��Դ/��u��:!�~�#��N�w;�)���?Z���6"���u�`^��(V� �=�d�f�c�ŉ���E /GJ���_�r�^��&�F���|@���fКAv��/�݀��m����P�4�����P��a�yQV�	�	��)�{8%��7B4����gI%E%1o�E��6�"p�<�=�К��SW[m�8��ЊjTK(����9g��{WF��,U!pl�n��{L��m��t��[V�]����r�����ȟpH�1�u	Ĭ��g�$g�C� �w�ˉ�bkBG�I[�|Es�����Q�?y�����Gv.�d����@^D�c�G����B:i⺰o���oM�n�#�i�9��5�O��j���	�	s]'�3\
�0	������c�f3�FO��|]5!�1� ��g��q����=}��O𒦁ލ>�MHcb�'�	}��ka`���%'�����t�B"��q��}j	)'=m}3���)�5=����x���ۚ�Ů�d�:� ���K��y�3�������$��>�iL%hMXD�,>��������wL��b��Ԛ�'|�H�Ư؍�{��L]�R�{Lr�� ����Ё;��	��cx90BpFA�N�N��Q�hG�h�h� �><����Hu��e�}q�0�'&Z�h�^��#��=о��	�F�g�Á��H�&��s�qH�B�p�t"W�Gyz�]Ju�n�>P̄���[�`n�RL݋����>5e�.��#����i~g�oQ,�p��?��T�kf�'-��2�4 �FID��٢5��dB�i�)?>;�W��Bî��B��a95*�.];�a�F�@>E~e�S"V���`)Â��Dv��������M\h��!�� �I?�˰a�r�$�ۻdv#>���9�~��钱}{�V"稀.������S��Y�� �s�D�8ae���E �(���?��fpl��<��'Q�3�$�!�0z�^��dtw�o��j���A"!��1�q�����`Vr��!�(�ѯ�H��WקB�pט��ga]l��Ip���b�FM���4���>��]5�:��޵Ұ��}B�$�Ҩ��B��јx�'C�����Q�K�w�9ӘA��=��9�X%.U[�U+�V:�r{Âɫ-���9��/�P��B=��"�� �}y���s_�K�����-ǆ@K�������g�`�ގ��P��F�O2��#|	�:�Ϛ9�d��P�g7����,�Y�M�m�E%��u�g}<B���kb{,��T�	|ST=+�`�.�\WAz�\O��rHI)��ܢb�Ι�)��zB�=�U��.g���=�D���i��9%��}��c��k���(�pL��N��%�_��v����q��g>ӷ�Я�M�`�ta�O݈wK@.8�rX	��z�$�\��Z�<"�>����	Cӭ������ҳ'�$�k���w����i��4�#yڐ��u���
�u^4"��Π�C� �Lf�<�$����'��G!��9��
e�^O���_��s|2��g$u	�Ӻ�B���F��	�)cp�z�-|�O6�B_��Rb�\5,�8(����F�ñ"�A�&�3�|S��0����E�_��!�[Wv�F~�:�ܷ4"Z8���3�$kC��#�+ӿ�y@�.�u7E���.�s����v�*�[ #���|����}́"������gH⸑S%~+��8<��xG��HLEPy,���yG�A=O�!x�̆#�Z�\�!Hj�5=XCCgZ~ƕڦ�gz<���»0O�C�a����]��X�
O����HPw���Z� ��|�rU�U�x#8^$m��ȍޡ<�0�`�d�F��I��q�P�?�4���Oȋ���4p����Ϣk����`���Ӿ�>Չ.�.��U�⓽�$��3�rCt�l`>��BK��A�-�0�}������ҹ�+���b~>���Jm���P�W!����(Tv�� Ε��t\��t��OB�@ZdS���\��:���dM '�3�Ċ~��4��B��Y>�꽹c�`���[�$o���N���s�X�m2v��@N_gLo��_m3ݦM%��F;��@��~�rMg�\�j"�����4[�)��Oa�r�×�Q�b�m祔qy('.���'{���"�U�� =����EX�,�1���qyp�����C�����m�.�B�Q��5��jy>�p�C,g���ev\ߵ��j��2:ؓ��	��P�(W�Q����v>�/�>9<��N����Q�]!H�(�1u��7�r�:K�F���&`'zq�����[��@�*���)��R��z+�[���&��Ѿ��M~�F�����rE��4�f;DR�ǣI'M'�`�=K���=��iJ���T~�Z���dx�|@��1�Dț�<7e>�O���-�x�7r���YAhyG��gƼ]B��	~K�qq�P��BQ�EtJBv�
GZ��a�[���,�{�d��w\�\9ו��e���   �MD``)!g������i��	���n��!!s�����j�}�\)$c�>���� ��>�Ic&��M�)�s���d��N@�Js`J?��u�.��R����K����U���0"��I������2��r�!+��;��u�
�?�lr�JN�.��F(�V&Է%�u$a��d�����ێ��J$��`��[�1I�}��ݯCV��v&�6��bt�=��C��(��\:%f[��ѡ(FOqmA��µ��I��+��k'�g n1x�貳M��4��ꥁz�$Ū��T@\g�6?�T\�-�X��^��R!0��oC��4����x-��O;�
w]ށ�Nf�=���#L�O�m9L�h	���Av��~��J�����n_�>��
� �:z���klU( �n�W���c�q�	A�0.��������sY�.���J�;�����2�4��mo��-�^�
y�وv��g$i�0�#HNl��=Z��,�ƅI��H����0i�+���v5��HzW7ԑ�W�AWno��{����l�{?�(ÕctH~c����"}@u�)D���-��'5�B#��ѵ&��'hk�\T�+�=w��m��pr5�k�O��v|�,��f�w�-.���\gk>��p��Dnw��6(��e �=]�72���H]]Ge�!4��(�" ��WM�li���4�� �	F_r���VTUDdѰ���J����$��je@h�Q$�UO���H�#ۊ�R�=[,�M څ�É�@�\��D>�G8�=��*��-/d��χ�<q>�u�I�脒	׈����,���6P���qپ��Rp���L�����k�G}|��7E�P���q��y�Ca ��ʈ��뮣%�.�1�(�U��(E!�q����ݚ�<!�(�t�\�;��i#%!:|C��"!s��D�a#&o<��"�r����@���&���J�14DCGy4���Z�Y(.ǵ[�Ĭ��-��G�%�L�H�;B�a�$=q8�c>_���'Q3��q�2F�5���ne�@��H>�ƒ)���⸪�Qd�1dѯ��yx�e�����w���1�<�l��k	h}[��9�v�ͩ���ܐ���ZD�ր��
x7�'0j��ԁx=Q~bx'�J9���v�n����8�!D�B�^���n�]Xt��	������k��=V����aX�QF	�=.������UN<�iڄ�q�ѕ�o�C�0��7���xMɸeLx��� ������81qPד����4"������r�>y�ѶGT� >ܦN�=q��3K��brģ��9k)냡��|�@��{���'�OX�3�
`<��@no��t.��l> �E���.ʆ��\ok:���w�{-���	�aKwcDÄ�����j^����є�L�O(3'n�s��X'��@no�y�������wY�������bB��R��?2r�mMw,��@�/��G3ߢu�af�(�6Ć��rtH[���(њ�g�K���K�FZv���w�`���O�&����!ˍPz���$��F
j����bیS�L��	jD+o�c?��G��^�@^�y�CK�y�yP�WM~�S/��i(Z-imѡ��V�-zn�o,1d��4ae��M�+�٘=�:*�3Ek��1��c�k�:"ℹshMM�Q��9ӯe����<�8V� ��Ȥ��H�bPؓ�8ڝ��m�O7�k	���.�ҔPL�+�l��p����W��c0�F$g{{(	�}ݯ��(�<�Z�J�ުN�#��7VN�G�#l7����H:��Q���)��y���'��ӿ����DR��]:k��Gf�������jBjc�!\D`�D?�#tv��?�B�n�Y�
���Pm� .��M�v�q�l8�L�8\z�� �/�Áo"�̆K�8�{Ъ�:�r�I	���C�'�$cdJ��	�=�� {�h@��� �i��%b�U����7շuma<�NB�]�W=��)3I���6�xC�}$��a�Ws	�WN�î��B80s����UF�Q�og"��p0v&|r�y��v} �`�Z!;eD�1��(桻��S �>�I�B�f8+w!�D��n���~�<�}fhTǙ��#4FB������s�I�E�s���`��u�HX��&��#�'�Gl���v�OB����K'����'K�ylL4q����v�*H�3�7v-��6���P�ↁo:�P�����v$�A�lL�%-\+����p����Dl\O�Ē4�8?b���ێ@�1�Ӻ�A-<{ģ�{�bx6 ȗ�S£�V���c�f��.��х��t­�9�w%����&� �&���݇f�P�Ή��Cc�G0τ��t��û�Z�3(���ݖ�H���4WAH�-|��Ҥ�c}x��3���HK	y�fӜ���@[+�uz"Q���q��V���4���;_�=�Sx}q0�zů���#���L��6��������"qBJ	O8�4��{��H��m�1�]�H�[^�쉿Rgg4FBV��ܲj|���tSn�qb�^v��'@|=˃�
o
��T<���.��L'u��M��}�0Ɂ��Q�ΌD���mKؠ58c1XW�ܧ6NEL�l~�@�/-$��
��Z<�b�)����겗��8�\p�8�ƚ��φ0���<s��'|}���0�)J|�V�3��DĆ�b�(�o)!�}�2e�=D`�2�3����W��"�rh<��Z�|��H�\�M�gѸ�|�	�qQ�[ o��,���(6���E/_O�����"��w���]r�	�"�(ZV��f�=0����SQ��U�;~�D6v�l��I^1�mA=�'L��^��]d�byJ�	��XDz �$3@ܭ�G������$���Ƨ�C�2�h�n#����觼ԬO��b/��͹Ћl�k&�9֔er�e���jYy��D��<	�F�W_5ջc|8�	yF��z��7f��pڙ�J�Yp�	�C����S1�(nŹ��'D�)�y�y�]!���#e}�Ȥߘe����L_$Q�,pg��>�%~���!�E0��c�y%��� ^�'�VE[�K�?�ݷB肁k���ةM$�W�9�gv^�ت4�/�Mg>!/QQCW^�����҉x�:������fw�&rM�-L�G!�&eMޘSX��b`Hi
�.
&��\`>�!�40��{Y�7�����%�0�@���s�YR�Β)	����}p=����4H��w�����R5]w.
��Ë����N�g�V;�����3�  ���w]
�-F�OA8'����)a	�%n�w)��.qk��Ky2��(Ɩ����h�"D�'��#["�["C���H��U�O�Y�#��6Jc�!����R�e����sP�Mh�6Ur�UgV��{��}�έ=�x�E�T�@�F��GRxz�}J�����9zb�!N��U���3�j*b\�1sd!�i�+
�#��#����߻�Չ0cϚ��M��o�<�{0��Q(�E���*L�6��a�9�,��xѫlz $!�bM�h���"a�Y���U��ޛa��/2</mr�Hz���;��1-�*��D;��*�0mf��٫����ZBA���zRmM����?���?<�ϐ�ݔ~�y���7Z���D����Ǝ��п=�hVS!�\��{�6!�0�T���Uf<�4��=���Qܺ��AD;U��"�s��>��QRv�X�?������?H_E      �      x��<]��6�ϓ_��; 3�D	����b�r1���e_�nʹ0�u����XE���x�� ��i���b�XU�*��nt������zlV������m������wc]��*�v�_���V�inKE�Z���i.E͆�.A���·]7��X��n�w��p����+���s����p?��n{�+��醮�OŦ�Cz������Oź?/�@�:L�[�����mq��i�]ڵ���F)�0�j6Ԭ�����tD��ݪo��)~���g@�����pY����T|����)�=���0������QN25�vj*MMŅ�,B5�4��Dh��P��~�+	����s�����(k=@���l���14 E�HR
P��F����	��*�W�)�+���	J_�k�a%���������@���py�R�AM~송�Q�o�%5^"D�|J�?���	6 �2�lST#}�53	�0������2��_���>e͆�9]�n5�ש���gt�����Kj��<�m�a�A}0Z�V�ݧ��`b���[W�P����������vb�[P_P)k9BSS�3���G�N͆Yߚ�����>5���������Os%���2}P5}�RSSS���)���9����>��K���|�]0��#���S�?��6lw7ڃ>�F�L1$|FZ����i �9���d�L'2��.j��=��U��*WX֎�:���l��Yt��uj*j��	�
d�بA13�D�*>j��Ԕ�1G�����z���&(�Y�2c�s5"���7$��JN�DW����?eיi���D��8������lڜ�h+�M�6����;�a��}�O�i���߇m�V~U��Ro�]�濊����)��m��>�dau���q��)8L308���T�aě�Q:�Vt�cssخ�o��9���Э���.��i�7�>8���[w���ߢ�W|ڄ�c�� L���Ȗ�T�s�̭U��y�j>y�v�=�U���j��s&oh���}�ƹ�u�cr���:I�@���ls�xE�[��P2a����9z)hO�	
<��)`�<�s���.Hq��婩�䩙�����~�����F5���4�����+�we�@i4�^�Plڜ.۶7"���z�^�q����N1w���m��O��E<�|_��ч	R<v��~��|>��r�P������!���"|��9���yܶ�xlK'�S���ð�t�Q� ^�DRI�R�Ѽ���w<��깹t�_�Rx.����eq.���T�D.S�S\1�Y�ԡ�AG?t�o��*��aG�55�=����*5�O,wZ�p��x`d�3�T�/]$�2<Dr>\�AO���)����G�4@�:fsݵ��xP��=����|���>L0�bts���ST�]5�7A�㈁����|���զ�Ž�4u)�p]�V'��V7���P�kQ��]k	J��r��2׆3?Aii��;\�A��W�C��F�;18���e��w�O��ZO���}��~��x	��=E~`-Z]�^����-!cE5��j��Rb�W��z�[\�B#���r�U��X%�� �H#B9	�E'(<6�����"��H4J�)%$gZ�1���6mL�i�����a7���ݱ�?AX/��	�>����i(q �FK8qJ�i*�^#��|���o�R2��N����5�4���i�� �U-uG�W�g^�u(W/Bi	��O�?.��¯C�;��r��c\#:~�i��p����mi��l�ET�%/4��<>�Q8;HPes
פ柲��Pf���"��e�(#A��ri���P���j8�r�f4�\_����
+/��p�K(2�Ҽ��Kz<Fˆn�=�SZ�x �w����%���<K�m��cD������C���Oq/G� �(�F�y�T�~��u�aұ���Qs���x�����f��rz�R��͕� [�lt��^��Y�E<b�����_]������P����G�����v;m�Zfz�W�Ak���m��8C���)�,J�@���n���*�g8\��
zv�������MN�dDCN�f��|�i���K����fn¹�D�@=O]�&^�q��6E8����}qlw�Ͷ;��3��a�^��)�'0�Ǵj$�u��c�T���fFR��Д4d�`�1Y)P��0����exj�r+0�E�K��Z��O8�4�:X�R9�_�M��n������68A-je�xc,+:���~<Xhƒ�4��&���cC�1��h��)0� ��c��T��HC����Lm���we� ���3e�hE�`9����Wr(mK�2�?�e��X��.mF��o�.��h/ ��M�?55g�Z��W�oJѯ�>	m���+1)H�iS1YUנ,���&Є�,���%�)�K�����z*����(-N@�J�&mq?���i��-?׌��%%N��H n�!�I n�Ӑ�- ���w�q./B)�5?�AZۚ�i��d��_R"��s����O1�����<b������h�և�%�g�ڃcnᆣ�����Ic�[�+%�(B#��Y��Ў}Jhj˛Y���#'-���|J��$��&�u�aP#�1qlzj�#���Eޤ"�OKB��PQ���]�(��A�8on}4B9�	���Znݦ�x�UQ
��1�5j_��r~�r1���>����s�n!�6��M��%����;����35�+	Fe|[$�L�HP��܄�\MI�V����E���(|MH�3m�!!)�)�ivʀL�iDޱ�^'��d����45�vTņ��VjK���:ZN����-�L�y�j��Wa^�!!�r	ef�HXzf�lԩ�4�*��ٲ���܅k��~��������^q��e_�t��/�ʀ��V�
�76[2�=���f��Y�[IS5gM�*��"����ÖN�T�f~�Ӧ��Қ����W�v��mۇ�
��C}E<W��q�Ʋ�v�>@�q��2{�p����ƃM�N��xW����n{<�`�h:Q�`��M2H���W���p�r��'�f��7�5�����g���\N�nٯy)&F�mZe�֞#���X�`�a�2d6�*�Gj�9�_�α���!+���s��r�����O8�\]�[�~��E���� >ph�S�ŨGߡ�3�����b�*�u�<l�J8��]q��O}8�c�˪j���:+QE�UÛK"���kҗZ�M[��EP�r�c]s43� ��*��E>y�/��Uw:Q��J�f ��
3�,���2��`�
�@IaV�M�ފ.rTt솛 B}ǚ��c�,J'� ��bg��B�`�v p���x8D��:ĭ�/NP�q�>]�Bpz@U�]p�ix��㾋�8nw�Y"��V�/up����!�D�3x�q�[�*���~�K�i�Cw��k��.�]#B]y�kLuT�DL��K�;�!�l]���j@�
ע�͋�\bT��Ci��z�?���,wSV�Rw�z���J/wH2�����=�ڰ����}�1�vا$ϯ"���C���i&��R��"�M�<Oj��9lLuU�)x�)����ֶv@F�H�SD{{h�U0�+z�����q�R���PY��J�Mq�"A��V���>�|�eҼ"�)�P�|�e<�"
a��[���sEh�k�ϙ��)���5Z�碽�222>����ٴ��1w��\��$�;N6k�@y�O)��������J��S�%(`I�5�Ӵ�a0�<�'����t�cN�:-B	�O��N�p�5��r�*��:�%�N�՞ӖE2@�j%ѮIԳ��&U�4�&U�R&�6�)��5&�j�PM��O�����[���+cv�Mo]-����h�!e��K�?�7�u]�����9[�����2��K�
>u��'�'o��'�#���� �ޅ���"T�y�*c�G5�Ǎ8��bc��|��ј7�ˡ^0F囹$Qi�o^�  v  �y� �n~��X�Ӑ8�e?]��.�!nH����ˉP`,L*�,��M~e0�;!@jR�f�o2����̙a7��Dv�0��'F3Y�	j��үB���f�ޔ4�d̦Kz�9��I"R���L���+e�z�H�VW�WPfJ/BN@�G�������^X��f2=Wg�_� E`���硰�0�q(�'�Tr9梔��V�t 0��h��T"�u��P�k��L3���O��j���"<gO����?�?K�+�\b=����87Q�4')�`P��%ӑ�S�X���#>�z�e��|$C�Od��qF3D��
�6��:#B-.۽n�&^1��D䥍L[J]�>���D(s
헮$Ea+b[D�xޟ��6�z�������y�7�Mi��)�\��������;��ѵ$�r���_��o�f�I�iҬ�<ocJI�L��Z�&�1�?�Lיm�vզX�i��q��)1��'(6@��p��+�zP"������q=x��m<�]L�_L��6�f�|��M�ϥǥi��c#	�6xSq�S����t*f�ef�9�9�c2b%s�K.�S��FRN6�,��`Q_�\>�;/-��[pƪ��r���?���5�A�n���e-�Y�z�!VY'B]���VK]�|#�{n�/By	ꅕ��ȩ&u�@�M���Y|���~ͅ�����Ҋs�	<�of���+Pca�sK��]%���(�0SbR�]����$f�P�%�Tŧ]Z�)1y�n�D�H�fr���R�81c5���j�"a*�
[���)���<=E7��)<�f*CP�S}
��MeE(O�J6�"�J�4�`̟2�[���(H͆#��򕗈I%���^Z8���n�qN��ugwx��5�`���
(�Y��}�g3ݱ7U-Ѭ��/���+�b�;u-��2kƗK��|��*WI������N��5b虼�$����;�EO�J��2��5k�Qc<U³��Ta��t	}�ݒ��u�ٍ(�JB�?Ē/F(/�����u��t�]s_K{�=5'������N���GEo?���Ź��ӷJ�$*z�1)ߞ��Œ�Ko�jz3s�b B��^E����Uf�!��Aij�nV�YW%fҝ�靟4@���§��̮��V�� ��r:C�7��:��D$�����͗\��������Pf̚%�q�$8CotR3�w� ��i�٣��z}�H%7�bsW���/�RyEM�Xd�Քʙ��b3���C��\�����Fؙ1�PU��1}�����XZ����֗��Vq�9hGﳺ{�h��[����]�rc'"���N�sd�ݜ������S>A��
�u�4jB62<W��"��Cㄬt�߲jyV1x���5# �'�
6�%�X���zr �L8�������M�I      �      x�U��z����w�|�iI���$ۻ���q���k{a��@�P�x��w��?Cp����iCv9����_�)����v�7���ͺ������߾>�<z�}�Ϛ���za���C78��BX�C���j_��Tڴ����b�V�*N'n��&�[���ž~ߕ��O��PC�~�<^��jn�!����F7��	'�/��`V��EOl�a������7?�[r~����D��<���J6���f���o~�k)�1�_>xN��U�5ݐ'���:��>ї��O ��(N���]���rEn�K%L1t��.�_�D˱�8vG�m���Ǌ��u��)�d.���CM��XK7����\ޯ0��w�]78��[~aze��ut�Η��["
~��2mp��9���2)��Ɯ�����'��7����>'m���|	�-�y�չ�w|�� ��i����6���K������.Y���;���X�7���9g2ƭw0_�s��W���5X�P,��	 �x�[��BV{Vcp9�j�}��H�� \���u1���H�FR�H΁7p�q3e�r���B�b�J���zB�\Hc�vx���|?R�b���-�ݿ���E�3��ymJ�T��k��A��͠�	�)i˵��&����3`�o\ڢS�뗃wm�(���jG�f\�.Irr�c���zT�KYĎ<�X���G�[�&s�r���6(�5�� ǅ��K|�Ma�KbE�Z�_q��̯,Z��@��K�9���ݥε1M�~�ˡ�%��(|�46 k6\~*T�6��si,��m�k��'<�\ll�B>1@i�cTbs��׏��b�oh�Q�������<��uE�`��5w��5pö(E�6�0�/2�����2�J�����Ңy���+N�m,�ܮ�Ŵ�u�F�K�a.��	by�Ս>u�Áu/?��׿�PS�p:7 �B��t��h���V<b�s'P�}�	�sZ��;��JN��B�k �iG}����+�Anf�,?�Z)����+ME��Wk�"����5o�Kx�)tA���Q��s0�r@�TF����7��m�m�n�Z/�E�Nnʓ��)����z�}Ȱ��1�Ks�˖:�ŚK�����w%������:Q�]YM�22��n��+��6*!P�FO�S$���lC�ppHTd�N��u^?Ro�� }��,e�b�jW[��[7��T}CZ%D�Rc�D%��_C�������qL�,�!HU$�urc�x�,Sm+�v� ���i�r���D(V�e�\N,i��Bme�A;@���h�=˧��Љs��asyJ����]�a𺀿����I!`y��P��|�"6y�!Pc�q���R��	X)]U
�6�~Ca�Xw����=��f�M��$2k_�c.��
N�c�#���펾�M���Nho�/0_fP��@E�,_;�a3fe@Aű����w���ZY� �DX�u�n�}�\�z�׿nH�f���d�Y4�r�]��8��a�7���*�=+T� ��7���>yhP޼~�nZ��K�:�?�-���je�kf��ǔ�#�ᕩ��� @� R�'9Ygq&��;
"AŎ���e�dK��ܘS(c����M��ͭn� ��
X���J^�*k��Ph������r
�D�*Wo?��ol=q���~�!�J|?Ry�`�(�m��q/�8��e�)�,�r�Y�BKRI�|K�ǃ�ʅ �M�&!|_��Ӷ�\�w��6i+j���&Ձ�#�9�5i�~I�O�9-�F��G:[^`�~���-T)�$
���'��2,����grq�P��[��0�Z�i�m��$*�R��߿��ƺ�Ǯ`sgp<�Xa�p)ױp�H�����ߋ��Ɔ̐����+Hب?�T X\O��t�~��^u�MO�l��h�],�������W��2b���2���-�5gUꬡ�x��|���zM�H��Ꙭ������ze���5<2���륯+�ma�!G�+��$�DGT��+��͚B�'�5�{6���p���uY�
@O5��χ@�۪{�Qo��n��T��Q,���
y8���'%��T�>}�|D�l&5�n쟧�P�h#ZJ+Z`6�3Mdp��V0ܶ���2�|�=���Wx���D<<�b
��L�B�G�;�pG�Բ��P:U�d�uG+V++ܠ������H\�����zS/ ����x���Vin��ξZ�﬜�Z�_�������:�[O[��ހ� �W5Y	��B{,f�n��n�n���͌�����/��O����_��󀀌��z)E�$=���=�:���!x��|��wa��u���	7b��+�A��US��E�������q#b��9���dw�J�Y��L�5z��ㇼ�5m�%kF����p�p�������Q2����XY���?��W����2��+��9�V��hL��w@���U�B���b�)ܱ3\�E��|�;M%o�/�<�_l�8<�~�J�@N��J��Y�&�Ae����l��OhFI%ʪ2����K�-�����JM ���ڲ޵~��
}��Ӡ+̎�oGW��b��L��|E*E�������O_m�-����D�s�Ql'�h���fc���A#6=R���MG�ۦ5$��Ie����y������J"���k���d�0I�G2����d�*������(�����ΓG*�t&`���&�;�!T�/+ r3�+�ūi���zs3'�0o���ц�?�	S��"�\W����LS�a�4�i�C�C�O�CY��&#5Jj��A�0W����9�T�v�~XIx�j�^�l;J:�F��Q~�RF2x\���B�:�� �#�8d�|Ǟ�5E)}�Nh�\6݈�*�D?���o���6h��W~uGb�qQo�ױ}�H��t���;Zߞ�{�d�z>�R�⚵d%L�:9ap<P��짷�@58IP��b����>~Д�{08_ifB���;9圲���fڝ�1l&��&��>4�ډ���p��/_p��Y��O��w��	�\���4J�ea>����;/H�f��Xap���rK;�9I��^�@�̕�/$�u�KH�cW�c['.�C�h>�>Π�*�>�G�H�T��4#�N3��a-4��KW7ͧD"��GS-�u&,��>P�7������n��6����u�;]�QV�
^I�����ICNh�臬���jh���,�������:�3@��������0ՃR�2�xUguI���tB�_�-�%
�����¢d�ӻ��ZhԜ�$�ܺ��d���V�Uv@W����0rbj}�h�H����ԇ'�#�? ���2���?4r�y�tIRǢ�=�*��%��6���K�����K?�*� $���eq�_r]�Iڪy3d�;ʔ�����-N���W6sR�R�J7x]-Z͛��4�1����Kw�e.��;�Tӧ�O�I��+���.*�۝n���a���	g�f��%~spP�{�T��-9��L}T�������ܥW���<�����_�0�f�� S��?���s��W�q��u���kX�@���眩�� ���³RoT8�� �l�(?� ?>2�ci⽴ς8Z��S�����I[U��JߕϻB��6sV�������C��e�1�=��;;C���������Q!��.ܟO�~An ,MJݒ��-/]��Ȩ���.<v�'���Qhj�e�|�H��GF��#��H
6W�Pqu%��ep�Ȕ�Ua��=�X~�R�^���4���|��n��_��	+�<�%�6��Y|�An7}rt���\���>r�C^�Ԣ˪�j1�/����O��F�w�����%�K��(���ueӂS�4�Gph�z��f��)0XSs���R��
���?ȶ͗R�RC׹�ׯ�Pe�i�B8R�}�nО�Gs�d��j���U0x�ţ��剡T@,]� r   V磐N�~c�f�,��e�zV:��h�"�2p���b������ĭ�>t�!ښ-6hީɡ��Q:��c�@D9�+�ྏ�[�R$P4��4�����Q���_��BBqs      �     x��VMo�6=ۿb
�^��H|�ǡ��&�\��HbM�
?쪿�oF��&�#M�{XQ9�ޛ7�ڛ�]C�M�g/K�P\ԘD����L.��n�-�k�{�-�[�}��{7�Ml�LM�J���=���|D&1�o]訍���֡�Ƴ�7��ǘJ�%��!�9�p!�.���gJM��r0��Ժ`�������L.P�S��i�һ�3S�ѻ�djY��\GN{2��K$��8O�6ɴ%&h���I-�g|����c��raN�g��aCq䰤}o��F�ʀ�/{��-2*=�����<
v�=�������,�K�3�a��f�dd��0s�4k@h�gJ&t,�d�7S��@�ח;I����)���>�օ�W���)�L�� }�N1�����k���Ř������ށռ�� g�}=�Pé��	3 �L�J }��4G�g�M��ie(A�m���	�g ��@�N�+����4����XgP��������S3I�g�U���Y��������ڪ\�����0ٚ4�F�;pt��/&y�荹s6Oo*@p��{�[�����0UjP}̊<�	9��cQ
)"f٨���*�[��"�`7����D'Twa���M쉱쓔�� ����P�="B��&��L5�Q*�1 *�d��x�=��`��g�$�(�*{�M����S�� �Fy���]��5��+Z���{�����$���~�"P��@��ŷ�i�!�^{*�?��)t.����ż��j��W����� �y��+ܿß�(~�3`���� m&K�v"w�����#��;ܔ�H���{k���ǒ�iC,IO�-�.,��S��(=:�v��4G6�J/� ������3}�~`�Aš�\�K��T��sr{Y�3�|�]�H�aʃ&gp��.ɫ�����t�y�0;�����e�_Ԭ��&,�l��E��f��e��>�����fo��,9��[�{�}�U�Wg�������<�˟�`��4����xā��sP�Ǟ�w*3r�2�JS_vC)akg�T�ώ�Wx�r�
�:�Y׵���h$���g�i/�u��P�p[+���<��o�%��Cf�/�v�,6@�<¸�~�q?�b`A�����;f̒_	�)�Ք�C�-���P�zFu����d��ʙ��97��4�w2~<L�N(�k���勧���z��ԏ}g��5�-Ժx�2�D���}<?��'㡨@�p�K�ef�AsC�ۓ��4ME����&-�YN�ݓ�w�ݎ�(Zzr�\��,/�����@���������?G��      �      x��]��ƕ�?E��vkS;� 4�ί���X#+�XrR�r�ds�0 ��sk�$��-�M�$���$A�ȉe'�*[����>}�w�s鞱����Ql�I��i����J�g��,�wy�-�F��E�Z�ʺ.���n���-�+ױ��B���W���uc�,�ZTj�g�T�Uڬ+U����ˊ[q�M��&-fgb^�E#�u�RE��ř�Ui5�ټ�z�*|�,�I�ީ��Y��Wb�H3|�~�T^�&�F�
��y��UZ5x�R��l�α���)�3[+є�Y���JM�Z�z����_����M�4S��H�F�j[Q"���v�ZI`G�c�c�'�c�a��P�*�u�W:�u��u�M�eZٵ�\���� -^[7�H'����^�o�E�����'�%5i���Ȋ�U�%U�b�%L�Z��l�SS���폳���Ze7 Č��X�t+�� �<׷�^��!V����B<_��	�u��PK^d���t#B|8+2aV^[����7F^ޖz[3h�m����������5>@�8P�:�)Q�Ų{�پ�:�k�{��~�}	5K����7��oo�[%�tz�qט���H�u#V�JѴ�)n;���X�Z�<��)RɌ�4kpU.�Z�)Ԋ[�x�,S#�&�q&���r`�F��vLJ��i#KV(~�
��	�6�N`O$�t�r1�n��
C/���N��.��y��0��;�4�0��iz��]UX�Ev�w��1n����=�@�v�l�>��?I
IV;��2��X���fh�x���~&�5�� a,a��hZ�u�.W�hU���m��PLl���-�虨���WJ���m�s�Go���pO�	�b}�SSX�k0��v˚̀�β��ћ\AS5dAi�%�=��3Ab�mI��i�e�^C�*f����<]<�NLK�-t\M-��/l�z���k��ߏ�{�[��
�س�v<����P�TD�9"���� vs> ��S�B�У3��^%+��z���4��^�Yq`�p�2��~�(BO�Lh����6����~��%N�Ӛ�/�a����H��R�ȎH�\��%	c�f�zM�|{�j�:_7%�ƸYϲ" �^`>g��ZGiF���&E��?��/�g��ﭵ�#Ѱ� �`�!k�Y�����%��,�� J��cW���v��#�+���J�L<->���_�&��Mh�A�%Ev��%�!�� c�T��X��Tk:?*��w�jV'^W�l=��f�� ��YyOx{�ɱ{pR�.ns�\ޤ'�\ׇ~\��s	WReX;��]��QbE��8l~��"/�$m�'���L|�����˳�+�x?0�<�b�A�GS���|~n�$I�b{p�c�o�t}�\���L��,>�&�PGz�8�nY�\��;_B\���ٜ�E�?IfA��ܬ�*��
'���v`�',cGc�U9���*�nRb��	{}O��Aj��2'94 V6�
nd��Ș�m��giT�'EK�A�K1��/��	�O9�u�YB��Z"�Y�u���q�Q��ު��/�c�0F���ja�l��8�V��";^���P�B��m�*�X��u����&�.�S��FƐ�P*"��jҀ�q�J"�&�q0Mcق��߶����k'�����~$��DPhj�@�^q7O?P쨩��ٴ����YO&ʄ���
�9
�l�(����-�����n�d����y5A�4R��p`��S�@�m:T�(��a�Al�|]2K�0&~F��w�=jq����A��ͼs�u9Gx���1ѐ�3�/���i5�	�xF�w{�sMQ4����v���`��:`�Fc�����������V+������V��ۼ�x��`y��"�$RC7 R�#ʛHq�~�9��~8����a����ު�/�^�x�:�Ŷ�]h��t�l�l�R�&&0 _ (�];�����_DiA�x!.T�S@��c�.�������9,=k�kB�=_���oV�.(i�D�՞Ih�!���ܡI
V6�P�G8�7blRo�tUs?j =R��A�*�X�	O�ͷ�Q�����K3:wbhQU��W��m��Z/Y��3h�L�(����g��}�Zs�SL�y�k��L�Ɛzt�7uINf�)��*� FK�϶iچ���J-�T����S�g`,e`y��V ���[�e����U��/��;�|�����u�SFdppB���&����r/c�w�ń�WN���
3�tI��%��%6�_=;�bԏ\��f�IWp�8u�]�&�P���%;A�j�vfI��,BNR�N-.�zċ�P�\�%��Ӣu�I��'�ʌ�������y).^�_~#^����7���:���ɈO:=�E�]�Q1r��g�X�J���W�E�<;x���EDv���F��w#�/ݔkV����ŀ�w��l���π�6�M��A�sr� �F31P3�^��@��}�UŃ�1p&�hk�I�D��H��s%u�7���8� h�s¯�jQ���3=��c�K�W6��^<�E�f�2��1�D�����5 m2G�[>4a
��	r�)�P����!�S�=P����Nڨ�V;��y� ����T��4/�{����n�d_��0�����3���$v}��
��;2ޏ��� #�<�8�~ ���E�h��G�;�?�t�u����0ע�Sa�0cJ�5��%�6~�����AdI8�����v'1%В l� =���gӁ=�/�Ri�[S�Z#�2�6i���^�K�<I�$ׯ65�U�I��OP�b��H����WO���חO_���g߾Oߞ������o_���ҷ�^��OŔ\��=n�	\�e�JD$FJ��q]M�o��������A���wJ�1���i:V�򥯈�ZRJ�9�����KJ�|�bO��J��h�8�?��S�O?��Zc?��:qf?:/{AlE����:�K��[�i+ε�7�,�r���Q�QY��⢤"V�͛�̼\�9�6b#�5�Ѧ�0ڣK4��#b��p �U��H�b7�9/�]#_	�B��"��Tax� �?�S��m^�[`xm=�U���?cZSsV�2�*[<��7�p���*4�g.ʚ���kt��i���8)���m(�7��9������^	_�`v`w�G��j�Z�G�;��J1}/09/�z�{\v�E�T�{��;��Z����V����4��k���s�X����T��n��&JD��;5��쮗������h����H1Jh9^�@����q����Mg'�&��xv h	c;2/&��$	b�(BkJ�7,������aL�_��Ⱥ��u7]3��(�h�n��Ĕ�>��t��+M%��~u,�?jܼ}^�0�C��,�]�ʝL)�i�
��4��Z�XtJ�]�e��G63��=ծv�LK"�a@�[*G�p 7�/V���C�eY���%"F���{
��Y-�y�N���-���
1�M�.�r����߰�A�]0$¥���t�q�����_:���᥶��s��s6�3�Q]i��Z��x��@��}j���PW	�A��Mҷe`���kj+��K��e�H�r��2m�1B�#��s��(j#ar��ׄ�� �5v+��-�TNlOJ.2��@iI�^�j�$�n�~J�eʌ�+�-+5�!ys� ��]
ָ�����S;�F����<���S��uh�/�(o���(��ɇ-x�6�+��p��*�iM�nsS�z����I̴o��&o2�iNK��L���-�%I���Vu�Lī*��ǝnA���W۔�Ԁ�J3��׶�{7��kA6T���jä�
�މO�v�n�O��� ������mx�1wbI`*u�I]tt~Ez̤�닐�� �fp ���*�׎��MabK��'�� 1Ħl�-�U5T������\��5�(�܂�v�;)j)�$�3��'@��
���>�v0�^�)A���``� V��8��,�ݔ�9;���wO��g�(    tr�}�m>��1e~� �LHo���1��,}նB?@,1�s;n��m׵�1Y��P�	�_�)S�����,GJ�љ����慇��U���S�W�gd,c2�1�MFK��("G SC`�$�gV���"QS"���{��J/��T_è�6�3/�g��<"ݷ�U���59���H�o4k���T�6~h'�˅q����٬8�����{��*�NFu=�=M$e4ŷ|�ZW�,F�E�`7��e5!��S��J�~�1ˡW���)��G�wm�:^�����wmO�2�"��%����9������U�f;�V�bE!��~	�s�`~LX��.��Te,l˽W*_ ������Ǜ��N5�u��b�^D�A��o:��:������$ �z�Zk(������;]�?�f��ڂ����d|'ѩ�^3x|�I���UY=��ŷ�����P�-4R����>ݫ�#�������6O\��=��W�=ug���4\���'_͎Ť����<���?UjAv�2K���j���aHr�B+�lGg)��#�r|q�&;x�.�e|��>��c�xvZq�f��q�g��0ܜ�:�������F߭�X��n��e��'q"��}�Y�6 ��g�!3P?���s �۶��V��Po�lK�^L�R�Wy�k��L��`7g���I�3�QsGI׀jÝd[��V����΂�*�v��F��tJ��U���anwʴ�,���	L�;���E-���&~��sM�_Ya
�(,���L��?�����,h0�(��Û��jD���z��� m���-�w�ea���1��}9<�*ﹶ?�c)M˭����$mj�H,D|	=:a��~"MG�.�-��Y5B?�7�x��L�&#0\�؃P~�6��5�J��P��73qp���sH�5��E�)T�\gM����RQF��#:M�p���W }<���C��t�(�I- b<>��P<8�0D��,�\ԙ���Ο��"s�"R�ba���X�+1ٰ_2ܣ*�y۹nbjYF(��Ra.�%�����iH-�{�@��<�[�w����'��v,߉|"o2�`����p��D����x��M�x�Nb��%�.������p���!w����H��k+r.	QE���0�2�8<�x�r��e9�R�{�?���
�N����Wz���6E�ѩn���:nJ�E���=��� �t���Ԅ5w0���C�6���#N�.	I�� #VC-|�5�Kl��q$�(6E��
�P/����+j�<Ϫ�)��J�?�Nٱd��Θ&���'22��ڐ`����&6�p�v�i�ƽ��U���Y��������ݢ�!lSn)��=Pa�I6�����,ϳ�unZC��0�q1>ש����ŕ���(N���,٘rr�Ǔu]]���R"��VuU�S�G@ΤFW���=�^����Dƍ�B�bC�v+���x�ߎ�P��Ss��"�?�O�;���:��Y�t;�ptou�2��@�=a�I��h���S��r/�ױ\S�R�B�l�X���Lg/��c����ݖ3 *&S�G�^U�ψ���<DܱDs�b���ˢ`V��}[�w�=v��9L�r2� t�}�3������O ҕ��e�-��J�?"�ڥ$L�ӉyM�8��N�ȁ�1��myJ�g3]_��hsJ�L)\s�,!������~�PcO\�A�2���δ=�:=�' �0�ˏl�!v�z!��񻔪*��o��\r�^_��9�Q�rh�l�c34�I�����̩�ؠ0�>�K�%S�x3��J΍�f�\1�6�hG XF�穎U>���}���G<꧍"�eXB���&N�{�
�ĵd`˰�.E�Hb�.���Bw�
�z&و���.�Σ��V�"�j�����  hV��܏n�M�L˪"k[�,�z'��M�
Ȏ�]��%p���H�,�Y��������n��ÆNr{K�=��s�S{<���K	<p��Aد�>�<®��;e0�xGJo~�Q_!��cgy�}�L����]�[�ʀ7�(u�򯯌E��ܐ��ڑ�j�R�v�z��td2jl����� N�����6Yx��l�)Ŗ/\h{�wϗ%n$-*�V�Y�t�S�ۈ�2�=��^��5�7����0_��L]��)�����؍2{��λ�nz3ɵ�(��=���X����F5?LJ@���#q��#��F�~d@���:6Tgʿ�%�����=���sG����o��tޞ!�=��V����,/��� �(�A׾�2��9R��)�z7�88��� X�Sl��t���ʷ*Ʋ�=�����C.��~**V��c���F�s��)O���ݴ�_n=�nw}:�O���@��d_���;��s�TNt���ؾAj���t=�3�;���P�K��ovH����'�8��K�\����'Z��f~a�{�h� �;z��=le�YN?s�kqb��\@���6�E��K�N�/Ӎ*����R�9q� ����n4>�����D�Su�Dݱ��#�М���=�c(��#ס:P9�l���q��qQB����C7��"�7G�}�W��=����-/Tː�k!��5�C�7a���k(U>�>�@v��*�@ =�����#c9]�F�wwQD�}'��$�����s�3]+�� ��t�rﾷ�K8�j�=x�␻nW��t���Xb����������_k����(X�[<� Iփ�py�X����QA�D��u�l;���*A9_bnB]�E���U�Y�@,k�� ��b;
�{jx}ڈ��e��~#B�Gf�Wt��OT5ܝ��&I�L�����$�ۊ��0p��f/�-���"�'�eh�t�O0�ּ$����yN��`OB��p^����n�L<ߥ�o�LPxBS
�Y0���f�
'<bN�5xpuDw�Y��U��lDw���q��?��^��;�� +�Z =��{@���-��S��F]�m �����c�g����릛?�|@�V�[Gxbg{�q�NE�T�_Ws���z�
��rL3��T�P���q�I�����&s�Iy���p�eשp^��x�=u�Q��.w"㣇���W����􉋒�����"FG/��n����V�.卐QB���5߮��ӴG���x��������T-���e���{�k�M���o�hc����L����.)V������jfn�6c�N]`�v��Ċa�RR�4�r�����_/RE�.���}^��q�����	8Z��Q�iH�}nm��R%��N�/�Ch=�u�[��]J	@Bە|��F8t�e�c���
��f��7*pN7�>�9rBs�E�侙<�U�.Ij7 {b���h|�U��7iq7l����Op3�����D��==����FS��K���>Pfڬv�HH<!8ӜQ��̳��-��3*-#���_7�Q��D{�4���zY�b1���IO�m�ʒ�Tej���g��tCl��K�g�~x��W��ڽ���9�N����hO@��R�;��+�e�9���o�x��K�_��s��ZFt^)�t/K���	�P��߈kw� ��?��Q�H��D�~�G���1'[ǦKK\�kU���ڵ�#S:٬�^�']�>�z�._�q�3�u/��M�߾�j���eӹo���u3�i��W�7��l�T�|����z��FU��4����<�8-��a����8n�B�  ��x�{���@�{
o�0��)5��V������˴HgYZ�����*�_��O�>^��jw�yɓ�# $���!��E��بP߄�[&���u�g|h�����hD�Q��g���(Ի���'2}&��5���sm��!�ij�Yb��:�PƦ�HSrVG��%��}�C��Y�>�������MUqTcm�½�B��M�m1�+��|�_�z��yX�t�Ǣ�4tߡɈܦt�^*��$<Ǐ��c@X�fG�顭�}D20����wZ�r��D�+��'����0l�S����[����;P�#���)��p��{����: �  ��$�>�ء�<j��+�w�1�g���Y3)��ٵ�p�P�K����.����o�t�Y誯������K ��	׆����mޔ��V�{[\���`�@��*��	WBL7�Qr�x��ԙ�}��Tv�����oV�S�@ �Z7h����oο�Zu |GI�?#t9H�5ձ�YI7��gO΅��}���'�2\ʀ��	��J�M���7�B6�����B��;ۿ�M�PDxr��2?�o>8���hÉ�z���S�Ot)Et�C�����@�)��r�;�5����5�~M�Q�.��Q��]8qL�PI�*|0�!w~}5r��N�����5۫��!�Ǟ�I���8�bWD�5�Le�?��������/z��`��դ�{0�U����i��?�K�����	9�(t�����_���i     