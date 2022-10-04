use lab1_schema;


-- 1. Знайдіть опис проблеми кожного з ініціаторів заявки.

-- select iss.description, i.name, i.surname
-- from application a 
-- join issue iss on a.issue_id = iss.id
-- join initiator i on a.initiator_id = i.id
-- order by i.name, i.surname;

-- 2. Знайдіть ініціатора та його відповідачів.

/* select initiator.name, initiator.surname, respondent.name, respondent.surname
from initiator
join application
	on initiator.id = application.id
left join application_respondent
	on application.id = application_respondent.application_id
left join respondent
	on application_respondent.respondent_id = respondent.id */


-- 3. Порахуйте ініціаторів з однаковим іменем та/або однаковим прізвищем з відповідачами.

-- select COUNT(i.name) dup from initiator i join respondent r on r.id = i.id
-- where
	-- (case when i.name = r.name then 1 else 0 end +
	-- case when i.surname = r.surname then 1 else 0 end) >= 1;

-- 4. Відобразіть ініціаторів та дату їхніх заявок спочатку новіші.

-- select i.name, i.surname, date_format(app.date, "%D-%M-%Y") date from application app join initiator i on i.id = app.initiator_id
-- order by date DESC;

-- 5.

-- select office.number from office
-- where office.id not in (select office_id from room) and office.number >= 5;

-- 6.

-- select count(description)  from issue
-- where description like 'SW-%'