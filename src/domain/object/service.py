from .repository import ObjectRepository


class ObjectService:

    def __init__(self, repository):

        self.repository = repository

    def passport(self, cadastral_number):

        return self.repository.get_by_cadastral_number(
            cadastral_number
        )
