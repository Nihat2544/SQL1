--1.ornek: companies toblosundan en yuksek ikinci number_of_employees degeri olan company
--ve number_of_employees degerlerini cagirin.

--1.yol offset ve fetch next kullanarak
SELECT company,number_of_employees 
FROM companies
order by number_of_employees desc
offset 1 row
fetch next 1 row only;

SELECT company,number_of_employees 
FROM companies
Where number_of_employees = (select max(number_of_employees)
                            from companies
                            WHERE number_of_employees < (select max(number_of_employees)
                            from companies))


--1.ornek: number_of_employees degeri ortalama calisan sayisindan az olan number_of_employees degerlerini
--16000 olarak UPDADATE edin.

update companies
set number_of_employees = 16000
where number_of_employees < (select avg (number_of_employees)
                            from companies)



--1.ornek:Prepared Satetement kullanarak company adi IBM olan 
--number_of_employees degerini 9999 olarak güncelleyin.

update companiesset number_of_employees = 9999where company = 'IBM'

    






select * from companies;
