import termbox;
import std.random;

void main() {
    init();

    Color[] colors = [
        Color.default_,
        Color.red,
        Color.blue,
        Color.yellow,
        Color.green
    ];

    string hello = "Hello world in termbox!";
    string help = "Move the cursor with the arrow keys and quit with escape";

    Event e;

    int cx, cy;
    int x, y;
    do {
        clear();

        y = height() / 2;
        x = width() / 2 - cast(int) hello.length / 2;
        foreach (c; hello) {
            changeCell(x++, y, c, colors[uniform(0, colors.length)], Color.default_);
        }

        x = width() / 2 - cast(int) help.length / 2;
        foreach (c; help) {
            changeCell(x++, y + 1, c, colors[uniform(0, colors.length)], Color.default_);
        }

        setCursor(cx, cy);
        present();

        pollEvent(&e);

        if (e.key == Key.arrowUp) {
            cy--;
        } else if (e.key == Key.arrowDown) {
            cy++;
        } else if (e.key == Key.arrowRight) {
            cx++;
        } else if (e.key == Key.arrowLeft) {
            cx--;
        }
    } while (e.key != Key.esc);

    shutdown();
}
