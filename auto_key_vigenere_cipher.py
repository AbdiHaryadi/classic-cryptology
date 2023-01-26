import string
from itertools import chain
from letters import Letters
from standard_vigenere_table_generator import StandardVigenereTableGenerator

class AutoKeyVigenereCipher:
    def __init__(self, key):
        if key == "":
            raise ValueError("Key cannot be empty.")

        self._key = key
        self._generate_table()

    def _generate_table(self):
        self._table = StandardVigenereTableGenerator().generate()

    def _index_to_upper_letter(self, c_char_num):
        return chr(c_char_num + ord('A'))

    def encrypt(self, message):
        ciphertext = ""
        key_iterator = chain(Letters(self._key), Letters(message))
        for m_char, k_char in zip(Letters(message), key_iterator):
            ciphertext += self._table[k_char][m_char]
                
        return ciphertext

    def decrypt(self, ciphertext):
        ciphertext_fragments = self._make_fragments_with_key_length(ciphertext)

        message = ""
        current_key = self._key

        for fragment in ciphertext_fragments:
            next_key = ""
            for c_char, k_char in zip(Letters(fragment), Letters(current_key)):
                for m_char in string.ascii_uppercase:
                    if self._table[k_char][m_char] == c_char:
                        break # Found it!
                        
                # table[k_char][m_char] == char

                message += m_char
                next_key += m_char

            current_key = next_key

        return message

    def _make_fragments_with_key_length(self, ciphertext):
        ciphertext_fragments = []
        start_index = 0
        key_length = len(self._key)

        while start_index < len(ciphertext):
            ciphertext_fragments.append(ciphertext[start_index:start_index+key_length])
            start_index += key_length
        return ciphertext_fragments

    @property
    def table(self):
        return self._table.copy()

if __name__ == "__main__":
    key = input("Key: ")
    message = input("Message: ")

    cipher = AutoKeyVigenereCipher(key=key)
    ciphertext = cipher.encrypt(message)
    print("Ciphertext:", ciphertext)
    restored_message = cipher.decrypt(ciphertext)
    print("Restored message:", restored_message)

    # Nanti hasilnya kalau dalam bentuk text, ada pilihan: pakai pembagian 5 karakter atau tidak.
