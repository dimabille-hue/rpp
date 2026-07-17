class ComparableService:

    def search(

        self,

        cad_number

    ):

        rows = repository.nearby(...)

        rows = filters.by_area(rows)

        rows = filters.by_date(rows)

        rows = ranking.score(rows)

        return rows
