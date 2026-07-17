from abc import ABC, abstractmethod
from typing import Iterable


class Parser(ABC):
    """
    Любой парсер возвращает поток словарей.

    Один словарь = одна запись.
    """

    @abstractmethod
    def parse(self, file) -> Iterable[dict]:
        ...
