-- Создание базы данных
CREATE DATABASE TourismDB;
USE TourismDB;

-- =============================
-- Таблица: Страны (Справочник)
-- =============================
CREATE TABLE Countries (
                           country_id INT AUTO_INCREMENT PRIMARY KEY,
                           country_name VARCHAR(100) NOT NULL UNIQUE
);

-- =============================
-- Таблица: Туристы (Справочник)
-- =============================
CREATE TABLE Tourists (
                          tourist_id INT AUTO_INCREMENT PRIMARY KEY,
                          full_name VARCHAR(150) NOT NULL,
                          passport_number VARCHAR(20) UNIQUE,
                          phone VARCHAR(20),
                          email VARCHAR(100)
);

-- =============================
-- Таблица: Туры (Справочник)
-- =============================
CREATE TABLE Tours (
                       tour_id INT AUTO_INCREMENT PRIMARY KEY,
                       tour_name VARCHAR(150) NOT NULL,
                       country_id INT NOT NULL,
                       price DECIMAL(10,2) NOT NULL,
                       duration_days INT NOT NULL,
                       FOREIGN KEY (country_id) REFERENCES Countries(country_id)
                           ON UPDATE CASCADE ON DELETE RESTRICT
);

-- =============================
-- Таблица: Услуги (Справочник)
-- =============================
CREATE TABLE Services (
                          service_id INT AUTO_INCREMENT PRIMARY KEY,
                          service_name VARCHAR(100) NOT NULL,
                          service_price DECIMAL(10,2) NOT NULL
);

-- =============================
-- Таблица: Заказы (Переменная информация)
-- =============================
CREATE TABLE Orders (
                        order_id INT AUTO_INCREMENT PRIMARY KEY,
                        tourist_id INT NOT NULL,
                        tour_id INT NOT NULL,
                        service_id INT,
                        order_date DATE NOT NULL,
                        total_price DECIMAL(10,2) NOT NULL,
                        FOREIGN KEY (tourist_id) REFERENCES Tourists(tourist_id)
                            ON UPDATE CASCADE ON DELETE CASCADE,
                        FOREIGN KEY (tour_id) REFERENCES Tours(tour_id)
                            ON UPDATE CASCADE ON DELETE RESTRICT,
                        FOREIGN KEY (service_id) REFERENCES Services(service_id)
                            ON UPDATE CASCADE ON DELETE SET NULL
);
-- Добавим страны
INSERT INTO Countries (country_name) VALUES
                                         ('Испания'),
                                         ('Италия'),
                                         ('Египет');

-- Добавим туристов
INSERT INTO Tourists (full_name, passport_number, phone, email) VALUES
                                                                    ('Иванов Иван Иванович', 'AB123456', '+79998887766', 'ivanov@example.com'),
                                                                    ('Петров Петр Петрович', 'CD654321', '+79997776655', 'petrov@example.com');

-- Добавим туры
INSERT INTO Tours (tour_name, country_id, price, duration_days) VALUES
                                                                    ('Барселона – пляжный отдых', 1, 55000, 7),
                                                                    ('Рим – экскурсионный тур', 2, 65000, 5),
                                                                    ('Каир – пирамиды и Нил', 3, 45000, 6);

-- Добавим услуги
INSERT INTO Services (service_name, service_price) VALUES
                                                       ('Медицинская страховка', 3000),
                                                       ('Трансфер до аэропорта', 2000),
                                                       ('Экскурсия по городу', 4000);

-- Добавим заказы
INSERT INTO Orders (tourist_id, tour_id, service_id, order_date, total_price) VALUES
                                                                                  (1, 1, 1, '2025-08-01', 58000),  -- Иванов, Барселона + страховка
                                                                                  (2, 2, 3, '2025-08-02', 69000); -- Петров, Рим + экскурсия
--Посмотреть все заказы
SELECT * FROM Orders;
--Вывести заказы с именем туриста и названием тура
SELECT o.order_id,
       t.full_name AS tourist,
       tr.tour_name AS tour,
       s.service_name AS service,
       o.total_price,
       o.order_date
FROM Orders o
         JOIN Tourists t ON o.tourist_id = t.tourist_id
         JOIN Tours tr ON o.tour_id = tr.tour_id
         LEFT JOIN Services s ON o.service_id = s.service_id;
--Список туров по странам
SELECT tr.tour_name, c.country_name, tr.price
FROM Tours tr
         JOIN Countries c ON tr.country_id = c.country_id;
