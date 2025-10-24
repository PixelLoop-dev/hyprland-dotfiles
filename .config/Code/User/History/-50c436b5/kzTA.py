from aiogram import Router as _Router
from aiogram.fsm.context import FSMContext
from aiogram.types import CallbackQuery

from keyboards import get_files_keyboard
from keyboards import menu
from config import config

Router = _Router()


@Router.callback_query(lambda c: c.data == "GOBACK")
async def go_back(callback: CallbackQuery, state: FSMContext):
  data = await state.get_data()
  current_page = data.get("current_page", 1)

  current_page = current_page - 1

  files_data = data.get("files_data", [])

  await state.update_data(current_page=current_page)

  keyboard = get_files_keyboard(files_data, current_page)

  await callback.message.edit_reply_markup(reply_markup=keyboard)
  await callback.answer()


@Router.callback_query(lambda c: c.data == "GONEXT")
async def go_next(callback: CallbackQuery, state: FSMContext):
  data = await state.get_data()
  current_page = data.get("current_page", 1)

  files_data = data.get("files_data", [])

  current_page = current_page + 1

  await state.update_data(current_page=current_page)

  keyboard = get_files_keyboard(files_data, current_page)

  await callback.message.edit_reply_markup(reply_markup=keyboard)
  await callback.answer()


@Router.callback_query(lambda c: c.data == "null")
async def go_back(callback: CallbackQuery):
  await callback.answer()
  

@Router.callback_query(lambda c: c.data == "GOMAIN")
async def go_main(callback: CallbackQuery):
  
  await callback.message.edit_caption(
    photo=config.banner,
    caption=config.messages.greetings,
    reply_markup=menu,
    parse_mode="Markdown"
  )


