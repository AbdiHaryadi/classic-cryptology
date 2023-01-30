from standard_vigenere_table_generator import StandardVigenereTableGenerator
from vigenere_cipher import VigenereCipher

class StandardVigenereCipher(VigenereCipher):
    def __init__(self, key):
        super().__init__(
            key=key,
            table=StandardVigenereTableGenerator().generate()
        )

if __name__ == "__main__":
    key = input("Key: ")
    message = input("Message: ")

    cipher = StandardVigenereCipher(key=key)
    ciphertext = cipher.encrypt(message)
    print("Ciphertext:", ciphertext)
    restored_message = cipher.decrypt(ciphertext)
    print("Restored message:", restored_message)

    # Nanti hasilnya kalau dalam bentuk text, ada pilihan: pakai pembagian 5 karakter atau tidak.
