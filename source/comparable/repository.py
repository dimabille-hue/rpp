from sqlalchemy import text


SQL = text("""

WITH target AS (

    SELECT

        id,

        geometry,

        area

    FROM report.object_passport

    WHERE cadastral_number=:cad

)

SELECT

    o.id,

    o.cadastral_number,

    o.address_text,

    m.price,

    m.price_per_sq_meter,

    m.observation_date,

    o.area,

    ST_Distance(

        o.centroid,

        t.geometry

    ) AS distance

FROM target t

JOIN core.object o

ON ST_DWithin(

    o.centroid,

    t.geometry,

    :radius

)

JOIN market.observation m

ON m.object_id=o.id

WHERE

    o.id<>t.id

ORDER BY

distance

LIMIT 500;

""")


class ComparableRepository:

    def __init__(self, engine):

        self.engine = engine

    def nearby(self, cad_number, radius):

        with self.engine.begin() as cn:

            return cn.execute(

                SQL,

                {

                    "cad": cad_number,

                    "radius": radius

                }

            ).mappings().all()
