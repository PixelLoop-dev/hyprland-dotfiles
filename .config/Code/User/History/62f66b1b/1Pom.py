from pathlib import Path

WALLPAPERS_PATH = Path("/home/pixel_loop/wallpapers")

wallpapers = [f.name for f in WALLPAPERS_PATH.iterdir() if f.is_file() and f.suffix.lower() in [".png", ".jpg", ".jpeg"]]

class Random

