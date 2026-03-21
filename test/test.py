import math


class Calculator:
    def __init__(self, mode: str) -> None:

        if mode in ("rad", "deg"):
            self.mode = mode
        else:
            self.mode = "rad"


if __name__ == "__main__":
    calc = Calculator("deg")
    print(calc.mode)
