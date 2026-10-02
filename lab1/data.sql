INSERT INTO conferences (name, start_date, end_date, location, status) VALUES
('HighLoad 2026', '2026-11-01', '2026-11-03', 'Москва, Экспоцентр', 'planned'),
('Data Science Conf', '2026-12-10', '2026-12-12', 'Санкт-Петербург, Экспофорум', 'planned'),
('TechWeek 2025', '2025-09-15', '2025-09-17', 'Москва, Крокус Экспо', 'completed'),
('DevFest 2026', '2026-05-20', '2026-05-22', 'Казань, IT-парк', 'cancelled'),
('AI Summit', '2026-10-05', '2026-10-07', 'Онлайн', 'active');

INSERT INTO speakers (first_name, last_name, email, organization) VALUES
('Иван', 'Петров', 'ivan.p@tech.com', 'Yandex'),
('Анна', 'Сидорова', 'anna.s@data.com', 'Sber AI'),
('Алексей', 'Смирнов', 'alex.smirnov@vk.com', 'VK'),
('Мария', 'Иванова', 'maria.i@freelance.ru', NULL),
('John', 'Doe', 'john.doe@global.com', 'Google');

INSERT INTO attendees (first_name, last_name, email) VALUES
('Дмитрий', 'Кузнецов', 'd.kuznetsov@mail.ru'),
('Елена', 'Смирнова', 'e.smirnova@gmail.com'),
('Сергей', 'Волков', 's.volkov@corp.net'),
('Ольга', 'Новикова', 'olga.n@yandex.ru'),
('Максим', 'Соколов', 'max.sokolov@inbox.ru');

INSERT INTO sessions (conference_id, speaker_id, title, room, start_time, end_time) VALUES
(1, 1, 'Оптимизация PostgreSQL', 'Зал А', '2026-11-01 10:00:00+03', '2026-11-01 11:30:00+03'),
(1, 2, 'Машинное обучение в проде', 'Зал Б', '2026-11-01 12:00:00+03', '2026-11-01 13:00:00+03'),
(1, 3, 'Микросервисы на Go', 'Зал А', '2026-11-02 10:00:00+03', '2026-11-02 11:00:00+03'),
(2, 2, 'Нейросети для анализа текста', 'Главный зал', '2026-12-10 11:00:00+03', '2026-12-10 12:30:00+03'),
(2, 5, 'LLM в enterprise-решениях', 'Главный зал', '2026-12-11 14:00:00+03', '2026-12-11 15:30:00+03'),
(3, 1, 'Итоги года в HighLoad', 'Зал 1', '2025-09-15 10:00:00+03', '2025-09-15 11:00:00+03'),
(4, NULL, 'Панельная дискуссия (спикер ТБА)', 'Онлайн', '2026-05-20 18:00:00+03', '2026-05-20 19:00:00+03');

INSERT INTO registrations (attendee_id, conference_id, status) VALUES
(1, 1, 'attended'),
(1, 2, 'registered'),
(2, 1, 'registered'),
(2, 3, 'attended'),
(3, 1, 'cancelled'),
(4, 5, 'registered'),
(5, 2, 'registered');