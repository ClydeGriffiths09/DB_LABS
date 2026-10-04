\set ON_ERROR_STOP 0

INSERT INTO conferences (name, start_date, end_date, location) 
VALUES ('HighLoad 2026', '2027-01-01', '2027-01-02', 'Казань');

INSERT INTO conferences (name, start_date, end_date, location) 
VALUES ('Bad Conf', '2027-05-10', '2027-05-01', 'Москва');

INSERT INTO sessions (conference_id, speaker_id, title, room, start_time, end_time) 
VALUES (1, 1, 'Невозможная секция', 'Зал В', '2026-11-01 15:00:00+03', '2026-11-01 14:00:00+03');

INSERT INTO sessions (conference_id, speaker_id, title, room, start_time, end_time) 
VALUES (1, 99, 'Секция без спикера', 'Зал Г', '2026-11-02 10:00:00+03', '2026-11-02 11:00:00+03');

INSERT INTO registrations (attendee_id, conference_id) 
VALUES (1, 1);

DELETE FROM conferences WHERE id = 1;

INSERT INTO speakers (first_name, last_name, email) 
VALUES (NULL, 'Иванов', 'ivanov@example.com');

INSERT INTO conferences (name, start_date, end_date, location, status) 
VALUES ('Invalid Status', '2027-06-01', '2027-06-02', 'Москва', 'invalid_status');

INSERT INTO registrations (attendee_id, conference_id) 
VALUES (999, 1);

INSERT INTO registrations (attendee_id, conference_id, status) 
VALUES (2, 1, 'invalid_status');

INSERT INTO reviews (session_id, attendee_id, rating, comment) 
VALUES (1, 3, 6, 'Слишком хорошо, чтобы быть правдой');

INSERT INTO reviews (session_id, attendee_id, rating, comment) 
VALUES (1, 3, 0, 'Ноль звезд');

INSERT INTO reviews (session_id, attendee_id, rating, comment) 
VALUES (1, 1, 2, 'Передумал, теперь оценка плохая');

INSERT INTO reviews (session_id, attendee_id, rating) 
VALUES (999, 1, 5);