from copy import copy

from colors import palette

if __name__ == "__main__":
    print("Creating tmux color themes ...")
    for intensity, value in palette["intensities"].items():
        print(f"Creating tmux color for intensity {intensity} ...")
        updated_palette = copy(palette["colors"])
        updated_palette.update(value)
        with open(f"{intensity.upper()}.tmux", "w", encoding="utf-8") as file:
            for color_name, color_value in updated_palette.items():
                file.write(f"{color_name.upper()}={color_value.upper()}\n")
    print("Done!")
