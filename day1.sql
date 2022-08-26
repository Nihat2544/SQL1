/*
DDL - DATA DEFINITION LANG.
CREATE - ALTER - DROP
*/
-- CREATE - TABLO OLUSTURMA -
create table ogrenci(
ogr_no int,
ogr_isimsoyisim varchar(30),
notlar REAL,
yas int,
adres varchar(50),
kayit_tarih date
);
--Var olan tablodan yeni bir tablo olusturma
create table ogr_notlari
As
select ogr_no, notlar From ogrenci;

select * from ogrenci;