SET search_path TO factors, public;

CREATE TABLE factor_value
(
    id                      BIGSERIAL PRIMARY KEY,

    assessment_cycle_id     BIGINT
        REFERENCES system.assessment_cycle(id),

    object_id               BIGINT
        REFERENCES core.object(id),

    factor_id               BIGINT
        REFERENCES factor(id),

    numeric_value           DOUBLE PRECISION,

    text_value              TEXT,

    date_value              DATE,

    calculated_at           TIMESTAMP DEFAULT now(),

    calculation_version     INTEGER DEFAULT 1
);

CREATE INDEX idx_factor_object
ON factor_value(object_id);

CREATE INDEX idx_factor_cycle
ON factor_value(assessment_cycle_id);

CREATE INDEX idx_factor
ON factor_value(factor_id);

CREATE UNIQUE INDEX uq_factor
ON factor_value(
    assessment_cycle_id,
    object_id,
    factor_id
);
