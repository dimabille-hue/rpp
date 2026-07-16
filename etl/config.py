from pathlib import Path

ROOT = Path(__file__).parent.parent

DATA = ROOT / "data"

RAW = DATA / "raw"

PROCESSED = DATA / "processed"

LOGS = ROOT / "logs"

DATABASE = {

    "host": "localhost",

    "port": 5432,

    "database": "property",

    "user": "postgres",

    "password": "postgres"

}
