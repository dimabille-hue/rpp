from pathlib import Path

from etl.framework.loader import Loader


class XMLLoader(Loader):

    def __init__(self, directory):

        self.directory = Path(directory)

    def files(self):

        return sorted(self.directory.glob("*.xml"))
