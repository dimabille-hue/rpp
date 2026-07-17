from dataclasses import dataclass
from datetime import date
from typing import Optional


@dataclass(slots=True)
class Comparable:

    object_id: int

    cadastral_number: str

    address: Optional[str]

    area: float

    price: float

    price_per_sq_meter: float

    observation_date: date

    distance: float

    score: float = 0.0
