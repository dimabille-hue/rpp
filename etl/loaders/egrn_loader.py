from pathlib import Path

import lxml.etree as ET

from .base import Loader

class EGRNLoader(Loader):

    source = "ЕГРН"

    def load(self, directory):

        directory = Path(directory)

        for file in directory.glob("*.xml"):

            yield ET.parse(file)
