import click

from src.database import engine

from src.domain.object.repository import ObjectRepository
from src.domain.object.service import ObjectService


@click.command()

@click.argument("cad_number")

def main(cad_number):

    service = ObjectService(

        ObjectRepository(engine)

    )

    passport = service.passport(cad_number)

    print(passport)


if __name__ == "__main__":

    main()
