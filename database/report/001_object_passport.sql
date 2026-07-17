SET search_path TO report, core, market, factors, system, public;

CREATE OR REPLACE VIEW report.object_passport AS

SELECT

    o.id,

    o.object_uid,

    o.cadastral_number,

    ot.name               AS object_type,

    os.name               AS status,

    o.address_text,

    o.area,

    lp.category_land,

    lp.permitted_use,

    lp.cadastral_cost,

    lp.cadastral_cost_date,

    o.geometry,

    o.centroid,

    o.created_at,

    o.updated_at

FROM core.object o

JOIN core.object_type ot

ON ot.id = o.object_type_id

JOIN core.object_status os

ON os.id = o.status_id

LEFT JOIN core.land_parcel lp

ON lp.object_id = o.id

WHERE o.is_actual = TRUE;
