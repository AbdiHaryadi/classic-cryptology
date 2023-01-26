import string

class Letters:
    def __init__(self, text):
        self._letters = ""
        for character in text.upper():
            if character in string.ascii_uppercase:
                self._letters += character

    def __iter__(self):
        self._letters_iter = iter(self._letters)
        return self

    def __next__(self):
        return next(self._letters_iter)