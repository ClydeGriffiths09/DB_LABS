DROP TABLE IF EXISTS reviews CASCADE;
DROP TABLE IF EXISTS registrations CASCADE;
DROP TABLE IF EXISTS sessions CASCADE;
DROP TABLE IF EXISTS attendees CASCADE;
DROP TABLE IF EXISTS speakers CASCADE;
DROP TABLE IF EXISTS conferences CASCADE;

CREATE TABLE conferences (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    location VARCHAR(255) NOT NULL,
    status VARCHAR(20) DEFAULT 'planned' CHECK (
        status IN ('planned', 'active', 'completed', 'cancelled')
    ),
    CONSTRAINT chk_conference_dates CHECK (end_date >= start_date)
);

CREATE TABLE speakers (
    id BIGSERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,    
    email VARCHAR(255) NOT NULL UNIQUE,
    organization VARCHAR(255)
);

CREATE TABLE attendees (
    id BIGSERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    registration_date TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE sessions (
    id BIGSERIAL PRIMARY KEY,
    conference_id BIGINT NOT NULL REFERENCES conferences(id) ON DELETE RESTRICT,
    speaker_id BIGINT REFERENCES speakers(id) ON DELETE SET NULL,
    title VARCHAR(255) NOT NULL,
    room VARCHAR(100) NOT NULL,
    start_time TIMESTAMPTZ NOT NULL,
    end_time TIMESTAMPTZ NOT NULL,
    CONSTRAINT chk_session_times CHECK (end_time > start_time)
);

CREATE TABLE registrations (
    id BIGSERIAL PRIMARY KEY,
    attendee_id BIGINT NOT NULL REFERENCES attendees(id) ON DELETE CASCADE,
    conference_id BIGINT NOT NULL REFERENCES conferences(id) ON DELETE CASCADE,
    registration_date TIMESTAMPTZ NOT NULL DEFAULT now(),
    status VARCHAR(20) DEFAULT 'registered' CHECK (
        status IN ('registered', 'attended', 'cancelled')
    ),
    CONSTRAINT uq_attendee_conference UNIQUE (attendee_id, conference_id)
);

CREATE TABLE reviews (
    id BIGSERIAL PRIMARY KEY,
    session_id BIGINT NOT NULL REFERENCES sessions(id) ON DELETE CASCADE,
    attendee_id BIGINT NOT NULL REFERENCES attendees(id) ON DELETE CASCADE,
    rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    CONSTRAINT uq_review_session_attendee UNIQUE (session_id, attendee_id)
);