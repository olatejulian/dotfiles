#!/usr/bin/env python
import sys


def format_section_header(string: str) -> str:
    LINE_LENGTH = 100

    string_length: int = len(string)

    calculated_length: int = (LINE_LENGTH - string_length) // 2

    a_offset: int = 2
    b_offset: int = 1
    c_offset: int = 1
    d_offset: int = 0

    section_string: str = (
        "# "
        + "=" * (calculated_length - (a_offset + b_offset))
        + "<"
        + string
        + ">"
        + "=" * (calculated_length - (c_offset + d_offset))
    )

    section_string += "=" if string_length % 2 != 0 else ""

    assert len(section_string) == LINE_LENGTH, (
        f"section_string length: {len(section_string)} != LINE_LENGTH: {LINE_LENGTH}"
    )

    return section_string


if __name__ == "__main__":
    sys.stdout.write(format_section_header(sys.argv[1]) + "\n")

    sys.exit(0)
