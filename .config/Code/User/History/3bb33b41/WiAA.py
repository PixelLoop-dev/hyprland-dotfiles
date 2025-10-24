from aiogram.types import InlineKeyboardMarkup, InlineKeyboardButton

menu: InlineKeyboardMarkup = InlineKeyboardMarkup(inline_keyboard=[
  [
    InlineKeyboardButton(text="Мои файлы", callback_data="MYFILES:"),
  ]
])
