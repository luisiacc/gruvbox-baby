from copy import copy
from tempfile import TemporaryFile
from typing import Dict, Tuple

import svgwrite
from utils import draw_background, hex_to_rgb

from colors import palette


class IntensityShadesGenerator:
    X_PLANE = 1920
    Y_PLANE = 1080
    COLOR_BOX_X = 480
    COLOR_BOX_Y = 180
    START_X = 0
    START_Y = 0
    X_MARGIN_RIGHT = 0
    Y_MARGIN_TOP = 0

    @staticmethod
    def _move_color_position(x: int, y: int) -> Tuple[int, int]:
        return x, y + IntensityShadesGenerator.COLOR_BOX_Y

    @staticmethod
    def _move_shade_position(x: int, y: int) -> Tuple[int, int]:
        # pylint: disable=unused-argument
        return (
            x + IntensityShadesGenerator.COLOR_BOX_X,
            IntensityShadesGenerator.START_Y,
        )

    @staticmethod
    def _draw_shade(
        dwg: svgwrite.Drawing, color_name: str, color_value: str, x: int, y: int
    ) -> None:
        dwg.add(
            dwg.rect(
                insert=(x, y),
                size=(
                    IntensityShadesGenerator.COLOR_BOX_X,
                    IntensityShadesGenerator.COLOR_BOX_Y,
                ),
                fill=hex_to_rgb(color_value),
            )
        )
        text_color = "#ffffff"
        dwg.add(
            svgwrite.text.Text(
                color_name.replace("_", " "),
                insert=(x + 25, y + 35),
                fill=hex_to_rgb(text_color),
                font_size="28px",
            )
        )
        dwg.add(
            svgwrite.text.Text(
                color_value,
                insert=(x + 25, y + IntensityShadesGenerator.COLOR_BOX_Y - 15),
                fill=hex_to_rgb(text_color),
                font_size="28px",
            )
        )

    @staticmethod
    def _draw_shade_header(dwg, shade_name, x, y) -> None:
        text_color = palette["colors"]["dark0"]
        dwg.add(
            svgwrite.text.Text(
                shade_name.replace("_", " "),
                insert=(x + 25, y + 50),
                fill=hex_to_rgb(text_color),
                font_size="42px",
                font_weight="bold",
            )
        )

    @staticmethod
    def draw(palette: dict) -> svgwrite.Drawing:
        shade_color_names = [
            "dark0",
            "dark",
            "background_dark",
            "background",
            "background_light",
        ]
        svg_file = TemporaryFile("r+", encoding="utf-8")
        dwg = svgwrite.Drawing(
            svg_file,
            profile="tiny",
            size=(IntensityShadesGenerator.X_PLANE, IntensityShadesGenerator.Y_PLANE),
        )

        current_x = IntensityShadesGenerator.START_X
        current_y = IntensityShadesGenerator.START_Y

        draw_background(
            dwg,
            "#ffffff",
            IntensityShadesGenerator.X_PLANE,
            IntensityShadesGenerator.Y_PLANE,
        )
        shade_colors: Dict[str, Dict[str, str]] = {}
        for intensity, value in palette["intensities"].items():
            colors_ = copy(palette["colors"])
            colors_.update(value)
            shade_colors[intensity] = {}
            for color_name, color_value in colors_.items():
                if color_name not in shade_color_names:
                    continue
                shade_colors[intensity][color_name] = color_value

        for shades_, colors in shade_colors.items():
            IntensityShadesGenerator._draw_shade_header(
                dwg, shades_, current_x, current_y
            )
            current_x, current_y = IntensityShadesGenerator._move_color_position(
                current_x, current_y
            )
            for color_name, color_value in colors.items():
                IntensityShadesGenerator._draw_shade(
                    dwg, color_name, color_value, current_x, current_y
                )
                current_x, current_y = IntensityShadesGenerator._move_color_position(
                    current_x, current_y
                )
            current_x, current_y = IntensityShadesGenerator._move_shade_position(
                current_x, current_y
            )
        return dwg
