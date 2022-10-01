from tempfile import TemporaryFile
from typing import Dict, List, Tuple

import svgwrite
from utils import draw_background, hex_to_rgb

from colors import palette, text_colors


class PaletteGenerator:
    X_PLANE = 1920
    Y_PLANE = 1080
    PALETTE_COLOR_BOX_X = 280
    PALETTE_COLOR_BOX_Y = 160
    PALETTE_START_X = 0
    PALETTE_START_Y = 0
    PALETTE_X_MARGIN_RIGHT = 80
    PALETTE_Y_MARGIN_TOP = 45
    PALETTE_COLOR_BOX_RX = 20
    PALETTE_COLOR_BOX_RY = 20

    @staticmethod
    def draw_text(
        dwg: svgwrite.Drawing,
        color_name: str,
        color_value: str,
        default_text_color: str,
        x: int,
        y: int,
    ):
        text_color = text_colors[color_name]
        if text_color is None:
            text_color = default_text_color
        dwg.add(
            svgwrite.text.Text(
                color_name.replace("_", " "),
                insert=(x + 25, y + 35),
                fill=hex_to_rgb(text_color),
                font_size="28px",
                font_weight="bold",
            )
        )
        dwg.add(
            svgwrite.text.Text(
                color_value,
                insert=(x + 25, y + PaletteGenerator.PALETTE_COLOR_BOX_Y - 15),
                fill=hex_to_rgb(text_color),
                font_size="28px",
            )
        )

    @staticmethod
    def create_color_box(
        dwg: svgwrite.Drawing,
        color_name: str,
        color_value: str,
        default_text_color: str,
        x: int,
        y: int,
    ) -> None:
        dwg.add(
            dwg.rect(
                insert=(x, y),
                size=(
                    PaletteGenerator.PALETTE_COLOR_BOX_X,
                    PaletteGenerator.PALETTE_COLOR_BOX_Y,
                ),
                rx=PaletteGenerator.PALETTE_COLOR_BOX_RX,
                ry=PaletteGenerator.PALETTE_COLOR_BOX_RY,
                fill=hex_to_rgb(color_value),
                stroke=hex_to_rgb(palette["colors"]["comment"]),
                stroke_width=5,
            )
        )
        PaletteGenerator.draw_text(
            dwg, color_name, color_value, default_text_color, x, y
        )

    @staticmethod
    def max_x() -> int:
        return (
            PaletteGenerator.X_PLANE
            - PaletteGenerator.PALETTE_COLOR_BOX_X
            - PaletteGenerator.PALETTE_X_MARGIN_RIGHT
        )

    @staticmethod
    def max_y() -> int:
        return (
            PaletteGenerator.Y_PLANE
            - PaletteGenerator.PALETTE_COLOR_BOX_Y
            - PaletteGenerator.PALETTE_Y_MARGIN_TOP
        )

    @staticmethod
    def move_position(x: int, y: int) -> Tuple[int, int]:
        new_x = (
            x
            + PaletteGenerator.PALETTE_COLOR_BOX_X
            + PaletteGenerator.PALETTE_X_MARGIN_RIGHT
        )
        new_y = y
        if new_x > PaletteGenerator.max_x():
            new_y = (
                y
                + PaletteGenerator.PALETTE_Y_MARGIN_TOP
                + PaletteGenerator.PALETTE_COLOR_BOX_Y
            )
            new_x = (
                PaletteGenerator.PALETTE_START_X
                + PaletteGenerator.PALETTE_X_MARGIN_RIGHT
            )
        return new_x, new_y

    @staticmethod
    def draw_intensity_map_text(
        dwg: svgwrite.Drawing, intensity_string: str, x: int, y: int
    ) -> None:
        dwg.add(
            svgwrite.text.Text(
                intensity_string,
                insert=(x + 25, y + 3 * (PaletteGenerator.PALETTE_COLOR_BOX_Y / 4)),
                fill=palette["colors"]["milk"],
                font_size="96px",
                font_weight="bold",
            )
        )

    @staticmethod
    def draw(palette_dict: dict, name: str) -> svgwrite.Drawing:
        svg_file = TemporaryFile("r+", encoding="utf-8")
        dwg = svgwrite.Drawing(svg_file, profile="tiny", size=(1920, 1080))

        current_x = (
            PaletteGenerator.PALETTE_START_X + PaletteGenerator.PALETTE_X_MARGIN_RIGHT
        )
        current_y = (
            PaletteGenerator.PALETTE_START_Y + PaletteGenerator.PALETTE_Y_MARGIN_TOP
        )

        draw_background(
            dwg,
            palette_dict["background"],
            PaletteGenerator.X_PLANE,
            PaletteGenerator.Y_PLANE,
        )
        for color_name, color_value in palette_dict.items():
            PaletteGenerator.create_color_box(
                dwg,
                color_name,
                color_value,
                palette_dict["background"],
                current_x,
                current_y,
            )
            current_x, current_y = PaletteGenerator.move_position(current_x, current_y)
        PaletteGenerator.draw_intensity_map_text(dwg, name, current_x, current_y)
        return dwg
