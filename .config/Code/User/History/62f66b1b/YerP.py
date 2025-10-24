from pathlib import Path


wallpapers = [f.name for f in WALLPAPERS_PATH.iterdir() if f.is_file() and f.suffix.lower() in [".png", ".jpg", ".jpeg"]]

class RandomWallpapers:
  def __init__(self, path: str):
    self.WALLPAPERS_PATH = Path(path)

  def 
