class OutputFormatter:
    def __init__(self, no_space_display_value: str,
            five_letters_group_display_value: str):
        self._no_space_display_value = no_space_display_value
        self._five_letters_group_display_value = five_letters_group_display_value

        self._current_display = "no_space"

    def set_display(self, value: str):
        if value == self._no_space_display_value:
            self._current_display = "no_space"
        elif value == self._five_letters_group_display_value:
            self._current_display = "five_letters_group"
        else:
            raise ValueError("Unexpected display value: {}".format(value))

    def format(self, text: str):
        if self._current_display == "no_space":
            return text
        elif self._current_display == "five_letters_group":
            return " ".join([text[i:i+5] for i in range(0, len(text), 5)])

if __name__ == "__main__":
    formatter = OutputFormatter(
        no_space_display_value="option1",
        five_letters_group_display_value="option2"
    )

    formatter.set_display("option1")
    no_space_result = formatter.format("OUTPUTEXAMPLE")
    print(no_space_result)
    assert no_space_result == "OUTPUTEXAMPLE"
    
    formatter.set_display("option2")
    five_letters_group_result = formatter.format("OUTPUTEXAMPLE")
    print(no_space_result)
    assert five_letters_group_result == "OUTPU TEXAM PLE"
