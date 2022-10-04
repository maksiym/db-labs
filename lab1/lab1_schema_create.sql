USE lab1_schema;


-- Office
INSERT INTO office(number, city) VALUES
(1, 'Rivne'),
(2, 'Kyiv'),
(3, 'Lviv'),
(4, 'Lutsk'),
(5, 'Miami'),
(6, 'Los Angeles'),
(7, 'Makiivka'),
(8, 'Ternopil'),
(9, 'Odesa'),
(10, 'Kherson');

-- Room
INSERT INTO room(number, office_id) VALUES
(501, 1),
(503, 2),
(503, 3),
(101, 4),
(102, 5),
(205, 6),
(206, 6),
(207, 1),
(307, 7),
(907, 8);

-- Workplace
INSERT INTO workplace(number, room_id) VALUES
(11, 1),
(12, 4),
(13, 3),
(13, 6),
(13, 5),
(14, 7),
(15, 8),
(16, 1),
(17, 7),
(18, 8);

-- Equipment location
INSERT INTO equipment_location(workplace_id) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);

-- Initiator 
INSERT INTO initiator(name, surname) VALUES
('Tolik', 'Sharii'),
('Jay', 'A'),
('Jay', 'B'),
('Jay', 'C'),
('Nazar', 'Bylen'),
('Jay', 'Bylen'),
('Nazar', 'Jobhelper'),
('Zenoviy', 'Veres'),
('Zinoviy', 'Mychuda'),
('Zynoviy', 'Nytrebych');

-- Respondent
INSERT INTO respondent(name, surname) VALUES
('Eminem', 'Bylen'),
('Jack', 'Gorobets'),
('Anatolii', 'Petrovych'),
('Leonardo', 'Turtle'),
('Rafael', 'Turtle'),
('Donatello', 'Turtle'),
('Michelangelo', 'Turtle'),
('Volodymyr', 'Zelenskiy'),
('Svyat', 'Lord'),
('Svyat', 'Must-have');

-- Issue
INSERT INTO issue(description, equipment_location_id) VALUES
('SW-failure', 1),
('SW-failure', 2),
('SW-failure', 3),
('PC-failure', 4),
('PC-change', 5),
('PC-change', 6),
('SW-update', 7),
('SW-update', 8),
('PC-failure', 9),
('PC-failure', 10);

-- Application
INSERT INTO application(date, status, issue_id, initiator_id) VALUES
('2022-09-13', 'NEW', 1, 10),
('2022-09-14', 'NEW', 2, 1),
('2022-09-15', 'NEW', 3, 6),
('2022-09-16', 'NEW', 4, 3),
('2022-08-13', 'NEW', 5, 4),
('2022-07-13', 'NEW', 6, 2),
('2022-09-20', 'NEW', 7, 8),
('2022-09-21', 'NEW', 8, 7),
('2022-09-23', 'NEW', 9, 9),
('2022-09-30', 'NEW', 10, 5);

-- Application respondent
INSERT INTO application_respondent(application_id, respondent_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9);