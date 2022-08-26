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

select * from personel;

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

-- 'a' ile başlayıp 'n' ile biten personel isimlerini listeleyiniz
select isim from personel Where isim ~~* 'a%n'

--ikinci karakteri 'a' ve dordüncu karakteri 'u'olan personel isimlerini listeleyiniz
select isim from personel Where isim like'_a_u%'

-- İçinde 'e' ve 'r' bulunan personel isimlerini listeleyiniz

select isim from personel Where isim ~~* '%e%r%'


-- 2. harfi e olup diğer harflerinde y olan personeli listeleyiniz
select isim from personel Where isim like '_e%y%'

-- a harfi olmayan personeli listeleyin
select isim from personel Where isim not like '%a%'

-- 1. harfi A ve 7. harfi a olan personeli listeleyin
select isim from personel Where isim ~~* 'a%_____a%'


select isim from personel Where isim ~~* '%r_'







