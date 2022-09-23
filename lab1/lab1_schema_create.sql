USE lab1_schema;


-- Office
INSERT INTO office VALUES
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
INSERT INTO room VALUES
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
INSERT INTO workplace VALUES
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
INSERT INTO equipment_location VALUES
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
INSERT INTO initiator VALUES
('Tolik', 'Sharii'),
('Jay', 'Z'),
('Jay', 'O'),
('Jay', 'V'),
('Nazar', 'Bylen'),
('Jay', 'Bylen'),
('Nazar', 'Z'),
('Zenoviy', 'Veres'),
('Zinoviy', 'Mychuda'),
('Zynoviy', 'Nytrebych');

-- Respondent
INSERT INTO respondent VALUES
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
INSERT INTO issue VALUES
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
INSERT INTO application VALUES
('2022-09-13', 'NEW', 1, 2),
('2022-09-14', 'NEW', 1, 2),
('2022-09-15', 'NEW', 1, 2),
('2022-09-16', 'NEW', 1, 2),
('2022-08-13', 'NEW', 1, 2),
('2022-07-13', 'NEW', 1, 2),
('2022-09-20', 'NEW', 1, 2),
('2022-09-21', 'NEW', 1, 2),
('2022-09-23', 'NEW', 1, 2),
('2022-09-30', 'NEW', 1, 2);

-- Application respondent
INSERT INTO application_respondent VALUES
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