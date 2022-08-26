-- AGREGATE METHOD KULLANİMİ --
/*
Agregate method'lari (SUM(topla), COUNT(say), MIN(en kucuk deger), MAX(en buyuk deger), AVG(ortalama))
-- Subquery icin de kullanilir
-- Ancak, sorgu tek bir degir donduruyor olmalidir
SYNTAX : sum() seklinde olamli sum () arasında bosluk olmamali
*/
select * from calisanlar2
select * from markalar

-- Calisanlar2 tablosundaki en yuksek maas degerini listeleyiniz
select max (maas) from calisanlar2

--calisanlra2 tablosundaki maaslarin toplamini listeliyiniz
select sum (maas)from calisanlar2

--calisanlar2 tablosundaki maaslarin ortalamaliri listeleyiniz
select avg (maas)from calisanlar2
select round(avg(maas)) from calisanlar2 -- hesaplamadaki noktadan sonraki kusuratı kaldiriyor
select round(avg(maas),2) from calisanlar2 -- virgul den sonraki ilk iki rakami aldı

--calisanlar2 tablosundaki en az maas alani listeleyiniz
select min (maas)from calisanlar2

-- calisanlar tabolsundaki kackisinin maas aldigini listileyiniz
select count (maas)from calisanlar2

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyiniz
select marka_isim,calisan_sayisi,(select sum (maas)from calisanlar2 
where marka_isim = isyeri)as toplam_maas from markalar

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin 
-- maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.
SELECT marka_isim,calisan_sayisi,(SELECT max(maas) from calisanlar2 where marka_isim=isyeri) AS max_maas,
                                 (SELECT min(maas) from calisanlar2 where marka_isim=isyeri) AS min_maas
from markalar;

--Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz.
select marka_id,marka_isim,(select count(sehir)from calisanlar2 where marka_isim = isyeri)
as sehir_sayisi from markalar

--Interview Question: En yüksek ikinci maas değerini çağırın.
select max (maas) as enyuksek_ikinci_maas from calisanlar2
where maas<(select max (maas)from calisanlar2)

----Interview Question: En düşük ikinci maas değerini çağırın.select max (maas) as enyuksek_ikinci_maas from calisanlar2
select min (maas) as endusuk_ikinci_maas from calisanlar2
where maas>(select min (maas)from calisanlar2)

--En yüksek üçüncü maas değerini bulun
select max (maas) as enyuksek_ucuncu_maas from calisanlar2
where maas<(select max (maas)from calisanlar2 where maas<(select max(maas)from calisanlar2))

--(odev) en dusuk ucuncu maas degeri bulun
select min (maas) as endusuk_ucuncu_maas from calisanlar2
where maas>(select min (maas)from calisanlar2 where maas>(select min(maas)from calisanlar2))








