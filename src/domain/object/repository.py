from sqlalchemy import text


class ObjectRepository:

    def __init__(self, engine):

        self.engine = engine

    def get_by_cadastral_number(self, cad_number):

        sql = text("""

        SELECT

            o.id,

            o.cadastral_number,

            t.code,

            o.address_text,

            lp.area_registered,

            lp.cadastral_cost,

            lp.cadastral_cost_date

        FROM core.object o

        JOIN core.object_type t

          ON t.id=o.object_type_id

        LEFT JOIN core.land_parcel lp

          ON lp.object_id=o.id

        WHERE o.cadastral_number=:cad

          AND o.is_actual=true

        """)

        with self.engine.begin() as cn:

            row = cn.execute(sql, {"cad": cad_number}).mappings().first()

        return row
