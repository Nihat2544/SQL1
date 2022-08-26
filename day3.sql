CREATE TABLE calisanlar
(
id CHAR(5) PRIMARY KEY, -- not null + unique
isim VARCHAR(50) UNIQUE, -- UNIQUE --> Bir sutundaki tüm değerlerin BENZERSİZ yani tek olmasını sağlar
maas int NOT NULL, -- NOT NULL --> Bir sutunun NULL içermemesini yani boş olmamasını sağlar
ise_baslama DATE
);
INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10010', Mehmet Yılmaz, 5000, '2018-04-14'); --Unique
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12'); --NOT NULL
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14'); --UNIQUE
--INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14'); --NOT NULL
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
--INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14'); --PRIMARY KEY
--INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14'); --PRIMARY KEY
--INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14'); -- PRIMARY KEY
-- FOREIGN KEY--
CREATE TABLE adresler
(
adres_id char(5) ,
sokak varchar(20),
cadde varchar(30),
sehir varchar(20),
CONSTRAINT fk FOREIGN KEY (adres_id) REFERENCES calisanlar(id)
);
INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');
select * from adresler;
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');
--Parent tabloda olmayan id ile child tabloya ekleme yapamayız
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
--Calısanlar id ile adresler tablosundaki adres_id ile eşlesenlere bakmak için
select * from calisanlar,adresler WHERE calisanlar.id = adresler.adres_id;
DROP table calisanlar
--Parant tabloyu yani primary key olan tabloyu silmek istediğimizde tabloyu silmez
--Önce child tabloyu silmemiz gerekir

delete from calisanlar where id='10002'

delete from adresler WHERE adres_id = '10002'

drop table calisanlar;

-- ON DELETE CASCADE --
--Her defasında önce child tablodaki verileri silmek yerine
--ON DELETE CASCADE silme özelliğini aktif hale getirebiliriz
--Bunun için FK olan satırın en sonuna ON DELETE CASCADE komutunu yazmamız yeterli

CREATE TABLE talebeler
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebeler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);


CREATE TABLE notlar(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebeler(id)
on delete cascade
);

INSERT INTO notlar VALUES ('123','kimya',75);
INSERT INTO notlar VALUES ('124', 'fizik',65);
INSERT INTO notlar VALUES ('125', 'tarih',90);
INSERT INTO notlar VALUES ('126', 'Matematik',90);

select * from talebeler
select * from notlar;

delete from notlar WHERE talebe_id = '123'

delete from talebeler WHere id ='126'-- ON DELETE CASCADE kullandıgimiz icin PARENT table den direk silebildik
--Parent table den sildigimiz icin child table dan da silinmis olur
Delete from talebeler

Drop table talebeler cascade;-- Parent tablosunu kaldırmak istersek Drop table tablo_adı'ndan sonra 
--CASCADE komutunu kullaniriz

--Talebeler tablosundaki isim sutununa NOTT NULL kısıtlaması ekleyiniz ve veri tipini VARCHAR(30)olarak degistiriniz
--Not: ALTER= Tabloyu güncellemeye yarar.
alter table talebeler
alter column isim type varchar(30),
alter column isim set not NULL;

--talabeler tablosundaki yazılı_notu sutununa 60 dan buyuk rakam girebilsin
alter table talebeler
ADD CONSTRAINT sinir check (yazili_notu>60);
--CHECK kısıtlaması ile tablodaki sitedgimiz sutunu sinirladirabiliriz
-- yukarda 60'i sinir olarak belirledigimiz icin bunu eklemedi




INSERT INTO talebeler VALUES(128, 'Mustafa Can', 'Hasan',45);

create table ogrenciler(
id int,
isim varchar(45),
adres varchar(100),
sinav_notu int
);

Create table ogrenci_adres
AS
SELECT id, adres from ogrenciler;

select * from ogrenciler
select * from ogrenci_adres

--Tablodaki bir sutuna PRIMARY KEY ekleme
alter table ogrenciler 
ADD Primary key (id);

--PRIMARY KEY olusturmada 2. yol 
alter table ogrenciler 
ADD CONSTRAINT pk_id PRIMARY KEY (id); 

--PK' dan sonar FK atamasi
alter table ogrenci_adres
ADD foreign key(id) references ogrenciler;
--child tabloyu parent tablodan olusturdugumuz icin kolon adi verilmedi

--PK'yi silme CONSTRAINT silme
alter table ogrenciler DROP CONSTRAINT pk_id;
alter table ogreci_adres drop CONSTRAINT ogrenci_adres_id_fkey;

--yazili notu 85 den buyuk olan talebe bilgilerini getirin
select * from talebeler WHERE yazili_notu>85;

-- ismi Mustafa BAk olan talebenin tum bilgilerini getirin
select * from talebeler WHERE isim ='Mustafa Bak'

--SELECT komutunda -- BETWEEN  kosulu
--Between belirttiniz 2 veri arasindaki bilgileri listeler
--Between de belirttiginiz degerlerde listemeleye dahildir

create table personel
(
id char(4),
isim varchar(50),
maas int
);

insert into personel values('1001', 'Ali Can', 70000);
insert into personel values('1002', 'Veli Mert', 85000);
insert into personel values('1003', 'Ayşe Tan', 65000);
insert into personel values('1004', 'Derya Soylu', 95000);
insert into personel values('1005', 'Yavuz Bal', 80000);
insert into personel values('1006', 'Sena Beyaz', 100000);

/*
AND (ve ): belirtilen sartlarin her ikiside gerceklesiyorsa o kayıt listelenir
Bir tanesi gerceklesmezse listelemez
select * from matematik sinav1>50 AND sinav2>50
hem sinav1 hemde sinav2 alani, 50'den buyuk olan kayitlari listeler
OR(VEYA): Belirtilen sartlardan biri gerceklesirse kayit listelenir
select * from matematik sinav>50 OR sinav2>50
Hem sinav veya sinav2 alani 50'den buyuk olan kayitlari listeler
*/
select * from personel

--id'si 1003 ile 1005 arasinda olan personel bilgisini listeyiniz?
select * from personel WHERE id BETWEEN '1003' AND '1005';

--2.yol
select * from personel WHERE id >='1003'and id<='1005';

--Derya soylu ile yavuz bal arasindaki personel bilgisin listeyiniz
select * from personel WHERE isim BETWEEN 'Derya Soylu' and 'Yavuz Bal';

-- Maasi 7000 ve ismi Sena olan personeli listeleyiniz
select * from personel Where maas = 70000 OR isim ='Sena Beyaz';

--IN : Birden fazla mantiksal ifade ile tanimlaya bilecegimiz durumlari tek komutta yaza bilme imkani verir
-- Farkli sutunlar icin IN kullanilamaz.
-- id'si 1001,1002 ve 1004 olan personelin bilgilerini listeleyiniz?
select * from personel WHERE id = '1001' or id='1002'or id='1004';

--2.yol
select * from personel Where id IN('1001','1002','1004');

--maasi sadece 70000, 100000 olan personeli listeleyiniz?
select * from personel Where maas IN (70000,100000);

/*
SELECT - LIKE kosulu
LIKE : sorgulama yaparken belirli (pattern)kalip ifadeleri kullana bilmemizi saglar
ILIKE : sorgulama yaparken buyuk, kucuk harfe duyarsiz olarak eslestirir.
LIKE : ~~ (Bu isaret lıke anlımına gelir)
ILIKE : ~~*
NOT LIKE : !~~
NOT ILIKE : !~~*

%--> 0 veya daha fazla karekteri belirtir.
_--> Tek bir karakteri belirtir
*/

--ismi A harfi ile baslayan personeli listeleyeniz?
select * from personel Where isim Like 'A%';

--ismi T harfi ile biten qersoneli lisityiniz?
select * from personel Where isim like '%t';

--isminin ikinci harfi e olan personeli listeliyinz?
select * from personel Where isim like '_e%';













