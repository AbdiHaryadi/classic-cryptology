import string
from algorithm.letters import Letters

class Rotor:
    def __init__(self, letters: str, notch="Z"):
        if notch not in string.ascii_uppercase:
            raise ValueError("Notch should be an uppercase letter.")

        self._r_letters = letters
        self._notch = notch
        self._position_index = 0

    def encipher(self, i_letter):
        if i_letter not in string.ascii_uppercase:
            raise ValueError("I-letter should be an uppercase letter.")
        
        i_letter_index = self._get_letter_index(i_letter)
        r_letter_index = (i_letter_index + self._position_index) % 26
        l_letter = self._r_letters[r_letter_index]
        l_letter_index = (self._get_letter_index(l_letter)) % 26
        o_letter_index = (l_letter_index - self._position_index) % 26

        return self._get_letter_by_index(o_letter_index)

    def decipher(self, o_letter):
        if o_letter not in string.ascii_uppercase:
            raise ValueError("O-letter should be an uppercase letter.")

        o_letter_index = self._get_letter_index(o_letter)
        l_letter_index = (o_letter_index + self._position_index) % 26
        l_letter = self._get_letter_by_index(l_letter_index)
        
        for r_letter_index in range(26):
            if self._r_letters[r_letter_index] == l_letter:
                break # Found it!

        i_letter_index = (r_letter_index - self._position_index) % 26
        return self._get_letter_by_index(i_letter_index)
    
    def _get_letter_index(self, m_letter):
        return ord(m_letter) - ord("A")

    def _get_letter_by_index(self, m_letter_index):
        return chr(m_letter_index + ord("A"))

    def advance(self):
        self._position_index = (self._position_index + 1) % 26

    @property
    def notch(self):
        return self._notch

    @property
    def position(self):
        return self._get_letter_by_index(self._position_index)

    @position.setter
    def position(self, new_position):
        if new_position not in string.ascii_uppercase:
            raise ValueError("Position should be an uppercase letter.")

        self._position_index = self._get_letter_index(new_position)

class Reflector:
    def __init__(self, letters: str):
        for letter_index in range(26):
            reflected_letter = letters[letter_index]
            reflected_letter_index = self._get_letter_index(reflected_letter)

            if letters[reflected_letter_index] != self._get_letter_by_index(letter_index):
                raise ValueError("Letters is not reflexive.")

        self._letters = letters

    def reflect(self, letter):
        if letter not in string.ascii_uppercase:
            raise ValueError("M-letter should be an uppercase letter.")

        reflected_letter_index = self._get_letter_index(letter)
        return self._letters[reflected_letter_index]
    
    def _get_letter_index(self, m_letter):
        return ord(m_letter) - ord("A")

    def _get_letter_by_index(self, m_letter_index):
        return chr(m_letter_index + ord("A"))

class EnigmaCipher:
    def __init__(self, rotors: list[Rotor], reflector: Reflector, initial_positions="AAA"):
        if len(rotors) != len(initial_positions):
            raise ValueError("Length of rotors and initial position does not match.")
        
        if any([(position not in string.ascii_uppercase) for position in initial_positions]):
            raise ValueError("Each positions should only an uppercase letter.")

        self._rotors = rotors
        self._reflector = reflector
        self._initial_positions = initial_positions

    def _reset_rotors(self):
        for rotor, initial_position in zip(self._rotors, self._initial_positions):
            rotor.position = initial_position

    def encrypt(self, message: str):
        self._reset_rotors()
        ciphertext = ""

        for m_letter in Letters(message):
            self._advance_rotors()

            current_letter = m_letter
            for rotor in self._rotors[::-1]:
                current_letter = rotor.encipher(current_letter)
            
            current_letter = self._reflector.reflect(current_letter)

            for rotor in self._rotors:
                current_letter = rotor.decipher(current_letter)

            ciphertext += current_letter

        return ciphertext

    def _advance_rotors(self):
        advance_rotor = True
        rotor_index = 2
        while advance_rotor:
            rotor = self._rotors[rotor_index]
            prev_rotor_position = rotor.position
            rotor.advance()

            if prev_rotor_position == rotor.notch and rotor_index > 0:
                rotor_index -= 1
            else:
                advance_rotor = False

    def decrypt(self, ciphertext):
        return self.encrypt(ciphertext)

if __name__ == "__main__":
    key = input("Key (length of 3): ").upper()
    message = input("Message: ")

    cipher = EnigmaCipher(
        rotors=[
            Rotor(letters="EKMFLGDQVZNTOWYHXUSPAIBRCJ", notch="Q"),
            Rotor(letters="AJDKSIRUXBLHWTMCQGZNPYFVOE", notch="E"),
            Rotor(letters="BDFHJLCPRTXVZNYEIWGAKMUSQO", notch="V")
        ],
        reflector=Reflector(letters="YRUHQSLDPXNGOKMIEBFZCWVJAT"),
        initial_positions=key
    )

    ciphertext = cipher.encrypt(message)
    print("Ciphertext:", ciphertext)
    restored_message = cipher.decrypt(ciphertext)
    print("Restored message:", restored_message)