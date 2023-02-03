from itertools import chain
import string
from algorithm.letters import Letters

class PlayfairTableGenerator:
    def generate(self, key: str):
        used_letters = set()
        table_sequence = []

        for letter in chain(Letters(key), string.ascii_uppercase):
            if letter in used_letters or letter == "J":
                continue # Skip

            table_sequence.append(letter)
            used_letters.add(letter)

        return [
            table_sequence[0:5],
            table_sequence[5:10],
            table_sequence[10:15],
            table_sequence[15:20],
            table_sequence[20:25],
        ]

class PlayfairBigrams:
    def __init__(self, text):
        self._letters = Letters(text)

    def __iter__(self):
        self._letters_iter = iter(self._letters)
        self._next_first_letter = None
        return self

    def __next__(self):
        first_letter = self._get_first_letter()
        second_letter = next(self._letters_iter, "X").replace("J", "I")

        if first_letter != second_letter:
            return first_letter + second_letter
        else:
            self._next_first_letter = second_letter
            if first_letter != "X":
                return first_letter + "X"
            else:
                return first_letter + "Q"

    def _get_first_letter(self):
        if self._next_first_letter is None:
            return next(self._letters_iter).replace("J", "I")
        else:
            first_letter = self._next_first_letter
            self._next_first_letter = None
            return first_letter

class PlayfairCipher:
    def __init__(self, key: str):
        self._table = PlayfairTableGenerator().generate(key)

    def encrypt(self, message: str):
        ciphertext = ""
        for bigram in PlayfairBigrams(message):
            m_first_row, m_first_col = self._get_position(bigram[0])
            m_second_row, m_second_col = self._get_position(bigram[1])

            if m_first_row == m_second_row:
                ciphertext += self._table[m_first_row][(m_first_col + 1) % 5]
                ciphertext += self._table[m_first_row][(m_second_col + 1) % 5]

            elif m_first_col == m_second_col:
                ciphertext += self._table[(m_first_row + 1) % 5][m_first_col]
                ciphertext += self._table[(m_second_row + 1) % 5][m_first_col]

            else: # different row, different column
                ciphertext += self._table[m_first_row][m_second_col]
                ciphertext += self._table[m_second_row][m_first_col]

        return ciphertext

    def decrypt(self, ciphertext: str):
        message = ""
        for bigram in PlayfairBigrams(ciphertext):
            m_first_row, m_first_col = self._get_position(bigram[0])
            m_second_row, m_second_col = self._get_position(bigram[1])

            if m_first_row == m_second_row:
                message += self._table[m_first_row][(m_first_col - 1) % 5]
                message += self._table[m_first_row][(m_second_col - 1) % 5]

            elif m_first_col == m_second_col:
                message += self._table[(m_first_row - 1) % 5][m_first_col]
                message += self._table[(m_second_row - 1) % 5][m_first_col]

            else: # different row, different column
                message += self._table[m_first_row][m_second_col]
                message += self._table[m_second_row][m_first_col]

        return message

    def _get_position(self, character):
        result = (-1, -1) # Initialize with dummy
        for row in range(5):
            for col in range(5):
                if self._table[row][col] == character:
                    result = (row, col)

        return result

if __name__ == "__main__":
    key = input("Key: ")
    message = input("Message: ")

    cipher = PlayfairCipher(key=key)
    ciphertext = cipher.encrypt(message)
    print("Ciphertext:", ciphertext)
    restored_message = cipher.decrypt(ciphertext)
    print("Restored message:", restored_message)