import termbox;
import std.random;

void main() {
    init();

    string hello = "Hello world in termbox!";
    string help = "Move the cursor with the arrow keys and quit with escape";

    Event e;

    int x, y;
    y = height() / 2;
    x = width() / 2 - cast(int) hello.length / 2;
    foreach (c; hello) {
        setCell(x++, y, c, Color.red, Color.default_);
    }

    x = width() / 2 - cast(int) help.length / 2;
    foreach (c; help) {
        setCell(x++, y + 1, c, Color.blue, Color.default_);
    }

    int cx, cy;
    do {
        setCursor(cx, cy);

        flush();
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
