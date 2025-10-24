from pathlib import Path
from random import choice
from subprocess import run as Run

class RandomWallpapers:
  def __init__(self, path: str):
    self.WALLPAPERS_PATH = Path(path)

  def get_wallpapers(self) -> list:
    return [f.name for f in self.WALLPAPERS_PATH.iterdir() if f.is_file() and f.suffix.lower() in [".png", ".jpg", ".jpeg"]]

  def set_wallpaper(self, path: Path) -> None:
    Run(["swww", "img", path])

  def main(self):
    wallpaper = choice(self.get_wallpapers())
    
    print(f"Установленны обои: {wallpaper}")


if __name__ == ""