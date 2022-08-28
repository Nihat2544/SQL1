/*
GROUP BY -- HAVİNG --
HAVİNG ifadesini islevi WHERE ifadesininkine cok benziyor. Ancak kumeleme fonksiyonlari ile
WHERE ifadesi birlikte kullanilmadiginda HAVİNG ifadesine ihtiyac duyulmustur.
GROUP BY ile kullanilir gruplamadan sonraki sart icin group by dan sonra HAVİNG kullanilir.
*/

--Maaş ortalaması 3000’den fazla olan ülkelerdeki erkek çalışanların maaş ortalaması.
select ulke, round (avg (maas)) as maas_ortalamasi from personel
where cinsiyet = 'E'
group by ulke
having avg(maas)>3000;

--Erkek çalışanların sayısı 1’den fazla olan ülkelerin maaş ortalamasını getiren sorgu(odev)
select ulke, round(avg(maas))as erkek_calisanlar_sayisi from personel 
where cinsiyet = 'E' 
group by ulke
having count(*)>1
