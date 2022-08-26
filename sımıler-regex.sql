-- SELECT - SIMILIR TO - REGEX(Regulear Expressions)--
/*
SIMILAR TO : Daha karmasik pattern (kalip) ile sorgulama islemi icin SIMILAR TO kullanilabilir.
sadece PostgreSQL de kullanilir. Buyuk kucuk harf onemlidir.

REGEX : Herhangi bir kod, medin icerisinde iseten yazi veya kod parcasinin aranip bulunmasini saglayan
kendine ait bir soz dizimi olan bir yapidir. MySQL de (REGEXP_LIKE)olarak kullanilir
PostgreSQL de "- karekteri ile kullanilir."
*/
CREATE TABLE kelimeler
(
id int,
kelime VARCHAR(50),
harf_sayisi int
);

INSERT INTO kelimeler VALUES (1001, 'hot', 3);
INSERT INTO kelimeler VALUES (1002, 'hat', 3);
INSERT INTO kelimeler VALUES (1003, 'hit', 3);
INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
INSERT INTO kelimeler VALUES (1005, 'hct', 3);
INSERT INTO kelimeler VALUES (1006, 'adem', 4);
INSERT INTO kelimeler VALUES (1007, 'selim', 5);
INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
INSERT INTO kelimeler VALUES (1009, 'hip', 3);
INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
INSERT INTO kelimeler VALUES (1015, 'hooooot', 5);
INSERT INTO kelimeler VALUES (1016, 'booooot', 5);
INSERT INTO kelimeler VALUES (1017, 'bolooot', 5);
   
select * from kelimeler;
 
-- icerisinde 'ot' veya 'at' bulunan kelimelir listeleyiniz
-- veya ıslemi icin | karakteri kullanilir

--SIMILAR TO ile
select * from kelimeler where kelime SIMILAR TO '%(at|ot)%' 
 
--LIKE ile
select * from kelimeler Where kelime Ilike '&at&' or kelime Ilike '%ot%' ;
select * from kelimeler Where kelime ~~* '%at%' or kelime ~~* '%ot%';
--REGEX ile
select * from kelimeler where kelime ~*'ot' or kelime ~* 'at';

-- : 'ho' veya 'hi' ile başlayan kelimeleri listeleyeniz
--SIMILAR TO ile
select * from kelimeler where kelime SIMILAR TO 'ho%|hi%';
--LIKE ile
select * from kelimeler where kelime ~~*'ho%' or kelime ~~* 'hi%'
-- REGEX ile
select * from kelimeler wHere kelime ~* 'h[oi](.*)'; --Regex'te ".(nokta) bir karakteri temsil eder"
-- Regex'de ikinci karakter icin koseli parantez kullanilir. * hepsi anlamında kullanilir.

--Sonu 't' veya 'm' ile bitenleri listeleyeniz
--LIKE ile
select * from kelimeler wHere kelime ~~* '%t' or kelime ~~*'%m';
--REGEX ile 
select * from kelimeler where kelime ~*'(.*)[tm]$' -- $ karakteri bitisi gesterir

--h ile başlayıp t ile biten 3 harfli kelimeleri listeleyeniz
--SIMILAR TO ile
select * from kelimeler where kelime SIMILAR TO 'h[a-z,A-Z,0-9]t';
--LIKE ile
select * from kelimeler where kelime ~~* 'h_t';
--REGEX ile
select * from kelimeler where kelime ~* 'h[a-z,A-Z,0-9]t';

--İlk karakteri 'h', son karakteri 't' ve ikinci karakteri 'a'dan 'e'ye herhangi bir 
--karakter olan “kelime" değerlerini çağırın.
--SIMILAR TO ile
select kelime from kelimeler where kelime SIMILAR TO  'h[a-e](.*)%t';
--REGEX ile
select kelime from kelimeler where kelime ~* 'h[a-e](.*)t';

--İlk karakteri 's', 'a' veya 'y' olan "kelime" değerlerini çağırın.
--SIMILAR TO ile
select kelime from kelimeler where kelime SIMILAR TO 's%|a%|y%'
--
select kelime from kelimeler where kelime ~ '^[say](.*)'; -- ^ baslagic ı tesil eder

--Son karakteri 'm', 'a' veya 'f' olan "kelime" değerlerini çağırın.
select kelime from kelimeler where kelime ~ '^(.*)[maf]$';

--İlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tüm bilgilerini sorgulayalım.
--SIMILAR TO ile
select * from kelimeler where kelime SIMILAR TO 'h[a|i]t';
--REGEX ile
select * from kelimeler where kelime ~ '^h[a|i]t$';

--İlk harfi 'b' dan ‘s' ye bir karakter olan ve ikinci harfi herhangi bir karakter olup üçüncü harfi ‘l' olan “kelime" 
--değerlerini çağırın.
select * from kelimeler where kelime ~ '^[b-s].l(.*)';

--içerisinde en az 2 adet oo barıdıran kelimelerin tüm bilgilerini listeleyiniz.
--SIMILAR TO ile
select * from kelimeler where kelime SIMILAR TO  '%[o][o]%';
select * from kelimeler where kelime SIMILAR TO  '%[o]{2}%'; -- Suslu parantez icindeki rakam bir onceki koseli paranetz
-- REGEX ile
select * from kelimeler where kelime ~*'(.*)oo(.*)';

--içerisinde en az 4 adet oooo barıdıran kelimelerin tüm bilgilerini listeleyiniz.
select * from kelimeler where kelime ~*'(.*)oooo(.*)';

select * from kelimeler where kelime SIMILAR TO  '%[o]{4}%';

--'a', 's' yada 'y' ile başlayan VE 'm' yada 'f' ile biten "kelime" değerlerini çağırın.

SELECT * FROM kelimeler WHERE kelime ~ '^[asy](.*)[mf]'









 
 
 
 
 
 
 
 