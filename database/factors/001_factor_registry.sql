SET search_path TO factors, public;

CREATE TABLE factor_group
(
    id          SERIAL PRIMARY KEY,

    code        VARCHAR(50) UNIQUE NOT NULL,

    name        TEXT NOT NULL,

    description TEXT
);

INSERT INTO factor_group(code,name)
VALUES
('LOCATION','Местоположение'),
('TRANSPORT','Транспорт'),
('SOCIAL','Социальная инфраструктура'),
('ENGINEERING','Инженерная инфраструктура'),
('MARKET','Рынок'),
('ENVIRONMENT','Экология'),
('LEGAL','Правовые характеристики');

CREATE TABLE factor
(
    id                  BIGSERIAL PRIMARY KEY,

    code                VARCHAR(80) UNIQUE NOT NULL,

    factor_group_id     INTEGER
        REFERENCES factor_group(id),

    name                TEXT NOT NULL,

    description         TEXT,

    unit                VARCHAR(30),

    data_type           VARCHAR(30),

    calculation_method  TEXT,

    version             INTEGER DEFAULT 1,

    enabled             BOOLEAN DEFAULT TRUE
);

CREATE INDEX idx_factor_group
ON factor(factor_group_id);
