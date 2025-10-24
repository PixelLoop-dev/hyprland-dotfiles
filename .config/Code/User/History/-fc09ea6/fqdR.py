from aiogram.types import CallbackQuery
from aiogram import Router as _Router, F

from aiogram.fsm.context import FSMContext

from utils.client import client
from config import config
from keyboards import get_files_keyboard

Router = _Router()


@Router.callback_query(F.data.startswith("MYFILES:"))
async def process_callback(callback: CallbackQuery, state: FSMContext):

  data_state = await state.get_data()
  current_page = data_state.get("current_page", 1)

  print(callback.data.split(":"))

  if len(callback.data.split(":")) == 1:
    
    api_response = await client().get_user_files(callback.from_user.id)

    if "error" in api_response:
      await callback.message.answer(f'Ошибка api: {api_response.get("error")}')
      return

    files_data = api_response.get("files_data")
    await state.update_data(files_data=files_data, current_page=current_page)

  else:
    files_data = data_state.get(files_data)
    

  keyboard = get_files_keyboard(files_data, current_page)

  await callback.message.edit_caption(
    caption=config.messages.fileslist,
    reply_markup=keyboard,
    parse_mode="Markdown"
  )

  await callback.answer()