class Pipeline:

    def __init__(self, loader, parser, writer):

        self.loader = loader

        self.parser = parser

        self.writer = writer

    def run(self):

        for file in self.loader.files():

            rows = self.parser.parse(file)

            self.writer.write(rows)
