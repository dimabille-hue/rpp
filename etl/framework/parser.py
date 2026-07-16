from abc import ABC, abstractmethod


class Parser(ABC):
    """
    Преобразование исходного файла
    в поток словарей.
    """

    @abstractmethod
    def parse(self, file):

        yield {}
