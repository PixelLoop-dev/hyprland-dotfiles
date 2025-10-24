from pathlib import Path
from subprocess import run as Run

class RandomWallpapers:
  def __init__(self, path: str):
    self.WALLPAPERS_PATH = Path(path)

  def get_wallpapers(self):
    return [f.name for f in self.WALLPAPERS_PATH.iterdir() if f.is_file() and f.suffix.lower() in [".png", ".jpg", ".jpeg"]]

  def set_wallpaper(self, name):
    Run(["swww", "img", ]) 
