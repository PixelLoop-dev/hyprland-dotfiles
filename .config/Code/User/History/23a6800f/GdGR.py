import curses

def draw_smile(stdscr):
    curses.start_color()
    curses.init_pair(1, curses.COLOR_YELLOW, curses.COLOR_YELLOW)
    curses.init_pair(2, curses.COLOR_BLACK, curses.COLOR_BLACK)
    curses.init_pair(3, curses.COLOR_RED, curses.COLOR_RED)

    stdscr.clear()
    # Координаты для смайлика (матрица 7x7)
    smile = [
        " 00000 ",
        "0     0",
        "0 0 0 0",
        "0     0",
        "0 000 0",
        "0     0",
        " 00000 "
    ]
    for y, row in enumerate(smile):
        for x, ch in enumerate(row):
            if ch == "0":
                stdscr.addstr(y, x*2, "  ", curses.color_pair(1))
            elif ch == " ":
                stdscr.addstr(y, x*2, "  ", curses.color_pair(2))
    # Рот (красный)
    stdscr.addstr(4, 2*2, "  ", curses.color_pair(3))
    stdscr.addstr(4, 3*2, "  ", curses.color_pair(3))
    stdscr.addstr(4, 4*2, "  ", curses.color_pair(3))

    stdscr.refresh()
    stdscr.getch()

curses.wrapper(draw_smile)