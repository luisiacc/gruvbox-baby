import json
from copy import copy
from typing import Dict

from colors import palette

mapping: Dict = dict(
    cursorColor="medium_gray",
    selectionBackground="milk",
    background="background",
    foreground="foreground",
    black="background_dark",
    brightBlack="background_light",
    blue="blue_gray",
    brightBlue="light_blue",
    cyan="dark_gray",
    brightCyan="forest_green",
    green="soft_green",
    brightGreen="clean_green",
    purple="magenta",
    brightPurple="pink",
    red="error_red",
    brightRed="red",
    white="gray",
    brightWhite="milk",
    yellow="bright_yellow",
    brightYellow="soft_yellow",
)


def create_windows_terminal_themes() -> Dict:
    windows_terminal_themes = {}
    for intensity, value in palette["intensities"].items():
        updated_palette = copy(palette["colors"])
        updated_palette.update(value)
        windows_terminal_theme = copy(mapping)
        for windows_terminal_color, gruvbox_color in mapping.items():
            windows_terminal_theme[windows_terminal_color] = updated_palette[gruvbox_color]
        windows_terminal_theme["name"] = f"gruvbox-baby-{intensity}"
        windows_terminal_themes[intensity] = windows_terminal_theme
    return windows_terminal_themes


if __name__ == "__main__":
    print("Creating Windows Terminal themes as JSON")
    color_schemes = create_windows_terminal_themes()
    for theme_intensity, terminal_colors in color_schemes.items():
        print(f"Creating JSON for intensity: {theme_intensity} ...")
        with open(f"windows_terminal_{theme_intensity}.json", "w", encoding="utf-8") as file:
            file.write(json.dumps(terminal_colors, indent=4))
    print("Done!")
