from pathlib import Path
from typing import Iterator
from lxml import etree

from etl.framework.parser import Parser


class EGRNLandParcelParser(Parser):

    NS = {}

    FIELD_MAP = {
        "cad_number": ".//CadastralNumber",
        "area": ".//Area",
        "category": ".//Category",
        "utilization": ".//Utilization",
        "address": ".//Address",
    }

    def parse(self, file: Path) -> Iterator[dict]:

        tree = etree.parse(str(file))
        root = tree.getroot()

        for parcel in root.findall(".//LandRecord", self.NS):

            row = {}

            for field, xpath in self.FIELD_MAP.items():

                node = parcel.find(xpath, self.NS)

                row[field] = node.text if node is not None else None

            yield row
