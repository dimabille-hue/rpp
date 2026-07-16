from abc import ABC, abstractmethod
from pathlib import Path


class Loader(ABC):
    """
    Источник данных.
    Отвечает только за получение файлов.
    """

    @abstractmethod
    def files(self) -> list[Path]:
        raise NotImplementedError
