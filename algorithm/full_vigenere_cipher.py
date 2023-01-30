import random
import string
from vigenere_cipher import VigenereCipher

class FullVigenereCipher(VigenereCipher):
    def __init__(self, key):
        super().__init__(
            key=key,
            table=self._generate_table()
        )

    def _generate_table(self):
        table = {}
        for k_char in string.ascii_uppercase:
            table[k_char] = {}

            c_char_list = list(string.ascii_uppercase)
            random.shuffle(c_char_list)

            for m_char, c_char in zip(string.ascii_uppercase, c_char_list):
                table[k_char][m_char] = c_char

        return table

if __name__ == "__main__":
    key = input("Key: ")
    message = input("Message: ")

    cipher = FullVigenereCipher(key=key)
    print("Table:\n", cipher.table)

    ciphertext = cipher.encrypt(message)
    print("Ciphertext:", ciphertext)
    restored_message = cipher.decrypt(ciphertext)
    print("Restored message:", restored_message)

    # Nanti hasilnya kalau dalam bentuk text, ada pilihan: pakai pembagian 5 karakter atau tidak.
