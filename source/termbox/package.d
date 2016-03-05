module termbox;

/* Key constants. See also struct tb_event's key field.
 *
 * These are a safe subset of terminfo keys, which exist on all popular
 * terminals. Termbox uses only them to stay truly portable.
 */
enum Key {
    f1               = 0xffff-0,
    f2               = 0xffff-1,
    f3               = 0xffff-2,
    f4               = 0xffff-3,
    f5               = 0xffff-4,
    f6               = 0xffff-5,
    f7               = 0xffff-6,
    f8               = 0xffff-7,
    f9               = 0xffff-8,
    f10              = 0xffff-9,
    f11              = 0xffff-10,
    f12              = 0xffff-11,
    insert           = 0xffff-12,
    delete_          = 0xffff-13,
    home             = 0xffff-14,
    end              = 0xffff-15,
    pgup             = 0xffff-16,
    pgdn             = 0xffff-17,
    arrowUp         = 0xffff-18,
    arrowDown       = 0xffff-19,
    arrowLeft       = 0xffff-20,
    arrowRight      = 0xffff-21,
    mouseLeft       = 0xffff-22,
    mouseRight      = 0xffff-23,
    mouseMiddle     = 0xffff-24,
    mouseRelease    = 0xffff-25,
    mouseWheelUp   = 0xffff-26,
    mouseWheelDown = 0xffff-27,
    ctrl_tilde       = 0x00,
    ctrl_2           = 0x00, /* clash with 'ctrl_tilde' */
    ctrl_a           = 0x01,
    ctrl_b           = 0x02,
    ctrl_c           = 0x03,
    ctrl_d           = 0x04,
    ctrl_e           = 0x05,
    ctrl_f           = 0x06,
    ctrl_g           = 0x07,
    backspace        = 0x08,
    ctrl_h           = 0x08, /* clash with 'ctrl_backspace' */
    tab              = 0x09,
    ctrl_i           = 0x09, /* clash with 'tab' */
    ctrl_j           = 0x0a,
    ctrl_k           = 0x0b,
    ctrl_l           = 0x0c,
    enter            = 0x0d,
    ctrl_m           = 0x0d, /* clash with 'enter' */
    ctrl_n           = 0x0e,
    ctrl_o           = 0x0f,
    ctrl_p           = 0x10,
    ctrl_q           = 0x11,
    ctrl_r           = 0x12,
    ctrl_s           = 0x13,
    ctrl_t           = 0x14,
    ctrl_u           = 0x15,
    ctrl_v           = 0x16,
    ctrl_w           = 0x17,
    ctrl_x           = 0x18,
    ctrl_y           = 0x19,
    ctrl_z           = 0x1a,
    esc              = 0x1b,
    ctrl_lsqBracket = 0x1b, /* clash with 'esc' */
    ctrl_3           = 0x1b, /* clash with 'esc' */
    ctrl_4           = 0x1c,
    ctrl_backslash   = 0x1c, /* clash with 'ctrl_4' */
    ctrl_5           = 0x1d,
    ctrl_rsqBracket = 0x1d, /* clash with 'ctrl_5' */
    ctrl_6           = 0x1e,
    ctrl_7           = 0x1f,
    ctrl_slash       = 0x1f, /* clash with 'ctrl_7' */
    ctrl_underscore  = 0x1f, /* clash with 'ctrl_7' */
    space            = 0x20,
    backspace2       = 0x7f,
    ctrl_8           = 0x7f /* clash with 'backspace2' */
}

/* These are all ASCII code points below SPACE character and a BACKSPACE key. */

enum Mod {
    alt = 0x01
}

/* Colors (see struct tb_cell's fg and bg fields). */
enum Color {
    default_ = 0x00,
    black    = 0x01,
    red      = 0x02,
    green    = 0x03,
    yellow   = 0x04,
    blue     = 0x05,
    magenta  = 0x06,
    cyan     = 0x07,
    white    = 0x08
}

/* Attributes, it is possible to use multiple attributes by combining them
 * using bitwise OR ('|'). Although, colors cannot be combined. But you can
 * combine attributes and a single color. See also struct tb_cell's fg and bg
 * fields.
 */
enum Attribute {
    bold      = 0x0100,
    underline = 0x0200,
    reverse   = 0x0400
}


enum EventType {
    key    = 1,
    resize = 2,
    mouse  = 3
}

/* Error codes returned by tb_init(). All of them are self-explanatory, except
 * the pipe trap error. Termbox uses unix pipes in order to deliver a message
 * from a signal handler (SIGWINCH) to the main event reading loop. Honestly in
 * most cases you should just check the returned code as < 0.
 */
enum Error {
    unsupportedTerminal = -1,
    failedToOpenTTY     = -2,
    pipeTrapError       = -3
}

enum hideCursor = -1;

enum InputMode {
    current = 0,
    esc     = 1,
    alt     = 2,
    mouse   = 4
}

enum OutputMode {
    current   = 0,
    normal    = 1,
    out256    = 2,
    out216    = 3,
    grayscale = 4
}

enum TB_EOF = -1;

struct tb_cell {
    uint ch;
    ushort fg;
    ushort bg;
};

struct tb_event {
    ubyte type;
    ubyte mod; /* modifiers to either 'key' or 'ch' below */
    ushort key; /* one of the TB_KEY_* constants */
    uint ch; /* unicode character */
    int w;
    int h;
    int x;
    int y;
};

extern (C) int tb_init();
extern (C) void tb_shutdown();
extern (C) int tb_width();
extern (C) int tb_height();
extern (C) void tb_clear();
extern (C) void tb_set_clear_attributes(ushort fg, ushort bg);
extern (C) void tb_present();
extern (C) void tb_set_cursor(int cx, int cy);
extern (C) void tb_put_cell(int x, int y, tb_cell *cell);
extern (C) void tb_change_cell(int x, int y, uint ch, uint fg, uint bg);
extern (C) void tb_blit(int x, int y, int w, int h, tb_cell *cells);
extern (C) tb_cell *tb_cell_buffer();
extern (C) int tb_select_input_mode(int mode);
extern (C) int tb_select_output_mode(int mode);
extern (C) int tb_peek_event(tb_event *event, int timeout);
extern (C) int tb_poll_event(tb_event* event);

alias Event = tb_event;
alias Cell = tb_cell;

alias init = tb_init;
alias shutdown = tb_shutdown;
alias width = tb_width;
alias height = tb_height;
alias clear = tb_clear;
alias setClearAttributes = tb_set_clear_attributes;
alias present = tb_present;
alias setCursor = tb_set_cursor;
alias putCell = tb_put_cell;
alias changeCell = tb_change_cell;
alias blit = tb_blit;
alias cellBuffer = tb_cell_buffer;
alias selectInputMode = tb_select_input_mode;
alias selectOutputMode = tb_select_output_mode;
alias peekEvent = tb_peek_event;
alias pollEvent = tb_poll_event;
