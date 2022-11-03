#! /usr/bin/env python3
import argparse
import json
from pathlib import Path

from create_windows_terminal_themes import create_windows_terminal_themes

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("windows_terminal_settings_json", type=str)
    args = parser.parse_args()
    settings = Path(args.windows_terminal_settings_json)
    with open(settings, "r+", encoding="utf-8") as file:
        print(f"Adding gruvbox-baby themes to Windows Terminal settings @ {args.windows_terminal_settings_json} ...")
        data = json.load(file)
        for scheme in create_windows_terminal_themes().values():
            print(f"Adding gruvbox-baby-{scheme['name']} to Windows Terminal settings ...")
            data["schemes"].append(scheme)
            file.seek(0)
            json.dump(data, file, indent=4)
            file.truncate()
    print("Done!")
