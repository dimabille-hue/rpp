CREATE TABLE system.dataset
(
    id              BIGSERIAL PRIMARY KEY,

    code            VARCHAR(50) UNIQUE NOT NULL,

    name            TEXT NOT NULL,

    description     TEXT,

    source          TEXT,

    version         VARCHAR(20),

    loaded_at       TIMESTAMP,

    created_at      TIMESTAMP DEFAULT now()
);

CREATE TABLE system.event
(
    id              BIGSERIAL PRIMARY KEY,

    event_type      VARCHAR(100) NOT NULL,

    object_type     VARCHAR(50),

    object_id       BIGINT,

    event_time      TIMESTAMP DEFAULT now(),

    payload         JSONB
);

CREATE INDEX idx_event_type
ON system.event(event_type);

CREATE INDEX idx_event_object
ON system.event(object_type, object_id);
