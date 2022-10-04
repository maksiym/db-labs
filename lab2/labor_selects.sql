use labor_sql;

-- 1. БД «Аеропорт». Знайдіть номери всіх рейсів, на яких курсує літак
-- 'TU-134'. Вивести: trip_no, plane, town_from, town_to. Вихідні дані
-- впорядкувати за спаданням за стовпцем time_out.

-- select trip_no, plane, town_from, town_to from trip
-- where plane = 'TU-134';

-- 2. БД «Комп. фірма». Вивести всі моделі ПК, у номерах яких є хоча б
-- дві одинички.

-- select model from pc
-- where model like '%1%1%';

-- 3. БД «Кораблі». Знайдіть країни, що мали класи як звичайних бойо-
-- вих кораблів 'bb', так і класи крейсерів 'bc'. Вивести: country, типи із
-- класом 'bb', типи із класом 'bc'.

-- select country, type from classes
-- where country in (select country from classes where type = 'bc')
-- and country in (select country from classes where type = 'bb');

-- 4. БД «Кораблі». Знайдіть кораблі, «збережені для майбутніх битв»,
-- тобто такі, що були виведені з ладу в одній битві ('damaged'), а потім
-- (пізніше в часі) знову брали участь у битвах. Вивести: ship, battle, date.

-- select o.ship, o.battle, b.date from outcomes o join battles b
-- where o.result = 'damaged' and o.battle = b.name;

-- 5. БД «Комп. фірма». Знайдіть виробників принтерів, що випускають
-- ПК із найменшим об’ємом RAM. Виведіть: maker.

-- select distinct maker from product p join pc on p.model = pc.model
-- where pc.ram = (select min(ram) from pc) and maker in (select maker from product where type = 'Printer');

-- 6. БД «Аеропорт». Для таблиці Pass_in_trip значення стовпця place
-- розбити на два стовпця з коментарями, наприклад, перший – 'ряд: 2' та
-- другий – 'місце: a'.

-- select place, concat('row: ', substring(place, 1, 1)) r, concat('seat: ', substring(place, 2)) s from pass_in_trip;


-- 7. БД «Комп. фірма». Знайти тих виробників ПК, для яких не всі моде-
-- лі ПК є в наявності в таблиці PC (використовувати засоби групової
-- статистики). Вивести maker.

-- select distinct maker from product
-- where model not in (select model from pc) and type = 'PC;'

-- 8. БД «Комп. фірма». Для таблиці Product отримати підсумковий набір
-- у вигляді таблиці зі стовпцями maker, pc, laptop та printer, у якій для
-- кожного виробника необхідно вказати кількість різної продукції, що
-- ним випускається, тобто продукції з різними (унікальними) номерами
-- моделей у таблицях, відповідно, PC, Laptop та Printer. (Підказка: вико-
-- ристовувати підзапити в якості обчислювальних стовпців)

/* select distinct maker,
(select count(distinct model) from pc where maker=(select maker from product inn_p where inn_p.model = pc.model)) pcs,
(select count(distinct model) from laptop l where maker=(select maker from product inn_p where inn_p.model = l.model)) laptops,
(select count(distinct model) from printer pr where maker=(select maker from product inn_p where inn_p.model = pr.model)) printers
from product p; */


-- 9. БД «Фірма прий. вторсировини». Приймаючи, що прихід та розхід
-- грошей на кожному пункті прийому фіксується не частіше одного
-- разу на день (лише таблиці Income_o та Outcome_o), написати запит із
-- такими вихідними даними: point (пункт), date (дата), inc (прихід), out
-- (розхід). (Підказка: використовувати зовнішнє з’єднання та оператор
-- CASE)

/* select ino.point, ino.date, ino.inc, outo.out
from income_o ino left join outcome_o outo on ino.point = outo.point
and ino.date = outo.date
union
select outo.point, outo.date, ino.inc, outo.out
from income_o ino right join outcome_o outo on ino.point = outo.point
and ino.date = outo.date; */

-- 10. БД «Комп. фірма». Для кожної моделі продукції з усієї БД виведіть
-- її найвищу ціну. Вивести: type, model, максимальна ціна. (Підказка:
-- використовувати оператор UNION)

/* select p.type, p.model, mod_max_price.price from product p,
(
select model, price from pc where price = (select max(price) from pc inn_pc where pc.model = inn_pc.model)
union
select model, price from laptop l where price = (select max(price) from laptop inn_l where l.model = inn_l.model)
union
select model, price from printer pr where price = (select max(price) from printer inn_pr where pr.model = inn_pr.model)
) mod_max_price
where p.model = mod_max_price.model; */