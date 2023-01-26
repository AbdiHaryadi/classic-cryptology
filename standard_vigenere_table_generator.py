import string

class StandardVigenereTableGenerator:
    def generate(self):
        table = {}
        for k_char_index, k_char in enumerate(string.ascii_uppercase):
            table[k_char] = {}
            for m_char_index, m_char in enumerate(string.ascii_uppercase):
                c_char_index = (m_char_index + k_char_index) % 26
                c_char = self._index_to_upper_letter(c_char_index)
                table[k_char][m_char] = c_char

        return table

    def _index_to_upper_letter(self, c_char_num):
        return chr(c_char_num + ord('A'))
