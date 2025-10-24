#!/usr/bin/env python

from pathlib import Path
from random import choice
from subprocess import run as Run

class RandomWallpapers:
  def __init__(self, path: str):
    self.WALLPAPERS_PATH = Path(path)

  def get_wallpapers(self) -> list:
    return [f.name for f in self.WALLPAPERS_PATH.iterdir() if f.is_file() and f.suffix.lower() in [".png", ".jpg", ".jpeg"]]

  def set_wallpaper(self, name: str) -> None:
    Run(["swww", "img", self.WALLPAPERS_PATH / name])

  def current_wallpaper(self, name: str) -> None:
    os

  def main(self) -> None:
    wallpaper = choice(self.get_wallpapers())
    
    print(f"Установленны обои: {wallpaper}")

    self.set_wallpaper(wallpaper)


if __name__ == "__main__":
  RandomWallpapers("/home/pixel_loop/wallpapers").main()
