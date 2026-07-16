SET search_path TO system, public;

CREATE TABLE assessment_cycle
(
    id                  BIGSERIAL PRIMARY KEY,

    code                VARCHAR(30) UNIQUE NOT NULL,

    name                TEXT NOT NULL,

    description         TEXT,

    valuation_date      DATE NOT NULL,

    market_start_date   DATE,

    market_end_date     DATE,

    approval_date       DATE,

    status              VARCHAR(30) DEFAULT 'PLANNED',

    created_at          TIMESTAMP DEFAULT now()
);

COMMENT ON TABLE assessment_cycle IS
'Туры государственной кадастровой оценки';
