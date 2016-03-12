import termbox;

import std.stdio;
import std.random;

void main() {
    init();

    setInputMode(InputMode.esc | InputMode.mouse);

    Color[] colors = [
        Color.basic,
        Color.black,
        Color.red,
        Color.green,
        Color.yellow,
        Color.blue,
        Color.magenta,
        Color.cyan,
        Color.white
    ];

    Event e;

    string help = "Click around to paint colors, quit with escape";
    int x = width() / 2 - cast(int) help.length / 2;
    foreach (ch; help) {
        setCell(x++, height() / 2, ch, Color.basic, Color.basic);
    }

    do {
        flush();

        pollEvent(&e);

        if (e.key == Key.mouseLeft) {
            setCell(e.x, e.y, '█', colors[uniform(0, colors.length)], Color.basic);
        }
    } while (e.key != Key.esc);

    shutdown();
}
