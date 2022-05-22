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
        setCell(x++, y, c, Color.red, Color.basic);
    }

    x = width() / 2 - cast(int) help.length / 2;
    foreach (c; help) {
        setCell(x++, y + 1, c, Color.blue, Color.basic);
    }

	for(int i=0; i<8; i++)
	{
		setCell(i, 0, '▄', cast(ushort)(i + 1), cast(ushort)((i + 1) | Attribute.bright));
	}

    int cx, cy;
    do {
        setCursor(cx, cy);

        flush();
        pollEvent(&e);

        if (e.key == Key.arrowUp) {
            if (cy > 0)
                cy--;
        } else if (e.key == Key.arrowDown) {
            if (cy < height())
                cy++;
        } else if (e.key == Key.arrowRight) {
            if (cx < width())
                cx++;
        } else if (e.key == Key.arrowLeft) {
            if (cx > 0)
                cx--;
        }
    } while (e.key != Key.esc);

    shutdown();
}
