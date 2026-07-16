from abc import ABC

class Loader(ABC):

    source = ""

    def load(self):

        raise NotImplementedError()

    def validate(self):

        return True

    def transform(self):

        pass

    def save(self):

        pass
