/*
-- UNION operator : 
1)sorgu(query) sonucunu birlestirmek icin kullanilir
2)Tekrasiz (unique)recordlari(satirlari)verir
3)Tek bir sutuna cok sutun koya biliriz
4)Tek bir sutuna cok sutun koyarken mevcut data durumuna dikkat etmek gerekir
5)
*/
--salary değeri 3000'den yüksek olan state değerlerini ve 
--salary 2000'den küçük olan name değerlerini tekrarsız olarak bulun.

CREATE TABLE workers
(
  id CHAR(9),
  name VARCHAR(50),
  state VARCHAR(50),
  salary SMALLINT,
  company VARCHAR(20)
);
INSERT INTO workers VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO workers VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO workers VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO workers VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO workers VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO workers VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO workers VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');

SELECT * FROM workers;

select state as "Name and state",salary
from workers where salary >3000
union 
select name,salary
from workers where salary <2000;

--salary değeri 3000'den yüksek olan state değerlerini ve 
--2000'den küçük olan name değerlerini tekrarlı olarak bulun.
select state as "Name and state",salary
from workers where salary >3000
union all --> union ile ayni isi yapar. Ancak tekrarlı degerleri de verir
select name,salary
from workers where salary <2000;

--salary değeri 1000'den yüksek, 2000'den az olan "ortak" name değerlerini bulun.
select name
from workers 
where salary >1000
intersect--INTERSECT Operator: İki sorgu (query) sonucunun ortak(common) değerlerini verir. Unique(tekrarsız) recordları verir.
select name
from workers 
where salary <2000;

--salary değeri 2000'den az olan ve company değeri  
--IBM, APPLE yada MICROSOFT olan ortak "name" değerlerini bulun
select name
from workers
where salary < 2000
intersect
select name
from workers
where company in('IBB','APLLE','MICROSOFT');

--EXCEPT Operator : Bir sorgu sonucundan başka bir sorgu sonucunu çıkarmak için kullanılır. Unique(tekrarsız) recordları verir.
--salary değeri 3000'den az ve GOOGLE'da çalışmayan  name değerlerini bulun.
select name 
from workers
where salary <3000
except
select name
from workers
where company in('GOOGLE')












