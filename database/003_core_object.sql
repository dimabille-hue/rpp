-- =============================================================================
-- Regional Property Intelligence Platform
-- Core Object Model
-- Version: 0.1
-- =============================================================================

SET search_path TO core, public;

-- -----------------------------------------------------------------------------
-- Справочник типов объектов
-- -----------------------------------------------------------------------------

CREATE TABLE object_type
(
    id              SMALLSERIAL PRIMARY KEY,
    code            VARCHAR(30) UNIQUE NOT NULL,
    name            TEXT NOT NULL,
    description     TEXT
);

INSERT INTO object_type(code,name)
VALUES
('LAND_PARCEL','Земельный участок'),
('BUILDING','Здание'),
('PREMISE','Помещение'),
('CONSTRUCTION','Сооружение'),
('PARKING','Машино-место');

-- -----------------------------------------------------------------------------
-- Статусы объекта
-- -----------------------------------------------------------------------------

CREATE TABLE object_status
(
    id          SMALLSERIAL PRIMARY KEY,
    code        VARCHAR(30) UNIQUE NOT NULL,
    name        TEXT NOT NULL
);

INSERT INTO object_status(code,name)
VALUES
('ACTIVE','Актуальный'),
('ARCHIVED','Архивный'),
('DELETED','Удален'),
('UNKNOWN','Не определен');

-- -----------------------------------------------------------------------------
-- Главная таблица объектов
-- -----------------------------------------------------------------------------

CREATE TABLE object
(
    id                  BIGSERIAL PRIMARY KEY,

    object_uid          UUID NOT NULL DEFAULT gen_random_uuid(),

    object_type_id      SMALLINT NOT NULL
        REFERENCES object_type(id),

    status_id           SMALLINT NOT NULL
        REFERENCES object_status(id),

    cadastral_number    VARCHAR(40),

    parent_object_id    BIGINT
        REFERENCES object(id),

    name                TEXT,

    address_text        TEXT,

    geometry            geometry(Geometry,3857),

    centroid            geometry(Point,3857),

    area                NUMERIC(18,2),

    created_at          TIMESTAMP NOT NULL DEFAULT now(),

    updated_at          TIMESTAMP NOT NULL DEFAULT now(),

    valid_from          DATE,

    valid_to            DATE,

    is_actual           BOOLEAN DEFAULT TRUE
);

ALTER TABLE object
ADD CONSTRAINT uq_object_uid
UNIQUE(object_uid);

CREATE INDEX idx_object_cadastral
ON object(cadastral_number);

CREATE INDEX idx_object_type
ON object(object_type_id);

CREATE INDEX idx_object_status
ON object(status_id);

CREATE INDEX idx_object_actual
ON object(is_actual);

CREATE INDEX idx_object_parent
ON object(parent_object_id);

CREATE INDEX idx_object_geom
ON object
USING GIST(geometry);

CREATE INDEX idx_object_centroid
ON object
USING GIST(centroid);

COMMENT ON TABLE object
IS 'Базовая таблица всех объектов недвижимости';
