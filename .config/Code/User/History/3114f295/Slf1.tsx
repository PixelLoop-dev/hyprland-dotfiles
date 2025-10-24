import { App, Widget } from 'resource:///com/github/Aylur/ags';
import { execAsync } from 'resource:///com/github/Aylur/ags/utils';

// Функция для выполнения команд управления питанием
const powerAction = (command) => () => {
    execAsync(command).catch(err => console.error(`Ошибка: ${err}`));
};

// Создание меню питания
const PowerMenu = () => Widget.Window({
    name: 'power-menu',
    layer: 'overlay', // Оверлей поверх всех окон
    anchor: ['center'], // Центрирование
    exclusivity: 'normal', // Не резервирует пространство
    visible: false, // Скрыто по умолчанию
    // Горячая клавиша для показа/скрытия (опционально)
    keymode: 'exclusive',
    setup: self => self.keybind(['SUPER', 'p'], () => {
        App.toggleWindow('power-menu');
    }),
    child: Widget.Box({
        className: 'power-menu',
        vertical: true, // Вертикальное расположение кнопок
        spacing: 10,
        children: [
            Widget.Button({
                className: 'power-button',
                child: Widget.Label('⏻ Выключить'),
                onClicked: powerAction('systemctl poweroff'),
            }),
            Widget.Button({
                className: 'power-button',
                child: Widget.Label('↻ Перезагрузить'),
                onClicked: powerAction('systemctl reboot'),
            }),
            Widget.Button({
                className: 'power-button',
                child: Widget.Label('🚪 Выйти'),
                onClicked: powerAction('loginctl terminate-session self'),
            }),
            Widget.Button({
                className: 'power-button',
                child: Widget.Label('🔒 Блокировать'),
                onClicked: powerAction('hyprlock'), // Предполагается, что используется hyprlock
            }),
        ],
    }),
});

// Экспорт конфига
App.config = {
    style: './style.css',
    windows: [PowerMenu()],
};