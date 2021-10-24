"""
Translate the billing/payee to something more friendly and readable.
"""

import constants

class Translation:
    column = "payee"
    name = ""
    synonyms = []

    def __init__(self, name, synonyms):
        self.name = name
        self.synonyms = synonyms

    def translate(self):
        return self.name
