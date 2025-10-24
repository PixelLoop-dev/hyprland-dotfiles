import { App, Widget } from 'resource:///com/github/Aylur/ags';
import { execAsync } from 'resource:///com/github/Aylur/ags/utils';

// Компонент: Кнопка действия
const PowerButton = ({ label, icon, command }) => Widget.Button({
    className: 'power-button',
    onClicked: () => execAsync(command).catch(err => console.error(`Ошибка: ${err}`)),
    child: Widget.Box({
        spacing: 8,
        children: [
            Widget.Label(icon),
            Widget.Label(label),
        ],
    }),
});

// Компонент: Контейнер меню
const PowerMenuContainer = ({ children }) => Widget.Box({
    className: 'power-menu',
    vertical: true,
    spacing: 10,
    children,
});

// Главный компонент: Меню питания
const PowerMenu = () => Widget.Window({
    name: 'power-menu',
    layer: 'overlay', // Поверх всех окон
    anchor: ['center'], // Центрирование
    exclusivity: 'normal',
    visible: false, // Скрыто по умолчанию
    keymode: 'exclusive',
    setup: self => self.keybind(['SUPER', 'p'], () => {
        App.toggleWindow('power-menu');
    }),
    child: PowerMenuContainer({
        children: [
            PowerButton({
                label: 'Выключить',
                icon: '⏻',
                command: 'systemctl poweroff',
            }),
            PowerButton({
                label: 'Перезагрузить',
                icon: '↻',
                command: 'systemctl reboot',
            }),
            PowerButton({
                label: 'Выйти',
                icon: '🚪',
                command: 'loginctl terminate-session self',
            }),
            PowerButton({
                label: 'Блокировать',
                icon: '🔒',
                command: 'hyprlock', // Замените на ваш локскрин, например, swaylock
            }),
        ],
    }),
});

// Экспорт конфига
App.config = {
    style: './style.css',
    windows: [PowerMenu()],
};