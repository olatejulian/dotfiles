#!/usr/bin/env python
import sys


def ppi_calculator(image_width, image_height, diagonal_size):
    # Calculate the pixel density (PPI)
    ppi = (image_width**2 + image_height**2) ** 0.5 / diagonal_size
    return ppi


if __name__ == "__main__":
    if len(sys.argv) != 4:
        print(
            "Usage: python ppi_calculator.py <image_width> <image_height> <diagonal_size>"
        )
        sys.exit(1)

    image_width = int(sys.argv[1])
    image_height = int(sys.argv[2])
    diagonal_size = float(sys.argv[3])

    ppi = ppi_calculator(image_width, image_height, diagonal_size)
    print(f"Pixels Per Inch (PPI): {ppi:.2f}")

    sys.exit(0)
