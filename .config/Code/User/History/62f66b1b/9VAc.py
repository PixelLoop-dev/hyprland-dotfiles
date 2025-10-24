from pathlib import Path

WALLPAPERS_PATH = Path("/home/pixel_loop/wallpapers")

WALLPAPERS = [f.name for f in path.iterdir() if f.is_file() and f.suffix.lower() in [".png", ".jpg", ".jpeg"]]


