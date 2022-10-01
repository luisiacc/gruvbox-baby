from argparse import ArgumentParser
from copy import copy
from tempfile import TemporaryFile
from typing import Tuple

import svgwrite
from intensity_generator import IntensityShadesGenerator
from palette_generator import PaletteGenerator
from utils import draw_background, hex_to_rgb

from colors import palette, text_colors

parser = ArgumentParser()
parser.add_argument("save_path", type=str)

if __name__ == "__main__":
    args = parser.parse_args()
    save_path = args.save_path
    print("To run the 'svgwrite' package needs to be installed!")
    print("To install: pip install svgwrite")
    print("https://pypi.org/project/svgwrite/")

    print("Creating shades ...")
    drawing = IntensityShadesGenerator.draw(palette)
    with open(f"{save_path}/shades.svg", "w", encoding="utf-8") as file:
        file.write(drawing.tostring())

    print("Creating palettes ...")
    for intensity, value in palette["intensities"].items():
        print(f"Creating palette for intensity: {intensity} ...")
        updated_palette = copy(palette["colors"])
        updated_palette.update(value)
        drawing = PaletteGenerator.draw(updated_palette, intensity)
        with open(f"{save_path}/{intensity}.svg", "w", encoding="utf-8") as file:
            file.write(drawing.tostring())
    print("Done!")
