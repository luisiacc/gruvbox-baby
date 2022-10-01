from collections import OrderedDict, defaultdict

palette: OrderedDict = OrderedDict(
    colors=OrderedDict(
        dark0="#0d0e0f",
        dark="#202020",
        background_dark="#1d2021",
        background="#282828",
        background_light="#32302f",
        foreground="#ebdbb2",
        gray="#dedede",
        medium_gray="#504945",
        comment="#665c54",
        milk="#e7d7ad",
        error_red="#cc241d",
        red="#fb4934",
        orange="#d65d0e",
        bright_yellow="#fabd2f",
        soft_yellow="#eebd35",
        pink="#d4879c",
        magenta="#b16286",
        soft_green="#98971a",
        forest_green="#689d6a",
        clean_green="#8ec07c",
        blue_gray="#458588",
        dark_gray="#83a598",
        light_blue="#7fa2ac",
    ),
    intensities=OrderedDict(
        dark=OrderedDict(
            dark="#0d0e0f",
            background_dark="#171a1a",
            background="#1d2021",
        ),
        medium=OrderedDict(background="#282828", background_dark="#242424"),
        soft=OrderedDict(
            background="#32302f", background_dark="#282626", background_light="#3c3a39"
        ),
        soft_flat=OrderedDict(
            background="#32302f", background_dark="#32302f", background_light="#3c3a39"
        ),
    ),
)


text_colors: dict = defaultdict(lambda: None)

INVERSE_COLOR = "milk"
text_colors["dark0"] = palette["colors"][INVERSE_COLOR]
text_colors["dark"] = palette["colors"][INVERSE_COLOR]
text_colors["background_dark"] = palette["colors"][INVERSE_COLOR]
text_colors["background"] = palette["colors"][INVERSE_COLOR]
text_colors["background_light"] = palette["colors"][INVERSE_COLOR]
