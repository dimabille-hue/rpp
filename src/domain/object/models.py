from dataclasses import dataclass
from datetime import date
from typing import Optional


@dataclass(slots=True)
class PropertyObject:

    id: int

    cadastral_number: str

    object_type: str

    address: Optional[str]

    area: Optional[float]

    cadastral_cost: Optional[float]

    valuation_date: Optional[date]
