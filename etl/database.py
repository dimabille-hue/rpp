from sqlalchemy import create_engine

from .config import DATABASE

engine = create_engine(

    f"postgresql://{DATABASE['user']}:{DATABASE['password']}@"

    f"{DATABASE['host']}:{DATABASE['port']}/"

    f"{DATABASE['database']}",

    future=True

)
