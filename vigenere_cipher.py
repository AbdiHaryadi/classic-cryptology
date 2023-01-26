import string
from itertools import cycle
from letters import Letters

class VigenereKeyCycler:
    def __init__(self, key):
        if key == "":
            raise ValueError("Key cannot be empty.")

        self._key_letters = ""
        for character in key.upper():
            if character in string.ascii_uppercase:
                self._key_letters += character

    def __iter__(self):
        self._key_iter = cycle(self._key_letters)
        return self

    def __next__(self):
        return next(self._key_iter)

class VigenereCipher:
    def __init__(self, key, table):
        if key == "":
            raise ValueError("Key cannot be empty.")

        self._key = key
        self._table = table

    def encrypt(self, message):
        ciphertext = ""
        for m_char, k_char in zip(Letters(message), VigenereKeyCycler(self._key)):
            ciphertext += self._table[k_char][m_char]
                
        return ciphertext

    def decrypt(self, ciphertext):
        message = ""
        for c_char, k_char in zip(Letters(ciphertext), VigenereKeyCycler(self._key)):
            for m_char in string.ascii_uppercase:
                if self._table[k_char][m_char] == c_char:
                    break # Found it!
                    
            # table[k_char][m_char] == char

            message += m_char
                
        return message

    @property
    def table(self):
        return self._table.copy()
