from aiogram.types import FSInputFile

from dataclasses import dataclass
from dotenv import load_dotenv
import os


load_dotenv() 

@dataclass(frozen=True)
class Messages:
  greetings: str = (
    "🌨️ *Привет! Это мой файлообменник.*\n\n"
    "💭 Чтобы загрузить файл, просто отправьте его в чат\n\n"
    "☁️ Вы можете загружать любые файлы размером до 80Mb.\n"
    "☁️ Срок их хранения ровно 7 дней.\n"
    "☁️ Одновременно у вас может быть загружено до 15 файлов.\n\n"
    "_✉️ Политика и условия — /policy_"
  )

  policy: str = (
    "📜 *Политика и условия*\n\n"
    "Файлы хранятся 7 дней, после чего удаляются.\n"
    "Отправляя файлы, вы соглашаетесь с этим."
  )

  fileslist: str = "💭 Выберите нужный файл:"


@dataclass(frozen=True)
class Config:
  token: str = os.getenv("BOT_TOKEN", "")
  admin_id: int = int(os.getenv("ADMIN_ID", "0"))
  messages: Messages = Messages()

  api_host: str = "127.0.0.1"
  api_port: int = 8435

  banner = FSInputFile("bot/background.jpg")

config = Config()