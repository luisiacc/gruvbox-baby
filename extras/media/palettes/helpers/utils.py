import svgwrite


def hex_to_rgb(hex_string: str) -> str:
    hex_ = hex_string.lstrip("#")
    rgb = tuple(int(hex_[i : i + 2], 16) for i in (0, 2, 4))
    return f"rgb({rgb[0]},{rgb[1]},{rgb[2]})"


def draw_background(
    dwg: svgwrite.Drawing, color: str, x_plane: int, y_plane: int
) -> None:
    dwg.add(
        dwg.rect(
            insert=(0, 0),
            size=(x_plane, y_plane),
            fill=hex_to_rgb(color),
        )
    )
