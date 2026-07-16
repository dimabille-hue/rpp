SET search_path TO market, public;

CREATE TABLE adjustment_type
(
    id          SERIAL PRIMARY KEY,

    code        VARCHAR(30) UNIQUE,

    name        TEXT
);

INSERT INTO adjustment_type(code,name)
VALUES
('LOCATION','Местоположение'),
('AREA','Площадь'),
('DATE','Дата сделки'),
('QUALITY','Качество'),
('UTILITIES','Коммуникации');

CREATE TABLE adjustment
(
    id                  BIGSERIAL PRIMARY KEY,

    observation_id      BIGINT
        REFERENCES observation(id)
        ON DELETE CASCADE,

    adjustment_type_id  INTEGER
        REFERENCES adjustment_type(id),

    adjustment_percent  NUMERIC(8,2),

    comment             TEXT,

    created_at          TIMESTAMP DEFAULT now()
);
