from itertools import cycle

class ExtendedVigenereKeyCycler:
    def __init__(self, key: bytes):
        if len(key) == 0:
            raise ValueError("Key cannot be empty.")

        self._key = key

    def __iter__(self):
        self._key_iter = cycle(self._key)
        return self

    def __next__(self):
        return next(self._key_iter)

class ExtendedVigenereCipher:
    def __init__(self, key: bytes):
        if len(key) == 0:
            raise ValueError("Key cannot be empty.")

        self._key = key
        self._generate_table()

    def _generate_table(self):
        table = {}
        for k_index in range(256):
            table[k_index] = {}
            for m_index in range(256):
                c_index = (m_index + k_index) % 256
                table[k_index][m_index] = c_index

        self._table = table

    def encrypt(self, message: bytes):
        ciphertext_indices = []
        for m_index, k_index in zip(message, ExtendedVigenereKeyCycler(self._key)):
            ciphertext_indices.append(self._table[k_index][m_index])

        return bytes(ciphertext_indices)

    def decrypt(self, ciphertext: bytes):
        message_indices = []
        for c_index, k_index in zip(ciphertext, ExtendedVigenereKeyCycler(self._key)):
            for m_index in range(256):
                if self._table[k_index][m_index] == c_index:
                    break # Found it!
                    
            # table[k_index][m_index] == c_index

            message_indices.append(m_index)
                
        return bytes(message_indices)

    @property
    def table(self):
        return self._table.copy()

if __name__ == "__main__":
    key = bytes(input("Key: "), encoding="ascii")
    cipher = ExtendedVigenereCipher(key=key)

    filename = input("Filename: ")
    with open(filename, mode="rb") as file:
        message = file.read()

    ciphertext = cipher.encrypt(message)

    with open("output", mode="wb") as file:
        file.write(ciphertext)

    restored_message = cipher.decrypt(ciphertext)
    with open("output_decrypted", mode="wb") as file:
        file.write(restored_message)

    assert restored_message == message
