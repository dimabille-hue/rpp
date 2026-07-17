import csv
import io

import psycopg2


class CopyWriter:

    def __init__(self, connection, table, columns):

        self.connection = connection

        self.table = table

        self.columns = columns

    def write(self, rows):

        buffer = io.StringIO()

        writer = csv.writer(buffer)

        count = 0

        for row in rows:

            writer.writerow([row.get(c) for c in self.columns])

            count += 1

        buffer.seek(0)

        with self.connection.cursor() as cursor:

            cursor.copy_expert(

                f"""
                COPY {self.table}
                ({",".join(self.columns)})
                FROM STDIN
                CSV
                """,

                buffer,

            )

        self.connection.commit()

        return count
