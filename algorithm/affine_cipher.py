from letters import Letters

class AffineCipher:
    def __init__(self, scale_key: int, bias_key: int):
        if self._gcd(scale_key, 26) != 1:
            raise ValueError("Module key must be relatively prime to bias key.")

        self._scale_key = scale_key
        self._bias_key = bias_key
        self._determine_inverse_scale_key()

    def _gcd(self, a, b):
        if b == 0:
            return a
        else:
            return self._gcd(b, a % b)

    def _determine_inverse_scale_key(self):
        for key in range(1, 26):
            if (self._scale_key * key) % 26 == 1:
                # Found it!
                self._inverse_scale_key = key
                break

    def encrypt(self, message: str):
        ciphertext = ""
        for m_letter in Letters(message):
            m_letter_index = self._get_letter_index(m_letter)
            c_letter_index = (self._scale_key * m_letter_index + self._bias_key) % 26
            ciphertext += self._get_letter_by_index(c_letter_index)

        return ciphertext

    def _get_letter_index(self, letter):
        return ord(letter) - ord("A")

    def _get_letter_by_index(self, letter_index):
        return chr(letter_index + ord("A"))

    def decrypt(self, ciphertext: str):
        message = ""
        for c_letter in Letters(ciphertext):
            c_letter_index = self._get_letter_index(c_letter)
            m_letter_index = ((c_letter_index - self._bias_key) * self._inverse_scale_key) % 26
            message += self._get_letter_by_index(m_letter_index)

        return message

if __name__ == "__main__":
    message = input("Message: ")
    cipher = AffineCipher(scale_key=7, bias_key=10)
    ciphertext = cipher.encrypt(message)
    print("Ciphertext:", ciphertext)
    restored_message = cipher.decrypt(ciphertext)
    print("Restored message:", restored_message)